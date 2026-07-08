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

   // -------------------------------------------------------------------------
   // DMA AXI4 master flat wires (clk_eth domain, driven by ethernet_top)
   // axi_dma_0 uses fixed ID=0; no AWID/ARID signals on the flat port list.
   // -------------------------------------------------------------------------
   // Scatter-Gather channel (descriptor ring in DDR)
   wire [31:0] m_axi_sg_awaddr;   wire  [7:0] m_axi_sg_awlen;
   wire  [2:0] m_axi_sg_awsize;   wire  [1:0] m_axi_sg_awburst;
   wire  [2:0] m_axi_sg_awprot;   wire  [3:0] m_axi_sg_awcache;
   wire        m_axi_sg_awvalid;  wire        m_axi_sg_awready;
   wire [31:0] m_axi_sg_wdata;    wire  [3:0] m_axi_sg_wstrb;
   wire        m_axi_sg_wlast;    wire        m_axi_sg_wvalid;
   wire        m_axi_sg_wready;   wire  [1:0] m_axi_sg_bresp;
   wire        m_axi_sg_bvalid;   wire        m_axi_sg_bready;
   wire [31:0] m_axi_sg_araddr;   wire  [7:0] m_axi_sg_arlen;
   wire  [2:0] m_axi_sg_arsize;   wire  [1:0] m_axi_sg_arburst;
   wire  [2:0] m_axi_sg_arprot;   wire  [3:0] m_axi_sg_arcache;
   wire        m_axi_sg_arvalid;  wire        m_axi_sg_arready;
   wire [31:0] m_axi_sg_rdata;    wire  [1:0] m_axi_sg_rresp;
   wire        m_axi_sg_rlast;    wire        m_axi_sg_rvalid;
   wire        m_axi_sg_rready;

   // MM2S channel (DDR → DMA → MAC TX) — READ-ONLY (AR+R only)
   wire [31:0] m_axi_mm2s_araddr;  wire  [7:0] m_axi_mm2s_arlen;
   wire  [2:0] m_axi_mm2s_arsize;  wire  [1:0] m_axi_mm2s_arburst;
   wire  [2:0] m_axi_mm2s_arprot;  wire  [3:0] m_axi_mm2s_arcache;
   wire        m_axi_mm2s_arvalid; wire        m_axi_mm2s_arready;
   wire [31:0] m_axi_mm2s_rdata;   wire  [1:0] m_axi_mm2s_rresp;
   wire        m_axi_mm2s_rlast;   wire        m_axi_mm2s_rvalid;
   wire        m_axi_mm2s_rready;

   // S2MM channel (MAC RX → DMA → DDR) — WRITE-ONLY (AW+W+B only)
   wire [31:0] m_axi_s2mm_awaddr;  wire  [7:0] m_axi_s2mm_awlen;
   wire  [2:0] m_axi_s2mm_awsize;  wire  [1:0] m_axi_s2mm_awburst;
   wire  [2:0] m_axi_s2mm_awprot;  wire  [3:0] m_axi_s2mm_awcache;
   wire        m_axi_s2mm_awvalid; wire        m_axi_s2mm_awready;
   wire [31:0] m_axi_s2mm_wdata;   wire  [3:0] m_axi_s2mm_wstrb;
   wire        m_axi_s2mm_wlast;   wire        m_axi_s2mm_wvalid;
   wire        m_axi_s2mm_wready;  wire  [1:0] m_axi_s2mm_bresp;
   wire        m_axi_s2mm_bvalid;  wire        m_axi_s2mm_bready;

   // DMA interrupt wires
   wire        mm2s_introut;
   wire        s2mm_introut;

   // DMA AXI buses: src = clk_eth, dst = user_clk (after CDC)
   // ID_WIDTH=4: DMA uses ID=0; 4 slave ports → 2 routing bits → 6-bit M00 IDs
   // Data width = 32 (DMA native); dwidth_converters widen to 64 before crossbar
   AXI_BUS #(32, 32, 4, 1) dma_sg_src();
   AXI_BUS #(32, 32, 4, 1) dma_sg_mem();
   AXI_BUS #(32, 32, 4, 1) dma_mm2s_src();
   AXI_BUS #(32, 32, 4, 1) dma_mm2s_mem();
   AXI_BUS #(32, 32, 4, 1) dma_s2mm_src();
   AXI_BUS #(32, 32, 4, 1) dma_s2mm_mem();

   // DDR arbiter output flat wires (M0 of ddr_mux_wrapper, 8-bit IDs)
   // axi_mux prepends 2-bit slave-port-index → 8 bits total.
   wire  [7:0] ddr_awid,    ddr_arid;
   wire [31:0] ddr_awaddr,  ddr_araddr;
   wire  [7:0] ddr_awlen,   ddr_arlen;
   wire  [2:0] ddr_awsize,  ddr_arsize;
   wire  [1:0] ddr_awburst, ddr_arburst;
   wire        ddr_awvalid, ddr_awready;
   wire [63:0] ddr_wdata,   ddr_rdata;
   wire  [7:0] ddr_wstrb;
   wire        ddr_wlast,   ddr_wvalid,  ddr_wready;
   wire  [7:0] ddr_bid,     ddr_rid;
   wire  [1:0] ddr_bresp,   ddr_rresp;
   wire        ddr_bvalid,  ddr_bready;
   wire        ddr_arvalid, ddr_arready;
   wire        ddr_rlast,   ddr_rvalid,  ddr_rready;

   // CPU path: mem is 6-bit IDs; crossbar S00 now ID_WIDTH=6, full IDs preserved.

   // Static fields for DMA src buses (not present on ethernet_top flat ports)
   assign dma_sg_src.aw_atop  = 6'd0;  assign dma_sg_src.aw_id    = 4'd0;
   assign dma_sg_src.aw_lock  = 1'b0;  assign dma_sg_src.aw_region = 4'd0;
   assign dma_sg_src.aw_qos   = 4'd0;  assign dma_sg_src.aw_user  = 1'b0;
   assign dma_sg_src.ar_id    = 4'd0;  assign dma_sg_src.ar_lock  = 1'b0;
   assign dma_sg_src.ar_region = 4'd0; assign dma_sg_src.ar_qos   = 4'd0;
   assign dma_sg_src.ar_user  = 1'b0;  assign dma_sg_src.w_user   = 1'b0;

   assign dma_mm2s_src.aw_atop  = 6'd0;  assign dma_mm2s_src.aw_id    = 4'd0;
   assign dma_mm2s_src.aw_lock  = 1'b0;  assign dma_mm2s_src.aw_region = 4'd0;
   assign dma_mm2s_src.aw_qos   = 4'd0;  assign dma_mm2s_src.aw_user  = 1'b0;
   assign dma_mm2s_src.ar_id    = 4'd0;  assign dma_mm2s_src.ar_lock  = 1'b0;
   assign dma_mm2s_src.ar_region = 4'd0; assign dma_mm2s_src.ar_qos   = 4'd0;
   assign dma_mm2s_src.ar_user  = 1'b0;  assign dma_mm2s_src.w_user   = 1'b0;

   assign dma_s2mm_src.aw_atop  = 6'd0;  assign dma_s2mm_src.aw_id    = 4'd0;
   assign dma_s2mm_src.aw_lock  = 1'b0;  assign dma_s2mm_src.aw_region = 4'd0;
   assign dma_s2mm_src.aw_qos   = 4'd0;  assign dma_s2mm_src.aw_user  = 1'b0;
   assign dma_s2mm_src.ar_id    = 4'd0;  assign dma_s2mm_src.ar_lock  = 1'b0;
   assign dma_s2mm_src.ar_region = 4'd0; assign dma_s2mm_src.ar_qos   = 4'd0;
   assign dma_s2mm_src.ar_user  = 1'b0;  assign dma_s2mm_src.w_user   = 1'b0;

   // Unused user bits on DMA dst (slave side not driven by CDC)
   assign dma_sg_mem.b_user   = 1'b0;  assign dma_sg_mem.r_user   = 1'b0;
   assign dma_mm2s_mem.b_user = 1'b0;  assign dma_mm2s_mem.r_user = 1'b0;
   assign dma_s2mm_mem.b_user = 1'b0;  assign dma_s2mm_mem.r_user = 1'b0;

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

   // -------------------------------------------------------------------------
   // DMA CDC bridges: clk_eth (100 MHz) → user_clk (litedram domain)
   // Flat wires from ethernet_top are assigned into *_src AXI_BUS fields.
   // Response signals (ready/resp/data) are read back from *_src to flat wires.
   // -------------------------------------------------------------------------

   // --- SG channel ---
   assign dma_sg_src.aw_valid = m_axi_sg_awvalid;
   assign dma_sg_src.aw_addr  = m_axi_sg_awaddr;
   assign dma_sg_src.aw_len   = m_axi_sg_awlen;
   assign dma_sg_src.aw_size  = m_axi_sg_awsize;
   assign dma_sg_src.aw_burst = m_axi_sg_awburst;
   assign dma_sg_src.aw_prot  = m_axi_sg_awprot;
   assign dma_sg_src.aw_cache = m_axi_sg_awcache;
   assign dma_sg_src.w_data   = m_axi_sg_wdata;
   assign dma_sg_src.w_strb   = m_axi_sg_wstrb;
   assign dma_sg_src.w_last   = m_axi_sg_wlast;
   assign dma_sg_src.w_valid  = m_axi_sg_wvalid;
   assign dma_sg_src.b_ready  = m_axi_sg_bready;
   assign dma_sg_src.ar_valid = m_axi_sg_arvalid;
   assign dma_sg_src.ar_addr  = m_axi_sg_araddr;
   assign dma_sg_src.ar_len   = m_axi_sg_arlen;
   assign dma_sg_src.ar_size  = m_axi_sg_arsize;
   assign dma_sg_src.ar_burst = m_axi_sg_arburst;
   assign dma_sg_src.ar_prot  = m_axi_sg_arprot;
   assign dma_sg_src.ar_cache = m_axi_sg_arcache;
   assign dma_sg_src.r_ready  = m_axi_sg_rready;
   assign m_axi_sg_awready = dma_sg_src.aw_ready;
   assign m_axi_sg_wready  = dma_sg_src.w_ready;
   assign m_axi_sg_bresp   = dma_sg_src.b_resp;
   assign m_axi_sg_bvalid  = dma_sg_src.b_valid;
   assign m_axi_sg_arready = dma_sg_src.ar_ready;
   assign m_axi_sg_rdata   = dma_sg_src.r_data;
   assign m_axi_sg_rresp   = dma_sg_src.r_resp;
   assign m_axi_sg_rlast   = dma_sg_src.r_last;
   assign m_axi_sg_rvalid  = dma_sg_src.r_valid;

   axi_cdc_intf #(.AXI_USER_WIDTH(1), .AXI_ADDR_WIDTH(32),
                  .AXI_DATA_WIDTH(32), .AXI_ID_WIDTH(4))
   dma_sg_cdc (.src_clk_i(clk_eth),  .src_rst_ni(~user_rst), .src(dma_sg_src),
               .dst_clk_i(user_clk), .dst_rst_ni(~user_rst), .dst(dma_sg_mem));

   // --- MM2S channel (read-only: AR+R only; no AW/W/B ports on DMA) ---
   assign dma_mm2s_src.aw_valid = 1'b0;
   assign dma_mm2s_src.aw_addr  = 32'h0;
   assign dma_mm2s_src.aw_len   = 8'h0;
   assign dma_mm2s_src.aw_size  = 3'h0;
   assign dma_mm2s_src.aw_burst = 2'b01;
   assign dma_mm2s_src.aw_prot  = 3'h0;
   assign dma_mm2s_src.aw_cache = 4'h0;
   assign dma_mm2s_src.w_data   = 32'h0;
   assign dma_mm2s_src.w_strb   = 4'h0;
   assign dma_mm2s_src.w_last   = 1'b0;
   assign dma_mm2s_src.w_valid  = 1'b0;
   assign dma_mm2s_src.b_ready  = 1'b1;
   assign dma_mm2s_src.ar_valid = m_axi_mm2s_arvalid;
   assign dma_mm2s_src.ar_addr  = m_axi_mm2s_araddr;
   assign dma_mm2s_src.ar_len   = m_axi_mm2s_arlen;
   assign dma_mm2s_src.ar_size  = m_axi_mm2s_arsize;
   assign dma_mm2s_src.ar_burst = m_axi_mm2s_arburst;
   assign dma_mm2s_src.ar_prot  = m_axi_mm2s_arprot;
   assign dma_mm2s_src.ar_cache = m_axi_mm2s_arcache;
   assign dma_mm2s_src.r_ready  = m_axi_mm2s_rready;
   assign m_axi_mm2s_arready = dma_mm2s_src.ar_ready;
   assign m_axi_mm2s_rdata   = dma_mm2s_src.r_data;
   assign m_axi_mm2s_rresp   = dma_mm2s_src.r_resp;
   assign m_axi_mm2s_rlast   = dma_mm2s_src.r_last;
   assign m_axi_mm2s_rvalid  = dma_mm2s_src.r_valid;

   axi_cdc_intf #(.AXI_USER_WIDTH(1), .AXI_ADDR_WIDTH(32),
                  .AXI_DATA_WIDTH(32), .AXI_ID_WIDTH(4))
   dma_mm2s_cdc (.src_clk_i(clk_eth),  .src_rst_ni(~user_rst), .src(dma_mm2s_src),
                 .dst_clk_i(user_clk), .dst_rst_ni(~user_rst), .dst(dma_mm2s_mem));

   // MM2S is read-only and not used in RX-only demo: stub out DDR responses
   assign dma_mm2s_mem.aw_ready = 1'b0;
   assign dma_mm2s_mem.w_ready  = 1'b0;
   assign dma_mm2s_mem.b_resp   = 2'b00;
   assign dma_mm2s_mem.b_valid  = 1'b0;
   assign dma_mm2s_mem.ar_ready = 1'b0;
   assign dma_mm2s_mem.r_data   = 32'h0;
   assign dma_mm2s_mem.r_resp   = 2'b00;
   assign dma_mm2s_mem.r_last   = 1'b0;
   assign dma_mm2s_mem.r_valid  = 1'b0;

   // --- S2MM channel (write-only: AW+W+B only; no AR/R ports on DMA) ---
   assign dma_s2mm_src.aw_valid = m_axi_s2mm_awvalid;
   assign dma_s2mm_src.aw_addr  = m_axi_s2mm_awaddr;
   assign dma_s2mm_src.aw_len   = m_axi_s2mm_awlen;
   assign dma_s2mm_src.aw_size  = m_axi_s2mm_awsize;
   assign dma_s2mm_src.aw_burst = m_axi_s2mm_awburst;
   assign dma_s2mm_src.aw_prot  = m_axi_s2mm_awprot;
   assign dma_s2mm_src.aw_cache = m_axi_s2mm_awcache;
   assign dma_s2mm_src.w_data   = m_axi_s2mm_wdata;
   assign dma_s2mm_src.w_strb   = m_axi_s2mm_wstrb;
   assign dma_s2mm_src.w_last   = m_axi_s2mm_wlast;
   assign dma_s2mm_src.w_valid  = m_axi_s2mm_wvalid;
   assign dma_s2mm_src.b_ready  = m_axi_s2mm_bready;
   assign dma_s2mm_src.ar_valid = 1'b0;
   assign dma_s2mm_src.ar_addr  = 32'h0;
   assign dma_s2mm_src.ar_len   = 8'h0;
   assign dma_s2mm_src.ar_size  = 3'h0;
   assign dma_s2mm_src.ar_burst = 2'b01;
   assign dma_s2mm_src.ar_prot  = 3'h0;
   assign dma_s2mm_src.ar_cache = 4'h0;
   assign dma_s2mm_src.r_ready  = 1'b0;
   assign m_axi_s2mm_awready = dma_s2mm_src.aw_ready;
   assign m_axi_s2mm_wready  = dma_s2mm_src.w_ready;
   assign m_axi_s2mm_bresp   = dma_s2mm_src.b_resp;
   assign m_axi_s2mm_bvalid  = dma_s2mm_src.b_valid;

   axi_cdc_intf #(.AXI_USER_WIDTH(1), .AXI_ADDR_WIDTH(32),
                  .AXI_DATA_WIDTH(32), .AXI_ID_WIDTH(4))
   dma_s2mm_cdc (.src_clk_i(clk_eth),  .src_rst_ni(~user_rst), .src(dma_s2mm_src),
                 .dst_clk_i(user_clk), .dst_rst_ni(~user_rst), .dst(dma_s2mm_mem));

   // -------------------------------------------------------------------------
   // DMA dwidth converter flat wire outputs (64-bit, user_clk domain → crossbar)
   wire [31:0] sg_wide_awaddr;  wire [7:0] sg_wide_awlen;
   wire  [2:0] sg_wide_awsize;  wire [1:0] sg_wide_awburst;
   wire  [3:0] sg_wide_awcache; wire [2:0] sg_wide_awprot;
   wire        sg_wide_awvalid; wire       sg_wide_awready;
   wire [63:0] sg_wide_wdata;   wire [7:0] sg_wide_wstrb;
   wire        sg_wide_wlast;   wire       sg_wide_wvalid;
   wire        sg_wide_wready;  wire [1:0] sg_wide_bresp;
   wire        sg_wide_bvalid;  wire       sg_wide_bready;
   wire [31:0] sg_wide_araddr;  wire [7:0] sg_wide_arlen;
   wire  [2:0] sg_wide_arsize;  wire [1:0] sg_wide_arburst;
   wire  [3:0] sg_wide_arcache; wire [2:0] sg_wide_arprot;
   wire        sg_wide_arvalid; wire       sg_wide_arready;
   wire [63:0] sg_wide_rdata;   wire [1:0] sg_wide_rresp;
   wire        sg_wide_rlast;   wire       sg_wide_rvalid;
   wire        sg_wide_rready;

   wire [31:0] s2mm_wide_awaddr;  wire [7:0] s2mm_wide_awlen;
   wire  [2:0] s2mm_wide_awsize;  wire [1:0] s2mm_wide_awburst;
   wire  [3:0] s2mm_wide_awcache; wire [2:0] s2mm_wide_awprot;
   wire        s2mm_wide_awvalid; wire       s2mm_wide_awready;
   wire [63:0] s2mm_wide_wdata;   wire [7:0] s2mm_wide_wstrb;
   wire        s2mm_wide_wlast;   wire       s2mm_wide_wvalid;
   wire        s2mm_wide_wready;  wire [1:0] s2mm_wide_bresp;
   wire        s2mm_wide_bvalid;  wire       s2mm_wide_bready;

   // SG: 32→64 bit width converter
   axi_dwidth_conv_sg u_sg_dwidth (
       .s_axi_aclk    (user_clk),
       .s_axi_aresetn (~user_rst),
       .s_axi_awaddr  (dma_sg_mem.aw_addr),
       .s_axi_awlen   (dma_sg_mem.aw_len),
       .s_axi_awsize  (dma_sg_mem.aw_size),
       .s_axi_awburst (dma_sg_mem.aw_burst),
       .s_axi_awlock  (dma_sg_mem.aw_lock),
       .s_axi_awcache (dma_sg_mem.aw_cache),
       .s_axi_awprot  (dma_sg_mem.aw_prot),
       .s_axi_awregion(dma_sg_mem.aw_region),
       .s_axi_awqos   (dma_sg_mem.aw_qos),
       .s_axi_awvalid (dma_sg_mem.aw_valid),
       .s_axi_awready (dma_sg_mem.aw_ready),
       .s_axi_wdata   (dma_sg_mem.w_data),
       .s_axi_wstrb   (dma_sg_mem.w_strb),
       .s_axi_wlast   (dma_sg_mem.w_last),
       .s_axi_wvalid  (dma_sg_mem.w_valid),
       .s_axi_wready  (dma_sg_mem.w_ready),
       .s_axi_bresp   (dma_sg_mem.b_resp),
       .s_axi_bvalid  (dma_sg_mem.b_valid),
       .s_axi_bready  (dma_sg_mem.b_ready),
       .s_axi_araddr  (dma_sg_mem.ar_addr),
       .s_axi_arlen   (dma_sg_mem.ar_len),
       .s_axi_arsize  (dma_sg_mem.ar_size),
       .s_axi_arburst (dma_sg_mem.ar_burst),
       .s_axi_arlock  (dma_sg_mem.ar_lock),
       .s_axi_arcache (dma_sg_mem.ar_cache),
       .s_axi_arprot  (dma_sg_mem.ar_prot),
       .s_axi_arregion(dma_sg_mem.ar_region),
       .s_axi_arqos   (dma_sg_mem.ar_qos),
       .s_axi_arvalid (dma_sg_mem.ar_valid),
       .s_axi_arready (dma_sg_mem.ar_ready),
       .s_axi_rdata   (dma_sg_mem.r_data),
       .s_axi_rresp   (dma_sg_mem.r_resp),
       .s_axi_rlast   (dma_sg_mem.r_last),
       .s_axi_rvalid  (dma_sg_mem.r_valid),
       .s_axi_rready  (dma_sg_mem.r_ready),
       .m_axi_awaddr  (sg_wide_awaddr),
       .m_axi_awlen   (sg_wide_awlen),
       .m_axi_awsize  (sg_wide_awsize),
       .m_axi_awburst (sg_wide_awburst),
       .m_axi_awlock  (),
       .m_axi_awcache (sg_wide_awcache),
       .m_axi_awprot  (sg_wide_awprot),
       .m_axi_awregion(),
       .m_axi_awqos   (),
       .m_axi_awvalid (sg_wide_awvalid),
       .m_axi_awready (sg_wide_awready),
       .m_axi_wdata   (sg_wide_wdata),
       .m_axi_wstrb   (sg_wide_wstrb),
       .m_axi_wlast   (sg_wide_wlast),
       .m_axi_wvalid  (sg_wide_wvalid),
       .m_axi_wready  (sg_wide_wready),
       .m_axi_bresp   (sg_wide_bresp),
       .m_axi_bvalid  (sg_wide_bvalid),
       .m_axi_bready  (sg_wide_bready),
       .m_axi_araddr  (sg_wide_araddr),
       .m_axi_arlen   (sg_wide_arlen),
       .m_axi_arsize  (sg_wide_arsize),
       .m_axi_arburst (sg_wide_arburst),
       .m_axi_arlock  (),
       .m_axi_arcache (sg_wide_arcache),
       .m_axi_arprot  (sg_wide_arprot),
       .m_axi_arregion(),
       .m_axi_arqos   (),
       .m_axi_arvalid (sg_wide_arvalid),
       .m_axi_arready (sg_wide_arready),
       .m_axi_rdata   (sg_wide_rdata),
       .m_axi_rresp   (sg_wide_rresp),
       .m_axi_rlast   (sg_wide_rlast),
       .m_axi_rvalid  (sg_wide_rvalid),
       .m_axi_rready  (sg_wide_rready)
   );

   // S2MM: 32→64 bit width converter (write-only in practice; AR/R tied to 0)
   axi_dwidth_conv_s2mm u_s2mm_dwidth (
       .s_axi_aclk    (user_clk),
       .s_axi_aresetn (~user_rst),
       .s_axi_awaddr  (dma_s2mm_mem.aw_addr),
       .s_axi_awlen   (dma_s2mm_mem.aw_len),
       .s_axi_awsize  (dma_s2mm_mem.aw_size),
       .s_axi_awburst (dma_s2mm_mem.aw_burst),
       .s_axi_awlock  (dma_s2mm_mem.aw_lock),
       .s_axi_awcache (dma_s2mm_mem.aw_cache),
       .s_axi_awprot  (dma_s2mm_mem.aw_prot),
       .s_axi_awregion(dma_s2mm_mem.aw_region),
       .s_axi_awqos   (dma_s2mm_mem.aw_qos),
       .s_axi_awvalid (dma_s2mm_mem.aw_valid),
       .s_axi_awready (dma_s2mm_mem.aw_ready),
       .s_axi_wdata   (dma_s2mm_mem.w_data),
       .s_axi_wstrb   (dma_s2mm_mem.w_strb),
       .s_axi_wlast   (dma_s2mm_mem.w_last),
       .s_axi_wvalid  (dma_s2mm_mem.w_valid),
       .s_axi_wready  (dma_s2mm_mem.w_ready),
       .s_axi_bresp   (dma_s2mm_mem.b_resp),
       .s_axi_bvalid  (dma_s2mm_mem.b_valid),
       .s_axi_bready  (dma_s2mm_mem.b_ready),
       .s_axi_araddr  (32'h0),
       .s_axi_arlen   (8'h0),
       .s_axi_arsize  (3'h0),
       .s_axi_arburst (2'b01),
       .s_axi_arlock  (1'b0),
       .s_axi_arcache (4'h0),
       .s_axi_arprot  (3'h0),
       .s_axi_arregion(4'h0),
       .s_axi_arqos   (4'h0),
       .s_axi_arvalid (1'b0),
       .s_axi_arready (dma_s2mm_mem.ar_ready),
       .s_axi_rdata   (dma_s2mm_mem.r_data),
       .s_axi_rresp   (dma_s2mm_mem.r_resp),
       .s_axi_rlast   (dma_s2mm_mem.r_last),
       .s_axi_rvalid  (dma_s2mm_mem.r_valid),
       .s_axi_rready  (1'b0),
       .m_axi_awaddr  (s2mm_wide_awaddr),
       .m_axi_awlen   (s2mm_wide_awlen),
       .m_axi_awsize  (s2mm_wide_awsize),
       .m_axi_awburst (s2mm_wide_awburst),
       .m_axi_awlock  (),
       .m_axi_awcache (s2mm_wide_awcache),
       .m_axi_awprot  (s2mm_wide_awprot),
       .m_axi_awregion(),
       .m_axi_awqos   (),
       .m_axi_awvalid (s2mm_wide_awvalid),
       .m_axi_awready (s2mm_wide_awready),
       .m_axi_wdata   (s2mm_wide_wdata),
       .m_axi_wstrb   (s2mm_wide_wstrb),
       .m_axi_wlast   (s2mm_wide_wlast),
       .m_axi_wvalid  (s2mm_wide_wvalid),
       .m_axi_wready  (s2mm_wide_wready),
       .m_axi_bresp   (s2mm_wide_bresp),
       .m_axi_bvalid  (s2mm_wide_bvalid),
       .m_axi_bready  (s2mm_wide_bready),
       .m_axi_araddr  (),
       .m_axi_arlen   (),
       .m_axi_arsize  (),
       .m_axi_arburst (),
       .m_axi_arlock  (),
       .m_axi_arcache (),
       .m_axi_arprot  (),
       .m_axi_arregion(),
       .m_axi_arqos   (),
       .m_axi_arvalid (),
       .m_axi_arready (1'b0),
       .m_axi_rdata   (64'h0),
       .m_axi_rresp   (2'b00),
       .m_axi_rlast   (1'b0),
       .m_axi_rvalid  (1'b0),
       .m_axi_rready  ()
   );

   // -------------------------------------------------------------------------
   // DDR crossbar: axi_crossbar_0  (4 masters → 1 litedram slave)
   // axi_crossbar uses vectorized ports: signals packed [S3|S2|S1|S0] LSB=S0.
   // S0 = CPU (mem, trimmed to 4-bit IDs)
   // S1 = DMA SG, S2 = DMA MM2S, S3 = DMA S2MM  (4-bit IDs from CDC)
   // M0 = ddr_* flat wires → litedram_top (6-bit IDs: 4+2 routing bits)
   // -------------------------------------------------------------------------

   // ---- AW channel pack (slave → crossbar) ----
   // S0=CPU(mem), S1=SG(via sg_wide_), S2=MM2S(unused/tied0), S3=S2MM(via s2mm_wide_)
   // crossbar ID_WIDTH=6: each slave slot is 6 bits; 4 slots = 24-bit vector.
   wire [23:0]  xbar_s_awid    = {6'b0,             6'b0,             6'b0,            mem.aw_id};
   wire [127:0] xbar_s_awaddr  = {s2mm_wide_awaddr, 32'h0,            sg_wide_awaddr,  mem.aw_addr};
   wire [31:0]  xbar_s_awlen   = {s2mm_wide_awlen,  8'h0,             sg_wide_awlen,   mem.aw_len};
   wire [11:0]  xbar_s_awsize  = {s2mm_wide_awsize, 3'h0,             sg_wide_awsize,  mem.aw_size};
   wire [7:0]   xbar_s_awburst = {s2mm_wide_awburst,2'b01,            sg_wide_awburst, mem.aw_burst};
   wire [3:0]   xbar_s_awlock  = {1'b0,             1'b0,             1'b0,            mem.aw_lock};
   wire [15:0]  xbar_s_awcache = {s2mm_wide_awcache,4'h0,             sg_wide_awcache, mem.aw_cache};
   wire [11:0]  xbar_s_awprot  = {s2mm_wide_awprot, 3'h0,             sg_wide_awprot,  mem.aw_prot};
   wire [15:0]  xbar_s_awqos   = {4'h0,             4'h0,             4'h0,            mem.aw_qos};
   wire [3:0]   xbar_s_awvalid = {s2mm_wide_awvalid,1'b0,             sg_wide_awvalid, mem.aw_valid};
   wire [3:0]   xbar_s_awready;
   assign mem.aw_ready        = xbar_s_awready[0];
   assign sg_wide_awready     = xbar_s_awready[1];
   // xbar_s_awready[2] (MM2S) floats — MM2S not used
   assign s2mm_wide_awready   = xbar_s_awready[3];

   // ---- W channel pack ----
   wire [255:0] xbar_s_wdata   = {s2mm_wide_wdata,  64'h0,            sg_wide_wdata,   mem.w_data};
   wire [31:0]  xbar_s_wstrb   = {s2mm_wide_wstrb,  8'h0,             sg_wide_wstrb,   mem.w_strb};
   wire [3:0]   xbar_s_wlast   = {s2mm_wide_wlast,  1'b0,             sg_wide_wlast,   mem.w_last};
   wire [3:0]   xbar_s_wvalid  = {s2mm_wide_wvalid, 1'b0,             sg_wide_wvalid,  mem.w_valid};
   wire [3:0]   xbar_s_wready;
   assign mem.w_ready         = xbar_s_wready[0];
   assign sg_wide_wready      = xbar_s_wready[1];
   // xbar_s_wready[2] (MM2S) floats — MM2S not used
   assign s2mm_wide_wready    = xbar_s_wready[3];

   // ---- B channel unpack (crossbar → slaves) ----
   // crossbar ID_WIDTH=6: s_axi_bid is 24-bit (6 bits × 4 slots); bresp is 8-bit (2×4).
   wire [23:0]  xbar_s_bid;
   wire [7:0]   xbar_s_bresp;
   wire [3:0]   xbar_s_bvalid;
   wire [3:0]   xbar_s_bready  = {s2mm_wide_bready, 1'b1, sg_wide_bready, mem.b_ready};
   assign mem.b_id             = xbar_s_bid[5:0];   // S0: full 6-bit response ID
   assign mem.b_resp           = xbar_s_bresp[1:0];
   assign mem.b_valid          = xbar_s_bvalid[0];
   assign sg_wide_bresp        = xbar_s_bresp[3:2];
   assign sg_wide_bvalid       = xbar_s_bvalid[1];
   // xbar_s_bid[17:12], bresp[5:4], bvalid[2] (MM2S) not connected
   assign s2mm_wide_bresp      = xbar_s_bresp[7:6];
   assign s2mm_wide_bvalid     = xbar_s_bvalid[3];

   // ---- AR channel pack ----
   wire [23:0]  xbar_s_arid    = {6'b0,             6'b0,             6'b0,            mem.ar_id};
   wire [127:0] xbar_s_araddr  = {32'h0,            32'h0,            sg_wide_araddr,  mem.ar_addr};
   wire [31:0]  xbar_s_arlen   = {8'h0,             8'h0,             sg_wide_arlen,   mem.ar_len};
   wire [11:0]  xbar_s_arsize  = {3'h0,             3'h0,             sg_wide_arsize,  mem.ar_size};
   wire [7:0]   xbar_s_arburst = {2'b01,            2'b01,            sg_wide_arburst, mem.ar_burst};
   wire [3:0]   xbar_s_arlock  = {1'b0,             1'b0,             1'b0,            mem.ar_lock};
   wire [15:0]  xbar_s_arcache = {4'h0,             4'h0,             sg_wide_arcache, mem.ar_cache};
   wire [11:0]  xbar_s_arprot  = {3'h0,             3'h0,             sg_wide_arprot,  mem.ar_prot};
   wire [15:0]  xbar_s_arqos   = {4'h0,             4'h0,             4'h0,            mem.ar_qos};
   wire [3:0]   xbar_s_arvalid = {1'b0,             1'b0,             sg_wide_arvalid, mem.ar_valid};
   wire [3:0]   xbar_s_arready;
   assign mem.ar_ready        = xbar_s_arready[0];
   assign sg_wide_arready     = xbar_s_arready[1];
   // xbar_s_arready[2] (MM2S) and [3] (S2MM) not needed

   // ---- R channel unpack ----
   // crossbar ID_WIDTH=6: s_axi_rid is 24-bit (6 bits × 4 slots).
   wire [23:0]  xbar_s_rid;
   wire [255:0] xbar_s_rdata;
   wire [7:0]   xbar_s_rresp;
   wire [3:0]   xbar_s_rlast;
   wire [3:0]   xbar_s_rvalid;
   wire [3:0]   xbar_s_rready  = {1'b0, 1'b0, sg_wide_rready, mem.r_ready};
   assign mem.r_id             = xbar_s_rid[5:0];  // S0: full 6-bit response ID
   assign mem.r_data           = xbar_s_rdata[63:0];
   assign mem.r_resp           = xbar_s_rresp[1:0];
   assign mem.r_last           = xbar_s_rlast[0];
   assign mem.r_valid          = xbar_s_rvalid[0];
   assign sg_wide_rdata        = xbar_s_rdata[127:64];
   assign sg_wide_rresp        = xbar_s_rresp[3:2];
   assign sg_wide_rlast        = xbar_s_rlast[1];
   assign sg_wide_rvalid       = xbar_s_rvalid[1];
   // xbar_s_rdata[191:128], rresp[5:4], rlast[2], rvalid[2] (MM2S) not connected
   // xbar_s_rdata[255:192], rresp[7:6], rlast[3], rvalid[3] (S2MM) not connected

   // PULP axi_mux wrapper: 4 slave ports (CPU/SG/MM2S/S2MM) → 1 DDR master.
   // Correctly prepends 2-bit slave-port-index to AWID/ARID so that B/R
   // responses are routed back to the originating slave, fixing the sbbusy
   // stuck-HIGH bug caused by axi_crossbar_0 misrouting B responses.
   ddr_mux_wrapper u_ddr_xbar (
       .aclk    (user_clk),
       .aresetn (~user_rst),
       // Slave (input) ports — same packed vectors as before
       .s_axi_awid    (xbar_s_awid),    .s_axi_awaddr  (xbar_s_awaddr),
       .s_axi_awlen   (xbar_s_awlen),   .s_axi_awsize  (xbar_s_awsize),
       .s_axi_awburst (xbar_s_awburst), .s_axi_awlock  (xbar_s_awlock),
       .s_axi_awcache (xbar_s_awcache), .s_axi_awprot  (xbar_s_awprot),
       .s_axi_awqos   (xbar_s_awqos),   .s_axi_awvalid (xbar_s_awvalid),
       .s_axi_awready (xbar_s_awready),
       .s_axi_wdata   (xbar_s_wdata),   .s_axi_wstrb   (xbar_s_wstrb),
       .s_axi_wlast   (xbar_s_wlast),   .s_axi_wvalid  (xbar_s_wvalid),
       .s_axi_wready  (xbar_s_wready),
       .s_axi_bid     (xbar_s_bid),     .s_axi_bresp   (xbar_s_bresp),
       .s_axi_bvalid  (xbar_s_bvalid),  .s_axi_bready  (xbar_s_bready),
       .s_axi_arid    (xbar_s_arid),    .s_axi_araddr  (xbar_s_araddr),
       .s_axi_arlen   (xbar_s_arlen),   .s_axi_arsize  (xbar_s_arsize),
       .s_axi_arburst (xbar_s_arburst), .s_axi_arlock  (xbar_s_arlock),
       .s_axi_arcache (xbar_s_arcache), .s_axi_arprot  (xbar_s_arprot),
       .s_axi_arqos   (xbar_s_arqos),   .s_axi_arvalid (xbar_s_arvalid),
       .s_axi_arready (xbar_s_arready),
       .s_axi_rid     (xbar_s_rid),     .s_axi_rdata   (xbar_s_rdata),
       .s_axi_rresp   (xbar_s_rresp),   .s_axi_rlast   (xbar_s_rlast),
       .s_axi_rvalid  (xbar_s_rvalid),  .s_axi_rready  (xbar_s_rready),
       // Master (output) port — 8-bit IDs (6+2 routing bits)
       .m_axi_awid    (ddr_awid),    .m_axi_awaddr  (ddr_awaddr),
       .m_axi_awlen   (ddr_awlen),   .m_axi_awsize  (ddr_awsize),
       .m_axi_awburst (ddr_awburst), .m_axi_awlock  (),
       .m_axi_awcache (),            .m_axi_awprot  (),
       .m_axi_awqos   (),            .m_axi_awvalid (ddr_awvalid),
       .m_axi_awready (ddr_awready),
       .m_axi_wdata   (ddr_wdata),   .m_axi_wstrb   (ddr_wstrb),
       .m_axi_wlast   (ddr_wlast),   .m_axi_wvalid  (ddr_wvalid),
       .m_axi_wready  (ddr_wready),
       .m_axi_bid     (ddr_bid),     .m_axi_bresp   (ddr_bresp),
       .m_axi_bvalid  (ddr_bvalid),  .m_axi_bready  (ddr_bready),
       .m_axi_arid    (ddr_arid),    .m_axi_araddr  (ddr_araddr),
       .m_axi_arlen   (ddr_arlen),   .m_axi_arsize  (ddr_arsize),
       .m_axi_arburst (ddr_arburst), .m_axi_arlock  (),
       .m_axi_arcache (),            .m_axi_arprot  (),
       .m_axi_arqos   (),            .m_axi_arvalid (ddr_arvalid),
       .m_axi_arready (ddr_arready),
       .m_axi_rid     (ddr_rid),     .m_axi_rdata   (ddr_rdata),
       .m_axi_rresp   (ddr_rresp),   .m_axi_rlast   (ddr_rlast),
       .m_axi_rvalid  (ddr_rvalid),  .m_axi_rready  (ddr_rready));

   litedram_top
     #(.ID_WIDTH (8))
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
      .i_awid    (ddr_awid          ),
      .i_awaddr  (ddr_awaddr[26:0]  ),
      .i_awlen   (ddr_awlen         ),
      .i_awsize  ({1'b0,ddr_awsize} ),
      .i_awburst (ddr_awburst       ),
      .i_awvalid (ddr_awvalid       ),
      .o_awready (ddr_awready       ),
      .i_arid    (ddr_arid          ),
      .i_araddr  (ddr_araddr[26:0]  ),
      .i_arlen   (ddr_arlen         ),
      .i_arsize  ({1'b0,ddr_arsize} ),
      .i_arburst (ddr_arburst       ),
      .i_arvalid (ddr_arvalid       ),
      .o_arready (ddr_arready       ),
      .i_wdata   (ddr_wdata         ),
      .i_wstrb   (ddr_wstrb         ),
      .i_wlast   (ddr_wlast         ),
      .i_wvalid  (ddr_wvalid        ),
      .o_wready  (ddr_wready        ),
      .o_bid     (ddr_bid           ),
      .o_bresp   (ddr_bresp         ),
      .o_bvalid  (ddr_bvalid        ),
      .i_bready  (ddr_bready        ),
      .o_rid     (ddr_rid           ),
      .o_rdata   (ddr_rdata         ),
      .o_rresp   (ddr_rresp         ),
      .o_rlast   (ddr_rlast         ),
      .o_rvalid  (ddr_rvalid        ),
      .i_rready  (ddr_rready        ));

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
      // DMA AXI4 master ports: Scatter-Gather
      .m_axi_sg_awaddr   (m_axi_sg_awaddr),  .m_axi_sg_awlen    (m_axi_sg_awlen),
      .m_axi_sg_awsize   (m_axi_sg_awsize),  .m_axi_sg_awburst  (m_axi_sg_awburst),
      .m_axi_sg_awprot   (m_axi_sg_awprot),  .m_axi_sg_awcache  (m_axi_sg_awcache),
      .m_axi_sg_awvalid  (m_axi_sg_awvalid), .m_axi_sg_awready  (m_axi_sg_awready),
      .m_axi_sg_wdata    (m_axi_sg_wdata),   .m_axi_sg_wstrb    (m_axi_sg_wstrb),
      .m_axi_sg_wlast    (m_axi_sg_wlast),   .m_axi_sg_wvalid   (m_axi_sg_wvalid),
      .m_axi_sg_wready   (m_axi_sg_wready),  .m_axi_sg_bresp    (m_axi_sg_bresp),
      .m_axi_sg_bvalid   (m_axi_sg_bvalid),  .m_axi_sg_bready   (m_axi_sg_bready),
      .m_axi_sg_araddr   (m_axi_sg_araddr),  .m_axi_sg_arlen    (m_axi_sg_arlen),
      .m_axi_sg_arsize   (m_axi_sg_arsize),  .m_axi_sg_arburst  (m_axi_sg_arburst),
      .m_axi_sg_arprot   (m_axi_sg_arprot),  .m_axi_sg_arcache  (m_axi_sg_arcache),
      .m_axi_sg_arvalid  (m_axi_sg_arvalid), .m_axi_sg_arready  (m_axi_sg_arready),
      .m_axi_sg_rdata    (m_axi_sg_rdata),   .m_axi_sg_rresp    (m_axi_sg_rresp),
      .m_axi_sg_rlast    (m_axi_sg_rlast),   .m_axi_sg_rvalid   (m_axi_sg_rvalid),
      .m_axi_sg_rready   (m_axi_sg_rready),
      // DMA AXI4 master ports: MM2S (DDR → MAC TX) — READ-ONLY (AR+R only)
      .m_axi_mm2s_araddr  (m_axi_mm2s_araddr), .m_axi_mm2s_arlen   (m_axi_mm2s_arlen),
      .m_axi_mm2s_arsize  (m_axi_mm2s_arsize), .m_axi_mm2s_arburst (m_axi_mm2s_arburst),
      .m_axi_mm2s_arprot  (m_axi_mm2s_arprot), .m_axi_mm2s_arcache (m_axi_mm2s_arcache),
      .m_axi_mm2s_arvalid (m_axi_mm2s_arvalid),.m_axi_mm2s_arready (m_axi_mm2s_arready),
      .m_axi_mm2s_rdata   (m_axi_mm2s_rdata),  .m_axi_mm2s_rresp   (m_axi_mm2s_rresp),
      .m_axi_mm2s_rlast   (m_axi_mm2s_rlast),  .m_axi_mm2s_rvalid  (m_axi_mm2s_rvalid),
      .m_axi_mm2s_rready  (m_axi_mm2s_rready),
      // DMA AXI4 master ports: S2MM (MAC RX → DDR) — WRITE-ONLY (AW+W+B only)
      .m_axi_s2mm_awaddr  (m_axi_s2mm_awaddr), .m_axi_s2mm_awlen   (m_axi_s2mm_awlen),
      .m_axi_s2mm_awsize  (m_axi_s2mm_awsize), .m_axi_s2mm_awburst (m_axi_s2mm_awburst),
      .m_axi_s2mm_awprot  (m_axi_s2mm_awprot), .m_axi_s2mm_awcache (m_axi_s2mm_awcache),
      .m_axi_s2mm_awvalid (m_axi_s2mm_awvalid),.m_axi_s2mm_awready (m_axi_s2mm_awready),
      .m_axi_s2mm_wdata   (m_axi_s2mm_wdata),  .m_axi_s2mm_wstrb   (m_axi_s2mm_wstrb),
      .m_axi_s2mm_wlast   (m_axi_s2mm_wlast),  .m_axi_s2mm_wvalid  (m_axi_s2mm_wvalid),
      .m_axi_s2mm_wready  (m_axi_s2mm_wready), .m_axi_s2mm_bresp   (m_axi_s2mm_bresp),
      .m_axi_s2mm_bvalid  (m_axi_s2mm_bvalid), .m_axi_s2mm_bready  (m_axi_s2mm_bready),
      // DMA interrupts (not yet wired to CPU interrupt controller)
      .mm2s_introut      (mm2s_introut),
      .s2mm_introut      (s2mm_introut),
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
      // MAC interrupt (unconnected)
      .mac_irq           ());

endmodule
