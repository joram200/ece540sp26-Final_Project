# create_dwidth_conv.tcl
# Creates axi_dwidth_conv_sg and axi_dwidth_conv_s2mm IPs (32-bit → 64-bit adapters)
# These bridge the 32-bit DMA AXI4 buses to the 64-bit DDR crossbar.
# Run with: HARTS_DISABLE=1 vivado -mode tcl -source create_dwidth_conv.tcl
# Must be run from the Hardware/ directory.

open_project Hardware.xpr

set_param general.maxThreads 1

foreach ip_name {axi_dwidth_conv_sg axi_dwidth_conv_s2mm} {
    if {[llength [get_ips -quiet $ip_name]] > 0} {
        puts "INFO: $ip_name already exists — skipping create_ip"
    } else {
        create_ip -name axi_dwidth_converter -vendor xilinx.com -library ip -version 2.1 \
            -module_name $ip_name

        set_property -dict [list \
            CONFIG.SI_DATA_WIDTH {32} \
            CONFIG.MI_DATA_WIDTH {64} \
            CONFIG.SI_ID_WIDTH   {4}  \
        ] [get_ips $ip_name]

        generate_target all [get_ips $ip_name]
        puts "INFO: $ip_name IP created and targets generated."
    }

    puts "INFO: Running OOC synthesis for $ip_name ..."
    synth_ip [get_ips $ip_name]
    puts "INFO: $ip_name OOC synthesis complete."
}

save_project_as Hardware.xpr -force
puts "SUCCESS: axi_dwidth_conv_sg and axi_dwidth_conv_s2mm ready."
