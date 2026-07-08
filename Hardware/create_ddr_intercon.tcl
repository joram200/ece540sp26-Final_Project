# create_ddr_intercon.tcl
# Creates the axi_crossbar_0 IP (4 masters → 1 DDR slave) and runs OOC synthesis.
# axi_crossbar is the RTL-instantiable equivalent of axi_interconnect v2+ (IP Integrator only).
# Run with: HARTS_DISABLE=1 vivado -mode tcl -source create_ddr_intercon.tcl
# Must be run from the Hardware/ directory.

open_project Hardware.xpr

# Update axi_crossbar_0 to ID_WIDTH=6 to preserve VeeRwolf's 6-bit AXI transaction IDs.
if {[llength [get_ips -quiet axi_crossbar_0]] > 0} {
    puts "INFO: Updating existing axi_crossbar_0 CONFIG.ID_WIDTH to 6"
    set_property -dict [list \
        CONFIG.NUM_SI          {4}  \
        CONFIG.NUM_MI          {1}  \
        CONFIG.DATA_WIDTH      {64} \
        CONFIG.ADDR_WIDTH      {32} \
        CONFIG.ID_WIDTH        {6}  \
        CONFIG.M00_A00_ADDR_WIDTH {27} \
        CONFIG.M00_A00_BASE_ADDR  {0x0000000000000000} \
    ] [get_ips axi_crossbar_0]
    generate_target all [get_ips axi_crossbar_0]
    puts "INFO: axi_crossbar_0 reconfigured (ID_WIDTH=6) and targets regenerated."
} else {
    # 4 slave ports (S00=CPU, S01=DMA-SG, S02=DMA-MM2S, S03=DMA-S2MM) → 1 master port (DDR2)
    create_ip -name axi_crossbar -vendor xilinx.com -library ip -version 2.1 \
        -module_name axi_crossbar_0

    set_property -dict [list \
        CONFIG.NUM_SI          {4}  \
        CONFIG.NUM_MI          {1}  \
        CONFIG.DATA_WIDTH      {64} \
        CONFIG.ADDR_WIDTH      {32} \
        CONFIG.ID_WIDTH        {6}  \
        CONFIG.M00_A00_ADDR_WIDTH {27} \
        CONFIG.M00_A00_BASE_ADDR  {0x0000000000000000} \
    ] [get_ips axi_crossbar_0]

    generate_target all [get_ips axi_crossbar_0]
    puts "INFO: axi_crossbar_0 IP created (ID_WIDTH=6) and targets generated."
}

set_param general.maxThreads 1
puts "INFO: Running OOC synthesis for axi_crossbar_0 ..."
synth_ip [get_ips axi_crossbar_0]
puts "INFO: axi_crossbar_0 OOC synthesis complete."

save_project_as Hardware.xpr -force
puts "SUCCESS: axi_crossbar_0 ready. Hardware.xpr saved."
