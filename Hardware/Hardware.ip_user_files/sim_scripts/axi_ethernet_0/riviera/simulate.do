transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+axi_ethernet_0  -L xil_defaultlib -L xpm -L axi_lite_ipif_v3_0_4 -L axi_ethernet_buffer_v2_0_26 -L xbip_utils_v3_0_15 -L mult_gen_v12_0_24 -L tri_mode_ethernet_mac_v9_0_39 -L c_reg_fd_v12_0_11 -L c_shift_ram_v12_0_20 -L xbip_dsp48_wrapper_v3_0_7 -L xbip_pipe_v3_0_11 -L c_addsub_v12_0_21 -L c_counter_binary_v12_0_22 -L util_vector_logic_v2_0_5 -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.axi_ethernet_0 xil_defaultlib.glbl

do {axi_ethernet_0.udo}

run 1000ns

endsim

quit -force
