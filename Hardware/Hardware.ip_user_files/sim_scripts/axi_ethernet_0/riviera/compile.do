transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib riviera/xpm
vlib riviera/axi_lite_ipif_v3_0_4
vlib riviera/axi_ethernet_buffer_v2_0_26
vlib riviera/xil_defaultlib
vlib riviera/xbip_utils_v3_0_15
vlib riviera/mult_gen_v12_0_24
vlib riviera/tri_mode_ethernet_mac_v9_0_39
vlib riviera/c_reg_fd_v12_0_11
vlib riviera/c_shift_ram_v12_0_20
vlib riviera/xbip_dsp48_wrapper_v3_0_7
vlib riviera/xbip_pipe_v3_0_11
vlib riviera/c_addsub_v12_0_21
vlib riviera/c_counter_binary_v12_0_22
vlib riviera/util_vector_logic_v2_0_5

vmap xpm riviera/xpm
vmap axi_lite_ipif_v3_0_4 riviera/axi_lite_ipif_v3_0_4
vmap axi_ethernet_buffer_v2_0_26 riviera/axi_ethernet_buffer_v2_0_26
vmap xil_defaultlib riviera/xil_defaultlib
vmap xbip_utils_v3_0_15 riviera/xbip_utils_v3_0_15
vmap mult_gen_v12_0_24 riviera/mult_gen_v12_0_24
vmap tri_mode_ethernet_mac_v9_0_39 riviera/tri_mode_ethernet_mac_v9_0_39
vmap c_reg_fd_v12_0_11 riviera/c_reg_fd_v12_0_11
vmap c_shift_ram_v12_0_20 riviera/c_shift_ram_v12_0_20
vmap xbip_dsp48_wrapper_v3_0_7 riviera/xbip_dsp48_wrapper_v3_0_7
vmap xbip_pipe_v3_0_11 riviera/xbip_pipe_v3_0_11
vmap c_addsub_v12_0_21 riviera/c_addsub_v12_0_21
vmap c_counter_binary_v12_0_22 riviera/c_counter_binary_v12_0_22
vmap util_vector_logic_v2_0_5 riviera/util_vector_logic_v2_0_5

vlog -work xpm  -incr "+incdir+../../../../../../../../../../../../../../../../../../../tools/Xilinx/2025.2/data/rsb/busdef" -l xpm -l axi_lite_ipif_v3_0_4 -l axi_ethernet_buffer_v2_0_26 -l xil_defaultlib -l xbip_utils_v3_0_15 -l mult_gen_v12_0_24 -l tri_mode_ethernet_mac_v9_0_39 -l c_reg_fd_v12_0_11 -l c_shift_ram_v12_0_20 -l xbip_dsp48_wrapper_v3_0_7 -l xbip_pipe_v3_0_11 -l c_addsub_v12_0_21 -l c_counter_binary_v12_0_22 -l util_vector_logic_v2_0_5 \
"/tools/Xilinx/2025.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/tools/Xilinx/2025.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"/tools/Xilinx/2025.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93  -incr \
"/tools/Xilinx/2025.2/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work axi_lite_ipif_v3_0_4 -93  -incr \
"../../../ipstatic/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work axi_ethernet_buffer_v2_0_26 -93  -incr \
"../../../ipstatic/hdl/axi_ethernet_buffer_v2_0_rfs.vhd" \

vcom -work xil_defaultlib -93  -incr \
"../../../../Hardware.gen/sources_1/ip/axi_ethernet_0/bd_0/ip/ip_0/sim/bd_5d9f_0_eth_buf_0.vhd" \

vcom -work xbip_utils_v3_0_15 -93  -incr \
"../../../ipstatic/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work mult_gen_v12_0_24 -93  -incr \
"../../../ipstatic/hdl/mult_gen_v12_0_vh_rfs.vhd" \

vlog -work tri_mode_ethernet_mac_v9_0_39  -incr -v2k5 "+incdir+../../../../../../../../../../../../../../../../../../../tools/Xilinx/2025.2/data/rsb/busdef" -l xpm -l axi_lite_ipif_v3_0_4 -l axi_ethernet_buffer_v2_0_26 -l xil_defaultlib -l xbip_utils_v3_0_15 -l mult_gen_v12_0_24 -l tri_mode_ethernet_mac_v9_0_39 -l c_reg_fd_v12_0_11 -l c_shift_ram_v12_0_20 -l xbip_dsp48_wrapper_v3_0_7 -l xbip_pipe_v3_0_11 -l c_addsub_v12_0_21 -l c_counter_binary_v12_0_22 -l util_vector_logic_v2_0_5 \
"../../../ipstatic/hdl/tri_mode_ethernet_mac_v9_0_rfs.v" \

vcom -work tri_mode_ethernet_mac_v9_0_39 -93  -incr \
"../../../ipstatic/hdl/tri_mode_ethernet_mac_v9_0_rfs.vhd" \

