#include "bsp_printf.h"

#define ETH      0x80040000u
#define ETH_IS   (*(volatile unsigned int *)(ETH + 0x0Cu))
#define ETH_RCW1 (*(volatile unsigned int *)(ETH + 0x404u))
#define ETH_SPEED (*(volatile unsigned int *)(ETH + 0x410u))
#define LED_OUT  (*(volatile unsigned int *)0x80001404u)
#define LED_OE   (*(volatile unsigned int *)0x80001408u)
#define RX_FLAGS 0x0Cu

/* RX capture FIFO registers (ethernet_top, offset >= 0x1000 -> FIFO path)
 * ETH_RXDATA   (offset 0x1000): read pops one 32-bit word from the FIFO.
 * ETH_RXSTATUS (offset 0x1008): status snapshot (no pop).
 *   [31:24] frame_count  - complete (tlast-terminated) frames in FIFO
 *   [17:9]  word_count   - 32-bit words currently in FIFO
 *   [1]     full         - FIFO full flag
 *   [0]     empty        - FIFO empty flag
 */
#define ETH_RXDATA   (*(volatile unsigned int *)(ETH + 0x1000u))
#define ETH_RXSTATUS (*(volatile unsigned int *)(ETH + 0x1008u))

int main(void)
{
    LED_OE = 0xFFFFu;
    LED_OUT = 0u;
    uartInit();
    ETH_SPEED = (1u << 30);
    ETH_RCW1 = (1u << 28);
    ETH_IS = RX_FLAGS;

    unsigned int frames  = 0u;
    unsigned int rx_prev = 0u;
    unsigned int rx_held = 0u;

    printfNexys("EthTest ready\r\n");

    for (;;)
    {
        unsigned int status = ETH_IS;
        unsigned int rx = status & RX_FLAGS;

        if (rx && !rx_prev)
        {
            rx_held = (status >> 2) & 0x3u;
            frames = (frames + 1u) & 0xFu;

            printfNexys("--- Frame %u (flags=%u) ---\r\n", frames, rx_held);
            unsigned int word_idx = 0u;
            while (!(ETH_RXSTATUS & 0x1u))
            {
                unsigned int word = ETH_RXDATA;
                printfNexys("[%02u] %08X\r\n", word_idx, word);
                word_idx++;
            }
            printfNexys("--- End (%u words) ---\r\n", word_idx);
        }
        if (rx)
            ETH_IS = rx;
        rx_prev = rx;

        LED_OUT = (frames << 4) | rx_held;
    }
}
