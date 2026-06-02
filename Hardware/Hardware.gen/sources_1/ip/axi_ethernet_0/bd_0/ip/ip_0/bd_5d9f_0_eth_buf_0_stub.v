// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
// Date        : Mon Jun  1 22:29:14 2026
// Host        : archlinux running 64-bit unknown
// Command     : write_verilog -force -mode synth_stub
//               /run/media/sackb/Windows-SSD/Users/sackb/OneDrive/Desktop/University/Course_Work/2025-2026/Spring_2026/ECE_540/ece540sp26-Final_Project/Hardware/Hardware.gen/sources_1/ip/axi_ethernet_0/bd_0/ip/ip_0/bd_5d9f_0_eth_buf_0_stub.v
// Design      : bd_5d9f_0_eth_buf_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "bd_5d9f_0_eth_buf_0,axi_ethernet_buffer_v2_0_26,{}" *) (* core_generation_info = "bd_5d9f_0_eth_buf_0,axi_ethernet_buffer_v2_0_26,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=axi_ethernet_buffer,x_ipVersion=2.0,x_ipCoreRevision=26,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_FAMILY=artix7,C_TXMEM=4096,C_TEMAC_ADDR_WIDTH=12,C_RXMEM=4096,C_TXCSUM=0,C_RXCSUM=0,C_PHYADDR=1,C_AVB=0,C_STATS=1,C_PHY_TYPE=0,C_SPEED_2P5=0,C_TYPE=0,C_TXVLAN_TRAN=0,C_RXVLAN_TRAN=0,C_TXVLAN_TAG=0,C_RXVLAN_TAG=0,C_TXVLAN_STRP=0,C_RXVLAN_STRP=0,C_MCAST_EXTEND=0,C_ENABLE_LVDS=0,C_ENABLE_1588=0,C_SIMULATION=0,C_PHY_RST_COUNT=500}" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* x_core_info = "axi_ethernet_buffer_v2_0_26,Vivado 2025.2" *) 
module bd_5d9f_0_eth_buf_0(INTERRUPT, S_AXI_ACLK, S_AXI_ARESETN, 
  S_AXI_AWADDR, S_AXI_AWVALID, S_AXI_AWREADY, S_AXI_WDATA, S_AXI_WSTRB, S_AXI_WVALID, 
  S_AXI_WREADY, S_AXI_BRESP, S_AXI_BVALID, S_AXI_BREADY, S_AXI_ARADDR, S_AXI_ARVALID, 
  S_AXI_ARREADY, S_AXI_RDATA, S_AXI_RRESP, S_AXI_RVALID, S_AXI_RREADY, 
  EMAC_CLIENT_AUTONEG_INT, EMAC_RESET_DONE_INT, EMAC_RX_DCM_LOCKED_INT, 
  PCSPMA_STATUS_VECTOR, AXI_STR_TXD_ACLK, AXI_STR_TXD_ARESETN, AXI_STR_TXD_TVALID, 
  AXI_STR_TXD_TREADY, AXI_STR_TXD_TLAST, AXI_STR_TXD_TKEEP, AXI_STR_TXD_TDATA, 
  AXI_STR_TXC_ACLK, AXI_STR_TXC_ARESETN, AXI_STR_TXC_TVALID, AXI_STR_TXC_TREADY, 
  AXI_STR_TXC_TLAST, AXI_STR_TXC_TKEEP, AXI_STR_TXC_TDATA, AXI_STR_RXD_ACLK, 
  AXI_STR_RXD_ARESETN, AXI_STR_RXD_VALID, AXI_STR_RXD_READY, AXI_STR_RXD_LAST, 
  AXI_STR_RXD_KEEP, AXI_STR_RXD_DATA, AXI_STR_RXS_ACLK, AXI_STR_RXS_ARESETN, 
  AXI_STR_RXS_VALID, AXI_STR_RXS_READY, AXI_STR_RXS_LAST, AXI_STR_RXS_KEEP, 
  AXI_STR_RXS_DATA, pause_req, pause_val, S_AXI_2TEMAC_AWADDR, S_AXI_2TEMAC_AWVALID, 
  S_AXI_2TEMAC_AWREADY, S_AXI_2TEMAC_WDATA, S_AXI_2TEMAC_WVALID, S_AXI_2TEMAC_WREADY, 
  S_AXI_2TEMAC_BRESP, S_AXI_2TEMAC_BVALID, S_AXI_2TEMAC_BREADY, S_AXI_2TEMAC_ARADDR, 
  S_AXI_2TEMAC_ARVALID, S_AXI_2TEMAC_ARREADY, S_AXI_2TEMAC_RDATA, S_AXI_2TEMAC_RRESP, 
  S_AXI_2TEMAC_RVALID, S_AXI_2TEMAC_RREADY, RX_CLK_ENABLE_IN, rx_statistics_vector, 
  rx_statistics_valid, rx_mac_aclk, rx_reset, rx_axis_mac_tdata, rx_axis_mac_tvalid, 
  rx_axis_mac_tlast, rx_axis_mac_tuser, tx_ifg_delay, tx_mac_aclk, tx_reset, 
  tx_axis_mac_tdata, tx_axis_mac_tvalid, tx_axis_mac_tlast, tx_axis_mac_tuser, 
  tx_axis_mac_tready, speed_is_10_100, RESET2PCSPMA, RESET2TEMACn, PHY_RST_N, mdio_i_top, 
  mdio_o_top, mdio_t_top, mdc_top, mdio_t_pcspma, mdio_o_pcspma, mdio_i_temac, mdio_o_temac, 
  mdio_t_temac, mdc_temac, GTX_CLK)
