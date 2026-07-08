# create_axi_dma.tcl
# Creates the axi_dma_0 IP and runs its OOC synthesis in-process.
# Run with: HARTS_DISABLE=1 vivado -mode tcl -source create_axi_dma.tcl
# Must be run from the Hardware/ directory.

open_project Hardware.xpr

# Remove existing IP if present (idempotent re-run)
if {[llength [get_ips -quiet axi_dma_0]] > 0} {
    puts "INFO: axi_dma_0 already exists — skipping create_ip"
} else {
    create_ip -name axi_dma -vendor xilinx.com -library ip -version 7.1 \
        -module_name axi_dma_0

    set_property -dict [list \
        CONFIG.c_include_sg               {1}  \
        CONFIG.c_sg_include_stscntrl_strm {1}  \
        CONFIG.c_sg_length_width          {23} \
        CONFIG.c_m_axi_mm2s_data_width    {64} \
        CONFIG.c_m_axi_s2mm_data_width    {64} \
        CONFIG.c_m_axis_mm2s_tdata_width  {32} \
        CONFIG.c_s_axis_s2mm_tdata_width  {32} \
        CONFIG.c_include_mm2s             {1}  \
        CONFIG.c_include_s2mm             {1}  \
        CONFIG.c_mm2s_burst_size          {16} \
        CONFIG.c_s2mm_burst_size          {16} \
        CONFIG.c_addr_width               {32} \
    ] [get_ips axi_dma_0]

    generate_target all [get_ips axi_dma_0]
    puts "INFO: axi_dma_0 IP created and targets generated."
}

# Run OOC synthesis in-process (avoids HARTS/NTFS crash)
set_param general.maxThreads 1
puts "INFO: Running OOC synthesis for axi_dma_0 ..."
synth_ip [get_ips axi_dma_0]
puts "INFO: axi_dma_0 OOC synthesis complete."

save_project_as Hardware.xpr -force
puts "SUCCESS: axi_dma_0 ready. Hardware.xpr saved."
