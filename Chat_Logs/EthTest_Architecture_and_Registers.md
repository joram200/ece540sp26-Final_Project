# EthTest — Architecture Diagram & Register Map

---

## System Block Diagram

```mermaid
flowchart TB
    subgraph FPGA["On FPGA — Nexys A7 (xc7a100t)"]
        direction TB

        PLLE2["clk_gen_nexys — PLLE2_BASE PLL
        ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        100 MHz input  →  25 MHz  clk_core
                          100 MHz clk_eth
                          125 MHz clk_gtx
                           50 MHz clk_eth_ref     0°
                           50 MHz clk_eth_ref_phy 45°"]

        ODDR["ODDR — Clock Forwarding
        clk_eth_ref_phy (50 MHz 45°) → CLKIN output pin"]

        CPU["VeeR EL2 RISC-V Core
        clk_core — 25 MHz"]

        XBAR["AXI Crossbar  (axi_intercon)
        ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
        0x00000000 – 0x08000000  →  DDR2 SDRAM
        0x80000000 – 0x80004000  →  Peripherals
        0x80040000 – 0x8007FFFF  →  Ethernet"]

        CDC["AXI CDC Bridge
        clk_core 25 MHz  →  clk_eth 100 MHz"]

        subgraph ETHTOP["ethernet_top   (clk_eth — 100 MHz)"]
            direction TB

            W64["axi_lite_64to32
            64-bit CPU bus → 32-bit MAC AXI-Lite
            Selects wdata / rdata lane via addr[2]"]

            MAC["axi_ethernet_0  —  Xilinx AXI Ethernet MAC
            ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
            MII mode  |  SupportLevel=1  |  Soft TEMAC
            AXI-Lite control  (offsets 0x000 – 0x7FC)
            AXI-Stream RX output  (m_axis_rxd, 32-bit)
            AXI-Stream TX input   (s_axis_txd)
            MDIO management interface"]

            FIFO["RX Capture FIFO  —  256 × 32-bit
            ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
            rxd_tready = ~fifo_full  (backpressure)
            ETH_RXDATA   @ offset 0x1000  (pop)
            ETH_RXSTATUS @ offset 0x1008  (status)"]

            RMIIIF["rmii_phy_if  —  MII ↔ RMII Bridge
            ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
            Clocked by clk_eth_ref  (50 MHz  0°)
            Generates mac_mii_rxc/txc  (25 MHz toggle)
            Decodes CRS_DV per RMII spec"]

            W64 <-->|"32-bit AXI-Lite\noffsets 0x000 – 0x7FC"| MAC
            W64 <-->|"FIFO register reads\noffsets 0x1000 / 0x1008"| FIFO
            MAC -->|"m_axis_rxd\nAXI-Stream 32-bit words\n+ tlast frame boundary"| FIFO
            MAC <-->|"MII  (4-bit nibbles, 25 MHz)\nmii_rxd, mii_rx_dv, mii_rx_er\nmii_txd, mii_tx_en, mii_tx_clk"| RMIIIF
        end

        PLLE2 -->|"clk_eth_ref_phy\n50 MHz 45°"| ODDR
        PLLE2 -->|"clk_eth_ref 50 MHz 0°"| RMIIIF
        PLLE2 -->|"clk_gtx 125 MHz"| MAC
        CPU <-->|"AXI4  64-bit data\n32-bit address"| XBAR
        XBAR <-->|"eth_cpu AXI bus\n(clk_core domain)"| CDC
        CDC <-->|"eth_cdc_bus AXI4  64-bit\n(clk_eth domain)"| W64
    end

    PHY["LAN8720A Ethernet Transceiver Chip
    RMII  100 / 10 Mbps  |  REF_CLK-In mode"]

    RJ45["RJ45 Jack"]

    ODDR -->|"CLKIN  50 MHz reference"| PHY
    RMIIIF <-->|"RMII signals
    CRS_DV, RXD[1:0], RXERR
    TXEN,   TXD[1:0]"| PHY
    PHY <-->|"100Base-TX"| RJ45
```

---

## ethernet\_top Register Map

All registers are 32-bit wide and accessed as `unsigned int` from firmware.
The Ethernet peripheral base address is **`0x80040000`**.

Addresses `0x80040000` – `0x80040FFF` (offset `0x000` – `0xFFF`) are forwarded to the
Xilinx AXI Ethernet MAC through the `axi_lite_64to32` width converter.

Addresses `0x80041000` – `0x8007FFFF` (offset `0x1000` – `0x3FFFF`) are decoded by
`ethernet_top` and service the internal RX Capture FIFO registers.

---

### MAC Control / Status Registers (Xilinx DS759)

