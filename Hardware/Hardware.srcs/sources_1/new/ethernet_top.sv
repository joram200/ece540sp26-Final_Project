`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Portland State Univeristy
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
// Dependencies: axi_ethernet_0.v, rmii_phy_if.v
//
// Revision: 1.0
// Revision 0.01 - File Created
// Revision 2.0 - Added 256x32 RX capture FIFO with AXI-Lite register interface.
//                m_axis_rxd/rxs ports removed; RX stream is now captured internally.
//                ETH_RXDATA  @ offset 0x1000 (pops one 32-bit word from FIFO)
//                ETH_RXSTATUS@ offset 0x1008 (word count, frame count, empty/full)
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

    // ---- AXI4-Lite Slave Interface (from AXI Interconnect io port) --------
    // Write address channel
    input  wire [17:0] s_axi_awaddr,
    input  wire        s_axi_awvalid,
    output wire        s_axi_awready,
    // Write data channel (64-bit: width-converted internally to 32-bit MAC)
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
    // Read data channel (64-bit: MAC 32-bit result lane-extended internally)
    output wire [63:0] s_axi_rdata,
    output wire  [1:0] s_axi_rresp,
    output wire        s_axi_rvalid,
    input  wire        s_axi_rready,

    // ---- AXI-Stream TX Data  (DMA -> Ethernet MAC) ------------------------
    input  wire [31:0] s_axis_txd_tdata,
    input  wire  [3:0] s_axis_txd_tkeep,
    input  wire        s_axis_txd_tlast,
    output wire        s_axis_txd_tready,
    input  wire        s_axis_txd_tvalid,

    // ---- AXI-Stream TX Control  (DMA -> Ethernet MAC) --------------------
    input  wire [31:0] s_axis_txc_tdata,
    input  wire  [3:0] s_axis_txc_tkeep,
    input  wire        s_axis_txc_tlast,
    output wire        s_axis_txc_tready,
    input  wire        s_axis_txc_tvalid,

    // ---- RMII PHY Interface (external pins) ------------------------------
    input  wire        phy_rmii_crsdv,      // Carrier sense / RX data valid (muxed)
    input  wire        phy_rmii_rxer,       // RX error (optional on RMII)
    input  wire  [1:0] phy_rmii_rxd,        // 2-bit RX data from PHY
    output wire        phy_rmii_txen,       // TX enable to PHY
    output wire  [1:0] phy_rmii_txd,        // 2-bit TX data to PHY

    // ---- MDIO Management Interface ---------------------------------------
    output wire        mdio_mdc,            // Management clock
    input  wire        mdio_mdio_i,         // MDIO data in
    output wire        mdio_mdio_o,         // MDIO data out
    output wire        mdio_mdio_t,         // MDIO tristate enable

    // ---- PHY Reset -------------------------------------------------------
    output wire        phy_rst_n,           // Active-low reset driven to PHY

    // ---- Speed Mode (ties to rmii_phy_if.mode_speed) ---------------------
    input  wire        mode_speed,          // 0 = 10 Mbps, 1 = 100 Mbps

    // ---- Interrupts ------------------------------------------------------
    output wire        mac_irq,             // Rising-edge MAC interrupt
    output wire        interrupt            // Level-high DMA/packet interrupt

);

    // =========================================================================
    // Internal MII wires connecting axi_ethernet_0 (MAC) <-> rmii_phy_if
    // =========================================================================

    // RX path: rmii_phy_if outputs -> axi_ethernet_0 MII RX inputs
    wire        mii_rx_clk;   // mac_mii_rxc  -> mii_rx_clk  (derived from phy_rmii_ref_clk)
    wire        mii_rx_dv;    // mac_mii_rxdv -> mii_rx_dv
    wire        mii_rx_er;    // mac_mii_rxer -> mii_rx_er
    wire  [3:0] mii_rxd;      // mac_mii_rxd  -> mii_rxd

    // TX path: axi_ethernet_0 MII TX outputs -> rmii_phy_if inputs
    wire        mii_tx_clk;   // mac_mii_txc  -> mii_tx_clk  (derived from phy_rmii_ref_clk)
    wire        mii_tx_en;    // mii_tx_en    -> mac_mii_txen
    wire        mii_tx_er;    // mii_tx_er    -> mac_mii_txer
    wire  [3:0] mii_txd;      // mii_txd      -> mac_mii_txd

    // Optional reset strobes from rmii_phy_if back to MAC (active-high).
    // Inverted (~) before connecting to axi_ethernet_0's active-low axis resets.
    wire        mii_rxrst;    // mac_mii_rxrst -> drives ~axi_rxd_arstn / ~axi_rxs_arstn
    wire        mii_rxrstn;   // inverted mac_mii_rxrst
    wire        mii_txrst;    // mac_mii_txrst -> drives ~axi_txd_arstn / ~axi_txc_arstn
    wire        mii_txrstn;   // inverted mac_mii_txrst

    // Inverters for resets
    not (mii_rxrstn, mii_rxrst);
    not (mii_txrstn, mii_txrst);

    // =========================================================================
    // Internal RX AXI-Stream wires (formerly external ports)
    // These are captured by the FIFO below instead of being exported.
    // =========================================================================
    wire [31:0] rxd_tdata;
    wire  [3:0] rxd_tkeep;
    wire        rxd_tlast;
    wire        rxd_tready;   // driven by ~fifo_full (backpressure)
    wire        rxd_tvalid;

    // RX status stream — accepted and discarded internally
    wire [31:0] rxs_tdata;
    wire  [3:0] rxs_tkeep;
    wire        rxs_tlast;
    wire        rxs_tvalid;

    // =========================================================================
    // AXI-Lite mux: split MAC register path from FIFO register path
    //
    // Address decode: s_axi_araddr[17:12] != 0 means offset >= 0x1000
    //   Offset 0x1000 → ETH_RXDATA   (read pops one 32-bit word)
    //   Offset 0x1008 → ETH_RXSTATUS (word count, frame count, empty, full)
    //   Offset 0x000 .. 0xFFF → MAC AXI-Lite registers (forwarded as before)
    //
    // Write path: all writes forwarded to MAC unchanged (firmware does not write
    // to FIFO register offsets; write path is not gated).
    // =========================================================================

    // Decode: is the incoming read address targeting the FIFO registers?
    wire        fifo_sel_ar = (s_axi_araddr[17:12] != 6'h0);

    // Internal wires for the MAC-side of the read channel
    wire        mac_arvalid_i;    // arvalid gated to MAC (suppressed for FIFO reads)
    wire        mac_arready_i;    // arready from MAC
    wire        mac_rvalid_i;     // rvalid from MAC
    wire  [1:0] mac_rresp_i;      // rresp from MAC
    wire        mac_rready_i;     // rready to MAC (suppressed while FIFO response pending)
    wire [31:0] mac_rdata_i;      // 32-bit rdata from MAC (before lane expansion)
    wire [63:0] mac_rdata_wide_i; // 64-bit expanded rdata (from axi_lite_64to32)

    // Gate MAC arvalid: do not forward FIFO-address reads to the MAC
    assign mac_arvalid_i = s_axi_arvalid & ~fifo_sel_ar;
    // Gate MAC rready: suppress while a FIFO response is being returned
    assign mac_rready_i  = s_axi_rready & ~fifo_r_pending;

    // =========================================================================
    // AXI4-Lite 64->32 data-width converter
    // Converts the 64-bit CPU bus lanes to the 32-bit AXI4-Lite port that
    // axi_ethernet_0 expects.  All address and handshake signals are wired
    // directly through; only wdata, wstrb, and rdata are converted.
    // =========================================================================

    wire [31:0] mac_wdata;
    wire  [3:0] mac_wstrb;

    axi_lite_64to32 u_width_conv (
        .aclk       (s_axi_lite_clk),
        .aresetn    (s_axi_lite_resetn),
        // Write address channel observation
        .s_awaddr2  (s_axi_awaddr[2]),
        .s_awvalid  (s_axi_awvalid),
        .m_awready  (s_axi_awready),
        // Write data channel observation
        .s_wvalid   (s_axi_wvalid),
        .m_wready   (s_axi_wready),
        // 64->32 write conversion
        .s_wdata    (s_axi_wdata),
        .s_wstrb    (s_axi_wstrb),
        .m_wdata    (mac_wdata),
        .m_wstrb    (mac_wstrb),
        // Read address channel observation (uses mac_arvalid_i path)
        .s_araddr2  (s_axi_araddr[2]),
        .s_arvalid  (mac_arvalid_i),
        .m_arready  (mac_arready_i),
        // 32->64 read conversion (drives internal wire, not port directly)
        .m_rdata    (mac_rdata_i),
        .s_rdata    (mac_rdata_wide_i)
    );

    // =========================================================================
    // RX Capture FIFO (256 x 32-bit, synchronous, s_axi_lite_clk = 100 MHz)
    // No CDC needed: MAC axis_clk is also s_axi_lite_clk.
    // =========================================================================
    localparam integer FIFO_DEPTH = 256;

    reg [31:0] fifo_data [0:FIFO_DEPTH-1];
    reg        fifo_last [0:FIFO_DEPTH-1]; // tlast tag per entry
    reg  [7:0] fifo_wptr;
    reg  [7:0] fifo_rptr;
    reg  [8:0] fifo_count;   // 0 .. 256
    reg  [7:0] fifo_frames;  // number of complete (tlast-terminated) frames in FIFO

    wire fifo_empty = (fifo_count == 9'd0);
    wire fifo_full  = (fifo_count == 9'd256);

    // FIFO write: accept from MAC when not full; provides backpressure via rxd_tready
    assign rxd_tready = ~fifo_full;
    wire   fifo_wr    = rxd_tvalid & rxd_tready;

    // FIFO read: pop occurs when a RXDATA read completes
    wire   fifo_rd_en = fifo_r_pending & fifo_r_is_data & s_axi_rready & ~fifo_empty;

    always @(posedge s_axi_lite_clk) begin
        if (fifo_wr) begin
            fifo_data[fifo_wptr] <= rxd_tdata;
            fifo_last[fifo_wptr] <= rxd_tlast;
            fifo_wptr            <= fifo_wptr + 8'd1;
        end
    end

    // FIFO word count
    always @(posedge s_axi_lite_clk or negedge s_axi_lite_resetn) begin
        if (~s_axi_lite_resetn)
            fifo_count <= 9'd0;
        else
            case ({fifo_wr, fifo_rd_en})
                2'b10: fifo_count <= fifo_count + 9'd1;
                2'b01: fifo_count <= fifo_count - 9'd1;
                default: ;
            endcase
    end

    // Frame counter: increment when tlast written, decrement when tlast read out
    always @(posedge s_axi_lite_clk or negedge s_axi_lite_resetn) begin
        if (~s_axi_lite_resetn) begin
            fifo_frames <= 8'd0;
        end else begin
            if ((fifo_wr & rxd_tlast) & ~(fifo_rd_en & fifo_last[fifo_rptr]))
                fifo_frames <= fifo_frames + 8'd1;
            else if (~(fifo_wr & rxd_tlast) & (fifo_rd_en & fifo_last[fifo_rptr]))
                fifo_frames <= fifo_frames - 8'd1;
        end
    end

    // =========================================================================
    // FIFO AXI-Lite read register interface
    // Accepts AR immediately (arready = 1) when FIFO selected and not busy.
    // Returns R data one cycle later (fifo_r_pending = 1 asserts rvalid).
    // =========================================================================
    reg fifo_r_pending;  // 1 = FIFO R response outstanding
    reg fifo_r_is_data;  // 1 = RXDATA read (pops FIFO), 0 = RXSTATUS (no pop)

    // FIFO arready: accept AR immediately when not already serving a FIFO read
    wire fifo_arready = fifo_sel_ar & ~fifo_r_pending;

    always @(posedge s_axi_lite_clk or negedge s_axi_lite_resetn) begin
        if (~s_axi_lite_resetn) begin
            fifo_r_pending <= 1'b0;
            fifo_r_is_data <= 1'b0;
            fifo_rptr      <= 8'd0;
        end else begin
            // Accept FIFO AR handshake
            if (fifo_arready & s_axi_arvalid) begin
                fifo_r_pending <= 1'b1;
                // Offset 0x1000: addr[11:0] = 12'h000 → RXDATA (pop)
                // Offset 0x1008: addr[11:0] = 12'h008 → RXSTATUS (no pop)
                fifo_r_is_data <= (s_axi_araddr[11:0] == 12'h000);
            end
            // Complete FIFO R when master accepts the data
            if (fifo_r_pending & s_axi_rready) begin
                fifo_r_pending <= 1'b0;
                if (fifo_r_is_data & ~fifo_empty)
                    fifo_rptr <= fifo_rptr + 8'd1; // advance read pointer
            end
        end
    end

    // FIFO read data, 32-bit:
    //   RXDATA   → head of FIFO (or 0xDEADBEEF if empty)
    //   RXSTATUS → {frame_count[7:0], 6'h0, word_count[8:0], last_flag, full, empty}
    wire [31:0] fifo_rdata_32 = fifo_r_is_data ?
        (fifo_empty ? 32'hDEAD_BEEF : fifo_data[fifo_rptr]) :
        {fifo_frames,               // [31:24] complete frame count
         6'h0,                      // [23:18] reserved
         fifo_count,                // [17:9]  word count (9 bits)
         fifo_last[fifo_rptr],      // [8]     tlast flag of current head word
         6'h0,                      // [7:2]   reserved
         fifo_full,                 // [1]     FIFO full
         fifo_empty};               // [0]     FIFO empty

    // Expand to 64-bit: data in lower 32 bits (addr[2]=0 for both 0x1000 and 0x1008)
    wire [63:0] fifo_rdata_wide = {32'h0, fifo_rdata_32};

    // =========================================================================
    // AXI-Lite output MUX: FIFO responses take priority when fifo_r_pending
    // =========================================================================
    assign s_axi_arready = fifo_sel_ar    ? fifo_arready    : mac_arready_i;
    assign s_axi_rvalid  = fifo_r_pending ? 1'b1            : mac_rvalid_i;
    assign s_axi_rdata   = fifo_r_pending ? fifo_rdata_wide : mac_rdata_wide_i;
    assign s_axi_rresp   = fifo_r_pending ? 2'b00           : mac_rresp_i;  // OKAY for FIFO

    // =========================================================================
    // Instantiations of the AXI Ethernet Subsystem and MII-to-RMII modules
    // =========================================================================

    // --- Xilinx AXI Ethernet MAC (MII mode, SupportLevel=1 includes DMA) ---
    axi_ethernet_0 u_axi_ethernet_0 (
        // Clocks and resets
        .s_axi_lite_clk     (s_axi_lite_clk),
        .s_axi_lite_resetn  (s_axi_lite_resetn),
        .axis_clk           (s_axi_lite_clk),
        .gtx_clk            (gtx_clk),
        // AXI-Stream resets (active-low); driven by inverted MII reset strobes
        .axi_txd_arstn      (mii_txrstn),
        .axi_txc_arstn      (mii_txrstn),
        .axi_rxd_arstn      (mii_rxrstn),
        .axi_rxs_arstn      (mii_rxrstn),
        // AXI4-Lite slave control interface
        .s_axi_awaddr       (s_axi_awaddr),
        .s_axi_awvalid      (s_axi_awvalid),
        .s_axi_awready      (s_axi_awready),
        .s_axi_wdata        (mac_wdata),
        .s_axi_wstrb        (mac_wstrb),
        .s_axi_wvalid       (s_axi_wvalid),
        .s_axi_wready       (s_axi_wready),
        .s_axi_bresp        (s_axi_bresp),
        .s_axi_bvalid       (s_axi_bvalid),
        .s_axi_bready       (s_axi_bready),
        // Read channel: gated arvalid, internal arready/rvalid/rresp/rdata
        .s_axi_araddr       (s_axi_araddr),
        .s_axi_arvalid      (mac_arvalid_i),
        .s_axi_arready      (mac_arready_i),
        .s_axi_rdata        (mac_rdata_i),
        .s_axi_rresp        (mac_rresp_i),
        .s_axi_rvalid       (mac_rvalid_i),
        .s_axi_rready       (mac_rready_i),
        // AXI-Stream TX data
        .s_axis_txd_tdata   (s_axis_txd_tdata),
        .s_axis_txd_tkeep   (s_axis_txd_tkeep),
        .s_axis_txd_tlast   (s_axis_txd_tlast),
        .s_axis_txd_tready  (s_axis_txd_tready),
        .s_axis_txd_tvalid  (s_axis_txd_tvalid),
        // AXI-Stream TX control
        .s_axis_txc_tdata   (s_axis_txc_tdata),
        .s_axis_txc_tkeep   (s_axis_txc_tkeep),
        .s_axis_txc_tlast   (s_axis_txc_tlast),
        .s_axis_txc_tready  (s_axis_txc_tready),
        .s_axis_txc_tvalid  (s_axis_txc_tvalid),
        // AXI-Stream RX data → captured by internal FIFO
        .m_axis_rxd_tdata   (rxd_tdata),
        .m_axis_rxd_tkeep   (rxd_tkeep),
        .m_axis_rxd_tlast   (rxd_tlast),
        .m_axis_rxd_tready  (rxd_tready),   // backpressure from FIFO
        .m_axis_rxd_tvalid  (rxd_tvalid),
        // AXI-Stream RX status → accepted and discarded
        .m_axis_rxs_tdata   (rxs_tdata),
        .m_axis_rxs_tkeep   (rxs_tkeep),
        .m_axis_rxs_tlast   (rxs_tlast),
        .m_axis_rxs_tready  (1'b1),         // always drain
        .m_axis_rxs_tvalid  (rxs_tvalid),
        // MII interface -> connects to rmii_phy_if mac_mii_* wires
        .mii_rx_clk         (mii_rx_clk),
        .mii_rx_dv          (mii_rx_dv),
        .mii_rx_er          (mii_rx_er),
        .mii_rxd            (mii_rxd),
        .mii_tx_clk         (mii_tx_clk),
        .mii_tx_en          (mii_tx_en),
        .mii_tx_er          (mii_tx_er),
        .mii_txd            (mii_txd),
        // MDIO management interface
        .mdio_mdc           (mdio_mdc),
        .mdio_mdio_i        (mdio_mdio_i),
        .mdio_mdio_o        (mdio_mdio_o),
        .mdio_mdio_t        (mdio_mdio_t),
        // PHY reset and interrupts
        .phy_rst_n          (phy_rst_n),
        .mac_irq            (mac_irq),
        .interrupt          (interrupt)
    );

    // --- MII-to-RMII bridge (converts between MAC MII and external RMII PHY) ---
    rmii_phy_if u_rmii_phy_if (
        // Reset and speed mode
        .rstn_async         (s_axi_lite_resetn),
        .mode_speed         (mode_speed),
        // MII interface (MAC side) -> connects to axi_ethernet_0 mii_* wires
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
        .mac_mii_crs        (1'bx),         // CRS unused by axi_ethernet_0 MII mode
        // RMII interface (PHY side) -> external pins
        .phy_rmii_ref_clk   (phy_rmii_ref_clk),
        .phy_rmii_crsdv     (phy_rmii_crsdv),
        .phy_rmii_rxer      (phy_rmii_rxer),
        .phy_rmii_rxd       (phy_rmii_rxd),
        .phy_rmii_txen      (phy_rmii_txen),
        .phy_rmii_txd       (phy_rmii_txd)
    );

endmodule
