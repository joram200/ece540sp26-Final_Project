// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
// Date        : Mon Jun  1 22:29:02 2026
// Host        : archlinux running 64-bit unknown
// Command     : write_verilog -force -mode funcsim
//               /run/media/sackb/Windows-SSD/Users/sackb/OneDrive/Desktop/University/Course_Work/2025-2026/Spring_2026/ECE_540/ece540sp26-Final_Project/Hardware/Hardware.gen/sources_1/ip/axi_ethernet_0/bd_0/ip/ip_3/bd_5d9f_0_c_counter_binary_0_0_sim_netlist.v
// Design      : bd_5d9f_0_c_counter_binary_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "bd_5d9f_0_c_counter_binary_0_0,c_counter_binary_v12_0_22,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_counter_binary_v12_0_22,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module bd_5d9f_0_c_counter_binary_0_0
   (CLK,
    SCLR,
    THRESH0,
    Q);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_mode = "slave clk_intf" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF q_intf:thresh0_intf:l_intf:load_intf:up_intf:sinit_intf:sset_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN bd_5d9f_0_s_axi_lite_clk, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) (* x_interface_mode = "slave sclr_intf" *) (* x_interface_parameter = "XIL_INTERFACENAME sclr_intf, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input SCLR;
  (* x_interface_info = "xilinx.com:signal:data:1.0 thresh0_intf DATA" *) (* x_interface_mode = "master thresh0_intf" *) (* x_interface_parameter = "XIL_INTERFACENAME thresh0_intf, LAYERED_METADATA undef" *) output THRESH0;
  (* x_interface_info = "xilinx.com:signal:data:1.0 q_intf DATA" *) (* x_interface_mode = "master q_intf" *) (* x_interface_parameter = "XIL_INTERFACENAME q_intf, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value data} bitwidth {attribs {resolve_type generated dependency bitwidth format long minimum {} maximum {}} value 24} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type immediate dependency {} format bool minimum {} maximum {}} value false}}}} DATA_WIDTH 24}" *) output [23:0]Q;

  wire CLK;
  wire [23:0]Q;
  wire SCLR;
  wire THRESH0;

  (* C_AINIT_VAL = "0" *) 
  (* C_CE_OVERRIDES_SYNC = "0" *) 
  (* C_FB_LATENCY = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "1" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_WIDTH = "24" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* c_count_by = "1" *) 
  (* c_count_mode = "0" *) 
  (* c_count_to = "1100000000000000000000" *) 
  (* c_has_load = "0" *) 
  (* c_has_thresh0 = "1" *) 
  (* c_latency = "1" *) 
  (* c_load_low = "0" *) 
  (* c_restrict_count = "1" *) 
  (* c_thresh0_value = "1100000000000000000000" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  bd_5d9f_0_c_counter_binary_0_0_c_counter_binary_v12_0_22 U0
       (.CE(1'b1),
        .CLK(CLK),
        .L({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .LOAD(1'b0),
        .Q(Q),
        .SCLR(SCLR),
        .SINIT(1'b0),
        .SSET(1'b0),
        .THRESH0(THRESH0),
        .UP(1'b1));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2025.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
RBTstJ7XWxZjQjwGcU/JJ2RAGa5J326RJh7NxA5qgBfK8BeXJA8bc+WOsvdknG8/riv7QAgHCnpv
7p09aXC2G7icYav/fCTOhzyvJZ1HWj3IGddakdkXukJqFtmZGxR24k14s0BkSIPogeAfNyaHKePA
r2D3JzayR7arvFzOmjk=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Y7nsQqW9jRG/Ue1k55uCDPMbrsfZ0FDCdbInxNxFZ2qJhs0eVmjuSFiOrx2L8Ppd1Db4WerjLrUL
/iwyDc1UXIidgvRE/MKTHWyywfLOtUV7mBiFvKnSmjLLV1JI+wvvHfZpT1pG4dVKUQ4JjjooL8+F
CtCw2W5CaNK7GJ49445TfQInznm91k9rGaSiMBkfiqF9GF7491ShVSMjntMj9WpVpaD7px52cIFj
sE/ncmfiBaB1LClBL7mcG84IZvgyIuYO6x8rHP3ynVAhTZ6V1tQLQaoBvhLd+AMSR4lfmJfE4Wdp
DNJ9mvI4vGVFl6t0vVkac37JxdYKkcgnygEJTQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
Vd8aib4ocNr7cl0xSwF63dKh44QCVdZr3BSRdYiod7MHgBmVMG71W6L0XJAsunnj8RlqylbNzuzj
MnpBkN+GopNfpF5qqgMfv0RCnuqnpb0Odat04JqFpXqHs7MChKYMiCgwfIO3d1tXgJeYa84KjG1V
nNjxsnrBYlaAkUVii78=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ANlFU/8fd6EknBXiroECf69h9cF5DTbM3V1TQV1mxRmxWYsbe6eoUF55OsWlmj93ySuMZIDEcLOq
s2KHP7T40A9qfJf77P3L9AR62AKFt/6JujXquNDMl6Cw+lgNmvhsBpbirEZKiy1Wi8rT30Hf70pD
Y9SVh6Q9QVKaquH0ETustnEPFSJaWFMn4D39aBjMBuzxNaw5lwIOSJYxOdqrtO8ehAapdUn+gGqd
6pSgPXxyi4lk/YYp53LMJ10LiHON9fzzWGz5TQ3N56E97Fdt7OB1EZuuoFhd31YidRNfkHiFy5nf
4w4lIxGVIqjotV6EgFmhPIi6uEjbl7+qYUKzEg==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ipVsCss9z/m2osfru3/H0vmygcHYzfd+o8Hf1Vkzz5dVaO0libemiiZALSdKT4ZlW9JmexafIicl
tQIBcuQGIHD6EORT/Hs5f8qV/JzKcmVLfmbp1a4DVOIw9LiHeBYn4FC2kcqugvDUNUW8OoTNkZgu
zIcasKPrreubU9tLrEhh8JnV2i3DZmzs5dh24yg16MjNncMHbIzzCLRoej1uVksKuKxVeiBbcbMy
zvnpJ0BBQiwmjhC3ch9ILVRQTUrYXM5ph034H15Gr7xaP2iviEdkouYSLjml/MLVu5dn4W6CHVT4
xU8aushvCJ7tFbhTk8Z3+eISN41ItvUteAMW8g==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2025.1-2029.x", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
djPXjFANy4PV94UZvyALTuKASFkkNI1pN6NVy51W/G82pM+x0GE8eHMmIrvM+QEzW2TFMYB9Dg41
huQCivdNy19rhr7IQkJ8EdT26yJpp1/JQLMOxuV0ExLvzBc5+KgkcGGnQHi8OzkrJxSJ8s+aduIE
cqPETnCWwCwpg9jrMXHQfdG1lechwExg7q/FBeCc2aa3y95y2vb9NQgV/S1XyeZi0vb5x3YqTJCy
amDeqrtKyCjYbo3/uu8WudcY3tF7mVk+Q4Eyy7At1JSFNQ46szdIOgZnfdZIufGJdYSzRVjFIEnQ
Gni0uUxQpiaXucXBzTBQ+OwZpl4F5JKHKj8VZg==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
WH7GziurDhUnenCg89cHfpFX8Jcxd+rWEPO/1/FCZItpiQ8gdJL3VcY/hPTS6f0nJGwGh//ljWC7
e7JYozerXnZ3/SeL2g4dDdO1PbsNpFp3vIW3Rt60muxtkcGMrQA/W45g/heHztPuq1KBOlfwqwlj
mohwFcuFV3TsYcRpFIVN8WXH6alITwAX/alkf00l0AEdabMBUPPONAXgmGglvePrQE2cti2F/iDZ
uZghRKFiJILy1zf3NAaLFoSd677m9NlDe9t3nJnPFn7upedW4dLIe6dywS2NQuX9mi8ew68urtQL
w6hOX8cGzZGP9BBsxhrUNnPSyFNy6aGKh5pv8Q==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
FVDqjRs9iZJWCTbX/pW565JM41qoQ9wn6l4s51L4T/zQsIvUAEHqYYYGnmJf81hCdQ5953xq0HUh
gatOmd3EyfPKFvHnwyCdW+QGbtigkSc2O3f44PTpzp09VRfEVhLIa/3FcMyPwD+3ZzUvMG+Mrlgc
zUuTtOYF0U7vmi29KLJfxO9Qg/7jqbxYadj3CDFpavYFVUuSERgj84+IyX4TMa9HK4V74vfrTcse
N3Cx2hGPpvvb6W/twbYkFK0aeikVT1JRA35izGFjcLMdKy+eQBVSR49wimCcDbe82riHRhodFTM9
lk7RvCbCktXU+8hjpjZWPIzByBLeqLVtdkRgl3iQb+kmmCiJGjc/ipHfQV1dcbvwoJQzj12ohrn4
9sInz+dNnCAMUK2VZuDkjhJl3iyocscyfkIKicZDeJKxBHAHoqZsi3DXVYXtbv7JthD6XHUFGSaI
0S1NxYGwGEdXpbJlkLxcDtk1gJx3k8xXtoDCBjXt5tjSRtgWV/qkyPmp

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
W/9CoopYBhSc0VJur0ZkfBasc7PqUWj5h8OyxAFdhG5S8p1/zIOPtqnzupthgCFiVZZ0mJ6mPo08
yhAbUShntZWeFNPStaIbB/9xlXn6xWhK2UUxhS3DxpZAG0Ur1jiL1ctxoPYKx46vTRYBHZSzF71Z
IN++zvuC6j27ccU3SyvPIAqC95gfw49eeGimTtEDh5m/BnVTyQ3ydd2vfZFiIp+JTfWKczg9fPdZ
bUsWHRk74SAICMg3xqzHioz2b3MIXFd5ApTUXLdBos3DXu5wCiXrmvtJbXqdZx3Xgv0KgkMmCRjp
FXi6pKifZjNO0Zu1c4IPP/dxTRxZ3i4zDrPTQg==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
VmFr7ml3aTDhuAUltvySdW+AOvXGZwGrAOwSAPiLsY2Wh+hbNXyuPlrq5yQ+4h3D3gnwkOGNEzpI
05pupfvWO5lLJdKGPQykorw/xi0avCiH51IpHLJtCnSOc1qE6161TBs+UHMUL7IOrG+uxrMJ6lG3
AxXRxUBg/1PqlpVi3idXIkWY4j12WJJjVbChhv7SCjE+SSaoW/d1WQlf4s79WBmb0WL1Pw13Hqzd
eh136M++u8fBcz8//+cChjMfpBQ/TeiE1TWXM+tPgHJyl2JNV/c3yk7D+VTIbAzNLltbCULCVLYr
WFMn8JvedBVGocxoIukg9s+anFuOys0zFzxXhg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
gpRm1tF66XoNeGB3TB7tL9wN0Vpiv9KAdNjce+TzohDQBpJvwplFymIlVItkzxz3LZwolSChxnL/
YDix+hT2tSVPv1Mz0BeURiCcCfix6dCwyezkEtLLdCFXKohjTJNWqnT8rSPBUUygK4udh/Wscf7D
qs8/A6KWA98PtglmTX4UhmYi2+4fc1GYEX4CDzDFK2MzMNmOLF9L6RSPa1NcxExLyAQgMPb9hQ5J
NsBFRxyTMN6Ekbo55kenWG6b6LF2A0Iw7jMPouIeXN83ySf6fyxlL9r6VatqkC69BKAjdyj50Fvr
APvoU3mPhM5kosLIfNng2VJu118Zp1bOe4RkMg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 2416)
`pragma protect data_block
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
tC+cGwBAi61Wbw2CVztd5dZbqnacaQ==
`pragma protect end_protected
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2025.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
iAcC0jwWy9Z5+wl+B8MhHqxxL5TfadxgWGZ+9slm8BFFTgz/icCG22xcVWRmDuK3N9Rb/B5NiGwN
e/xgYClcjFKLFKF6obpmTy3RQlN7DScdrXr2QPScDw/WCtjYdj9MXrrsTWVQwdcVB9Y8aCZ9hPfz
DJKtmoIuwh46MnjDL78=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
U/zku1ffpc6imSyt/Wbh/wmt3ZQgYvnE2OQTi42Jd8LcGOrhT9PAdtwSQdTSCH1dxjktZRV+QtvX
8A4bc4cWoFA/p1DWMlh6rWbKmGKWlYaZWym65dURxZuhDRjCpUhGkTx09hzOAo4rS/y5qBVT0XM+
chpLC4mb8yrj9h9eIo0+QwmXPTyVq9UwMd8Uw7pzoUr1HZEoR73gGH3BCtAKbRQcU0RH03UzLnf7
qNxZVR3943pSRYhj4ZU3ACas36w9K8itP5nYl7hsMlDumjQrrXyzDC9maknE3klhemcvOpkd59zw
cw/o4zuOPBecIZRMu2V7hDGgqHe4jLQHnlbpig==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
SWFvi0bYUA0VvwnOjVGnOuCVpr45WDSNZC6FHRlU2Pb6y7bUQB4QXLRpCrMe9fVqN/aig/5T/xu2
qyygh05r+nkKin8SM+PyK9x7oVaFGtQe2XZ1Yt1pHtev9TRVuDTX344eBL1SzvU6VlmiM8y3i/yc
mO7Wkl5Zkq7T+cTNuCk=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
E1brfDHDtCUmBjWNysgUzttlnzXf+4/bkYl5Jm5ar5ZmwHNiefxalW+NIno0w0UgPyY1g8FwagIf
OTUvGsmmvU5SQUnE3xfIjHV4X6MRb4wDHxQQrWW/PzC1ilb+efMt8vNanP7YSsnW44o3L4LbnoWR
toWSG2PdT8djxmp2lAIwLAZM7HPSNbv1AjNlZQiS/ogXl9pXdCKzCc6lrk8daEjoFGCInCVSSamq
/NvzxtTj2Lxi99fW/ZYnu6qbM7mn9RzAo1s/4ePEOMn77xYEdG2q93oL6WjdmK3ArXFoo0uq09VE
ZCpBgpDg+/NYnz+k/MeL8pl0avq3E1SX/7OFbQ==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
QUq9iWMx9C09gSO7bXme3TQAT+KpWBDIgwuc5mquAxoXBxbjrXkAOyUlFPDvAR8zUigyn48IFmVM
R1ZXi89FZ/93iIMKDEzJsMwNO20nnmtgBhV7wdmZYED778+HpTDaOd48EEZFa13zrADED27mGYPQ
K7yigaVTlUFFr4LOdtvf4os7kjEmAl5h6/eTZYs9d6+ec/BJcAsfvRMqmY/fiPN1UszYmMy14wg/
/QG4nKULNjCxDHD18hFkLHixX0kiaC/KXUJZHxCJG+wNP1g7zwbL73MklY+QgJuzeT1jUBOr7Lz8
Q3+dk4nPKP6Z6uRU3TSVCW4kzGF/wAlkyhcJgw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2025.1-2029.x", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
KR91xvxUjHsIQTi6U9bSVmI7HXoSYi4F+/eG3Fx9n+MbrXO3Z0W5QX2Jsh503RAANZJ3jzcoQz8v
kZ6cc7DolfEItw3LQPZ7IllnHRl/mM9pdjaXUMmHXpm9SRepU+5DDmaVSlGI6ctxxuU5Z1QorU7S
JQf5p8ub+IfjMCa/cS4+xo76OOvbW0ddoLtGS43DYJq5tCXsiZFNF540pTZeqwuLkTjn13yPIxxn
zR9EpMicO506i84arUwjcV1ox750MgDJCa01vAFg33ZXr88tziMxFid5Fe6qO6xbAir+13+6CUO1
7IRSgtROityJcgEFBV/fVaax+NCLv6TZxtwyJw==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
E3dWRjbWg0PDvbIA3yDMBfgzFLFLB4qRDkWJ7V0l/03Ki/NR4OKM2fTjDrLuZFI12IXFFTF+I+Zv
Zw4B8GGzhipssnWs5DSTGjkWe12/kifre/tY812o1q1FXFv9RrBmBYZrBqcPz1kbbhmfYE7Y1Taq
e8yz1FRCjMagQBkCD1zMWjdWBH+3x+RUrjp7OQOuSbwgl1v7UiTl9vdSrzm/aSIbwTT2tmgEABi5
Sdn47hIlyOQ1A9x6RdTw98rq2pQSKIgxj45/IRkT+sn6zkRRQH9UlZESNYNsi6j5mGxWFPwV/b6V
3e6wLofc4TTgJvHClOH1UDi0WlkTLmu8E7cGPg==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
ptQEntk2x7+Sf12mvNf1M4bwjBbWFpn2H2nhu45YXH4flC5Odk/MFv8wE0eXI73i/5lE2adRAawy
9Qx94hmQl4+g+9lEgLxvBJk34bePr/0WoUQY9p8Xd/vuOwjJXfzcy2LWwtadlxVGrGFSxkRuL9GW
EAzu92F+K4kagkji1XFzF/3VvOtewrkHF9xStIVAcIm8WClqFGPLQJhjrPvYZdCKP89sNwZLJWSU
yVG3Ajs58ZDGHX9wUsWpEtbQ49GfOuFJnzuBj3jE5fgTi8NGWmrmfhnWu/9wd7sbTLNIC1Ucdfln
Y/AFxtyWCOTrMD5SSRB7EhdyyjbTJMQ1EJWBKgv8TqELPQm2W97zh85j7IYkMZu27T62r/qyucC6
tKcQo8CcNVak9JL9ExK9WwccDSrCCVDnHP/F4qTbIWZgTQEHsUEjU77n0rgUEAbj/yzQjYkSGBZ2
BAi/4CaLcePuTIpZaSs7aWaGyxSa5YpUQdtnrd3t4vZaG1PagLLtpgaz

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
hYEN7fufkwYhPajcK3XG6QEkCkax//hsK8UridEWhrru5vrLFKuh9saq486oIXVtuNSBATbtQWM0
//V1rspp1F1YO8fClxg2LQ4dOh1lC2dgWcAiagLUrL5gsKw0OKIyRn+jArLBMH5/LgeDMCN/X+zQ
kN+B3g6bDkotuK75mvLjgn5SkfuHUAfXPWkydI2lQtJW/waiIe5O6jNsm+mx0Rv7590wXcWy96fs
1bYIQFY/osRx0LYzTB7I+YNu6UzDCPEZyEY/bUvUoNAB0BE3ZVwAZW4wjCuTffptQ01KOSVJbIZ1
HNvUm2nr5OtDbCukrf9WO53B+POoCLRu+1rFwA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
nZRDmSuplPRp+nSH093UkX36t0J50lUM89z5TQhEEeyDrgGSNUCTzgIkUg5nORT3IBT6dlmV4cth
DlemVZEoQqRZvClVJ2V68X8gY7QrordhXb8iEFuy0Z8qrSDn44Osc3QhXFfxMeic6g4Pcs+4mC7a
rk8djdWqEuagMnFE4atFEuNn2kRUcr7D32RqXvgGRpdYE1Z0QROp57Byikd8ubR2fBLSj5DTE3Qh
cz1tVqKY549SXyIICxJ1aofHpkHa0wnbdmQplykNKvCtbAefEhQcDIufbMjn2rk2aMopzH5lP4wq
hx53Ry5/WinyZ6nSamAYTAXby87gUUB5mV8w/w==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
N3P1AaatxnvHBvBt79NHHEwck4dlI5+VqsiRplzpymTzSe3l4Q4xxXzWQJHzu8zEEzAVdXBh6rPs
CMT4OBE6wxotpmQ5g5xzKhE89KG1egIZhpqDuwILmEGJakXONjKMwoOqRNEnD4HIapHmUD16DW+8
LcRX/B0ItP1MBZw5Q4DLI8SQoXo7hCZB8moOl2SoUK8u0kbtrL2/nUaeHPZG8lKHjDK2jWE7y91v
95iaAwaOvg7JTpOt5Kqy5isEWWe+nfi8HI+H3nOtIJk7nxacWYeZpVT+f7IEPTEq2NlkmdQtuRKi
/6+lYWvg4nxrOY0b+AsBI43zlbp5PW/ZWAzKSw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 12704)
`pragma protect data_block
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
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
