// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
// Date        : Mon Jun  1 22:29:02 2026
// Host        : archlinux running 64-bit unknown
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ bd_5d9f_0_c_counter_binary_0_0_sim_netlist.v
// Design      : bd_5d9f_0_c_counter_binary_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "bd_5d9f_0_c_counter_binary_0_0,c_counter_binary_v12_0_22,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_counter_binary_v12_0_22,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_counter_binary_v12_0_22 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 2384)
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 12512)
`pragma protect data_block
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
H+xjagfsl5raeQuQvW0yEZaCPZFFwO5d4BBuRc0=
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
