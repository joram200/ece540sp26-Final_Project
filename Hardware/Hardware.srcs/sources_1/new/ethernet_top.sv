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
    // Write data channel
    input  wire [31:0] s_axi_wdata,
    input  wire  [3:0] s_axi_wstrb,
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
    // Read data channel
    output wire [31:0] s_axi_rdata,
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

    // ---- AXI-Stream RX Data  (Ethernet MAC -> DMA) -----------------------
    output wire [31:0] m_axis_rxd_tdata,
    output wire  [3:0] m_axis_rxd_tkeep,
    output wire        m_axis_rxd_tlast,
    input  wire        m_axis_rxd_tready,
    output wire        m_axis_rxd_tvalid,

    // ---- AXI-Stream RX Status  (Ethernet MAC -> DMA) ---------------------
    output wire [31:0] m_axis_rxs_tdata,
    output wire  [3:0] m_axis_rxs_tkeep,
    output wire        m_axis_rxs_tlast,
    input  wire        m_axis_rxs_tready,
    output wire        m_axis_rxs_tvalid,

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
        .s_axi_wdata        (s_axi_wdata),
        .s_axi_wstrb        (s_axi_wstrb),
        .s_axi_wvalid       (s_axi_wvalid),
        .s_axi_wready       (s_axi_wready),
        .s_axi_bresp        (s_axi_bresp),
        .s_axi_bvalid       (s_axi_bvalid),
        .s_axi_bready       (s_axi_bready),
        .s_axi_araddr       (s_axi_araddr),
        .s_axi_arvalid      (s_axi_arvalid),
        .s_axi_arready      (s_axi_arready),
        .s_axi_rdata        (s_axi_rdata),
        .s_axi_rresp        (s_axi_rresp),
        .s_axi_rvalid       (s_axi_rvalid),
        .s_axi_rready       (s_axi_rready),
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
        // AXI-Stream RX data
        .m_axis_rxd_tdata   (m_axis_rxd_tdata),
        .m_axis_rxd_tkeep   (m_axis_rxd_tkeep),
        .m_axis_rxd_tlast   (m_axis_rxd_tlast),
        .m_axis_rxd_tready  (m_axis_rxd_tready),
        .m_axis_rxd_tvalid  (m_axis_rxd_tvalid),
        // AXI-Stream RX status
        .m_axis_rxs_tdata   (m_axis_rxs_tdata),
        .m_axis_rxs_tkeep   (m_axis_rxs_tkeep),
        .m_axis_rxs_tlast   (m_axis_rxs_tlast),
        .m_axis_rxs_tready  (m_axis_rxs_tready),
        .m_axis_rxs_tvalid  (m_axis_rxs_tvalid),
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
