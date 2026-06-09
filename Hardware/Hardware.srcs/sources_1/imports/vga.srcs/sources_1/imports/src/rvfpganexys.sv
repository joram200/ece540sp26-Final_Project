// SPDX-License-Identifier: Apache-2.0
// Copyright 2019 Western Digital Corporation or its affiliates.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

//********************************************************************************
// $Id$
//
// Function: SweRVolf toplevel for Nexys A7 board
// Comments:
//
//********************************************************************************

`default_nettype none
module rvfpganexys
  #(parameter bootrom_file  = "boot_main.mem")
   (input wire         clk,
    input wire         rstn,
    output wire [12:0] ddram_a,
    output wire [2:0]  ddram_ba,
    output wire        ddram_ras_n,
    output wire        ddram_cas_n,
    output wire        ddram_we_n,
    output wire        ddram_cs_n,
    output wire [1:0]  ddram_dm,
    inout wire [15:0]  ddram_dq,
    inout wire [1:0]  ddram_dqs_p,
    inout wire [1:0]  ddram_dqs_n,
    output wire        ddram_clk_p,
    output wire        ddram_clk_n,
    output wire        ddram_cke,
    output wire        ddram_odt,
    output wire        o_flash_cs_n,
    output wire        o_flash_mosi,
    input wire         i_flash_miso,
    input wire         i_uart_rx,
    output wire        o_uart_tx,
    inout wire [15:0]  i_sw,
    output reg [15:0]  o_led,
    inout wire [4:0] pushButton,
    output logic[5:0] pwmLed,
    output logic[3:0] vgaRed,
    output logic[3:0] vgaGreen,
    output logic[3:0] vgaBlue,
    output logic vgaHsync,
    output logic vgaVsync,
    output reg [7:0]   AN,
    output reg         CA, CB, CC, CD, CE, CF, CG,
    output wire        o_accel_cs_n,
    output wire        o_accel_mosi,
    input wire         i_accel_miso,
    output wire        accel_sclk,
    // Ethernet PHY (RMII)
    output wire        CLKIN,      // 50 MHz RMII ref driven OUT to PHY (D5, REF_CLK-In mode)
    input  wire        CRS_DV,
    input  wire        RXD0,
    input  wire        RXD1,
    input  wire        RXERR,
    output wire        TXD0,
    output wire        TXD1,
    output wire        TXEN,
    output wire        MDC,
    inout  wire        MDIO,
    output wire        nRST,
    input  wire        nINT
    );

   wire [15:0]         gpio_out;

   wire          cpu_tx,litedram_tx;

   wire          litedram_init_done;
   wire          litedram_init_error;
   wire pll_locked_;

   wire    clk_core;
   wire    rst_core;
   wire    user_clk;
   wire    user_rst;
   wire    clk_eth;        // 100 MHz for AXI-Lite / AXIS clock domain
   wire    clk_gtx;        // 125 MHz GTX reference for axi_ethernet_0
   wire    clk_eth_ref;     // 50 MHz, 0 deg : RMII reference into rmii_phy_if
   wire    clk_eth_ref_phy; // 50 MHz, 45 deg: forwarded out to PHY on CLKIN (D5)
   // MDIO tristate signals
   wire    mdio_i, mdio_o, mdio_t;
   // 64-bit read-data wire: ethernet_top performs lane conversion internally
   wire [63:0] eth_rdata_wide;



   clk_gen_nexys clk_gen
     (.i_clk     (user_clk),
      .i_rst     (user_rst),
      .o_clk_core (clk_core),
      .o_rst_core (rst_core),
      .o_clk_eth  (clk_eth),
      .o_clk_gtx  (clk_gtx),
      .o_clk_eth_ref     (clk_eth_ref),
      .o_clk_eth_ref_phy (clk_eth_ref_phy));

   // Forward the 50 MHz RMII reference out to the LAN8720A CLKIN pin (D5).  The Nexys
   // PHY is strapped in REF_CLK-In mode, so the FPGA must SOURCE this clock.  ODDR
   // clock forwarding gives a clean, low-jitter output.  The forwarded copy is phase-
   // shifted 45 deg (clk_eth_ref_phy) per the Digilent reference manual to center the
   // RMII RX window; rmii_phy_if samples RXD on the 0 deg clk_eth_ref.
   ODDR #(.DDR_CLK_EDGE ("SAME_EDGE"),
          .INIT         (1'b0),
          .SRTYPE       ("ASYNC"))
   eth_refclk_oddr
     (.Q  (CLKIN),
      .C  (clk_eth_ref_phy),
      .CE (1'b1),
      .D1 (1'b1),
      .D2 (1'b0),
      .R  (1'b0),
      .S  (1'b0));

   AXI_BUS #(32, 64, 6, 1) mem();
   AXI_BUS #(32, 64, 6, 1) cpu();
   // eth_cpu: clk_core-domain eth slave bus driven by veerwolf_core
   // eth_cdc_bus: clk_eth-domain eth slave bus driving ethernet_top
   AXI_BUS #(32, 64, 6, 1) eth_cpu();
   AXI_BUS #(32, 64, 6, 1) eth_cdc_bus();

   assign cpu.aw_atop = 6'd0;
   assign cpu.aw_user = 1'b0;
   assign cpu.ar_user = 1'b0;
   assign cpu.w_user = 1'b0;
   assign cpu.b_user = 1'b0;
   assign cpu.r_user = 1'b0;
   assign mem.b_user = 1'b0;
   assign mem.r_user = 1'b0;

   // eth_cpu master-side user/atop fields (veerwolf_core does not set them)
   assign eth_cpu.aw_atop = 6'd0;
   assign eth_cpu.aw_user = 1'b0;
   assign eth_cpu.ar_user = 1'b0;
   assign eth_cpu.w_user  = 1'b0;
   // eth_cdc_bus slave-side fields not driven by AXI4-Lite ethernet_top
   assign eth_cdc_bus.b_id   = 6'd0;
   assign eth_cdc_bus.b_user = 1'b0;
   assign eth_cdc_bus.r_id   = 6'd0;
   assign eth_cdc_bus.r_last = 1'b1;
   assign eth_cdc_bus.r_user = 1'b0;
   // Read data: lane conversion is handled inside ethernet_top
   assign eth_cdc_bus.r_data = eth_rdata_wide;

   axi_cdc_intf
     #(.AXI_USER_WIDTH (1),
       .AXI_ADDR_WIDTH (32),
       .AXI_DATA_WIDTH (64),
       .AXI_ID_WIDTH   (6))
   cdc
     (
      .src_clk_i  (clk_core),
      .src_rst_ni (~rst_core),
      .src        (cpu),
      .dst_clk_i  (user_clk),
      .dst_rst_ni (~user_rst),
      .dst        (mem));

   // Clock-domain crossing: clk_core (25 MHz) -> clk_eth (100 MHz)
   axi_cdc_intf
     #(.AXI_USER_WIDTH (1),
       .AXI_ADDR_WIDTH (32),
       .AXI_DATA_WIDTH (64),
       .AXI_ID_WIDTH   (6))
   eth_cdc
     (
      .src_clk_i  (clk_core),
      .src_rst_ni (~rst_core),
      .src        (eth_cpu),
      .dst_clk_i  (clk_eth),
      .dst_rst_ni (~user_rst),
      .dst        (eth_cdc_bus));

   litedram_top
     #(.ID_WIDTH (6))
   ddr2
     (.serial_tx   (litedram_tx),
      .serial_rx   (i_uart_rx),
      .clk100      (clk),
      .rst_n       (rstn),
      .pll_locked  (pll_locked_),
      .user_clk    (user_clk),
      .user_rst    (user_rst),
      .ddram_a     (ddram_a),
      .ddram_ba    (ddram_ba),
      .ddram_ras_n (ddram_ras_n),
      .ddram_cas_n (ddram_cas_n),
      .ddram_we_n  (ddram_we_n),
      .ddram_cs_n  (ddram_cs_n),
      .ddram_dm    (ddram_dm   ),
      .ddram_dq    (ddram_dq   ),
      .ddram_dqs_p (ddram_dqs_p),
      .ddram_dqs_n (ddram_dqs_n),
      .ddram_clk_p (ddram_clk_p),
      .ddram_clk_n (ddram_clk_n),
      .ddram_cke   (ddram_cke  ),
      .ddram_odt   (ddram_odt  ),
      .init_done  (litedram_init_done),
      .init_error (litedram_init_error),
      .i_awid    (mem.aw_id   ),
      .i_awaddr  (mem.aw_addr[26:0] ),
      .i_awlen   (mem.aw_len  ),
      .i_awsize  ({1'b0,mem.aw_size} ),
      .i_awburst (mem.aw_burst),
      .i_awvalid (mem.aw_valid),
      .o_awready (mem.aw_ready),
      .i_arid    (mem.ar_id   ),
      .i_araddr  (mem.ar_addr[26:0] ),
      .i_arlen   (mem.ar_len  ),
      .i_arsize  ({1'b0,mem.ar_size} ),
      .i_arburst (mem.ar_burst),
      .i_arvalid (mem.ar_valid),
      .o_arready (mem.ar_ready),
      .i_wdata   (mem.w_data  ),
      .i_wstrb   (mem.w_strb  ),
      .i_wlast   (mem.w_last  ),
      .i_wvalid  (mem.w_valid ),
      .o_wready  (mem.w_ready ),
      .o_bid     (mem.b_id    ),
      .o_bresp   (mem.b_resp  ),
      .o_bvalid  (mem.b_valid ),
      .i_bready  (mem.b_ready ),
      .o_rid     (mem.r_id    ),
      .o_rdata   (mem.r_data  ),
      .o_rresp   (mem.r_resp  ),
      .o_rlast   (mem.r_last  ),
      .o_rvalid  (mem.r_valid ),
      .i_rready  (mem.r_ready ));

   wire        dmi_reg_en;
   wire [6:0]  dmi_reg_addr;
   wire        dmi_reg_wr_en;
   wire [31:0] dmi_reg_wdata;
   wire [31:0] dmi_reg_rdata;
   wire        dmi_hard_reset;
   wire        flash_sclk;

   STARTUPE2 STARTUPE2
     (
      .CFGCLK    (),
      .CFGMCLK   (),
      .EOS       (),
      .PREQ      (),
      .CLK       (1'b0),
      .GSR       (1'b0),
      .GTS       (1'b0),
      .KEYCLEARB (1'b1),
      .PACK      (1'b0),
      .USRCCLKO  (flash_sclk),
      .USRCCLKTS (1'b0),
      .USRDONEO  (1'b1),
      .USRDONETS (1'b0));

   bscan_tap tap
     (.clk            (clk_core),
      .rst            (rst_core),
      .jtag_id        (31'd0),
      .dmi_reg_wdata  (dmi_reg_wdata),
      .dmi_reg_addr   (dmi_reg_addr),
      .dmi_reg_wr_en  (dmi_reg_wr_en),
      .dmi_reg_en     (dmi_reg_en),
      .dmi_reg_rdata  (dmi_reg_rdata),
      .dmi_hard_reset (dmi_hard_reset),
      .rd_status      (2'd0),
      .idle           (3'd0),
      .dmi_stat       (2'd0),
      .version        (4'd1));

   veerwolf_core
     #(.bootrom_file (bootrom_file),
       .clk_freq_hz  (32'd25_000_000)) // 32'd12_500_000
   swervolf
     (.clk  (clk_core),
      .rstn (~rst_core),
      .dmi_reg_rdata       (dmi_reg_rdata),
      .dmi_reg_wdata       (dmi_reg_wdata),
      .dmi_reg_addr        (dmi_reg_addr),
      .dmi_reg_en          (dmi_reg_en),
      .dmi_reg_wr_en       (dmi_reg_wr_en),
      .dmi_hard_reset      (dmi_hard_reset),
      .o_flash_sclk   (flash_sclk),
      .o_flash_cs_n   (o_flash_cs_n),
      .o_flash_mosi   (o_flash_mosi),
      .i_flash_miso   (i_flash_miso),
      .i_uart_rx      (i_uart_rx),
      .o_uart_tx      (cpu_tx),
      .o_ram_awid     (cpu.aw_id),
      .o_ram_awaddr   (cpu.aw_addr),
      .o_ram_awlen    (cpu.aw_len),
      .o_ram_awsize   (cpu.aw_size),
      .o_ram_awburst  (cpu.aw_burst),
      .o_ram_awlock   (cpu.aw_lock),
      .o_ram_awcache  (cpu.aw_cache),
      .o_ram_awprot   (cpu.aw_prot),
      .o_ram_awregion (cpu.aw_region),
      .o_ram_awqos    (cpu.aw_qos),
      .o_ram_awvalid  (cpu.aw_valid),
      .i_ram_awready  (cpu.aw_ready),
      .o_ram_arid     (cpu.ar_id),
      .o_ram_araddr   (cpu.ar_addr),
      .o_ram_arlen    (cpu.ar_len),
      .o_ram_arsize   (cpu.ar_size),
      .o_ram_arburst  (cpu.ar_burst),
      .o_ram_arlock   (cpu.ar_lock),
      .o_ram_arcache  (cpu.ar_cache),
      .o_ram_arprot   (cpu.ar_prot),
      .o_ram_arregion (cpu.ar_region),
      .o_ram_arqos    (cpu.ar_qos),
      .o_ram_arvalid  (cpu.ar_valid),
      .i_ram_arready  (cpu.ar_ready),
      .o_ram_wdata    (cpu.w_data),
      .o_ram_wstrb    (cpu.w_strb),
      .o_ram_wlast    (cpu.w_last),
      .o_ram_wvalid   (cpu.w_valid),
      .i_ram_wready   (cpu.w_ready),
      .i_ram_bid      (cpu.b_id),
      .i_ram_bresp    (cpu.b_resp),
      .i_ram_bvalid   (cpu.b_valid),
      .o_ram_bready   (cpu.b_ready),
      .i_ram_rid      (cpu.r_id),
      .i_ram_rdata    (cpu.r_data),
      .i_ram_rresp    (cpu.r_resp),
      .i_ram_rlast    (cpu.r_last),
      .i_ram_rvalid   (cpu.r_valid),
      .o_ram_rready   (cpu.r_ready),
      .i_ram_init_done  (litedram_init_done),
      .i_ram_init_error (litedram_init_error),
      .io_data        ({pushButton, i_sw[15:0],gpio_out[15:0]}),
      .pwmLed(pwmLed),
      .redVga(vgaRed),
      .greenVga(vgaGreen),
      .blueVga(vgaBlue),
      .hSyncVga(vgaHsync),
      .vSyncVga(vgaVsync),
      .AN (AN),
      .Digits_Bits ({CA,CB,CC,CD,CE,CF,CG}),
      .o_accel_sclk   (accel_sclk),
      .o_accel_cs_n   (o_accel_cs_n),
      .o_accel_mosi   (o_accel_mosi),
      .i_accel_miso   (i_accel_miso),
      .o_eth_awid     (eth_cpu.aw_id),
      .o_eth_awaddr   (eth_cpu.aw_addr),
      .o_eth_awlen    (eth_cpu.aw_len),
      .o_eth_awsize   (eth_cpu.aw_size),
      .o_eth_awburst  (eth_cpu.aw_burst),
      .o_eth_awlock   (eth_cpu.aw_lock),
      .o_eth_awcache  (eth_cpu.aw_cache),
      .o_eth_awprot   (eth_cpu.aw_prot),
      .o_eth_awregion (eth_cpu.aw_region),
      .o_eth_awqos    (eth_cpu.aw_qos),
      .o_eth_awvalid  (eth_cpu.aw_valid),
      .i_eth_awready  (eth_cpu.aw_ready),
      .o_eth_arid     (eth_cpu.ar_id),
      .o_eth_araddr   (eth_cpu.ar_addr),
      .o_eth_arlen    (eth_cpu.ar_len),
      .o_eth_arsize   (eth_cpu.ar_size),
      .o_eth_arburst  (eth_cpu.ar_burst),
      .o_eth_arlock   (eth_cpu.ar_lock),
      .o_eth_arcache  (eth_cpu.ar_cache),
      .o_eth_arprot   (eth_cpu.ar_prot),
      .o_eth_arregion (eth_cpu.ar_region),
      .o_eth_arqos    (eth_cpu.ar_qos),
      .o_eth_arvalid  (eth_cpu.ar_valid),
      .i_eth_arready  (eth_cpu.ar_ready),
      .o_eth_wdata    (eth_cpu.w_data),
      .o_eth_wstrb    (eth_cpu.w_strb),
      .o_eth_wlast    (eth_cpu.w_last),
      .o_eth_wvalid   (eth_cpu.w_valid),
      .i_eth_wready   (eth_cpu.w_ready),
      .i_eth_bid      (eth_cpu.b_id),
      .i_eth_bresp    (eth_cpu.b_resp),
      .i_eth_bvalid   (eth_cpu.b_valid),
      .o_eth_bready   (eth_cpu.b_ready),
      .i_eth_rid      (eth_cpu.r_id),
      .i_eth_rdata    (eth_cpu.r_data),
      .i_eth_rresp    (eth_cpu.r_resp),
      .i_eth_rlast    (eth_cpu.r_last),
      .i_eth_rvalid   (eth_cpu.r_valid),
      .o_eth_rready   (eth_cpu.r_ready));

   always @(posedge clk_core) begin
      o_led[15:0] <= gpio_out[15:0];
      //o_led[11] <= dbg_sdram_cke;
      //o_led[12] <= pll_locked_;
      //o_led[13] <= user_rst;
      //o_led[14] <= litedram_init_error;
      //o_led[15] <= litedram_init_done;
   end


   assign o_uart_tx = 1'b0 ? litedram_tx : cpu_tx;

   // -------------------------------------------------------------------------
   // MDIO bidirectional pad
   // -------------------------------------------------------------------------
   IOBUF mdio_iobuf
     (.IO (MDIO),
      .I  (mdio_o),
      .O  (mdio_i),
      .T  (mdio_t));

   // -------------------------------------------------------------------------
   // Ethernet top-level (axi_ethernet_0 + rmii_phy_if)
   // AXI4-Lite control connects to eth_cdc_bus (clk_eth domain, 100 MHz).
   // Data width adaptation (64-bit bus <-> 32-bit MAC) is handled inside
   // ethernet_top by the axi_lite_64to32 converter instance.
   // -------------------------------------------------------------------------
   ethernet_top u_ethernet_top
     (// Clocks and resets
      .s_axi_lite_clk    (clk_eth),
      .s_axi_lite_resetn (~user_rst),
      .gtx_clk           (clk_gtx),
      .phy_rmii_ref_clk  (clk_eth_ref),
      // AXI4-Lite slave control (from eth_cdc_bus, 100 MHz domain)
      .s_axi_awaddr      (eth_cdc_bus.aw_addr[17:0]),
      .s_axi_awvalid     (eth_cdc_bus.aw_valid),
      .s_axi_awready     (eth_cdc_bus.aw_ready),
      .s_axi_wdata       (eth_cdc_bus.w_data),
      .s_axi_wstrb       (eth_cdc_bus.w_strb),
      .s_axi_wvalid      (eth_cdc_bus.w_valid),
      .s_axi_wready      (eth_cdc_bus.w_ready),
      .s_axi_bresp       (eth_cdc_bus.b_resp),
      .s_axi_bvalid      (eth_cdc_bus.b_valid),
      .s_axi_bready      (eth_cdc_bus.b_ready),
      .s_axi_araddr      (eth_cdc_bus.ar_addr[17:0]),
      .s_axi_arvalid     (eth_cdc_bus.ar_valid),
      .s_axi_arready     (eth_cdc_bus.ar_ready),
      .s_axi_rdata       (eth_rdata_wide),
      .s_axi_rresp       (eth_cdc_bus.r_resp),
      .s_axi_rvalid      (eth_cdc_bus.r_valid),
      .s_axi_rready      (eth_cdc_bus.r_ready),
      // AXI-Stream TX (tied off — no DMA yet)
      .s_axis_txd_tdata  (32'd0),
      .s_axis_txd_tkeep  (4'd0),
      .s_axis_txd_tlast  (1'b0),
      .s_axis_txd_tvalid (1'b0),
      .s_axis_txc_tdata  (32'd0),
      .s_axis_txc_tkeep  (4'd0),
      .s_axis_txc_tlast  (1'b0),
      .s_axis_txc_tvalid (1'b0),
      // AXI-Stream RX (drop received frames — no DMA yet)
      .m_axis_rxd_tready (1'b1),
      .m_axis_rxs_tready (1'b1),
      // RMII PHY interface
      .phy_rmii_crsdv    (CRS_DV),
      .phy_rmii_rxd      ({RXD1, RXD0}),
      .phy_rmii_rxer     (RXERR),
      .phy_rmii_txen     (TXEN),
      .phy_rmii_txd      ({TXD1, TXD0}),
      // MDIO management interface
      .mdio_mdc          (MDC),
      .mdio_mdio_i       (mdio_i),
      .mdio_mdio_o       (mdio_o),
      .mdio_mdio_t       (mdio_t),
      // PHY reset
      .phy_rst_n         (nRST),
      // Speed mode: 1 = 100 Mbps
      .mode_speed        (1'b1),
      // Interrupts (unconnected for now)
      .mac_irq           (),
      .interrupt         ());

endmodule
