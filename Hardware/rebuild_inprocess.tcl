# rebuild_inprocess.tcl
# Runs synthesis and implementation entirely within the main Vivado process.
# Avoids launch_runs subprocesses (HARTS crashes) and reset_run (NTFS hangs).
# The axi_ethernet_0 OOC DCP is already on disk and is picked up by open_project.

open_project Hardware.xpr

# Register the width converter if it is not yet in the project.
set proj_dir [get_property DIRECTORY [current_project]]
set new_sv [file normalize "$proj_dir/Hardware.srcs/sources_1/new/axi_lite_64to32.sv"]
if {[llength [get_files -quiet $new_sv]] == 0} {
    add_files -norecurse $new_sv
    set_property FILE_TYPE {SystemVerilog} [get_files $new_sv]
    puts "INFO: Added $new_sv"
} else {
    puts "INFO: $new_sv already in project"
}

set part [get_property PART [current_project]]
set top  [get_property top  [current_fileset]]
puts "INFO: top=$top  part=$part"

# ---- Synthesis ---------------------------------------------------------------
# Limit to 1 thread to avoid HARTS thread-manager crash (SIGABRT in
# HARTSJobManager::thisThreadWaitForChildError) seen on this NTFS-mounted host.
set_param general.maxThreads 1
puts "INFO: synth_design ..."
synth_design -top $top -part $part -flatten_hierarchy rebuilt

file mkdir Hardware.runs/synth_1
write_checkpoint -force Hardware.runs/synth_1/rvfpganexys.dcp
puts "INFO: Synthesis checkpoint written."

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
write_bitstream -force Hardware.runs/impl_1/rvfpganexys.bit

if {![file exists Hardware.runs/impl_1/rvfpganexys.bit]} {
    error "Bitstream not found after write_bitstream"
}
puts "SUCCESS: Bitstream written to Hardware.runs/impl_1/rvfpganexys.bit"
