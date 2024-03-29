# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param chipscope.maxJobs 1
set_param xicom.use_bs_reader 1
set_msg_config -id {Common 17-41} -limit 10000000
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/scott/Desktop/Fall_Quarter/CSE100/Labs/lab7/lab7.cache/wt [current_project]
set_property parent.project_path C:/Users/scott/Desktop/Fall_Quarter/CSE100/Labs/lab7/lab7.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part digilentinc.com:basys3:part0:1.1 [current_project]
set_property ip_output_repo c:/Users/scott/Desktop/Fall_Quarter/CSE100/Labs/lab7/lab7.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib {
  C:/Users/scott/Desktop/Fall_Quarter/CSE100/Labs/lab7/lab7.srcs/sources_1/imports/new/Full_Adder.v
  C:/Users/scott/Desktop/Fall_Quarter/CSE100/Labs/lab7/lab7.srcs/sources_1/new/LSR_module.v
  C:/Users/scott/Desktop/Fall_Quarter/CSE100/Labs/lab7/lab7.srcs/sources_1/new/comparator_4bitmodule.v
  C:/Users/scott/Desktop/Fall_Quarter/CSE100/Labs/lab7/lab7.srcs/sources_1/new/comparator_module.v
  C:/Users/scott/Desktop/Fall_Quarter/CSE100/Labs/lab7/lab7.srcs/sources_1/imports/new/countUD16L.v
  C:/Users/scott/Desktop/Fall_Quarter/CSE100/Labs/lab7/lab7.srcs/sources_1/imports/new/countUD4L.v
  C:/Users/scott/Desktop/Fall_Quarter/CSE100/Labs/lab7/lab7.srcs/sources_1/new/divider_module.v
  C:/Users/scott/Desktop/Fall_Quarter/CSE100/Labs/lab7/lab7.srcs/sources_1/new/divider_statemachine.v
  C:/Users/scott/Desktop/Fall_Quarter/CSE100/Labs/lab7/lab7.srcs/sources_1/imports/new/edge_detector.v
  C:/Users/scott/Desktop/Fall_Quarter/CSE100/Labs/lab7/lab7.srcs/sources_1/imports/new/flash_module.v
  C:/Users/scott/Desktop/Fall_Quarter/CSE100/Labs/lab7/lab7.srcs/sources_1/imports/new/hex7seg.v
  C:/Users/scott/Desktop/Fall_Quarter/CSE100/Labs/lab7/lab7.srcs/sources_1/imports/lab7/lab7_clks.v
  C:/Users/scott/Desktop/Fall_Quarter/CSE100/Labs/lab7/lab7.srcs/sources_1/imports/new/m4_1.v
  C:/Users/scott/Desktop/Fall_Quarter/CSE100/Labs/lab7/lab7.srcs/sources_1/imports/new/m8_1.v
  C:/Users/scott/Desktop/Fall_Quarter/CSE100/Labs/lab7/lab7.srcs/sources_1/new/prime_statemachine.v
  C:/Users/scott/Desktop/Fall_Quarter/CSE100/Labs/lab7/lab7.srcs/sources_1/new/primetester_module.v
  C:/Users/scott/Desktop/Fall_Quarter/CSE100/Labs/lab7/lab7.srcs/sources_1/imports/new/ring_counter_module.v
  C:/Users/scott/Desktop/Fall_Quarter/CSE100/Labs/lab7/lab7.srcs/sources_1/imports/new/selector.v
  C:/Users/scott/Desktop/Fall_Quarter/CSE100/Labs/lab7/lab7.srcs/sources_1/new/subtractor_module.v
  C:/Users/scott/Desktop/Fall_Quarter/CSE100/Labs/lab7/lab7.srcs/sources_1/imports/new/time_counter_module.v
  C:/Users/scott/Desktop/Fall_Quarter/CSE100/Labs/lab7/lab7.srcs/sources_1/new/top_statemachine.v
  C:/Users/scott/Desktop/Fall_Quarter/CSE100/Labs/lab7/lab7.srcs/sources_1/new/top_module.v
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/scott/Desktop/Fall_Quarter/CSE100/Labs/lab7/lab7.srcs/constrs_1/imports/CSE100/Basys3_Master.xdc
set_property used_in_implementation false [get_files C:/Users/scott/Desktop/Fall_Quarter/CSE100/Labs/lab7/lab7.srcs/constrs_1/imports/CSE100/Basys3_Master.xdc]

set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top top_module -part xc7a35tcpg236-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef top_module.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file top_module_utilization_synth.rpt -pb top_module_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
