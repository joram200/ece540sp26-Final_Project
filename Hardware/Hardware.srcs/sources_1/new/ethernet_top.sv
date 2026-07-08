`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Portland State University
// Engineer: Jose Ramirez
//
// Create Date: 06/01/2026 10:25:34 PM
// Design Name: Top module for Ethernet
// Module Name: ethernet_top
// Project Name: ECE 540 Spring 2026 Final Project
// Target Devices: xc7a100tcsg324-1
// Tool Versions: Vivado v2025.2
// Description:
//
// Dependencies: axi_ethernet_0.v, rmii_phy_if.v, axi_dma_0
//
// Revision: 3.0
// Revision 0.01 - File Created
// Revision 2.0 - Added 256x32 RX capture FIFO with AXI-Lite register interface.
// Revision 3.0 - Replaced custom FIFO with axi_dma_0 (Xilinx PG021, SG mode).
//                RX frames are DMA'd directly to DDR2 via S2MM channel.
//                TX frames are DMA'd from DDR2 via MM2S channel.
//                DMA AXI4 master ports exposed as flat top-level outputs for
//                connection to CDC bridges and DDR crossbar in rvfpganexys.sv.
//                DMA control registers mapped at AXI-Lite offset 0x2000
//                (CPU address 0x80042000).
//
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////


module ethernet_top (

    // ---- System Clocks and Resets ----------------------------------------
    input  wire        s_axi_lite_clk,      // 100 MHz: AXI-Lite control + AXIS data clock
    input  wire        s_axi_lite_resetn,   // Active-low synchronous reset for AXI-Lite domain
    input  wire        gtx_clk,             // 125 MHz GTX reference clock for Ethernet MAC
    input  wire        phy_rmii_ref_clk,    // 50 MHz RMII reference clock supplied by PHY

    // ---- AXI4-Lite Slave Interface (from AXI Interconnect eth port) -------
    // Write address channel
    input  wire [17:0] s_axi_awaddr,
    input  wire        s_axi_awvalid,
    output wire        s_axi_awready,
    // Write data channel (64-bit: width-converted internally to 32-bit)
    input  wire [63:0] s_axi_wdata,
    input  wire  [7:0] s_axi_wstrb,
    input  wire        s_axi_wvalid,
    output wire        s_axi_wready,
    // Write response channel
    output wire  [1:0] s_axi_bresp,
    output wire        s_axi_bvalid,
    input  wire        s_axi_bready,
    // Read address channel
    input  wire [17:0] s_axi_araddr,
    input  wire        s_axi_arvalid,
    output wire        s_axi_arready,
    // Read data channel (64-bit: 32-bit results lane-extended internally)
    output wire [63:0] s_axi_rdata,
    output wire  [1:0] s_axi_rresp,
    output wire        s_axi_rvalid,
    input  wire        s_axi_rready,

    // ---- RMII PHY Interface (external pins) ------------------------------
    input  wire        phy_rmii_crsdv,
    input  wire        phy_rmii_rxer,
    input  wire  [1:0] phy_rmii_rxd,
    output wire        phy_rmii_txen,
    output wire  [1:0] phy_rmii_txd,

    // ---- MDIO Management Interface ---------------------------------------
    output wire        mdio_mdc,
    input  wire        mdio_mdio_i,
    output wire        mdio_mdio_o,
    output wire        mdio_mdio_t,

    // ---- PHY Reset -------------------------------------------------------
    output wire        phy_rst_n,

    // ---- Speed Mode ------------------------------------------------------
    input  wire        mode_speed,          // 0 = 10 Mbps, 1 = 100 Mbps

    // ---- MAC Interrupt ---------------------------------------------------
    output wire        mac_irq,

    // ---- DMA AXI4 Master Ports (to rvfpganexys.sv CDC bridges → DDR) ----
    // All three channels are 64-bit data, 32-bit address, active in s_axi_lite_clk domain.

    // Scatter-Gather (descriptor read/write, 32-bit AXI4)
    output wire [31:0] m_axi_sg_awaddr,
    output wire  [7:0] m_axi_sg_awlen,
    output wire  [2:0] m_axi_sg_awsize,
    output wire  [1:0] m_axi_sg_awburst,
    output wire  [2:0] m_axi_sg_awprot,
    output wire  [3:0] m_axi_sg_awcache,
    output wire        m_axi_sg_awvalid,
    input  wire        m_axi_sg_awready,
    output wire [31:0] m_axi_sg_wdata,
    output wire  [3:0] m_axi_sg_wstrb,
    output wire        m_axi_sg_wlast,
    output wire        m_axi_sg_wvalid,
    input  wire        m_axi_sg_wready,
    input  wire  [1:0] m_axi_sg_bresp,
    input  wire        m_axi_sg_bvalid,
    output wire        m_axi_sg_bready,
    output wire [31:0] m_axi_sg_araddr,
    output wire  [7:0] m_axi_sg_arlen,
    output wire  [2:0] m_axi_sg_arsize,
    output wire  [1:0] m_axi_sg_arburst,
    output wire  [2:0] m_axi_sg_arprot,
    output wire  [3:0] m_axi_sg_arcache,
    output wire        m_axi_sg_arvalid,
    input  wire        m_axi_sg_arready,
    input  wire [31:0] m_axi_sg_rdata,
    input  wire  [1:0] m_axi_sg_rresp,
    input  wire        m_axi_sg_rlast,
    input  wire        m_axi_sg_rvalid,
    output wire        m_axi_sg_rready,

    // MM2S (memory-to-stream, TX path: DDR → DMA → MAC TX; READ-ONLY AXI4, 32-bit)
    output wire [31:0] m_axi_mm2s_araddr,
    output wire  [7:0] m_axi_mm2s_arlen,
    output wire  [2:0] m_axi_mm2s_arsize,
    output wire  [1:0] m_axi_mm2s_arburst,
    output wire  [2:0] m_axi_mm2s_arprot,
    output wire  [3:0] m_axi_mm2s_arcache,
    output wire        m_axi_mm2s_arvalid,
    input  wire        m_axi_mm2s_arready,
    input  wire [31:0] m_axi_mm2s_rdata,
    input  wire  [1:0] m_axi_mm2s_rresp,
    input  wire        m_axi_mm2s_rlast,
    input  wire        m_axi_mm2s_rvalid,
    output wire        m_axi_mm2s_rready,

    // S2MM (stream-to-memory, RX path: MAC RX → DMA → DDR; WRITE-ONLY AXI4, 32-bit)
    output wire [31:0] m_axi_s2mm_awaddr,
    output wire  [7:0] m_axi_s2mm_awlen,
    output wire  [2:0] m_axi_s2mm_awsize,
    output wire  [1:0] m_axi_s2mm_awburst,
    output wire  [2:0] m_axi_s2mm_awprot,
    output wire  [3:0] m_axi_s2mm_awcache,
    output wire        m_axi_s2mm_awvalid,
    input  wire        m_axi_s2mm_awready,
    output wire [31:0] m_axi_s2mm_wdata,
    output wire  [3:0] m_axi_s2mm_wstrb,
    output wire        m_axi_s2mm_wlast,
    output wire        m_axi_s2mm_wvalid,
    input  wire        m_axi_s2mm_wready,
    input  wire  [1:0] m_axi_s2mm_bresp,
    input  wire        m_axi_s2mm_bvalid,
    output wire        m_axi_s2mm_bready,

    // ---- DMA Interrupts --------------------------------------------------
    output wire        mm2s_introut,   // TX DMA complete / error
    output wire        s2mm_introut    // RX DMA complete / error

);

    // =========================================================================
    // Internal MII wires connecting axi_ethernet_0 (MAC) <-> rmii_phy_if
    // =========================================================================
    wire        mii_rx_clk;
    wire        mii_rx_dv;
    wire        mii_rx_er;
    wire  [3:0] mii_rxd;

    wire        mii_tx_clk;
    wire        mii_tx_en;
    wire        mii_tx_er;
    wire  [3:0] mii_txd;

    wire        mii_rxrst;
    wire        mii_rxrstn;
    wire        mii_txrst;
    wire        mii_txrstn;

    not (mii_rxrstn, mii_rxrst);
    not (mii_txrstn, mii_txrst);

    // =========================================================================
    // Internal AXI-Stream wires
    // RX: axi_ethernet_0 → axi_dma_0 S2MM
    // TX: axi_dma_0 MM2S → axi_ethernet_0
    // =========================================================================

    // RX data stream (MAC → DMA S2MM)
    wire [31:0] rxd_tdata;
    wire  [3:0] rxd_tkeep;
    wire        rxd_tlast;
    wire        rxd_tready;   // driven by DMA S2MM tready (backpressure)
    wire        rxd_tvalid;

    // RX status stream (MAC → DMA STS)
    wire [31:0] rxs_tdata;
    wire  [3:0] rxs_tkeep;
    wire        rxs_tlast;
    wire        rxs_tvalid;
    wire        rxs_tready;   // driven by DMA STS tready

    // TX data stream (DMA MM2S → MAC)
    wire [31:0] txd_tdata;
    wire  [3:0] txd_tkeep;
    wire        txd_tlast;
    wire        txd_tready;   // from MAC
    wire        txd_tvalid;

    // TX control stream: constant "no checksum offload" word, driven internally
    wire [31:0] txc_tdata;
    wire  [3:0] txc_tkeep;
    wire        txc_tlast;
    wire        txc_tready;   // from MAC (ignored)
    wire        txc_tvalid;

    assign txc_tdata  = 32'h0000_0000;
    assign txc_tkeep  = 4'hF;
    assign txc_tlast  = 1'b1;
    assign txc_tvalid = 1'b1;  // always assert; MAC accepts one control word per frame

    // =========================================================================
    // AXI-Lite address decode
    //
    // addr[13] = 0 → MAC registers   (offset 0x0000–0x1FFF, CPU 0x80040000)
    // addr[13] = 1 → DMA registers   (offset 0x2000–0x3FFF, CPU 0x80042000)
    //
    // Write path: latch sel_dma_aw on the AW handshake to steer W and B channels.
    // Read path:  gate arvalid to MAC or DMA based on araddr[13].
    // =========================================================================

    wire sel_dma_ar = s_axi_araddr[13];
    wire sel_dma_aw = s_axi_awaddr[13];

    // --- Internal handshake wires for MAC write channel ---
    wire        mac_awvalid_i;
    wire        mac_awready_i;
    wire        mac_wvalid_i;
    wire        mac_wready_i;
    wire        mac_bvalid_i;
    wire  [1:0] mac_bresp_i;
    wire        mac_bready_i;

    // --- DMA AXI-Lite handshake wires ---
    wire        dma_awvalid_i;
    wire        dma_awready_i;
    wire        dma_wvalid_i;
    wire        dma_wready_i;
    wire        dma_bvalid_i;
    wire  [1:0] dma_bresp_i;
    wire        dma_arvalid_i;
    wire        dma_arready_i;
    wire [31:0] dma_rdata_32;
    wire  [1:0] dma_rresp_i;
    wire        dma_rvalid_i;

    // --- Track pending DMA read (for read-response MUX) ---
    reg  dma_r_pending;
    always @(posedge s_axi_lite_clk or negedge s_axi_lite_resetn) begin
        if (~s_axi_lite_resetn)
            dma_r_pending <= 1'b0;
        else if (dma_arvalid_i & dma_arready_i)
            dma_r_pending <= 1'b1;
        else if (dma_rvalid_i & s_axi_rready)
            dma_r_pending <= 1'b0;
    end

    // --- Track pending DMA write (for write-response MUX) ---
    // Set when AW handshake to DMA completes; cleared when B handshake completes.
    reg  dma_write_pending;
    always @(posedge s_axi_lite_clk or negedge s_axi_lite_resetn) begin
        if (~s_axi_lite_resetn)
            dma_write_pending <= 1'b0;
        else if (s_axi_awvalid & s_axi_awready & sel_dma_aw)
            dma_write_pending <= 1'b1;
        else if (dma_bvalid_i & s_axi_bready & dma_write_pending)
            dma_write_pending <= 1'b0;
    end

    // --- Write channel gating ---
    assign mac_awvalid_i = s_axi_awvalid & ~sel_dma_aw;
    assign dma_awvalid_i = s_axi_awvalid &  sel_dma_aw;
    assign mac_wvalid_i  = s_axi_wvalid  & ~dma_write_pending;
    assign dma_wvalid_i  = s_axi_wvalid  &  dma_write_pending;
    assign mac_bready_i  = s_axi_bready  & ~dma_write_pending;

    // --- AXI-Lite output MUX ---
    // Write channel: arbitrate awready/wready/bvalid/bresp between MAC and DMA
    assign s_axi_awready = sel_dma_aw        ? dma_awready_i : mac_awready_i;
    assign s_axi_wready  = dma_write_pending ? dma_wready_i  : mac_wready_i;
    assign s_axi_bvalid  = dma_write_pending ? dma_bvalid_i  : mac_bvalid_i;
    assign s_axi_bresp   = dma_write_pending ? dma_bresp_i   : mac_bresp_i;

    // Read channel: arbitrate arready/rvalid/rdata/rresp between MAC and DMA
    wire        mac_arvalid_i = s_axi_arvalid & ~sel_dma_ar;
    wire        mac_arready_i;
    wire        mac_rvalid_i;
    wire  [1:0] mac_rresp_i;
    wire        mac_rready_i  = s_axi_rready  & ~dma_r_pending;

    assign dma_arvalid_i = s_axi_arvalid &  sel_dma_ar;

    wire [63:0] dma_rdata_wide = {32'h0, dma_rdata_32};
    wire [31:0] mac_rdata_i;
    wire [63:0] mac_rdata_wide_i;

    assign s_axi_arready = sel_dma_ar    ? dma_arready_i  : mac_arready_i;
    assign s_axi_rvalid  = dma_r_pending ? dma_rvalid_i   : mac_rvalid_i;
    assign s_axi_rdata   = dma_r_pending ? dma_rdata_wide : mac_rdata_wide_i;
    assign s_axi_rresp   = dma_r_pending ? dma_rresp_i    : mac_rresp_i;

    // =========================================================================
    // AXI4-Lite 64->32 data-width converter
    // Shared between MAC and DMA write paths (only one active at a time).
    // =========================================================================
    wire [31:0] mac_wdata;
    wire  [3:0] mac_wstrb;

    axi_lite_64to32 u_width_conv (
        .aclk       (s_axi_lite_clk),
        .aresetn    (s_axi_lite_resetn),
        // Write address channel: observe MAC writes only
        .s_awaddr2  (s_axi_awaddr[2]),
        .s_awvalid  (mac_awvalid_i),
        .m_awready  (mac_awready_i),
        // Write data channel
        .s_wvalid   (s_axi_wvalid),
        .m_wready   (mac_wready_i),
        // 64->32 write conversion
        .s_wdata    (s_axi_wdata),
        .s_wstrb    (s_axi_wstrb),
        .m_wdata    (mac_wdata),
        .m_wstrb    (mac_wstrb),
        // Read address channel: observe MAC reads only
        .s_araddr2  (s_axi_araddr[2]),
        .s_arvalid  (mac_arvalid_i),
        .m_arready  (mac_arready_i),
        // 32->64 read conversion
        .m_rdata    (mac_rdata_i),
        .s_rdata    (mac_rdata_wide_i)
    );

    // =========================================================================
    // axi_dma_0 instantiation
    // Controls: DMA AXI-Lite slave at AXI offset 0x2000 (CPU 0x80042000)
    // RX:       MAC m_axis_rxd → S_AXIS_S2MM → DDR  (via m_axi_s2mm master)
    // TX:       DDR → M_AXIS_MM2S → MAC s_axis_txd  (via m_axi_mm2s master)
    // SG:       Descriptor ring in DDR               (via m_axi_sg master)
    // =========================================================================
    axi_dma_0 u_axi_dma_0 (
        // Clocks — all in s_axi_lite_clk (100 MHz) domain
        .s_axi_lite_aclk    (s_axi_lite_clk),
        .m_axi_sg_aclk      (s_axi_lite_clk),
        .m_axi_mm2s_aclk    (s_axi_lite_clk),
        .m_axi_s2mm_aclk    (s_axi_lite_clk),
        .axi_resetn         (s_axi_lite_resetn),

        // AXI-Lite control (DMA registers at offset 0x2000, 10-bit reg space)
        .s_axi_lite_awvalid (dma_awvalid_i),
        .s_axi_lite_awready (dma_awready_i),
        .s_axi_lite_awaddr  (s_axi_awaddr[9:0]),
        .s_axi_lite_wvalid  (dma_wvalid_i),
        .s_axi_lite_wready  (dma_wready_i),
        .s_axi_lite_wdata   (mac_wdata),      // reuse 64→32 converter output
        // .s_axi_lite_wstrb not a port (HAS_WSTRB=0)
        .s_axi_lite_bresp   (dma_bresp_i),
        .s_axi_lite_bvalid  (dma_bvalid_i),
        .s_axi_lite_bready  (s_axi_bready),
        .s_axi_lite_arvalid (dma_arvalid_i),
        .s_axi_lite_arready (dma_arready_i),
        .s_axi_lite_araddr  (s_axi_araddr[9:0]),
        .s_axi_lite_rdata   (dma_rdata_32),
        .s_axi_lite_rresp   (dma_rresp_i),
        .s_axi_lite_rvalid  (dma_rvalid_i),
        .s_axi_lite_rready  (s_axi_rready),

        // AXI4 master: Scatter-Gather → top-level ports → CDC → DDR crossbar
        .m_axi_sg_awaddr    (m_axi_sg_awaddr),
        .m_axi_sg_awlen     (m_axi_sg_awlen),
        .m_axi_sg_awsize    (m_axi_sg_awsize),
        .m_axi_sg_awburst   (m_axi_sg_awburst),
        .m_axi_sg_awprot    (m_axi_sg_awprot),
        .m_axi_sg_awcache   (m_axi_sg_awcache),
        .m_axi_sg_awvalid   (m_axi_sg_awvalid),
        .m_axi_sg_awready   (m_axi_sg_awready),
        .m_axi_sg_wdata     (m_axi_sg_wdata),
        .m_axi_sg_wstrb     (m_axi_sg_wstrb),
        .m_axi_sg_wlast     (m_axi_sg_wlast),
        .m_axi_sg_wvalid    (m_axi_sg_wvalid),
        .m_axi_sg_wready    (m_axi_sg_wready),
        .m_axi_sg_bresp     (m_axi_sg_bresp),
        .m_axi_sg_bvalid    (m_axi_sg_bvalid),
        .m_axi_sg_bready    (m_axi_sg_bready),
        .m_axi_sg_araddr    (m_axi_sg_araddr),
        .m_axi_sg_arlen     (m_axi_sg_arlen),
        .m_axi_sg_arsize    (m_axi_sg_arsize),
        .m_axi_sg_arburst   (m_axi_sg_arburst),
        .m_axi_sg_arprot    (m_axi_sg_arprot),
        .m_axi_sg_arcache   (m_axi_sg_arcache),
        .m_axi_sg_arvalid   (m_axi_sg_arvalid),
        .m_axi_sg_arready   (m_axi_sg_arready),
        .m_axi_sg_rdata     (m_axi_sg_rdata),
        .m_axi_sg_rresp     (m_axi_sg_rresp),
        .m_axi_sg_rlast     (m_axi_sg_rlast),
        .m_axi_sg_rvalid    (m_axi_sg_rvalid),
        .m_axi_sg_rready    (m_axi_sg_rready),

        // AXI4 master: MM2S (DDR → stream → MAC TX; READ-ONLY: no AW/W/B ports)
        .mm2s_prmry_reset_out_n  (),
        .mm2s_cntrl_reset_out_n  (),
        // MM2S control stream (TX control word; leave unconnected for RX-only demo)
        .m_axis_mm2s_cntrl_tdata  (),
        .m_axis_mm2s_cntrl_tkeep  (),
        .m_axis_mm2s_cntrl_tvalid (),
        .m_axis_mm2s_cntrl_tready (1'b1),
        .m_axis_mm2s_cntrl_tlast  (),
        .m_axi_mm2s_araddr  (m_axi_mm2s_araddr),
        .m_axi_mm2s_arlen   (m_axi_mm2s_arlen),
        .m_axi_mm2s_arsize  (m_axi_mm2s_arsize),
        .m_axi_mm2s_arburst (m_axi_mm2s_arburst),
        .m_axi_mm2s_arprot  (m_axi_mm2s_arprot),
        .m_axi_mm2s_arcache (m_axi_mm2s_arcache),
        .m_axi_mm2s_arvalid (m_axi_mm2s_arvalid),
        .m_axi_mm2s_arready (m_axi_mm2s_arready),
        .m_axi_mm2s_rdata   (m_axi_mm2s_rdata),
        .m_axi_mm2s_rresp   (m_axi_mm2s_rresp),
        .m_axi_mm2s_rlast   (m_axi_mm2s_rlast),
        .m_axi_mm2s_rvalid  (m_axi_mm2s_rvalid),
        .m_axi_mm2s_rready  (m_axi_mm2s_rready),

        // AXI4 master: S2MM (MAC RX → stream → DDR; WRITE-ONLY: no AR/R ports)
        .s2mm_prmry_reset_out_n  (),
        .s2mm_sts_reset_out_n    (),
        .axi_dma_tstvec          (),
        .m_axi_s2mm_awaddr  (m_axi_s2mm_awaddr),
        .m_axi_s2mm_awlen   (m_axi_s2mm_awlen),
        .m_axi_s2mm_awsize  (m_axi_s2mm_awsize),
        .m_axi_s2mm_awburst (m_axi_s2mm_awburst),
        .m_axi_s2mm_awprot  (m_axi_s2mm_awprot),
        .m_axi_s2mm_awcache (m_axi_s2mm_awcache),
        .m_axi_s2mm_awvalid (m_axi_s2mm_awvalid),
        .m_axi_s2mm_awready (m_axi_s2mm_awready),
        .m_axi_s2mm_wdata   (m_axi_s2mm_wdata),
        .m_axi_s2mm_wstrb   (m_axi_s2mm_wstrb),
        .m_axi_s2mm_wlast   (m_axi_s2mm_wlast),
        .m_axi_s2mm_wvalid  (m_axi_s2mm_wvalid),
        .m_axi_s2mm_wready  (m_axi_s2mm_wready),
        .m_axi_s2mm_bresp   (m_axi_s2mm_bresp),
        .m_axi_s2mm_bvalid  (m_axi_s2mm_bvalid),
        .m_axi_s2mm_bready  (m_axi_s2mm_bready),

        // AXI-Stream TX: DMA reads from DDR and pushes to MAC TX FIFO
        .m_axis_mm2s_tdata  (txd_tdata),
        .m_axis_mm2s_tkeep  (txd_tkeep),
        .m_axis_mm2s_tlast  (txd_tlast),
        .m_axis_mm2s_tvalid (txd_tvalid),
        .m_axis_mm2s_tready (txd_tready),

        // AXI-Stream RX: MAC RX output flows into DMA S2MM; DMA writes to DDR
        .s_axis_s2mm_tdata  (rxd_tdata),
        .s_axis_s2mm_tkeep  (rxd_tkeep),
        .s_axis_s2mm_tlast  (rxd_tlast),
        .s_axis_s2mm_tvalid (rxd_tvalid),
        .s_axis_s2mm_tready (rxd_tready),

        // RX status stream: per-frame status word from MAC (checksum, length)
        .s_axis_s2mm_sts_tdata  (rxs_tdata),
        .s_axis_s2mm_sts_tkeep  (rxs_tkeep),
        .s_axis_s2mm_sts_tlast  (rxs_tlast),
        .s_axis_s2mm_sts_tvalid (rxs_tvalid),
        .s_axis_s2mm_sts_tready (rxs_tready),

        // Interrupts
        .mm2s_introut       (mm2s_introut),
        .s2mm_introut       (s2mm_introut)
    );

    // =========================================================================
    // Xilinx AXI Ethernet MAC (MII mode, SupportLevel=1)
    // =========================================================================
    axi_ethernet_0 u_axi_ethernet_0 (
        // Clocks and resets
        .s_axi_lite_clk     (s_axi_lite_clk),
        .s_axi_lite_resetn  (s_axi_lite_resetn),
        .axis_clk           (s_axi_lite_clk),
        .gtx_clk            (gtx_clk),
        // AXI-Stream resets
        .axi_txd_arstn      (mii_txrstn),
        .axi_txc_arstn      (mii_txrstn),
        .axi_rxd_arstn      (s_axi_lite_resetn),
        .axi_rxs_arstn      (s_axi_lite_resetn),
        // AXI4-Lite slave (MAC registers at offset 0x0000)
        .s_axi_awaddr       (s_axi_awaddr),
        .s_axi_awvalid      (mac_awvalid_i),
        .s_axi_awready      (mac_awready_i),
        .s_axi_wdata        (mac_wdata),
        .s_axi_wstrb        (mac_wstrb),
        .s_axi_wvalid       (mac_wvalid_i),
        .s_axi_wready       (mac_wready_i),
        .s_axi_bresp        (mac_bresp_i),
        .s_axi_bvalid       (mac_bvalid_i),
        .s_axi_bready       (mac_bready_i),
        .s_axi_araddr       (s_axi_araddr),
        .s_axi_arvalid      (mac_arvalid_i),
        .s_axi_arready      (mac_arready_i),
        .s_axi_rdata        (mac_rdata_i),
        .s_axi_rresp        (mac_rresp_i),
        .s_axi_rvalid       (mac_rvalid_i),
        .s_axi_rready       (mac_rready_i),
        // AXI-Stream TX: driven by DMA MM2S output
        .s_axis_txd_tdata   (txd_tdata),
        .s_axis_txd_tkeep   (txd_tkeep),
        .s_axis_txd_tlast   (txd_tlast),
        .s_axis_txd_tready  (txd_tready),
        .s_axis_txd_tvalid  (txd_tvalid),
        // AXI-Stream TX control: constant "no checksum offload"
        .s_axis_txc_tdata   (txc_tdata),
        .s_axis_txc_tkeep   (txc_tkeep),
        .s_axis_txc_tlast   (txc_tlast),
        .s_axis_txc_tready  (txc_tready),
        .s_axis_txc_tvalid  (txc_tvalid),
        // AXI-Stream RX: feeds DMA S2MM input
        .m_axis_rxd_tdata   (rxd_tdata),
        .m_axis_rxd_tkeep   (rxd_tkeep),
        .m_axis_rxd_tlast   (rxd_tlast),
        .m_axis_rxd_tready  (rxd_tready),
        .m_axis_rxd_tvalid  (rxd_tvalid),
        // AXI-Stream RX status: feeds DMA STS input
        .m_axis_rxs_tdata   (rxs_tdata),
        .m_axis_rxs_tkeep   (rxs_tkeep),
        .m_axis_rxs_tlast   (rxs_tlast),
        .m_axis_rxs_tready  (rxs_tready),
        .m_axis_rxs_tvalid  (rxs_tvalid),
        // MII interface
        .mii_rx_clk         (mii_rx_clk),
        .mii_rx_dv          (mii_rx_dv),
        .mii_rx_er          (mii_rx_er),
        .mii_rxd            (mii_rxd),
        .mii_tx_clk         (mii_tx_clk),
        .mii_tx_en          (mii_tx_en),
        .mii_tx_er          (mii_tx_er),
        .mii_txd            (mii_txd),
        // MDIO
        .mdio_mdc           (mdio_mdc),
        .mdio_mdio_i        (mdio_mdio_i),
        .mdio_mdio_o        (mdio_mdio_o),
        .mdio_mdio_t        (mdio_mdio_t),
        // PHY reset and interrupt
        .phy_rst_n          (phy_rst_n),
        .mac_irq            (mac_irq),
        .interrupt          ()
    );

    // =========================================================================
    // MII-to-RMII bridge
    // =========================================================================
    rmii_phy_if u_rmii_phy_if (
        .rstn_async         (s_axi_lite_resetn),
        .mode_speed         (mode_speed),
        .mac_mii_rxc        (mii_rx_clk),
        .mac_mii_rxdv       (mii_rx_dv),
        .mac_mii_rxer       (mii_rx_er),
        .mac_mii_rxd        (mii_rxd),
        .mac_mii_rxrst      (mii_rxrst),
        .mac_mii_txc        (mii_tx_clk),
        .mac_mii_txen       (mii_tx_en),
        .mac_mii_txer       (mii_tx_er),
        .mac_mii_txd        (mii_txd),
        .mac_mii_txrst      (mii_txrst),
        .mac_mii_crs        (1'bx),
        .phy_rmii_ref_clk   (phy_rmii_ref_clk),
        .phy_rmii_crsdv     (phy_rmii_crsdv),
        .phy_rmii_rxer      (phy_rmii_rxer),
        .phy_rmii_rxd       (phy_rmii_rxd),
        .phy_rmii_txen      (phy_rmii_txen),
        .phy_rmii_txd       (phy_rmii_txd)
    );

endmodule