| Register | CPU Address | Offset | Bit Field | Access | Reset Value | Description |
|---|---|---|---|---|---|---|
| **RAF** | `0x80040000` | `0x000` | `[2]` BcstRej | R/W | `0x0000_0000` | Receive Address Filter. `BcstRej=0` accepts broadcast frames (default). Set bit 2 to reject broadcasts. |
| **IS** | `0x8004000C` | `0x00C` | `[7]` MgtRdy | RO | — | Management Ready. Set to 1 once PHY MDIO is initialised. Always 1 in steady state. |
| | | | `[6]` RxDcmLock | RO | — | RX DCM lock. Always 1 (no DCM in MII mode). |
| | | | `[4]` RxMemOvr | W1C | `0` | RX Memory Overflow. Set if MAC's internal RX FIFO overflows. Cleared by writing 1. |
| | | | `[3]` RxRject | W1C | `0` | Frame Rejected. Set when a received frame is discarded (bad CRC, address mismatch, etc.). Write 1 to clear. |
| | | | `[2]` RxCmplt | W1C | `0` | Frame Complete. Set when a full frame has been received and transferred to the AXI-Stream. Write 1 to clear. |
| **RCW1** | `0x80040404` | `0x404` | `[28]` RX\_EN | R/W | `0x1000_FFFF` | Receiver Enable. **Must be set to 1** to enable frame reception. Write `(1u << 28)`. |
| | | | `[27]` Vlan | R/W | — | VLAN frame enable. Leave 0 for standard frames. |
| | | | `[26]` HD | R/W | — | Half-duplex enable. Leave 0 for full-duplex. |
| **EMMC** | `0x80040410` | `0x410` | `[31:30]` MAC\_SPEED | R/W | `0x8000_0000` | MAC speed. `10` = 1 Gbps (reset default — **wrong for 100M**), `01` = 100 Mbps, `00` = 10 Mbps. Write `(1u << 30)` to select 100 Mbps. |

---

### RX Capture FIFO Registers (ethernet\_top custom, offset ≥ 0x1000)

Reads to these offsets are intercepted by `ethernet_top` and never forwarded to the MAC.

| Register | CPU Address | Offset | Bit Field | Access | Reset Value | Description |
|---|---|---|---|---|---|---|
| **ETH\_RXDATA** | `0x80041000` | `0x1000` | `[31:0]` data | R (destructive) | — | Pop one 32-bit word from the head of the RX Capture FIFO. Each read advances the read pointer by one entry. Returns `0xDEADBEEF` if the FIFO is empty. Read ETH\_RXSTATUS first to confirm the FIFO is not empty. |
| **ETH\_RXSTATUS** | `0x80041008` | `0x1008` | `[31:24]` frame\_count | RO | `0x0000_0001` | Number of complete (tlast-terminated) frames currently in the FIFO. Increments when a frame's last word is written; decrements when that word is read out. |
| | | | `[17:9]` word\_count | RO | — | Total 32-bit words currently stored in the FIFO (0 – 256). |
| | | | `[8]` tlast | RO | — | The `tlast` flag of the word at the current read pointer. Indicates the head word is the last word of its frame. |
| | | | `[1]` full | RO | — | FIFO full flag. Set when all 256 entries are occupied. The MAC will be backpressured (rxd\_tready = 0) while full; new data is held in the MAC's internal buffer. |
| | | | `[0]` empty | RO | `1` | FIFO empty flag. **Poll this bit before reading ETH\_RXDATA.** `1` = no data available. |

---

### Firmware Usage Pattern (EthTest `main.c`)

```c
/* Initialisation */
ETH_SPEED = (1u << 30);   // EMMC[31:30] = 01 → 100 Mbps
ETH_RCW1  = (1u << 28);   // RCW1[28]    = 1  → receiver enable
ETH_IS    = 0x0Cu;         // Clear any stale RxCmplt / RxRject bits

/* Poll loop */
unsigned int status = ETH_IS;
if (status & 0x04u)        // RxCmplt (IS bit 2)
{
    /* Drain the FIFO one word at a time */
    while (!(ETH_RXSTATUS & 0x1u))   // while not empty
    {
        unsigned int word = ETH_RXDATA;  // pops one word
        /* TODO: write word to VGA framebuffer (skip first 4 words = 14-byte Eth header) */
    }
    ETH_IS = 0x04u;    // W1C: clear RxCmplt
}
if (status & 0x08u)    // RxRject (IS bit 3)
    ETH_IS = 0x08u;    // W1C: clear RxRject
```

---

### Address Map Summary

| Region | CPU Address Range | Size | Target |
|---|---|---|---|
| Peripherals | `0x80000000` – `0x80003FFF` | 16 KB | GPIO, UART, timers, etc. |
| **Ethernet** | **`0x80040000` – `0x8007FFFF`** | **256 KB** | **ethernet\_top** |
| — MAC registers | `0x80040000` – `0x80040FFF` | 4 KB | Forwarded to axi\_ethernet\_0 |
| — RX FIFO regs | `0x80041000` – `0x8007FFFF` | 252 KB | Decoded by ethernet\_top |
| DDR2 SDRAM | `0x00000000` – `0x07FFFFFF` | 128 MB | litedram |
