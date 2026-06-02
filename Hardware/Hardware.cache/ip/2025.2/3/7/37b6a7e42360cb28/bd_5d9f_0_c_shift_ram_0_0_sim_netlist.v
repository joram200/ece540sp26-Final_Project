// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
// Date        : Mon Jun  1 22:29:01 2026
// Host        : archlinux running 64-bit unknown
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ bd_5d9f_0_c_shift_ram_0_0_sim_netlist.v
// Design      : bd_5d9f_0_c_shift_ram_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "bd_5d9f_0_c_shift_ram_0_0,c_shift_ram_v12_0_20,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_shift_ram_v12_0_20,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_shift_ram_v12_0_20 U0
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
wVkl
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 4096)
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 720)
`pragma protect data_block
1/LW+DXULubpv3wIjC3GSCCunYVCBwTdAROCrSx/gW4/K+DDCL1NSZoMAPhbuUtbKDNBn5FzekcP
HBa298cQEXLxWWa/QvEUsAuW2y525oN/jpTiJPws1jkuUcj6Br7MMsQGAEHqr0UiGzyzvTsQCC8v
tblk0EeUYjG4T/eaxm/ZPy6OvqjD27K4j8vOYG5vJMp5ceFg6nfF8bY3mBzj3RiwGn5MlRXFWl/S
zd/++wCE/siD4bAMRJNc8RPLZaJsGV4PEzZzAKW3siKqEWbOqA8cfhtJfVXQMoJot9mgzSOct8/9
/XIxpxw9lj7KOx4MBwGNQRn6+UqUTj8nHgxKi6qfa2f6z5Vd03+z+jqW7ZPaFxZNrGlr1BrweQK1
e9tjaO9zRMGkcZfpPaAo2yagbazfGHlPY+qY+EVGG1ZLxk40O7QcmYnhfXqUMXH5zjKOH1qeVhUU
jAlkHKhmjxjVTSeq1/Sfl8Z1053rZCIkUz6p9t5RZCNYFlJAfCpduSrW77Dq+pwzBLWdGzuXMBXp
LOgSJfbLXxryKMkWPoQKvlOPJbxavpQlB7N/Eu+Q7MItdBkTVqvxh7gPcTGtDf2DVHEKBpqBiXu+
nh9E3RMKuPZihozOH6NedNvAVADJdIpFnvnMNOV1F1+dvqqtWMiV2i288ju1r7DZeemV+7ihE/Qj
aIzKesnYVcYQZhDXxbk+QhQaP3bBt+YuWq3zAHHwfR7OccxGbGOGB4296aCt/zL1dYqqJ6YMKxrV
BQlyUSkg6vqBsyPTDFwSvUOHeiLwZS2lxBWMU2LOc2BVnw2XUqIZp5hO3lBi4CQVeENKpAMWfQkI
swf8Y0G0TlRQeiVAXszLixTRVvq3JBgsA+xi/9kyBaPLI7ks1H+ENU2IL79m3DZ7OqOXsjE1kfYP
o0WNns6aYUEG3HbZHBqpp0tv2ab+Z/dO9YL1h2Tt3KZ/gCqS
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