vcom -work xil_defaultlib -93  -incr \
"../../../../Hardware.gen/sources_1/ip/axi_ethernet_0/bd_0/ip/ip_1/synth/bd_5d9f_0_mac_0_axi4_lite_ipif_top.vhd" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../../../../../../../../../../../../../../../../tools/Xilinx/2025.2/data/rsb/busdef" -l xpm -l axi_lite_ipif_v3_0_4 -l axi_ethernet_buffer_v2_0_26 -l xil_defaultlib -l xbip_utils_v3_0_15 -l mult_gen_v12_0_24 -l tri_mode_ethernet_mac_v9_0_39 -l c_reg_fd_v12_0_11 -l c_shift_ram_v12_0_20 -l xbip_dsp48_wrapper_v3_0_7 -l xbip_pipe_v3_0_11 -l c_addsub_v12_0_21 -l c_counter_binary_v12_0_22 -l util_vector_logic_v2_0_5 \
"../../../../Hardware.gen/sources_1/ip/axi_ethernet_0/bd_0/ip/ip_1/synth/bd_5d9f_0_mac_0_axi4_lite_ipif_wrapper.v" \
"../../../../Hardware.gen/sources_1/ip/axi_ethernet_0/bd_0/ip/ip_1/synth/physical/bd_5d9f_0_mac_0_mii_if.v" \
"../../../../Hardware.gen/sources_1/ip/axi_ethernet_0/bd_0/ip/ip_1/synth/statistics/bd_5d9f_0_mac_0_vector_decode.v" \
"../../../../Hardware.gen/sources_1/ip/axi_ethernet_0/bd_0/ip/ip_1/synth/bd_5d9f_0_mac_0_block.v" \
"../../../../Hardware.gen/sources_1/ip/axi_ethernet_0/bd_0/ip/ip_1/synth/bd_5d9f_0_mac_0.v" \

vcom -work c_reg_fd_v12_0_11 -93  -incr \
"../../../ipstatic/hdl/c_reg_fd_v12_0_vh_rfs.vhd" \

vcom -work c_shift_ram_v12_0_20 -93  -incr \
"../../../ipstatic/hdl/c_shift_ram_v12_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  -incr \
"../../../../Hardware.gen/sources_1/ip/axi_ethernet_0/bd_0/ip/ip_2/sim/bd_5d9f_0_c_shift_ram_0_0.vhd" \

vcom -work xbip_dsp48_wrapper_v3_0_7 -93  -incr \
"../../../ipstatic/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_11 -93  -incr \
"../../../ipstatic/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \

vcom -work c_addsub_v12_0_21 -93  -incr \
"../../../ipstatic/hdl/c_addsub_v12_0_vh_rfs.vhd" \

vcom -work c_counter_binary_v12_0_22 -93  -incr \
"../../../ipstatic/hdl/c_counter_binary_v12_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  -incr \
"../../../../Hardware.gen/sources_1/ip/axi_ethernet_0/bd_0/ip/ip_3/sim/bd_5d9f_0_c_counter_binary_0_0.vhd" \

vlog -work util_vector_logic_v2_0_5  -incr -v2k5 "+incdir+../../../../../../../../../../../../../../../../../../../tools/Xilinx/2025.2/data/rsb/busdef" -l xpm -l axi_lite_ipif_v3_0_4 -l axi_ethernet_buffer_v2_0_26 -l xil_defaultlib -l xbip_utils_v3_0_15 -l mult_gen_v12_0_24 -l tri_mode_ethernet_mac_v9_0_39 -l c_reg_fd_v12_0_11 -l c_shift_ram_v12_0_20 -l xbip_dsp48_wrapper_v3_0_7 -l xbip_pipe_v3_0_11 -l c_addsub_v12_0_21 -l c_counter_binary_v12_0_22 -l util_vector_logic_v2_0_5 \
"../../../ipstatic/hdl/util_vector_logic_v2_0_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../../../../../../../../../../../../../../../../tools/Xilinx/2025.2/data/rsb/busdef" -l xpm -l axi_lite_ipif_v3_0_4 -l axi_ethernet_buffer_v2_0_26 -l xil_defaultlib -l xbip_utils_v3_0_15 -l mult_gen_v12_0_24 -l tri_mode_ethernet_mac_v9_0_39 -l c_reg_fd_v12_0_11 -l c_shift_ram_v12_0_20 -l xbip_dsp48_wrapper_v3_0_7 -l xbip_pipe_v3_0_11 -l c_addsub_v12_0_21 -l c_counter_binary_v12_0_22 -l util_vector_logic_v2_0_5 \
"../../../../Hardware.gen/sources_1/ip/axi_ethernet_0/bd_0/ip/ip_5/sim/bd_5d9f_0_util_vector_logic_0_0.v" \
"../../../../Hardware.gen/sources_1/ip/axi_ethernet_0/bd_0/sim/bd_5d9f_0.v" \
"../../../../Hardware.gen/sources_1/ip/axi_ethernet_0/sim/axi_ethernet_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

