vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xpm
vlib questa_lib/msim/axi_lite_ipif_v3_0_4
vlib questa_lib/msim/axi_ethernet_buffer_v2_0_26
vlib questa_lib/msim/xil_defaultlib
vlib questa_lib/msim/xbip_utils_v3_0_15
vlib questa_lib/msim/mult_gen_v12_0_24
vlib questa_lib/msim/tri_mode_ethernet_mac_v9_0_39
vlib questa_lib/msim/c_reg_fd_v12_0_11
vlib questa_lib/msim/c_shift_ram_v12_0_20
vlib questa_lib/msim/xbip_dsp48_wrapper_v3_0_7
vlib questa_lib/msim/xbip_pipe_v3_0_11
vlib questa_lib/msim/c_addsub_v12_0_21
vlib questa_lib/msim/c_counter_binary_v12_0_22
vlib questa_lib/msim/util_vector_logic_v2_0_5

vmap xpm questa_lib/msim/xpm
vmap axi_lite_ipif_v3_0_4 questa_lib/msim/axi_lite_ipif_v3_0_4
vmap axi_ethernet_buffer_v2_0_26 questa_lib/msim/axi_ethernet_buffer_v2_0_26
vmap xil_defaultlib questa_lib/msim/xil_defaultlib
vmap xbip_utils_v3_0_15 questa_lib/msim/xbip_utils_v3_0_15
vmap mult_gen_v12_0_24 questa_lib/msim/mult_gen_v12_0_24
vmap tri_mode_ethernet_mac_v9_0_39 questa_lib/msim/tri_mode_ethernet_mac_v9_0_39
vmap c_reg_fd_v12_0_11 questa_lib/msim/c_reg_fd_v12_0_11
vmap c_shift_ram_v12_0_20 questa_lib/msim/c_shift_ram_v12_0_20
vmap xbip_dsp48_wrapper_v3_0_7 questa_lib/msim/xbip_dsp48_wrapper_v3_0_7
vmap xbip_pipe_v3_0_11 questa_lib/msim/xbip_pipe_v3_0_11
vmap c_addsub_v12_0_21 questa_lib/msim/c_addsub_v12_0_21
vmap c_counter_binary_v12_0_22 questa_lib/msim/c_counter_binary_v12_0_22
vmap util_vector_logic_v2_0_5 questa_lib/msim/util_vector_logic_v2_0_5

vlog -work xpm -64 -incr -mfcu  -sv "+incdir+../../../../../../../../../../../../../../../../../../../tools/Xilinx/2025.2/data/rsb/busdef" \
"/tools/Xilinx/2025.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/tools/Xilinx/2025.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"/tools/Xilinx/2025.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93  \
"/tools/Xilinx/2025.2/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work axi_lite_ipif_v3_0_4 -64 -93  \
"../../../ipstatic/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work axi_ethernet_buffer_v2_0_26 -64 -93  \
"../../../ipstatic/hdl/axi_ethernet_buffer_v2_0_rfs.vhd" \

vcom -work xil_defaultlib -64 -93  \
"../../../../Hardware.gen/sources_1/ip/axi_ethernet_0/bd_0/ip/ip_0/sim/bd_5d9f_0_eth_buf_0.vhd" \

vcom -work xbip_utils_v3_0_15 -64 -93  \
"../../../ipstatic/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work mult_gen_v12_0_24 -64 -93  \
"../../../ipstatic/hdl/mult_gen_v12_0_vh_rfs.vhd" \

vlog -work tri_mode_ethernet_mac_v9_0_39 -64 -incr -mfcu  "+incdir+../../../../../../../../../../../../../../../../../../../tools/Xilinx/2025.2/data/rsb/busdef" \
"../../../ipstatic/hdl/tri_mode_ethernet_mac_v9_0_rfs.v" \

vcom -work tri_mode_ethernet_mac_v9_0_39 -64 -93  \
"../../../ipstatic/hdl/tri_mode_ethernet_mac_v9_0_rfs.vhd" \

vcom -work xil_defaultlib -64 -93  \
"../../../../Hardware.gen/sources_1/ip/axi_ethernet_0/bd_0/ip/ip_1/synth/bd_5d9f_0_mac_0_axi4_lite_ipif_top.vhd" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../../../../../../../../../../../../../../../../tools/Xilinx/2025.2/data/rsb/busdef" \
"../../../../Hardware.gen/sources_1/ip/axi_ethernet_0/bd_0/ip/ip_1/synth/bd_5d9f_0_mac_0_axi4_lite_ipif_wrapper.v" \
"../../../../Hardware.gen/sources_1/ip/axi_ethernet_0/bd_0/ip/ip_1/synth/physical/bd_5d9f_0_mac_0_mii_if.v" \
"../../../../Hardware.gen/sources_1/ip/axi_ethernet_0/bd_0/ip/ip_1/synth/statistics/bd_5d9f_0_mac_0_vector_decode.v" \
"../../../../Hardware.gen/sources_1/ip/axi_ethernet_0/bd_0/ip/ip_1/synth/bd_5d9f_0_mac_0_block.v" \
"../../../../Hardware.gen/sources_1/ip/axi_ethernet_0/bd_0/ip/ip_1/synth/bd_5d9f_0_mac_0.v" \

vcom -work c_reg_fd_v12_0_11 -64 -93  \
"../../../ipstatic/hdl/c_reg_fd_v12_0_vh_rfs.vhd" \

vcom -work c_shift_ram_v12_0_20 -64 -93  \
"../../../ipstatic/hdl/c_shift_ram_v12_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93  \
"../../../../Hardware.gen/sources_1/ip/axi_ethernet_0/bd_0/ip/ip_2/sim/bd_5d9f_0_c_shift_ram_0_0.vhd" \

vcom -work xbip_dsp48_wrapper_v3_0_7 -64 -93  \
"../../../ipstatic/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_11 -64 -93  \
"../../../ipstatic/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \

vcom -work c_addsub_v12_0_21 -64 -93  \
"../../../ipstatic/hdl/c_addsub_v12_0_vh_rfs.vhd" \

vcom -work c_counter_binary_v12_0_22 -64 -93  \
"../../../ipstatic/hdl/c_counter_binary_v12_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93  \
"../../../../Hardware.gen/sources_1/ip/axi_ethernet_0/bd_0/ip/ip_3/sim/bd_5d9f_0_c_counter_binary_0_0.vhd" \

vlog -work util_vector_logic_v2_0_5 -64 -incr -mfcu  "+incdir+../../../../../../../../../../../../../../../../../../../tools/Xilinx/2025.2/data/rsb/busdef" \
"../../../ipstatic/hdl/util_vector_logic_v2_0_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr -mfcu  "+incdir+../../../../../../../../../../../../../../../../../../../tools/Xilinx/2025.2/data/rsb/busdef" \
"../../../../Hardware.gen/sources_1/ip/axi_ethernet_0/bd_0/ip/ip_5/sim/bd_5d9f_0_util_vector_logic_0_0.v" \
"../../../../Hardware.gen/sources_1/ip/axi_ethernet_0/bd_0/sim/bd_5d9f_0.v" \
"../../../../Hardware.gen/sources_1/ip/axi_ethernet_0/sim/axi_ethernet_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

