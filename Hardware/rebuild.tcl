# rebuild.tcl
# RTL-only rebuild: resets synth_1 and impl_1, then regenerates the bitstream.
# Use this when only RTL source files have changed (no IP core modifications).
# The axi_ethernet_0 and sub-IP synthesis DCPs are reused as-is.

open_project Hardware.xpr

puts "INFO: Adding new RTL source files ..."
set proj_dir [get_property DIRECTORY [current_project]]
set new_sv [file normalize "$proj_dir/Hardware.srcs/sources_1/new/axi_lite_64to32.sv"]
if {[llength [get_files -quiet $new_sv]] == 0} {
    add_files -norecurse $new_sv
    set_property FILE_TYPE {SystemVerilog} [get_files $new_sv]
    puts "INFO: Added $new_sv"
} else {
    puts "INFO: $new_sv already in project"
}

puts "INFO: Resetting synth_1 and impl_1 ..."
reset_run impl_1
reset_run synth_1

puts "INFO: Launching synthesis ..."
launch_runs synth_1 -jobs 1
wait_on_run synth_1 -timeout 3600

set synth_status   [get_property STATUS   [get_runs synth_1]]
set synth_progress [get_property PROGRESS [get_runs synth_1]]
puts "INFO: synth_1 STATUS=$synth_status PROGRESS=$synth_progress"
if {$synth_progress != "100%"} {
    error "Synthesis did not complete: STATUS=$synth_status PROGRESS=$synth_progress"
}
puts "INFO: Synthesis complete."

puts "INFO: Launching implementation ..."
launch_runs impl_1 -to_step write_bitstream -jobs 2
wait_on_run impl_1 -timeout 7200

set impl_status   [get_property STATUS   [get_runs impl_1]]
set impl_progress [get_property PROGRESS [get_runs impl_1]]
puts "INFO: impl_1 STATUS=$impl_status PROGRESS=$impl_progress"
if {$impl_progress != "100%"} {
    error "Implementation did not complete: STATUS=$impl_status PROGRESS=$impl_progress"
}
puts "INFO: Implementation complete."

if {![file exists Hardware.runs/impl_1/rvfpganexys.bit]} {
    error "Bitstream file not found after write_bitstream"
}
puts "SUCCESS: Bitstream written to Hardware.runs/impl_1/rvfpganexys.bit"