/* synthesis syn_black_box black_box_pad_pin="INTERRUPT,S_AXI_ARESETN,S_AXI_AWADDR[17:0],S_AXI_AWVALID,S_AXI_AWREADY,S_AXI_WDATA[31:0],S_AXI_WSTRB[3:0],S_AXI_WVALID,S_AXI_WREADY,S_AXI_BRESP[1:0],S_AXI_BVALID,S_AXI_BREADY,S_AXI_ARADDR[17:0],S_AXI_ARVALID,S_AXI_ARREADY,S_AXI_RDATA[31:0],S_AXI_RRESP[1:0],S_AXI_RVALID,S_AXI_RREADY,EMAC_CLIENT_AUTONEG_INT,EMAC_RESET_DONE_INT,EMAC_RX_DCM_LOCKED_INT,PCSPMA_STATUS_VECTOR[15:0],AXI_STR_TXD_ARESETN,AXI_STR_TXD_TVALID,AXI_STR_TXD_TREADY,AXI_STR_TXD_TLAST,AXI_STR_TXD_TKEEP[3:0],AXI_STR_TXD_TDATA[31:0],AXI_STR_TXC_ARESETN,AXI_STR_TXC_TVALID,AXI_STR_TXC_TREADY,AXI_STR_TXC_TLAST,AXI_STR_TXC_TKEEP[3:0],AXI_STR_TXC_TDATA[31:0],AXI_STR_RXD_ARESETN,AXI_STR_RXD_VALID,AXI_STR_RXD_READY,AXI_STR_RXD_LAST,AXI_STR_RXD_KEEP[3:0],AXI_STR_RXD_DATA[31:0],AXI_STR_RXS_ARESETN,AXI_STR_RXS_VALID,AXI_STR_RXS_READY,AXI_STR_RXS_LAST,AXI_STR_RXS_KEEP[3:0],AXI_STR_RXS_DATA[31:0],pause_req,pause_val[16:31],S_AXI_2TEMAC_AWADDR[11:0],S_AXI_2TEMAC_AWVALID,S_AXI_2TEMAC_AWREADY,S_AXI_2TEMAC_WDATA[31:0],S_AXI_2TEMAC_WVALID,S_AXI_2TEMAC_WREADY,S_AXI_2TEMAC_BRESP[1:0],S_AXI_2TEMAC_BVALID,S_AXI_2TEMAC_BREADY,S_AXI_2TEMAC_ARADDR[11:0],S_AXI_2TEMAC_ARVALID,S_AXI_2TEMAC_ARREADY,S_AXI_2TEMAC_RDATA[31:0],S_AXI_2TEMAC_RRESP[1:0],S_AXI_2TEMAC_RVALID,S_AXI_2TEMAC_RREADY,RX_CLK_ENABLE_IN,rx_statistics_vector[27:0],rx_statistics_valid,rx_reset,rx_axis_mac_tdata[7:0],rx_axis_mac_tvalid,rx_axis_mac_tlast,rx_axis_mac_tuser,tx_ifg_delay[24:31],tx_reset,tx_axis_mac_tdata[7:0],tx_axis_mac_tvalid,tx_axis_mac_tlast,tx_axis_mac_tuser[0:0],tx_axis_mac_tready,speed_is_10_100,RESET2PCSPMA,RESET2TEMACn,PHY_RST_N,mdio_i_top,mdio_o_top,mdio_t_top,mdc_top,mdio_t_pcspma,mdio_o_pcspma,mdio_i_temac,mdio_o_temac,mdio_t_temac,mdc_temac" */
/* synthesis syn_force_seq_prim="S_AXI_ACLK" */
/* synthesis syn_force_seq_prim="AXI_STR_TXD_ACLK" */
/* synthesis syn_force_seq_prim="AXI_STR_TXC_ACLK" */
/* synthesis syn_force_seq_prim="AXI_STR_RXD_ACLK" */
/* synthesis syn_force_seq_prim="AXI_STR_RXS_ACLK" */
/* synthesis syn_force_seq_prim="rx_mac_aclk" */
/* synthesis syn_force_seq_prim="tx_mac_aclk" */
/* synthesis syn_force_seq_prim="GTX_CLK" */;
  (* x_interface_info = "xilinx.com:signal:interrupt:1.0 interrupt INTERRUPT" *) (* x_interface_mode = "master interrupt" *) (* x_interface_parameter = "XIL_INTERFACENAME interrupt, SENSITIVITY LEVEL_HIGH, PortWidth 1" *) output INTERRUPT;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 S_AXI_ACLK CLK" *) (* x_interface_mode = "slave S_AXI_ACLK" *) (* x_interface_parameter = "XIL_INTERFACENAME S_AXI_ACLK, ASSOCIATED_BUSIF S_AXI:S_AXI_2TEMAC, ASSOCIATED_RESET S_AXI_ARESETN, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN bd_5d9f_0_s_axi_lite_clk, INSERT_VIP 0" *) input S_AXI_ACLK /* synthesis syn_isclock = 1 */;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 S_AXI_ARESETN RST" *) (* x_interface_mode = "slave S_AXI_ARESETN" *) (* x_interface_parameter = "XIL_INTERFACENAME S_AXI_ARESETN, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input S_AXI_ARESETN;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI AWADDR" *) (* x_interface_mode = "slave S_AXI" *) (* x_interface_parameter = "XIL_INTERFACENAME S_AXI, FREQ_HZ 100000000, DATA_WIDTH 32, PROTOCOL AXI4LITE, ID_WIDTH 0, ADDR_WIDTH 18, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN bd_5d9f_0_s_axi_lite_clk, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input [17:0]S_AXI_AWADDR;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI AWVALID" *) input S_AXI_AWVALID;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI AWREADY" *) output S_AXI_AWREADY;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI WDATA" *) input [31:0]S_AXI_WDATA;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI WSTRB" *) input [3:0]S_AXI_WSTRB;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI WVALID" *) input S_AXI_WVALID;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI WREADY" *) output S_AXI_WREADY;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI BRESP" *) output [1:0]S_AXI_BRESP;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI BVALID" *) output S_AXI_BVALID;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI BREADY" *) input S_AXI_BREADY;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI ARADDR" *) input [17:0]S_AXI_ARADDR;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI ARVALID" *) input S_AXI_ARVALID;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI ARREADY" *) output S_AXI_ARREADY;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *) output [31:0]S_AXI_RDATA;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI RRESP" *) output [1:0]S_AXI_RRESP;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI RVALID" *) output S_AXI_RVALID;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI RREADY" *) input S_AXI_RREADY;
  (* x_interface_info = "xilinx.com:signal:interrupt:1.0 EMAC_CLIENT_AUTONEG_INT INTERRUPT" *) (* x_interface_mode = "slave EMAC_CLIENT_AUTONEG_INT" *) (* x_interface_parameter = "XIL_INTERFACENAME EMAC_CLIENT_AUTONEG_INT, SENSITIVITY EDGE_RISING, PortWidth 1" *) input EMAC_CLIENT_AUTONEG_INT;
  input EMAC_RESET_DONE_INT;
  input EMAC_RX_DCM_LOCKED_INT;
  input [15:0]PCSPMA_STATUS_VECTOR;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 AXI_STR_TXD_ACLK CLK" *) (* x_interface_mode = "slave AXI_STR_TXD_ACLK" *) (* x_interface_parameter = "XIL_INTERFACENAME AXI_STR_TXD_ACLK, ASSOCIATED_BUSIF AXI_STR_TXD, ASSOCIATED_RESET AXI_STR_TXD_ARESETN, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN bd_5d9f_0_axis_clk, INSERT_VIP 0" *) input AXI_STR_TXD_ACLK /* synthesis syn_isclock = 1 */;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 AXI_STR_TXD_ARESETN RST" *) (* x_interface_mode = "slave AXI_STR_TXD_ARESETN" *) (* x_interface_parameter = "XIL_INTERFACENAME AXI_STR_TXD_ARESETN, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input AXI_STR_TXD_ARESETN;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 AXI_STR_TXD TVALID" *) (* x_interface_mode = "slave AXI_STR_TXD" *) (* x_interface_parameter = "XIL_INTERFACENAME AXI_STR_TXD, FREQ_HZ 100000000, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1, PHASE 0.0, CLK_DOMAIN bd_5d9f_0_axis_clk, LAYERED_METADATA undef, INSERT_VIP 0" *) input AXI_STR_TXD_TVALID;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 AXI_STR_TXD TREADY" *) output AXI_STR_TXD_TREADY;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 AXI_STR_TXD TLAST" *) input AXI_STR_TXD_TLAST;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 AXI_STR_TXD TKEEP" *) input [3:0]AXI_STR_TXD_TKEEP;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 AXI_STR_TXD TDATA" *) input [31:0]AXI_STR_TXD_TDATA;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 AXI_STR_TXC_ACLK CLK" *) (* x_interface_mode = "slave AXI_STR_TXC_ACLK" *) (* x_interface_parameter = "XIL_INTERFACENAME AXI_STR_TXC_ACLK, ASSOCIATED_BUSIF AXI_STR_TXC, ASSOCIATED_RESET AXI_STR_TXC_ARESETN, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN bd_5d9f_0_axis_clk, INSERT_VIP 0" *) input AXI_STR_TXC_ACLK /* synthesis syn_isclock = 1 */;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 AXI_STR_TXC_ARESETN RST" *) (* x_interface_mode = "slave AXI_STR_TXC_ARESETN" *) (* x_interface_parameter = "XIL_INTERFACENAME AXI_STR_TXC_ARESETN, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input AXI_STR_TXC_ARESETN;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 AXI_STR_TXC TVALID" *) (* x_interface_mode = "slave AXI_STR_TXC" *) (* x_interface_parameter = "XIL_INTERFACENAME AXI_STR_TXC, FREQ_HZ 100000000, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1, PHASE 0.0, CLK_DOMAIN bd_5d9f_0_axis_clk, LAYERED_METADATA undef, INSERT_VIP 0" *) input AXI_STR_TXC_TVALID;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 AXI_STR_TXC TREADY" *) output AXI_STR_TXC_TREADY;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 AXI_STR_TXC TLAST" *) input AXI_STR_TXC_TLAST;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 AXI_STR_TXC TKEEP" *) input [3:0]AXI_STR_TXC_TKEEP;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 AXI_STR_TXC TDATA" *) input [31:0]AXI_STR_TXC_TDATA;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 AXI_STR_RXD_ACLK CLK" *) (* x_interface_mode = "slave AXI_STR_RXD_ACLK" *) (* x_interface_parameter = "XIL_INTERFACENAME AXI_STR_RXD_ACLK, ASSOCIATED_BUSIF AXI_STR_RXD, ASSOCIATED_RESET AXI_STR_RXD_ARESETN, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN bd_5d9f_0_axis_clk, INSERT_VIP 0" *) input AXI_STR_RXD_ACLK /* synthesis syn_isclock = 1 */;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 AXI_STR_RXD_ARESETN RST" *) (* x_interface_mode = "slave AXI_STR_RXD_ARESETN" *) (* x_interface_parameter = "XIL_INTERFACENAME AXI_STR_RXD_ARESETN, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input AXI_STR_RXD_ARESETN;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 AXI_STR_RXD TVALID" *) (* x_interface_mode = "master AXI_STR_RXD" *) (* x_interface_parameter = "XIL_INTERFACENAME AXI_STR_RXD, FREQ_HZ 100000000, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1, PHASE 0.0, CLK_DOMAIN bd_5d9f_0_axis_clk, LAYERED_METADATA undef, INSERT_VIP 0" *) output AXI_STR_RXD_VALID;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 AXI_STR_RXD TREADY" *) input AXI_STR_RXD_READY;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 AXI_STR_RXD TLAST" *) output AXI_STR_RXD_LAST;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 AXI_STR_RXD TKEEP" *) output [3:0]AXI_STR_RXD_KEEP;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 AXI_STR_RXD TDATA" *) output [31:0]AXI_STR_RXD_DATA;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 AXI_STR_RXS_ACLK CLK" *) (* x_interface_mode = "slave AXI_STR_RXS_ACLK" *) (* x_interface_parameter = "XIL_INTERFACENAME AXI_STR_RXS_ACLK, ASSOCIATED_BUSIF AXI_STR_RXS, ASSOCIATED_RESET AXI_STR_RXS_ARESETN, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN bd_5d9f_0_axis_clk, INSERT_VIP 0" *) input AXI_STR_RXS_ACLK /* synthesis syn_isclock = 1 */;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 AXI_STR_RXS_ARESETN RST" *) (* x_interface_mode = "slave AXI_STR_RXS_ARESETN" *) (* x_interface_parameter = "XIL_INTERFACENAME AXI_STR_RXS_ARESETN, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input AXI_STR_RXS_ARESETN;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 AXI_STR_RXS TVALID" *) (* x_interface_mode = "master AXI_STR_RXS" *) (* x_interface_parameter = "XIL_INTERFACENAME AXI_STR_RXS, FREQ_HZ 100000000, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1, PHASE 0.0, CLK_DOMAIN bd_5d9f_0_axis_clk, LAYERED_METADATA undef, INSERT_VIP 0" *) output AXI_STR_RXS_VALID;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 AXI_STR_RXS TREADY" *) input AXI_STR_RXS_READY;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 AXI_STR_RXS TLAST" *) output AXI_STR_RXS_LAST;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 AXI_STR_RXS TKEEP" *) output [3:0]AXI_STR_RXS_KEEP;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 AXI_STR_RXS TDATA" *) output [31:0]AXI_STR_RXS_DATA;
  output pause_req;
  output [16:31]pause_val;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI_2TEMAC AWADDR" *) (* x_interface_mode = "master S_AXI_2TEMAC" *) (* x_interface_parameter = "XIL_INTERFACENAME S_AXI_2TEMAC, FREQ_HZ 100000000, DATA_WIDTH 32, PROTOCOL AXI4LITE, ID_WIDTH 0, ADDR_WIDTH 12, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 0, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN bd_5d9f_0_s_axi_lite_clk, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) output [11:0]S_AXI_2TEMAC_AWADDR;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI_2TEMAC AWVALID" *) output S_AXI_2TEMAC_AWVALID;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI_2TEMAC AWREADY" *) input S_AXI_2TEMAC_AWREADY;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI_2TEMAC WDATA" *) output [31:0]S_AXI_2TEMAC_WDATA;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI_2TEMAC WVALID" *) output S_AXI_2TEMAC_WVALID;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI_2TEMAC WREADY" *) input S_AXI_2TEMAC_WREADY;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI_2TEMAC BRESP" *) input [1:0]S_AXI_2TEMAC_BRESP;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI_2TEMAC BVALID" *) input S_AXI_2TEMAC_BVALID;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI_2TEMAC BREADY" *) output S_AXI_2TEMAC_BREADY;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI_2TEMAC ARADDR" *) output [11:0]S_AXI_2TEMAC_ARADDR;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI_2TEMAC ARVALID" *) output S_AXI_2TEMAC_ARVALID;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI_2TEMAC ARREADY" *) input S_AXI_2TEMAC_ARREADY;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI_2TEMAC RDATA" *) input [31:0]S_AXI_2TEMAC_RDATA;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI_2TEMAC RRESP" *) input [1:0]S_AXI_2TEMAC_RRESP;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI_2TEMAC RVALID" *) input S_AXI_2TEMAC_RVALID;
  (* x_interface_info = "xilinx.com:interface:aximm:1.0 S_AXI_2TEMAC RREADY" *) output S_AXI_2TEMAC_RREADY;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 RX_CLK_ENABLE_IN CE" *) (* x_interface_mode = "slave RX_CLK_ENABLE_IN" *) (* x_interface_parameter = "XIL_INTERFACENAME RX_CLK_ENABLE_IN, POLARITY ACTIVE_LOW" *) input RX_CLK_ENABLE_IN;
  input [27:0]rx_statistics_vector;
  input rx_statistics_valid;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 rx_mac_aclk CLK" *) (* x_interface_mode = "slave rx_mac_aclk" *) (* x_interface_parameter = "XIL_INTERFACENAME rx_mac_aclk, ASSOCIATED_BUSIF RX_AXIS_MAC, FREQ_HZ 125000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /mac/rx_mac_aclk, INSERT_VIP 0" *) input rx_mac_aclk /* synthesis syn_isclock = 1 */;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 rx_reset RST" *) (* x_interface_mode = "slave rx_reset" *) (* x_interface_parameter = "XIL_INTERFACENAME rx_reset, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input rx_reset;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 RX_AXIS_MAC TDATA" *) (* x_interface_mode = "slave RX_AXIS_MAC" *) (* x_interface_parameter = "XIL_INTERFACENAME RX_AXIS_MAC, FREQ_HZ 125000000, TDATA_NUM_BYTES 1, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 1, HAS_TREADY 0, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, PHASE 0.0, CLK_DOMAIN /mac/rx_mac_aclk, LAYERED_METADATA undef, INSERT_VIP 0" *) input [7:0]rx_axis_mac_tdata;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 RX_AXIS_MAC TVALID" *) input rx_axis_mac_tvalid;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 RX_AXIS_MAC TLAST" *) input rx_axis_mac_tlast;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 RX_AXIS_MAC TUSER" *) input rx_axis_mac_tuser;
  output [24:31]tx_ifg_delay;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 tx_mac_aclk CLK" *) (* x_interface_mode = "slave tx_mac_aclk" *) (* x_interface_parameter = "XIL_INTERFACENAME tx_mac_aclk, ASSOCIATED_BUSIF TX_AXIS_MAC, FREQ_HZ 125000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /mac/tx_mac_aclk, INSERT_VIP 0" *) input tx_mac_aclk /* synthesis syn_isclock = 1 */;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 tx_reset RST" *) (* x_interface_mode = "slave tx_reset" *) (* x_interface_parameter = "XIL_INTERFACENAME tx_reset, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input tx_reset;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 TX_AXIS_MAC TDATA" *) (* x_interface_mode = "master TX_AXIS_MAC" *) (* x_interface_parameter = "XIL_INTERFACENAME TX_AXIS_MAC, FREQ_HZ 125000000, TDATA_NUM_BYTES 1, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 1, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, PHASE 0.0, CLK_DOMAIN /mac/tx_mac_aclk, LAYERED_METADATA undef, INSERT_VIP 0" *) output [7:0]tx_axis_mac_tdata;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 TX_AXIS_MAC TVALID" *) output tx_axis_mac_tvalid;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 TX_AXIS_MAC TLAST" *) output tx_axis_mac_tlast;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 TX_AXIS_MAC TUSER" *) output [0:0]tx_axis_mac_tuser;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 TX_AXIS_MAC TREADY" *) input tx_axis_mac_tready;
  input speed_is_10_100;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 RESET2PCSPMA RST" *) (* x_interface_mode = "master RESET2PCSPMA" *) (* x_interface_parameter = "XIL_INTERFACENAME RESET2PCSPMA, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) output RESET2PCSPMA;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 RESET2TEMACn RST" *) (* x_interface_mode = "master RESET2TEMACn" *) (* x_interface_parameter = "XIL_INTERFACENAME RESET2TEMACn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) output RESET2TEMACn;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 PHY_RST_N RST" *) (* x_interface_mode = "master PHY_RST_N" *) (* x_interface_parameter = "XIL_INTERFACENAME PHY_RST_N, BOARD.ASSOCIATED_PARAM PHYRST_BOARD_INTERFACE, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) output PHY_RST_N;
  (* x_interface_info = "xilinx.com:interface:mdio:1.0 mdio_to_top MDIO_I" *) (* x_interface_mode = "master mdio_to_top" *) (* x_interface_parameter = "XIL_INTERFACENAME mdio_to_top, BOARD.ASSOCIATED_PARAM MDIO_BOARD_INTERFACE, CAN_DEBUG false" *) input mdio_i_top;
  (* x_interface_info = "xilinx.com:interface:mdio:1.0 mdio_to_top MDIO_O" *) output mdio_o_top;
  (* x_interface_info = "xilinx.com:interface:mdio:1.0 mdio_to_top MDIO_T" *) output mdio_t_top;
  (* x_interface_info = "xilinx.com:interface:mdio:1.0 mdio_to_top MDC" *) output mdc_top;
  input mdio_t_pcspma;
  input mdio_o_pcspma;
  (* x_interface_info = "xilinx.com:interface:mdio:1.0 mdio_temac MDIO_I" *) (* x_interface_mode = "mirroredMaster mdio_temac" *) (* x_interface_parameter = "XIL_INTERFACENAME mdio_temac, CAN_DEBUG false" *) output mdio_i_temac;
  (* x_interface_info = "xilinx.com:interface:mdio:1.0 mdio_temac MDIO_O" *) input mdio_o_temac;
  (* x_interface_info = "xilinx.com:interface:mdio:1.0 mdio_temac MDIO_T" *) input mdio_t_temac;
  (* x_interface_info = "xilinx.com:interface:mdio:1.0 mdio_temac MDC" *) input mdc_temac;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 GTX_CLK CLK" *) (* x_interface_mode = "slave GTX_CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME GTX_CLK, FREQ_HZ 125000000, FREQ_TOLERANCE_HZ 0, PHASE 0, CLK_DOMAIN bd_5d9f_0_gtx_clk, INSERT_VIP 0" *) input GTX_CLK /* synthesis syn_isclock = 1 */;
endmodule
