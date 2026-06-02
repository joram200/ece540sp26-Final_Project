// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
// Date        : Mon Jun  1 22:29:02 2026
// Host        : archlinux running 64-bit unknown
// Command     : write_verilog -force -mode funcsim
//               /run/media/sackb/Windows-SSD/Users/sackb/OneDrive/Desktop/University/Course_Work/2025-2026/Spring_2026/ECE_540/ece540sp26-Final_Project/Hardware/Hardware.gen/sources_1/ip/axi_ethernet_0/bd_0/ip/ip_2/bd_5d9f_0_c_shift_ram_0_0_sim_netlist.v
// Design      : bd_5d9f_0_c_shift_ram_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "bd_5d9f_0_c_shift_ram_0_0,c_shift_ram_v12_0_20,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_shift_ram_v12_0_20,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module bd_5d9f_0_c_shift_ram_0_0
   (D,
    CLK,
    CE,
    SCLR,
    Q);
  (* x_interface_info = "xilinx.com:signal:data:1.0 d_intf DATA" *) (* x_interface_mode = "slave d_intf" *) (* x_interface_parameter = "XIL_INTERFACENAME d_intf, LAYERED_METADATA undef" *) input [0:0]D;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_mode = "slave clk_intf" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF q_intf:sinit_intf:sset_intf:d_intf:a_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN bd_5d9f_0_s_axi_lite_clk, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* x_interface_mode = "slave ce_intf" *) (* x_interface_parameter = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_HIGH" *) input CE;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) (* x_interface_mode = "slave sclr_intf" *) (* x_interface_parameter = "XIL_INTERFACENAME sclr_intf, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input SCLR;
  (* x_interface_info = "xilinx.com:signal:data:1.0 q_intf DATA" *) (* x_interface_mode = "master q_intf" *) (* x_interface_parameter = "XIL_INTERFACENAME q_intf, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value data} bitwidth {attribs {resolve_type generated dependency data_bitwidth format long minimum {} maximum {}} value 1} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0}}} DATA_WIDTH 1}" *) output [0:0]Q;

  wire CE;
  wire CLK;
  wire [0:0]D;
  wire [0:0]Q;
  wire SCLR;

  (* C_AINIT_VAL = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_SCLR = "1" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_SYNC_ENABLE = "0" *) 
  (* C_SYNC_PRIORITY = "1" *) 
  (* C_WIDTH = "1" *) 
  (* c_addr_width = "4" *) 
  (* c_default_data = "0" *) 
  (* c_depth = "1" *) 
  (* c_elaboration_dir = "./" *) 
  (* c_has_a = "0" *) 
  (* c_mem_init_file = "no_coe_file_loaded" *) 
  (* c_opt_goal = "0" *) 
  (* c_parser_type = "0" *) 
  (* c_read_mif = "0" *) 
  (* c_reg_last_bit = "1" *) 
  (* c_shift_type = "0" *) 
  (* c_verbosity = "0" *) 
  (* c_xdevicefamily = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  bd_5d9f_0_c_shift_ram_0_0_c_shift_ram_v12_0_20 U0
       (.A({1'b0,1'b0,1'b0,1'b0}),
        .CE(CE),
        .CLK(CLK),
        .D(D),
        .Q(Q),
        .SCLR(SCLR),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2025.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
CLe4hIBuPoGhpVl7WcpdPrkOqRB4Jx17xO25OhKMzcudPtO7fyzQcLT1Hwfd0j30ICv/93MrjmYk
VkhpZR9EpEAjIIkPAj6Uz1DaF5W+ZmnNsekRAyk+3Lm7DCkEdldRunmAMklLXDYSE0BHPyNZb6/O
1fVccxPwFw6jSpxzyJ8=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ACw/whBd4sJPjEXsPWy+A9hsrulOjhl03yGnO0wIJb/8lOFB6tmCM94OcdNwiMaV6kg8YzX1Zq7/
NE2RxoRW0a7WAr7xvZPy265UGSafgRDCpO1KBNNkYutsmHT7D2OLTvT4FaHp5hZFRk+z43Ve8ygQ
YJTKyx5ivjb/80JLBvE8hnVCpYkZN6VnhMHuf1XLNa0oxWLQ2z+ODAbTE0KVd6D6DWycqrbcGtw9
RfO96KL4+hS2NraPUOWRVGCJvHh+C9oFURQ8sSL1vIHuy9U+A+C/triRYJ4Yl8X5mPDgDSLb9GaP
flIuoeMAprVt1E/Bi7vgnF6kuuRtRrRwCbGG1A==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
WhGTCsy16/t+nTOk+CGv7tpQem4v8f0JcfhtmHJKBQmUKRgMWECn1vAxv7cTlF5fBXBuNPE5ekvE
eE5xvFBz6Hn8xUu09f8xFM1K5WhbovRkMP3+0G0ookHnjX6DsYKCCqav35emaqOkBS5JhVj2EBPk
XLtGUbRCypldy9j1hdo=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
HTqbg+eKkopQi5dj/L+szqmPwRpBkCcaMjACO+UpXthtee/no4xSMcGn8abIY3SPv4TzrnuqqXPm
0AF2N3wLbDTLOGfRyerYPQtOSICnY0YK1FpPbRpt8J37qRX06v29OCgAKQCRzqcyktN979XHA61i
y9kXKs0ecYFb/aEJn+r/Ms4/zkik5QDSibn9rXgrCIaAq3oV/qy4/eOC1I7HxFJ7pQLvD6TaOwrX
4JOp3lWwPc+YVayAWfwfSM8th7MZKBhpSD1StLeBRJc4CJ5oDLwaMgHEFCXxx3pyxq8QdKSuHOu3
Wi8mjTwcR+O/8mCaI/EQL04GZntygGZa6NRnQQ==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
o91QaUL83RhelLkEm4+751/SyYIekusmli7rQ/VnKAUITjkJaEGeiMiekUqrom206GlehlLCRUuJ
Qk6ai4cQrpKj2AErAd0Y5kUpeM5RS+aWpFjtOYrSHMdr4rMfgbsw35qJ6v9hjgJLVLLd2hyabIYi
/IO+Syqy221cIW0MUUpzoOJ9CjxdiirdkOfTk4p5NvXD0hVLjTWo5izC8MmrhTohoXTCLeDPBtni
h9yjKz34xbfDJ73edDWDKZuzkcksNcD8JDufI8TXjti6zIBBimw59rFhS2J51ljYPnYfZPiVePJ5
N7uOtLgm5YB9EYVkYBImzlegfvfeWKMlMPTN2Q==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2025.1-2029.x", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
lJKy9Zjha63A0h02ApuEz30etxi10kyaT0MM37kT8C079RoQxr/jzSdPRVB6DZEoEoxq3B3ZtFpY
YjPONLB3n6tCjDMSDQ3C1I1mBthQK6OvvTRuHUxb1l9/aLvQKKbftHNrYBApn8VpMjP6CLucAxZp
+odccI1IV35j33TcUjek8yCrtxEmdzWv0t5wOEQA4WTFVG1fU6/a+jfGVGHnhJhasL7Jl0YilFPM
HWd3rJlyr2xUSar0v6pd0AVRt6yFuPoCpA/gavX0kZRv+AugezxEfo89yWvJY2XTRZkZi3hMrZuv
vLK4usOzcbsPeMWzlO01N6DMHirnppE7yicsAA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
qZguQpkzQaubvif4ozJshLhSpVr4NjQRAvIToSXk4wKAhLoTGGfhff6h7uytylGeHmy/9jn719Sv
HAjAigAvx8FgkAdQ9HshMaw6B/CLhf7qqwtfgiEb8k4WEUmEBTliot58LPV7jCEMD1VBzZWYR4K/
F/3P7X3moGjkrFh9KcmMY5GwF7k9LuqZmEI6DK0O8ZCX0hTQnQ2olSPRWHDbVMSNk21ob6q2E7m5
xpDVITSJEGo0sugVShTUXPzIS2aLKbIkU7M7Hafar7cSxwCvM01LmXbK2kk/TJ1BnxjpTLKgqxru
qHGOZsfM5HZn/M3rQKeaLTsgoxJg0TzUyDcG2Q==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
hKe8IASictRpxK+UNDyBjdExv+cunUPc6ZpI+7czTzAehV4HfB+YDHOd05j6V2WSrIfjaa5Yc1RS
G3r38XeIaYh1ZL1ZSXdIVLclvWkAD0ZTUVklwYY6ca20tDHHAciXUrro3jg9kGe8H2Gojjw+VQZC
vGGdV4/DF3pjMdpz4nyJJWNfnYLPmx19+G3AsjJsk77LkeQJ3ac7KA942yZdeDmv4Gv409a95Tsb
ybgnN5fxmPfJ1KacG4k/Zu07i7vPA7/85FRrgptHJL0ytlZgmOydqGwz345i+KR6+tR6P3ZfO0s6
zos96acnjsr2RnP6pIJ30EKJj+IMY98YqW+6wBHZ1tOwA0LCIHrVhIyGe0B5IXV4RAxNY/K/8cZ4
j/W2apPE52Pk/hvYFtfyEVf1mS/lGq/t2LznNsZMt82q93Jb8hxwC6Zd8lrmm2hfqYfOAmlZmf6O
EfYHOP1GurKAmfr07eaBzMSZGJa/fC0AncpmpYD7OL9jcP2lP5UBi+qa

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
HO+y/HjEaXV9is2kIeddm5ja325WYl9z3UGUIfNECIbhm1CsOvhNxo06AGFh3AtmMj1fkyl7FpO4
5p6qJPGuMnf7KaoL2lbPdT1FmXinUUneD7TyneDl5s/cvecL9iNEtBuembSpR8uFQlqW3j5MnIU0
UISBysTQ8EGO9RDHkRKXJVBUPunFpCoxViEHDwuLeOfZnsSUNCm1TQkVN6lCJVpqMXGrell2v+/D
+BJWT6gUeDiXDTY/zYKkdaf1QckERhcVJjNORVmQDjxTeDa6GJ1AmksSzrK2M3vTp9axAcWS5ak3
FP7Oo1kxa1CXdzBltgltp8wxugADWHbPbfb6Kw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 2112)
`pragma protect data_block
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
ntsh
`pragma protect end_protected
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2025.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
CLe4hIBuPoGhpVl7WcpdPrkOqRB4Jx17xO25OhKMzcudPtO7fyzQcLT1Hwfd0j30ICv/93MrjmYk
VkhpZR9EpEAjIIkPAj6Uz1DaF5W+ZmnNsekRAyk+3Lm7DCkEdldRunmAMklLXDYSE0BHPyNZb6/O
1fVccxPwFw6jSpxzyJ8=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ACw/whBd4sJPjEXsPWy+A9hsrulOjhl03yGnO0wIJb/8lOFB6tmCM94OcdNwiMaV6kg8YzX1Zq7/
NE2RxoRW0a7WAr7xvZPy265UGSafgRDCpO1KBNNkYutsmHT7D2OLTvT4FaHp5hZFRk+z43Ve8ygQ
YJTKyx5ivjb/80JLBvE8hnVCpYkZN6VnhMHuf1XLNa0oxWLQ2z+ODAbTE0KVd6D6DWycqrbcGtw9
RfO96KL4+hS2NraPUOWRVGCJvHh+C9oFURQ8sSL1vIHuy9U+A+C/triRYJ4Yl8X5mPDgDSLb9GaP
flIuoeMAprVt1E/Bi7vgnF6kuuRtRrRwCbGG1A==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
WhGTCsy16/t+nTOk+CGv7tpQem4v8f0JcfhtmHJKBQmUKRgMWECn1vAxv7cTlF5fBXBuNPE5ekvE
eE5xvFBz6Hn8xUu09f8xFM1K5WhbovRkMP3+0G0ookHnjX6DsYKCCqav35emaqOkBS5JhVj2EBPk
XLtGUbRCypldy9j1hdo=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
HTqbg+eKkopQi5dj/L+szqmPwRpBkCcaMjACO+UpXthtee/no4xSMcGn8abIY3SPv4TzrnuqqXPm
0AF2N3wLbDTLOGfRyerYPQtOSICnY0YK1FpPbRpt8J37qRX06v29OCgAKQCRzqcyktN979XHA61i
y9kXKs0ecYFb/aEJn+r/Ms4/zkik5QDSibn9rXgrCIaAq3oV/qy4/eOC1I7HxFJ7pQLvD6TaOwrX
4JOp3lWwPc+YVayAWfwfSM8th7MZKBhpSD1StLeBRJc4CJ5oDLwaMgHEFCXxx3pyxq8QdKSuHOu3
Wi8mjTwcR+O/8mCaI/EQL04GZntygGZa6NRnQQ==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
o91QaUL83RhelLkEm4+751/SyYIekusmli7rQ/VnKAUITjkJaEGeiMiekUqrom206GlehlLCRUuJ
Qk6ai4cQrpKj2AErAd0Y5kUpeM5RS+aWpFjtOYrSHMdr4rMfgbsw35qJ6v9hjgJLVLLd2hyabIYi
/IO+Syqy221cIW0MUUpzoOJ9CjxdiirdkOfTk4p5NvXD0hVLjTWo5izC8MmrhTohoXTCLeDPBtni
h9yjKz34xbfDJ73edDWDKZuzkcksNcD8JDufI8TXjti6zIBBimw59rFhS2J51ljYPnYfZPiVePJ5
N7uOtLgm5YB9EYVkYBImzlegfvfeWKMlMPTN2Q==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2025.1-2029.x", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
lJKy9Zjha63A0h02ApuEz30etxi10kyaT0MM37kT8C079RoQxr/jzSdPRVB6DZEoEoxq3B3ZtFpY
YjPONLB3n6tCjDMSDQ3C1I1mBthQK6OvvTRuHUxb1l9/aLvQKKbftHNrYBApn8VpMjP6CLucAxZp
+odccI1IV35j33TcUjek8yCrtxEmdzWv0t5wOEQA4WTFVG1fU6/a+jfGVGHnhJhasL7Jl0YilFPM
HWd3rJlyr2xUSar0v6pd0AVRt6yFuPoCpA/gavX0kZRv+AugezxEfo89yWvJY2XTRZkZi3hMrZuv
vLK4usOzcbsPeMWzlO01N6DMHirnppE7yicsAA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
qZguQpkzQaubvif4ozJshLhSpVr4NjQRAvIToSXk4wKAhLoTGGfhff6h7uytylGeHmy/9jn719Sv
HAjAigAvx8FgkAdQ9HshMaw6B/CLhf7qqwtfgiEb8k4WEUmEBTliot58LPV7jCEMD1VBzZWYR4K/
F/3P7X3moGjkrFh9KcmMY5GwF7k9LuqZmEI6DK0O8ZCX0hTQnQ2olSPRWHDbVMSNk21ob6q2E7m5
xpDVITSJEGo0sugVShTUXPzIS2aLKbIkU7M7Hafar7cSxwCvM01LmXbK2kk/TJ1BnxjpTLKgqxru
qHGOZsfM5HZn/M3rQKeaLTsgoxJg0TzUyDcG2Q==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
hKe8IASictRpxK+UNDyBjdExv+cunUPc6ZpI+7czTzAehV4HfB+YDHOd05j6V2WSrIfjaa5Yc1RS
G3r38XeIaYh1ZL1ZSXdIVLclvWkAD0ZTUVklwYY6ca20tDHHAciXUrro3jg9kGe8H2Gojjw+VQZC
vGGdV4/DF3pjMdpz4nyJJWNfnYLPmx19+G3AsjJsk77LkeQJ3ac7KA942yZdeDmv4Gv409a95Tsb
ybgnN5fxmPfJ1KacG4k/Zu07i7vPA7/85FRrgptHJL0ytlZgmOydqGwz345i+KR6+tR6P3ZfO0s6
zos96acnjsr2RnP6pIJ30EKJj+IMY98YqW+6wBHZ1tOwA0LCIHrVhIyGe0B5IXV4RAxNY/K/8cZ4
j/W2apPE52Pk/hvYFtfyEVf1mS/lGq/t2LznNsZMt82q93Jb8hxwC6Zd8lrmm2hfqYfOAmlZmf6O
EfYHOP1GurKAmfr07eaBzMSZGJa/fC0AncpmpYD7OL9jcP2lP5UBi+qa

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
HO+y/HjEaXV9is2kIeddm5ja325WYl9z3UGUIfNECIbhm1CsOvhNxo06AGFh3AtmMj1fkyl7FpO4
5p6qJPGuMnf7KaoL2lbPdT1FmXinUUneD7TyneDl5s/cvecL9iNEtBuembSpR8uFQlqW3j5MnIU0
UISBysTQ8EGO9RDHkRKXJVBUPunFpCoxViEHDwuLeOfZnsSUNCm1TQkVN6lCJVpqMXGrell2v+/D
+BJWT6gUeDiXDTY/zYKkdaf1QckERhcVJjNORVmQDjxTeDa6GJ1AmksSzrK2M3vTp9axAcWS5ak3
FP7Oo1kxa1CXdzBltgltp8wxugADWHbPbfb6Kw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
cuIm6nddCidVAi+NafGM4GDoCEqidOzZDl3jA6NFxJmXxsXygduHrQoSqmyC7SxtZsBFUZo3YbX4
/dhbaykrPB2rZM8PNLsRIWsxs7UFzi2GDmWwabVyT3Y4eOOLX5r6C1FB+OjQi/0PNnTzoZnjPrrz
4d0E2tXyu216MAXUeFraKqJGDG9R0APzwO5HkKffto8lsLZ8VXcZWuOAsepKcGc2HaEUnGrk1geK
fT2at1Jsx7I0iVPg5Wg9SbCZgWHehU3Wo2ZksSI5uqAY8qBpJTYy1WwaPaUK6XEnCbRqD9mTC8Xl
wqi62zXuhlroC1B0U0wLSmKxQYJexrutnX/Jtw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
eP4AK07KIN19S+/28vl5GPDy4WQXQspcjbNp+QNisYyhf+FaOJEU5HEtpjiH0sOFJvPRu7Rm+inT
V6jExyBJFmcJxxK+HMvNjjXC0it/6gSxS45j8rOtG1dV+q0Wx1mSAivprILXIRKXE/fD6kJ1ZanH
1oWwx7+yjqZJcHBDy0EPKVWqYnUYxHtnSSNygzfm67c6skMnBo1OQ2fou3rCGjwIFdGpcPidhfeH
rhzqp1z4z1IMtmbHzJEoC96Wq/FGKU/NQQUXjENwelfonukutkiv6dEN9MhtvKfAVASMCS42Bru9
uBpOO6OtntObTKthIkaN/XRmcAYLPP+sM7VgYA==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 4128)
`pragma protect data_block
AOOM+YbZjgiVsbUWSi9OAaWNr+o05FoRubaO7/D/tKm3asZ8SfGe3r+iYdLmOYlSS+w9Um3hm3eM
HMpTuPdh+e/mRJJyosea38R2t/3ZMXLvbAWd+4ZByVckMHDB1N/KUqz2TgCvX3LYbxCNLEPSVSPU
Rerpfn22ZUMfl1y3OhnFMIjosqCRhEaAisgrjsoRpF9s4Hb7JEjw90Tu0lX8665bpaR8p6wAIS/+
lpR+I6c+kTcNOAeKOfl2mBYdypY66amxbAROKmwzROPEx+uLX972d5cFM4dw95UTVQ5zc2ctrkCv
hHpNQx1uLdNMgKbyrySQWm7eYRJXDKdUDscz91caBJgJurW1NDEjPl5ucrPAJrO+DAEcnNQhwL2k
j9ATUqOVXJNrx6tue3BDRFAd8jlSM0+9Q0XAJGpNr6ay07foBtF+waFKU8+/VBgbltqeEpBXF2MR
Uzwmiw/1H9gwxnqthpq09ROIRQZ1aQCvqVS3dznMmjzWc52ALAWMK2vmXCbsXfW5m9ueQm6PK3Qw
8clJ7j7Sb6edCgneGMriEuaqguwp7Tx1HugKOi4NRMp3VC0yAIpCv7ghufYDDZIhO0fSykM9zOAN
EXJX9EH5H0fO/rAj4xn0xptgE160J2GSkSGQgEFT/L+8X+1ATLP/Yumfhn869oYYNz2oD+un3kV1
a6djGjudYe45bJ2+0GTah1uSdjo8Q4DeId7aG/fRKba06ZQJAk/ert1pOdSPJ7pkx432P2I/7YoB
HM2UgRE77Dtzuh+k/ZYkbTJsp/yynaufyYFfSgMfQR/KhjkMcxJWoA2ypzXt6H86BVNJ1zy09HFp
4Fbf1eyQWebkcuNJXnuKI6VjGh6XV3PRgd3ZcRF6t/lslz76rgXdQ+DRHWeq8955wFuREgW3+lrz
9znQ2QSRoU6eDyu8c99D8z3ciXA90oVJAwUA3VydL9PnfUmb5WDc9equGLglqU7JW90vlCSNfvTW
lcubGsUAI7FFlbUq9AAvbDmvcXZUe0EQXtGRDxGutevW0OLR08g7AUHDPLAdNGpIQTgamJbxVFFf
brZ8D04Sb6mui0WEsWCBjiAMXaw2XRrq2USkISAhSp4htA2JQOijmAjOwOT+lNhzB9jqbWBWqUD3
R44fOPxUxWA5jRMshMyj5mSbN0ogot6Gavn9yojs+CO0TvgYhHQCPBwQyUVt/n/8OVS94C5fZdRz
Eo27OsVf4XcBMTb9+UFqJytIpSK/if9nInbULp2a39gusev8lBKi4Acpl4gfFOWIY94cBEWOTVUR
AqGTz7+rsA93/CWFlGXjpPdYC/FgbEZhdHncMxACwv7tFYE0I6OCjkl8loWls2bhcd4kKDErwpu4
hI/tKhVoGiU4japdhAn2RXcesL5ChlMKbkwcAO3qpHWv72wFzdg7OL7od0oEOxJiqj8vKPl9V0p8
tT7zMVJnBT86rwf0oMkJttR2uSlO7SZQUQAbPdb3wRoZhSxiWtxHOSMdi3EjolS0y9MNpQDc6Ky6
/chvVFLgFelvtm4KnIExGktTK0iFWo0vr1nAO7pclkLZcnvqJgruuvNM3ZRJqbzQX2WQfQl+nDTS
QWYRP3M7Sg3Ekil66iGIccRHc8RETriRbrr5VcywKNynSAUb+8hn78zgg3ugTPkIyksx7N4FCWCk
INnnObZN+JpBafi44/rQCvsy2eYWZ3hcJGN/vf9+4kvBZWBdgGpNHbLU6RPAEWpB2KNFj3FftsW4
2CkLXy8iyVMBD48A9Td+JFNkCjsa4V0q3ip7LFa+XeBOD9z4JfDGMQEuKXUATOktmPgTJVVeyUEZ
K09lB6VNvky5ZMTpsGlZeSYE8Kfg2zxasEgtgoWPDv0lVGy5CHUs2vF7kt7OkEPAEUwK1L7SyEXS
SqXVT3XkLZuMT+FnipzGfqiE+Cj3/9NEYMekXAm8t7AxEA970DyIGqYCXofVEOzjpn5SeJn9KoF1
Z5P8tJkz4x1bmmdQyRxaFCFLRGSpnTild1nXSEMDtYFK1eyKi8x1L4CE173jnuCiW9wn9s3PTSuV
OH8XUzi9hIta2QlYMbsqa2JPtznjpm9DwCwzWYgYiBN6byWn+Sp7pFhd3jU12ZcD12WmgEkwZByW
pauSj7RB42Zu59uMeLtxbkW5kLOSGslk1RUElb8EcNgZaMzRUHvseQ2wRQbAKhEHFCDGPpSt7L8m
cka44Qyug4uJOSYUfq6HCz6ypL0x+URw6cWgpssG+RkdLKO9IJ6Yt/tAJPRCODRhCXFaZc3uE8Uv
HSha98in7xlta8cJcCS6y2ObsvHGH4qeFslPnPCoGM0WRPWV23ycSkFTR+S8BH8a+milPZGgNBUm
Cte8Yxf+qJN8bCpb/KBGvt6oMMoleLl96rkAdXsuUQG7rzuGZBjvl0Hog/2FXqCXElP6+1s/9yU2
LGOLOmBR2uzMVHOVDGO8avY8ZQ1otnKPgAvr5HmhsrgNvNIlqSd6NhhLjZK6oGhlHoJYNnl4laYs
nGhVDddRtMEU2RtZTTJ0Dn8gh8hvoIM4g0F50SkjNAOYwSoIL3qkzv8K9e/bY6eTHhXsB10rUB+D
gy5NNTJKFGpgaZ0JFu59J1GugUveulAL5/vK9XCS6rz70XWvgT60Z49Mp9EqmvVgq1ujKE+3gTPd
1BJqTUQ9r5YrzUbLkn7Ptf+xGsqyWTZDqwW/hjgbDBb9gpUejnJGHsMHfMoI8yIigyXJkjLoNhEQ
RCwGs7bBd1Zntt92SLSBbhvSXEU1xprjK87KGphrIGKwDPMEyhd/Qov+UZJOuzut5xn7lRFJ5D73
+RNdRh6Zfk8SdX41cJ276BrSVzw1g8y+/4ccjgBqk0fNWPlYrRWdc7tpnUpxqu96CWWhzfKV47rm
u7qrkGUu+cP65steOaQVUVqVe1HbuYo27blFyxY5xbl2RttszBORLPIuc4lLVL0FLlTPsdLWErul
JAqkrnpQ9AyZtzfEkTONga5T7k3HWJWZsruAfNxJm2YeKKOJIgWlTYM0k1n+t2gAvNdWikSxAKgH
1m2i9AK95LwKyFPFOpqNlCraWExryHe0h3jhki5K3oSrQE+lohkrkAIB8RGtLch2VSSMW++HHWuA
VQqMj83LL2bw5n1/AW0tF8XbqiX/lYf88QfDlpuZVfKzwx4myRsqus2xufntLtj+OJfalOf1eiLM
fqqcHEMidzQRhVf7a4/t8XLz06j6Ifg3A1S2okEj3N8uTIt3IB5gMgV5Kpzi6wZ0Is4oBJvsdz9+
z38fWpZfhPzYLTjPb8E9eST0QJdL7FDXYCVUgPaTgZ44BNQDkQ+XzpQdwcH3JJvbitC90rXyINq6
YHM4DaPx06udvwoExK6tarKas3FtbAyokFreHCsgramtsChax+bTwfuipbMMTDj/u7V7S8VW7VTq
XBQfyLNByuBOKXjyTMMd9CK4UyfhH/ypTIMfPI3voonZoHtax8bQYasCT3hJCgorzyMfqczjQeNp
F6f1syVGgP5vNGZNtqBOy44l2aND9B+Sc+U0DQiiycVPmcoI6s5nh3LwQRXKGjOcF/dxaKi669l7
KbyaUOPNLohMQcx/Nbt5/jRqbwp9IFmcO1SmJQ8NwAqk7Nij2f3GPwcSBETMSINFexXOeHuSsF4q
7K7RwSbaxPsCu5sJMzWcsABTHcaAt45R2DUp4hXk1aHbq3Z8sUOEOCp8IVvqQKO6PS3UcOUJsF2w
K3rJ7/dfMsXoRhRFrYoeESS1a2e039A4pMGNrN5lYwcBoJ4FCaGhIyJNyVumh6SX97SyR92sLz9q
3pp1K7cXhPgkNG7Y+/P7yruVVvjckBXTF0Z6A9lAPZG7DKnhtY4l0izquBhpU9kqxpaws5mUK1gN
+H7/a7/CMkCECRAk83PJmE/2ntKxweW7TVvcD7yNFYDzRlmxAIOwm0JZn6IcrFSVh9M4WPvZ4Wvu
W2q7JhQugrUyIDL+ygycLnUXZFM3a0xDHr6m1aDCtw8mVI1YXv0uYdFdAxZ6i5Pxb56CrTfrYGpn
pIHmiPegyye+pNrHpoL8fswruNIWm97aKJ9xh7VMAfpn8EoEPs9mF38H6gE61oEEpQuE3Lq+mMis
jNQSk++ksi0G7clBSt9ab96DzdVVfRWlWmxgQSD6cji6f+pbkhbTCnGfh4oux8X9aJPfKklCjyWN
05NdtbLfljO8OFMdcBrFQXZRwYQWJeFChZ41uevuS2ZEzPAYc16D6fgjwtARgvZM+LkpBYwRwuyl
tah7A1hex4tjoLAHf3jr+Oq1RUUyd7MzzQ0rNlJOImTuRXAKtHje2WDbHqQR2AnbjVNb0lIe+jKX
uWv2wM0T2FLVFxc7dUt/Vzf56DhwvWZJ5oeZye2JsZewSPXKjw17BuS/bMuHSqqu/OmOdz3+5mtH
SXiJmsRmQBGRP8ZUifNLXW+AjT7YRKBLt5Tyc4/KOj7/43CJwLF0fMXat2jNQSagcXHYvhosd03+
oql0DV+C+A+z2hQIEDh/3pVQSSpRCRxiZppINOeBhMhr7PCirdPWge12uzNcXNGpnmOxnmlrJ/UZ
jzZKPUrPGaC+r0hcXEL3zUY4zIJ7o9mIeaBOCf/Nj84ah6zpIJNtuSReNyPgyc001+i6JRMagSYs
DzTCHfnYz+Oby9JH4LM1UVJANXvMUfHdZbB8QQ1FNr4p6UQly7t/pELUx5mm1/JN6JrHL2pRU95B
OtS6fvN6isxsvQn9l5I61Oz2/1WZgo76sdW5k9tFQBDz1h3E9LFgwFLgA5jsp5IFfnR4RtF9lyot
MKyeYImlYo0GemcyxSSZWLm0bUbgzhnDfMhmByreKw61G1UO9BCTQqozkxY6BvuVrnp7WOq4+sXA
+lxy8lwr8hMNrYkuB0TsgaLuVv1xiKf2mMenG9ut++wEvL/OleBqpCUKwajKtmNA2qHreTcF1N6l
Y0u2aOiIRiWyE5NT8/Gl9K0NFMa+gHBBmYgsNbx7iphQ4kNJ/Q9qOlLLDvJVo2yvdFb0WvFzbfS0
FCbTkX+6SNBfb5SwkwaOyshHIWDZAaaRHDH1sRxcVkdlL+w5XyResNzXR4XugKqKgk+OBpgAMUTh
HSmgPVnPSE+6XCDrfNRcSkrdN53W6xPadiaRxd6AhqSKz5cKn9SEQ3Vu+dgXEBJ3zPw+e4Vg/EWo
J0fRcU14gUH0uXsTMw9GUjobALfY8+Q/DbfuUB2dFGthjWK97zHysLj1BnfJccypTz0K1bhYNJlw
hGEOVa2CfYW408E0xQrpDrOIZ1P9pL+iMzzXZNmgqUVoXlzqL61IPCnEsZGXJFkj/Fca4OwBKGBZ
sfEqIlg8Q1KAFt9A9c8bqY2gYlhSQuiHdvT7kKRz4YV291jd9AAyG1kMpBT6aooZboRT3GEOH2va
I+iykD2KuXTnYzUdDUqN5cCBge70lW2B+Nj7mPVlvMBrT7RmPCGXqY1jBeztZPAm/Vqibx8AvDS/
IgLuvGLm46NowHe1EOiG/ETf6Ay3sYy6
`pragma protect end_protected
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2025.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
kHy+Y47DINMZBhGNJbO0iBu5fVXE7Bat9jgQLXk3ApvDPiebCpuM+E5t4isjIrxk2pED5TFqGGjD
mw0Zl0QfJTPovzyVpseGM40QVknZr+EDIrYMj7MVpgkj2ATuN1iy+Nvz6YtW2/re2ZVUKd6KZ9d8
ZtkYbqnhbmtJvfKBuWs=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
oLBB7WjlXxTNC/15uVtlqQWkjFXnw2HhPVZvddpi3xRaQMsDccDqLfppjYQKjAIcwmx7UL8nX9jY
IuK3hz1RJf4dbfla93PDLCBX0aBk1An/KOdlF5Y2TESp6lKREaIJfFXCI97OHpK8TjQwYuZoQV99
GsFHmrMDivoRCnKLjoigNPr7kEh5GqRxEv0UVBK8WHXxTGiQ1CyZlbP20JQAlu+UoIyMH8ApnVoz
DVwsg03AShhecQZUG5iRxEWHDVHs5fb3KKizCDD3/EfafrHbHtMnAqPgH2nN1s+BFXtP7TF5/hFD
qU1Ymhv29UtMA60XTB8yHMh1NgXgIXuHufwL5w==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
GEDYfV71I6d6lkWSPwWnwRMFU08ya6DZkuVnXtOutPMhJChntd1/vc9kECfYi2KBvIBB0KY9mK0F
VVb7ncucTInd+CA0EOHy4byn8cmzcH5ZZ51CtQ7HTAaQB3qezzk7OVsf32GI4pmISA9nMv9Ei1/N
Op2zFMirBwUmtO4zOXE=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
J2XHxL/aNfHVxeXSGgWDhegnTdxNShyVq/iRBtxw3hm6pL7DKSyIHRbUPprtmrPtX2nXp7yTakn4
BCxiPJBw+X46vD4bsAXhGnCruqz3KEdSiN4+FDm7mJv/I4sWq5OTTfqlwQUek+Anzt6HVF6ckXBb
y5MccqJ5DVzQqWOzY2wwG5+TlfQNx2e2JM2deG7oLmYp3DELNQ3RryYN7nuBCCnWwHc4KWsc1906
UzkhU7SsF8ytKjcYN6AMxPy4bVVCvUiWR5YFpfw5l2kiBh49qYby9jxAoxBMwFYMC+ccRsEQ03lu
UnQcBduhh6L/VMKwKw2qCM0TCvJIkVGHPHR/kQ==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
fS9WCZa9K50yTZTU6ExyBapRGcZ0+zmberI1FYlt/fgkAL7pNM2/Go4tFAaupyQPgNn22v1mgjJV
CPKy62gJu1efpHSSdAwUcDPojjg0YkFXp3DDReKmcBNxpzbRGtVTTm3IZMDr4EHOUe3Pb6CAGNJR
cxo5je2OB9ZUaCESQRtOrpc2zfvgYffOqApZFokARfrSLkRUC2IzACR2WgKQWmzUqVvOm9XmZTDj
H5i/etuHde70aAvE6YUXgdGXnFJ9FR6gXZNdzlVhVyMBiNZwuSATaqZsVrgubBVUpP1gxrNpwGkV
GDFWHKcVdIUHe7BMy9IM1ng0XMymvhkVELF9sQ==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2025.1-2029.x", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ml7FaGUhDI/BqFBOFzOS6wgTc7xx7F6mWr1x5/CWragDKjkxHDbnJVKM/Ydf+IB8pSXvXZklVaaQ
q3kxNA17gYDRWk0FmI9tWH1fiRNGiBXnKQeYpM4HfEbT8NB1//lJha92YwoKmWh6Y3RWx8JhIsCi
+4X1I54kJ4D1xB6KFvJ4D7xycdimb/o66RhypZ+WMbYahY0/xydPHW3mk0zh6mZ83yM8L9Xjdkjw
bWtG1WslwgKBzlBrfiHcncf9zMmfvnveJVr+Wv/kBYvy5NGpgqdBdiawQtfUbHJwzBdFK3wxNG2E
xmHQ5xv7aQ2Nyw8nNkxkT3m4vU2C7TZ6qRyjjw==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ELO0ctDLZ0o98clSrqFoG1nFfVGMDJ3FREqOInAEP7ODoIivkTOcRLPCHmSCxeiAf7B+QgXjJuuM
faX6xG5bccwKm9a1pAchSX/uUHgdUeHJH44Zn9Jg/JAyEnq1vpmj2oL0Lq62HcqcBfAhAtbBs8zy
QAVQOl3nJXmk0xYVtXsUEVed9dGAdJum3ysmH7s+YgmKrTgSDPOba4CHeu3h5QcqsTya2jV96rE4
+o1LyVig1eweAr5FlV8aexfmhQgkqeR7uPVfMuYq//zp59F6b9AaRLxJ1fO2iM6NiIj7BXr4wPRO
64PoDvI9VzJkyQbbwBqs8gF6eFpQyW9mHrw4pA==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
cPihq6JpepZTejaIN4Cird0q6KMxN96pxR9FpKYeg77sMgppvqi2iMYVMGL4QqW4xYjHhFWOX4rv
IcfbuSEQOaeIEA208PxDDa1RrQyIuFjq56SwtmTZK9c3jNBQYqnHSki2OQ1DXTLL3VUtIyi7kVHO
AlekEP8VaWmKQ0s5ywnst0V+b2iNwQMnin0oFY+z51vVg+olzOxEUJlxFWO7QTtdIZS7PuTvSv2O
p4WLhDmEheW7uPlh4H3VzvQJPqPTEqDArPU9t3nSIpdxBq/ZNx5QDqSPD0gbFIQCdmsKjJwKXAd7
jvlB25+m2TdkZMAIbYyoBJzKF4Wm11Ahde2iMp1E6f5A+bzSZN89umBbvS525wGBpzFKJRyHYK/R
IbuMOP0NVM4mM2csrfERqG2lyTkxs0p5RaUmguXT1XzhSIk0On8TtbcxkmQOgaaNImM0+WEqo0vs
YAwh+bb7iNwtJdtYXjYn50wyodKtl2I3s4B8pQY0EsYsaISHiC5y6P4R

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
m3x5WuABRT/NmnZ2viwwkr3V40yMnUOKtg3OI3r9/YQ2HTRCvD1ljzo0Wv9JF3DUSG1QgzT98R3c
tg0essbW899h1QMI/ytrpWA3AFGmKKUjHm6wP8MFp9hPjb8niaVAagToGm8M+GJ/IriyvIIH/HQf
59wnTZsXfG+YoX8UoH0ypVGELCGHEbVHj5QA8scWWDSxt80Wql6+brc90u6QtjoX0seTGtx3VM6K
7J5amowIujwCVkTO5jEhVWcBAtO44GJdkBzoAcVokIXoJp367RP3sN0NIyXCNe1g7gUI5oMeTNX8
s5diylN/nTYboy5B4LStwAHIWtMExnjNY/hFnw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
TfOoUYxi/XxlfrXW2akpmf1EH4g8XYaU6GynvHek7xPy8RiV4aGIQ773tGHMP65O3RYycKUlYXg1
Fa6/SN0yKIYNEKhYBJmbFHbMU4SpIxnaZWTZa9mBF62WaybG3U6dlRlh2Gfkuidp/zLYfAynknof
Ngj0UTBnzoWW3JLbT3XT0eYY5/pnJJq/m08boxB3bC+F44Q8XvOR1Hi1tpKOF3jm54pQ28KXvjK+
SZWdX84vYwetgrpQBbxEUIfmy4nISyWwSwtMIRIcWgJMUY0R11HDkKc68vUcIxiO9s343ArSdXjQ
tyyEkkeeLuytSyMNC7TG95B18++RFYqo7YIM7g==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
gelvD9OuDLeuKDiEVGVyMb6/8XPutjmyrxdteHV3WsIUSh54NoD2y/q2HQkLEGlRnp4Gqw4DoKN7
pjf9IdBLYZHDR8ZEE+wORlm8apGgDlupWV+qNlgrco4rnUXT0AXX8dJpPxkRZUpZRE0IzoHgWAyc
+Cp/MBX+UQJZSf8+QSZ7xA4ZoON0HofM1Cy6Yjt8nrZD0Bn/J2YutQiu4B+liv/48wr+DWB8puBN
8YPrIGY67jvbXPyWMclsTHeXpRIFVffd/xBKmLCyb5M6xvLsoyXxCcWBu2ZfCuzRF5mJdN5jabiv
j42PmKBoWi6SNs3QQp0KWw01Ost4beeWb1T0NA==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 752)
`pragma protect data_block
UUC4/7rkP6uS0k1cKFCMnZ5K2heQ6d16z4hinjeR63/3jMWku1fUS7U5IKgnrH8EK9RxD+TZKNny
Hoth0XGFJEGKmqZwrauVt1T4KKNK1kP8EVLhy5H4ZFHugLQqLoC4AKvXea0OdvXwSer4I/YszNNq
+oh1m1uIA8J+Og80IWIgEqfOY8Ldu1wML0zvPMlxNOcBVg+9bO4na+t4jYYehcEAQFad24q2ZD1h
6ZR9AaCQNv50ghE4DPAK+OX72sJalBZ5OBqEPho+vMJC/Rg1HqLOKMAc5grZBLUPXE3VYx5d1KPp
/O6aPytpkBBknXj8S/vJ2DIg+97AXdUpR/VQUoiFVmAsJdK0hj8iRxQ8TwBgqx+tLvnqTD9eDDgf
gi3iT35AbQvIyn/PutQwEZL4yXGlR7Z06WRx5HK36jXC6MDbI8fUKfqXVe5GRhI+fJSAuYP4dJIb
J8l62vP3BFx0nKErdQTXP63Dlt+1KB2rS23enBvFOjUGwSJFWimFVsBxQ3VktZWiOaRLeqdMN7Np
W1bZPRYD++8fb8ToWzC1eRQ4lx4RiL7uBSHNS6bIHE81HC0YGHrL+YVfGF+oIA72AeN7/HV1f/J9
Vnw9c47eF5k5wdB4r0mTpB+gRgt31ZWYc8WJ5otukUAjO+pohISksG2Io0G+h4jm7K8vSYFPGx12
jJyZsjxpY/7mv4EmIWNkQYUp+254MejoC41B2QIi1TsdxvHA7c02SS1nxT9lmLOBu0ei5Aqz6YIH
+qedaoZizCurIMXWo9PDyYS2ZrY9gJ2VMRMPkDX+q6In9+hHbzxx6tF4jMXsK5aW3yXLVsPQ0jvR
UazzB+Ld9NzwEZX3cVnguE65I4QknBO48HUnNx+0Wj9N7UOtEarbg+rie4nWcM9U1ZHrwckoHqH1
EODa4uxjPXlzcQZ6AyLfzVYOT9q7jTz//nQhYE7/XISvGtlAg3XesMz5ss2zYWQUHYkDccpSse4B
I3Yi3GtuuY24zmU=
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
