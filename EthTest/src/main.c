#include "bsp_printf.h"
#include <stdint.h>

// ---------------------------------------------------------------------------
// MAC control registers (axi_ethernet_0, via AXI-Lite offset 0x0000)
// ---------------------------------------------------------------------------
#define ETH_BASE  0x80040000u
#define ETH_IS    (*(volatile uint32_t *)(ETH_BASE + 0x0Cu))
#define ETH_RCW1  (*(volatile uint32_t *)(ETH_BASE + 0x404u))
#define ETH_SPEED (*(volatile uint32_t *)(ETH_BASE + 0x410u))
#define RX_FLAGS  0x0Cu

// ---------------------------------------------------------------------------
// DMA control registers (axi_dma_0, via AXI-Lite offset 0x2000 = CPU 0x80042000)
// Per Xilinx PG021 Table 2-1
// ---------------------------------------------------------------------------
#define DMA_BASE         0x80042000u
// MM2S (TX) channel
#define DMA_MM2S_CR      (*(volatile uint32_t *)(DMA_BASE + 0x00u))
#define DMA_MM2S_SR      (*(volatile uint32_t *)(DMA_BASE + 0x04u))
#define DMA_MM2S_CURDESC (*(volatile uint32_t *)(DMA_BASE + 0x08u))
#define DMA_MM2S_TAILDESC (*(volatile uint32_t *)(DMA_BASE + 0x10u))
// S2MM (RX) channel
#define DMA_S2MM_CR      (*(volatile uint32_t *)(DMA_BASE + 0x30u))
#define DMA_S2MM_SR      (*(volatile uint32_t *)(DMA_BASE + 0x34u))
#define DMA_S2MM_CURDESC (*(volatile uint32_t *)(DMA_BASE + 0x38u))
#define DMA_S2MM_TAILDESC (*(volatile uint32_t *)(DMA_BASE + 0x40u))

#define DMA_CR_RUN       (1u << 0)
#define DMA_CR_RESET     (1u << 2)
#define DMA_SR_IDLE      (1u << 1)
#define DMA_SR_HALTED    (1u << 0)

// ---------------------------------------------------------------------------
// Scatter-gather descriptor ring in DDR2 (0x06000000, well above code/stack)
// Descriptor layout per PG021 Table 2-5 (64-byte aligned, 64 bytes each)
// ---------------------------------------------------------------------------
#define DMA_N_DESC       8u
#define DMA_DESC_BASE    0x06000000u   // 8 × 64 B = 512 B for descriptors
#define DMA_BUF_BASE     0x06001000u   // 8 × 1536 B = 12 KB for frame buffers
#define DMA_BUF_SIZE     1536u         // max Ethernet frame (1500 + 14 + 4 + slack)

#define DMA_DESC_SOF     (1u << 27)    // start-of-frame
#define DMA_DESC_EOF     (1u << 26)    // end-of-frame
#define DMA_STS_CMPLT    (1u << 31)    // descriptor complete

typedef struct {
    volatile uint32_t next_desc;  // +0x00  next descriptor address
    volatile uint32_t _p0;        // +0x04  (next_desc MSB, 0 for 32-bit)
    volatile uint32_t buf_addr;   // +0x08  buffer address
    volatile uint32_t _p1;        // +0x0C  (buf_addr MSB, 0 for 32-bit)
    volatile uint32_t _rsv[2];    // +0x10
    volatile uint32_t control;    // +0x18  [27]=SOF [26]=EOF [22:0]=buf length
    volatile uint32_t status;     // +0x1C  [31]=Cmplt [30]=EOF [29]=SOF [22:0]=bytes rx
    volatile uint32_t app[5];     // +0x20  application words (frame checksum etc.)
    volatile uint32_t _pad[3];    // +0x34  pad to 64 bytes
} sg_desc_t;

