// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
// Date        : Mon Jun  1 22:29:01 2026
// Host        : archlinux running 64-bit unknown
// Command     : write_verilog -force -mode funcsim -rename_top bd_5d9f_0_c_shift_ram_0_0 -prefix
//               bd_5d9f_0_c_shift_ram_0_0_ bd_5d9f_0_c_shift_ram_0_0_sim_netlist.v
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 2080)
`pragma protect data_block
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
J3mGKardBSwWkFQMp1pDLaROAWz4JStJ4NzVSw==
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
piERG1ffjt801V5ZaHxl/6oXebhedtKUccbxXsMYWR6bSruBVYcfif5gz5/XLlX8nnVdWn2IWRTh
ogAW6HwXx738ymJVBa18vFTkb4gaSYaw7/q7HPegQ5mw1ctfukuDVKNNEpYLSDiCb1mUGBsykyMZ
Grp/cSrdKobI/x3xg03kyXgKoNeWbWSS0A8dZWYVwxR5YVfGRWdkvUxDnOSSeiZZeFWadGyRhQc8
67CWhyKiuTfTN5ejJVT/pum9eQG2tsnQvHPbmsMrieGJlpqigGN+e0Efsnl9omMJ/ti+dIGG9w14
2E6HJEzodJnM5LsmDFAWJDB9KdCu15phcWWVrw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
CV5AnuMMocCkuvmy2HLGShNKBJJNmqiGtSZI3CYxmTndd20M9x9RoUK4mlARvpYXWQdsn4oUgAV+
HfmTjb9qPsH+N0i9HuuA91QMjbPBqF9Y42MevIsIuskwvKBFKemHiKVJKr0mHTbQr6qs1GP+bt7z
+A20+26PMLaO8l0Y2YtC90OgsKxNYa/82dgV1+Yn5ZvoftZyRAJlyPie633ymBeh5pN8mvFEJP0R
peR55eX2qsh5yjqwz9w7hoye9iEycu2eI2++zZQzRjXDNvqqOOnsFLXonmFR7vmhZKFJ+ksJ7ZXK
v2yYrOXpNHs23aILx++Mx2CYdszZbJwqp3ZLxA==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 4032)
`pragma protect data_block
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
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 704)
`pragma protect data_block
rlddwC2f5nkrWG9IAsd07VrCp4fX6B4qDvKsVRo50jHxmiSIUMLJ8wSa+btdcMzMIixtmr05BeLf
SK9qDisAhl11iYM1wR7pDWMWcF5t4n9NLeiUwzA1Hfk5/0/1RPpy9fYsWYnGOKPEnlAJ9XY7+hqh
Boy/kAxzTHjHqDK4SCDShvwnSjX46N5gDzH7Ft1gmkrOlM5UJy4L7ATtH/Wg/zKeQgB5jjTYOonl
gLigdbynxAM4Wr1j1iPSsfccvA6mM5LG3jW/e+XAOT3lY83Nb01wZA3hwfM87Nslqv6OQhBjZ00g
UK0uBbxkgBIHsG/1L8X1+x1Q0pUY6Sit/FoOOm7n24prDCMjiISWWlu0cBvGbxaUpZoud2yav/6q
LnHKpFUfDJVGJghBIHyPfOYjSHzoC6IH4E1YiZsOM1jnt6cWxPCp8W6u9YlQg2w3yrOhX/W2N2ya
rgLeg7gwYCmqHj0HeaTBLUgq1/1T/8MVNKQgU/FKbiqEAzi2AEGkcaGEVuvqrtd7YZ6yjuaDb9xt
cn16EwtI9RLYy49RKY9kzXsx3u/1hlRietPwpLpf2Mdq6LznrxZC47pFb6xkoqUeY2Uk/xzsSw77
Pqzl0lgipfDIpCeZDpjinCgYDf5gKsBjul2wB8Z8FRsCXO9PnYQ0W17/9x+7f25XyDV9CKkU32Yx
KJvnOmOhBsZKH8xq06N67sj8mZPzvCBGx5Q1GhPkZnqsOLQCnp1c5j+7OgNH8JSrqurDI73+IjSv
lNA692sGs1pr0V+JcXJcojAcB9VvL8P1PpiEW126Gjd8wmbNSgr0AAu6B5PHgE4/Ykf5vRRHqTxx
AuAZ73VBRXiplshsWMAtNiglEtuqTgAMsd0fi5rgW979GmCJ46MsHWJlPgAU0TyLMEFwFowlyK/F
VIop6kVjSiysWGcykg6YGsubX1w=
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
