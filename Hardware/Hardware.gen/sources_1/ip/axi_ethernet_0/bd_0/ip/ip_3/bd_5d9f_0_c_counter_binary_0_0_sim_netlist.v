// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
// Date        : Mon Jun  1 22:29:02 2026
// Host        : archlinux running 64-bit unknown
// Command     : write_verilog -force -mode funcsim -rename_top bd_5d9f_0_c_counter_binary_0_0 -prefix
//               bd_5d9f_0_c_counter_binary_0_0_ bd_5d9f_0_c_counter_binary_0_0_sim_netlist.v
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 2368)
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 12384)
`pragma protect data_block
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
ixKUGmkqAG4Cr/jgvyBH
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