// ---------------------------------------------------------------------------
// Board I/O
// ---------------------------------------------------------------------------
#define LED_OUT (*(volatile uint32_t *)0x80001404u)
#define LED_OE  (*(volatile uint32_t *)0x80001408u)

// ---------------------------------------------------------------------------
// DMA S2MM ring initialisation
// ---------------------------------------------------------------------------
static void dma_rx_init(void)
{
    volatile sg_desc_t *ring = (volatile sg_desc_t *)DMA_DESC_BASE;

    // Build circular descriptor ring
    for (uint32_t i = 0u; i < DMA_N_DESC; i++) {
        uint32_t next = (i + 1u) % DMA_N_DESC;
        ring[i].next_desc = DMA_DESC_BASE + next * (uint32_t)sizeof(sg_desc_t);
        ring[i]._p0       = 0u;
        ring[i].buf_addr  = DMA_BUF_BASE + i * DMA_BUF_SIZE;
        ring[i]._p1       = 0u;
        ring[i].control   = DMA_DESC_SOF | DMA_DESC_EOF | DMA_BUF_SIZE;
        ring[i].status    = 0u;
    }

    // Reset S2MM channel
    DMA_S2MM_CR = DMA_CR_RESET;
    while (DMA_S2MM_CR & DMA_CR_RESET) {}   // wait for reset to self-clear

    // Start S2MM: set CURDESC before asserting Run (PG021 §2.3)
    DMA_S2MM_CURDESC = DMA_DESC_BASE;
    DMA_S2MM_CR      = DMA_CR_RUN;
    // Kick the engine by writing TAILDESC (last desc in ring)
    DMA_S2MM_TAILDESC = DMA_DESC_BASE + (DMA_N_DESC - 1u) * (uint32_t)sizeof(sg_desc_t);
}

int main(void)
{
    LED_OE  = 0xFFFFu;
    LED_OUT = 0u;
    uartInit();

    // Initialise MAC: 100 Mbps, enable receiver
    ETH_SPEED = (1u << 30);
    ETH_RCW1  = (1u << 28);
    ETH_IS    = RX_FLAGS;   // clear any pending interrupt flags

    dma_rx_init();
    printfNexys("DMA RX ready\r\n");

    volatile sg_desc_t *ring = (volatile sg_desc_t *)DMA_DESC_BASE;
    uint32_t rx_idx = 0u;
    uint32_t frames = 0u;

    for (;;)
    {
        // Poll: has the current descriptor been completed by the DMA?
        if (ring[rx_idx].status & DMA_STS_CMPLT)
        {
            uint32_t len   = ring[rx_idx].status & 0x007FFFFFu;
            uint32_t words = (len + 3u) / 4u;
            volatile uint32_t *buf =
                (volatile uint32_t *)(DMA_BUF_BASE + rx_idx * DMA_BUF_SIZE);

            frames = (frames + 1u) & 0xFFu;
            printfNexys("--- Frame %u (%u bytes) ---\r\n", frames, len);

            // Print up to 16 words (64 bytes); includes 14-byte Ethernet header
            uint32_t print_words = (words < 16u) ? words : 16u;
            for (uint32_t w = 0u; w < print_words; w++) {
                printfNexys("[%02u] %08X\r\n", w, buf[w]);
            }
            if (words > 16u) {
                printfNexys("  ... (%u more words)\r\n", words - 16u);
            }
            printfNexys("--- End ---\r\n");

            // Re-arm descriptor and advance tail pointer to re-submit to DMA
            ring[rx_idx].status  = 0u;
            ring[rx_idx].control = DMA_DESC_SOF | DMA_DESC_EOF | DMA_BUF_SIZE;
            DMA_S2MM_TAILDESC =
                DMA_DESC_BASE + rx_idx * (uint32_t)sizeof(sg_desc_t);

            rx_idx = (rx_idx + 1u) % DMA_N_DESC;
            LED_OUT = frames;
        }
    }
}
