# impl_inprocess.tcl
# Opens the existing synthesis checkpoint and runs implementation in-process.
# Use this when rebuild_inprocess.tcl crashes after synthesis but before
# write_checkpoint (NTFS/JVM crash).  The generated-clock XDC constraints
# (mii_rx_clk, mii_tx_clk) are implementation-time only and apply cleanly
# on top of the synthesis-checkpoint netlist.

set synth_dcp Hardware.runs/synth_1/rvfpganexys.dcp
set xdc_file  Hardware.srcs/constrs_1/imports/src/rvfpganexys.xdc
set bit_file  Hardware.runs/impl_1/rvfpganexys.bit

if {![file exists $synth_dcp]} {
    error "Synthesis checkpoint not found: $synth_dcp"
}
puts "INFO: Opening synthesis checkpoint $synth_dcp ..."
open_checkpoint $synth_dcp

# Apply the full updated XDC (includes the new create_generated_clock entries).
# read_xdc appends to whatever constraints are already embedded in the checkpoint.
# Duplicate create_clock / set_clock_groups entries are handled gracefully by
# Vivado (later definitions of mii_rx_clk / mii_tx_clk groups are additive).
puts "INFO: Reading XDC $xdc_file ..."
read_xdc $xdc_file

# ---- Implementation ----------------------------------------------------------
puts "INFO: opt_design ..."
opt_design

puts "INFO: place_design ..."
place_design

puts "INFO: phys_opt_design ..."
phys_opt_design

puts "INFO: route_design ..."
route_design

puts "INFO: write_bitstream ..."
file mkdir Hardware.runs/impl_1
write_bitstream -force $bit_file

if {![file exists $bit_file]} {
    error "Bitstream not found after write_bitstream"
}
puts "SUCCESS: Bitstream written to $bit_file"
