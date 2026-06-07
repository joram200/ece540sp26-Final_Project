open_project Hardware.xpr

set proj_dir [get_property DIRECTORY [current_project]]

# ---------------------------------------------------------------
# Reset ALL runs in dependency order (downstream first).
# Resetting the sub-IP synthesis runs lets them re-run fresh so
# Vivado's in-memory dependency chain is clean when link_design
# resolves the axi_ethernet_0_bd_5d9f_0_* black box cells.
# ---------------------------------------------------------------
puts "INFO: Resetting all runs..."
reset_run impl_1
reset_run synth_1
reset_run axi_ethernet_0_synth_1
foreach sub_run [list \
    bd_5d9f_0_eth_buf_0_synth_1 \
    bd_5d9f_0_mac_0_synth_1 \
    bd_5d9f_0_c_shift_ram_0_0_synth_1 \
    bd_5d9f_0_c_counter_binary_0_0_synth_1 \
    bd_5d9f_0_util_vector_logic_0_0_synth_1 \
] {
    if {[llength [get_runs -quiet $sub_run]] > 0} {
        reset_run $sub_run
        puts "INFO: Reset $sub_run"
    }
}

# ---------------------------------------------------------------
# Write pre-synthesis hook for axi_ethernet_0_synth_1.
#
# In Vivado 2025.2, read_ip inside create_project -in_memory does
# NOT auto-register sub-IP module definitions, causing:
#   ERROR [Synth 8-439] module 'bd_5d9f_0_c_counter_binary_0_0' not found
#
# read_verilog with the sub-IP stub files provides the module
# interface declarations that synth_design needs for elaboration.
# The sub-IP DCPs (produced by the freshly re-run sub-IP synthesis
# runs) are used by link_design to resolve the prefixed black boxes
# via the IpOocRunGenerated / RenamePrefix DCP metadata.
# ---------------------------------------------------------------
set ip_dir [file normalize \
  "$proj_dir/Hardware.gen/sources_1/ip/axi_ethernet_0/bd_0/ip"]
set hook_tcl [file normalize "$proj_dir/pre_synth_axi_eth.tcl"]

set fh [open $hook_tcl w]
puts $fh "# Pre-synthesis hook: load sub-IP stubs for axi_ethernet_0 elaboration"
foreach rel [list \
  "ip_0/bd_5d9f_0_eth_buf_0_stub.v" \
  "ip_1/bd_5d9f_0_mac_0_stub.v" \
  "ip_2/bd_5d9f_0_c_shift_ram_0_0_stub.v" \
  "ip_3/bd_5d9f_0_c_counter_binary_0_0_stub.v" \
  "ip_5/bd_5d9f_0_util_vector_logic_0_0_stub.v" \
] {
  set stub [file normalize "$ip_dir/$rel"]
  puts $fh "if \{\[file exists {$stub}\]\} \{"
  puts $fh "  read_verilog -quiet {$stub}"
  puts $fh "  puts \"HOOK: loaded {$stub}\""
  puts $fh "\}"
}
close $fh
puts "INFO: Wrote hook: $hook_tcl"

set_property STEPS.SYNTH_DESIGN.TCL.PRE $hook_tcl \
  [get_runs axi_ethernet_0_synth_1]
puts "INFO: Set SYNTH_DESIGN.TCL.PRE on axi_ethernet_0_synth_1"

# ---------------------------------------------------------------
# Synthesis — launches full chain:
#   bd_5d9f_0_*_synth_1 → axi_ethernet_0_synth_1 → synth_1
# ---------------------------------------------------------------
puts "INFO: Launching synthesis (synth_1 full chain)..."
launch_runs synth_1 -jobs 8
wait_on_run synth_1 -timeout 3600

set synth_status   [get_property STATUS   [get_runs synth_1]]
set synth_progress [get_property PROGRESS [get_runs synth_1]]
puts "INFO: synth_1 STATUS=$synth_status PROGRESS=$synth_progress"
if {$synth_progress != "100%"} {
  error "Synthesis did not complete: STATUS=$synth_status PROGRESS=$synth_progress"
}
puts "INFO: Synthesis complete."

# ---------------------------------------------------------------
# Implementation + Bitstream
# ---------------------------------------------------------------
puts "INFO: Launching implementation (impl_1 through write_bitstream)..."
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1 -timeout 7200

set impl_status   [get_property STATUS   [get_runs impl_1]]
set impl_progress [get_property PROGRESS [get_runs impl_1]]
puts "INFO: impl_1 STATUS=$impl_status PROGRESS=$impl_progress"
if {$impl_progress != "100%"} {
  error "Implementation did not complete: STATUS=$impl_status PROGRESS=$impl_progress"
}
puts "INFO: Implementation complete."

# ---------------------------------------------------------------
# Verify bitstream
# ---------------------------------------------------------------
if {![file exists Hardware.runs/impl_1/rvfpganexys.bit]} {
  error "Bitstream file not found after write_bitstream"
}
puts "SUCCESS: Bitstream written to Hardware.runs/impl_1/rvfpganexys.bit"
