# EthTest Major Bugs — Why Ethernet Packet Data Cannot Be Read

> Analysis of remaining issues in `Hardware/Hardware.srcs/sources_1/new/ethernet_top.sv`
> and `EthTest/src/main.c` that prevent reading received Ethernet frame data.

---

## Hardware Issues in `ethernet_top.sv`

### Bug 1 — `fifo_wptr` Never Reset (line 228)

```sv
always @(posedge s_axi_lite_clk) begin   // ← no reset sensitivity
    if (fifo_wr) begin
        fifo_wptr <= fifo_wptr + 8'd1;
    end
end
```

`fifo_count` and `fifo_rptr` both reset to `0` on `negedge s_axi_lite_resetn`, but
`fifo_wptr` is missing from that always block entirely. On first power-on Xilinx
registers default to `0`, so this works once. After any system reset during operation,
`fifo_count` resets to `0` while `fifo_wptr` stays non-zero — the FIFO write pointer and
read pointer are out of sync, corrupting all subsequent data.

---

### Bug 2 — MAC AXI-Stream RX May Stay in Reset

```sv
.axi_rxd_arstn      (mii_rxrstn),   // = ~mac_mii_rxrst
```

`mac_mii_rxrst` comes from `rmii_phy_if`. If that output stays high after system reset
(it is a pulse, not guaranteed zero in steady state), then `mii_rxrstn = 0` permanently.
The MAC's AXI-Stream RX interface stays in reset: `rxd_tvalid` is never asserted, nothing
enters the FIFO.

RXCMPLT in the IS register can still fire (the MAC's receive engine is independent of the
AXI-Stream interface), so the LED frame counter would increment while the FIFO remains
permanently empty.

**This is the most likely reason FIFO reads return `0xDEADBEEF` even when RXCMPLT fires.**

---

## Firmware Issues in `main.c`

### Bug 3 — All Frame Data Is Read and Discarded (line 49)

```c
unsigned int word = ETH_RXDATA;
(void)word;             // ← explicit discard
```

The FIFO drain loop is functionally correct — it reads words until the FIFO is empty —
but throws every word away. This is the explicit `TODO` that was left. The data cannot be
"read" by anyone because it is immediately thrown out.

---

### Bug 4 — No Ethernet Header Stripping

Even when `word` is stored somewhere useful, the first **14 bytes (3.5 words)** coming out
of `ETH_RXDATA` are the Ethernet header, not pixel payload:

| Bytes | Content |
|-------|---------|
| 0–5   | Destination MAC address |
| 6–11  | Source MAC address |
| 12–13 | EtherType |
| 14+   | Actual payload (pixel data) |

The firmware must skip the first 4 `ETH_RXDATA` reads to reach actual frame content,
otherwise the "pixel data" contains the Ethernet header instead of image bytes.

---

### Bug 5 — Drain Loop Runs on RXRJECT Too

```c
unsigned int rx = status & RX_FLAGS;  // RX_FLAGS = 0x0C = bits[3:2]
if (rx && !rx_prev) {
    // drain loop runs here for both RXCMPLT (bit 2) AND RXRJECT (bit 3)
```

On a rejected frame there is no data in the FIFO, so the loop exits immediately
(`ETH_RXSTATUS` bit 0 is already `1`). Not fatal, but the drain loop will not populate
any VGA output on rejected frames — which is the correct behavior.

---

## Summary

| # | Location | Issue | Impact |
|---|---|---|---|
| 1 | `ethernet_top.sv:228` | `fifo_wptr` not in reset block | FIFO corrupted after any soft reset |
| 2 | `ethernet_top.sv:331` | `axi_rxd_arstn = mii_rxrstn` stuck low | FIFO always empty despite RXCMPLT firing |
| 3 | `main.c:49` | `(void)word` discards all data | Data is read from hardware but not stored |
| 4 | `main.c:42–50` | No header skip (14 bytes) | First 3–4 words are Ethernet header, not pixels |
| 5 | `main.c:37` | Drain triggers on RXRJECT too | Benign — FIFO is empty on reject, loop exits immediately |

**Most likely root cause of the failure:** Bug 2 and Bug 3 together.

- **Bug 2** — The FIFO may be empty because the MAC's AXI-Stream RX interface is held in
  reset by `mii_rxrstn`, so data never enters the FIFO even though RXCMPLT fires.
- **Bug 3** — Even if data does flow into the FIFO, it is immediately thrown away before
  any code can use it.

Both must be fixed before received Ethernet frame data can be read and used for VGA display.
