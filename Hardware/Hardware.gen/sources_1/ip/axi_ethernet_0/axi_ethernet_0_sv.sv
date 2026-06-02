// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2026 Advanced Micro Devices, Inc. All Rights Reserved.
// -------------------------------------------------------------------------------
// This file contains confidential and proprietary information
// of AMD and is protected under U.S. and international copyright
// and other intellectual property laws.
//
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// AMD, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) AMD shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or AMD had been advised of the
// possibility of the same.
//
// CRITICAL APPLICATIONS
// AMD products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of AMD products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
//
// DO NOT MODIFY THIS FILE.

// MODULE VLNV: xilinx.com:ip:axi_ethernet:8.0

`timescale 1ps / 1ps

`include "vivado_interfaces.svh"

module axi_ethernet_0_sv (
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi" *)
  (* X_INTERFACE_MODE = "slave s_axi" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axi, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 18, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN bd_5d9f_0_s_axi_lite_clk, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *)
  vivado_axi4_lite_v1_0.slave s_axi,
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_txd" *)
  (* X_INTERFACE_MODE = "slave s_axis_txd" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axis_txd, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN bd_5d9f_0_axis_clk, LAYERED_METADATA undef, INSERT_VIP 0" *)
  vivado_axis_v1_0.slave s_axis_txd,
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_txc" *)
  (* X_INTERFACE_MODE = "slave s_axis_txc" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axis_txc, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN bd_5d9f_0_axis_clk, LAYERED_METADATA undef, INSERT_VIP 0" *)
  vivado_axis_v1_0.slave s_axis_txc,
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_rxd" *)
  (* X_INTERFACE_MODE = "master m_axis_rxd" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axis_rxd, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN bd_5d9f_0_axis_clk, LAYERED_METADATA undef, INSERT_VIP 0" *)
  vivado_axis_v1_0.master m_axis_rxd,
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_rxs" *)
  (* X_INTERFACE_MODE = "master m_axis_rxs" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axis_rxs, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN bd_5d9f_0_axis_clk, LAYERED_METADATA undef, INSERT_VIP 0" *)
  vivado_axis_v1_0.master m_axis_rxs,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire s_axi_lite_resetn,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire s_axi_lite_clk,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire mac_irq,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire axis_clk,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire axi_txd_arstn,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire axi_txc_arstn,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire axi_rxd_arstn,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire axi_rxs_arstn,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire interrupt,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire gtx_clk,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire [0:0] phy_rst_n,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire mii_rx_clk,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire mii_rx_dv,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire mii_rx_er,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire [3:0] mii_rxd,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire mii_tx_clk,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire mii_tx_en,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire mii_tx_er,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire [3:0] mii_txd,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire mdio_mdc,
  (* X_INTERFACE_IGNORE = "true" *)
  input wire mdio_mdio_i,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire mdio_mdio_o,
  (* X_INTERFACE_IGNORE = "true" *)
  output wire mdio_mdio_t
);

  // interface wire assignments
  assign m_axis_rxd.TDEST = 0;
  assign m_axis_rxd.TID = 0;
  assign m_axis_rxd.TSTRB = 0;
  assign m_axis_rxd.TUSER = 0;
  assign m_axis_rxs.TDEST = 0;
  assign m_axis_rxs.TID = 0;
  assign m_axis_rxs.TSTRB = 0;
  assign m_axis_rxs.TUSER = 0;

  axi_ethernet_0 inst (
    .s_axi_lite_resetn(s_axi_lite_resetn),
    .s_axi_lite_clk(s_axi_lite_clk),
    .mac_irq(mac_irq),
    .axis_clk(axis_clk),
    .axi_txd_arstn(axi_txd_arstn),
    .axi_txc_arstn(axi_txc_arstn),
    .axi_rxd_arstn(axi_rxd_arstn),
    .axi_rxs_arstn(axi_rxs_arstn),
    .interrupt(interrupt),
    .gtx_clk(gtx_clk),
    .phy_rst_n(phy_rst_n),
    .s_axi_araddr(s_axi.ARADDR),
    .s_axi_arready(s_axi.ARREADY),
    .s_axi_arvalid(s_axi.ARVALID),
    .s_axi_awaddr(s_axi.AWADDR),
    .s_axi_awready(s_axi.AWREADY),
    .s_axi_awvalid(s_axi.AWVALID),
    .s_axi_bready(s_axi.BREADY),
    .s_axi_bresp(s_axi.BRESP),
    .s_axi_bvalid(s_axi.BVALID),
    .s_axi_rdata(s_axi.RDATA),
    .s_axi_rready(s_axi.RREADY),
    .s_axi_rresp(s_axi.RRESP),
    .s_axi_rvalid(s_axi.RVALID),
    .s_axi_wdata(s_axi.WDATA),
    .s_axi_wready(s_axi.WREADY),
    .s_axi_wstrb(s_axi.WSTRB),
    .s_axi_wvalid(s_axi.WVALID),
    .s_axis_txc_tdata(s_axis_txc.TDATA),
    .s_axis_txc_tkeep(s_axis_txc.TKEEP),
    .s_axis_txc_tlast(s_axis_txc.TLAST),
    .s_axis_txc_tready(s_axis_txc.TREADY),
    .s_axis_txc_tvalid(s_axis_txc.TVALID),
    .s_axis_txd_tdata(s_axis_txd.TDATA),
    .s_axis_txd_tkeep(s_axis_txd.TKEEP),
    .s_axis_txd_tlast(s_axis_txd.TLAST),
    .s_axis_txd_tready(s_axis_txd.TREADY),
    .s_axis_txd_tvalid(s_axis_txd.TVALID),
    .m_axis_rxd_tdata(m_axis_rxd.TDATA),
    .m_axis_rxd_tkeep(m_axis_rxd.TKEEP),
    .m_axis_rxd_tlast(m_axis_rxd.TLAST),
    .m_axis_rxd_tready(m_axis_rxd.TREADY),
    .m_axis_rxd_tvalid(m_axis_rxd.TVALID),
    .m_axis_rxs_tdata(m_axis_rxs.TDATA),
    .m_axis_rxs_tkeep(m_axis_rxs.TKEEP),
    .m_axis_rxs_tlast(m_axis_rxs.TLAST),
    .m_axis_rxs_tready(m_axis_rxs.TREADY),
    .m_axis_rxs_tvalid(m_axis_rxs.TVALID),
    .mii_rx_clk(mii_rx_clk),
    .mii_rx_dv(mii_rx_dv),
    .mii_rx_er(mii_rx_er),
    .mii_rxd(mii_rxd),
    .mii_tx_clk(mii_tx_clk),
    .mii_tx_en(mii_tx_en),
    .mii_tx_er(mii_tx_er),
    .mii_txd(mii_txd),
    .mdio_mdc(mdio_mdc),
    .mdio_mdio_i(mdio_mdio_i),
    .mdio_mdio_o(mdio_mdio_o),
    .mdio_mdio_t(mdio_mdio_t)
  );

endmodule
