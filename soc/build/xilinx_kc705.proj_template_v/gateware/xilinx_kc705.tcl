
# Create Project

create_project -force -name xilinx_kc705 -part xc7k325t-ffg900-2
set_msg_config -id {Common 17-55} -new_severity {Warning}

# Add Sources

read_verilog {/home/karthikeyan/bachelor_thesis/pro/proj/proj_template_v/cfu.v}
read_verilog {/home/karthikeyan/bachelor_thesis/pro/third_party/python/pythondata_cpu_vexriscv/pythondata_cpu_vexriscv/verilog/VexRiscv_FullCfu.v}
read_verilog {/home/karthikeyan/bachelor_thesis/pro/soc/build/xilinx_kc705.proj_template_v/gateware/xilinx_kc705.v}

# Add EDIFs


# Add IPs


# Add constraints

read_xdc xilinx_kc705.xdc
set_property PROCESSING_ORDER EARLY [get_files xilinx_kc705.xdc]

# Add pre-synthesis commands


# Synthesis

synth_design -directive default -top xilinx_kc705 -part xc7k325t-ffg900-2

# Synthesis report

report_timing_summary -file xilinx_kc705_timing_synth.rpt
report_utilization -hierarchical -file xilinx_kc705_utilization_hierarchical_synth.rpt
report_utilization -file xilinx_kc705_utilization_synth.rpt

# Optimize design

opt_design -directive default

# Add pre-placement commands


# Placement

place_design -directive default

# Placement report

report_utilization -hierarchical -file xilinx_kc705_utilization_hierarchical_place.rpt
report_utilization -file xilinx_kc705_utilization_place.rpt
report_io -file xilinx_kc705_io.rpt
report_control_sets -verbose -file xilinx_kc705_control_sets.rpt
report_clock_utilization -file xilinx_kc705_clock_utilization.rpt

# Add pre-routing commands


# Routing

route_design -directive default
phys_opt_design -directive default
write_checkpoint -force xilinx_kc705_route.dcp

# Routing report

report_timing_summary -no_header -no_detailed_paths
report_route_status -file xilinx_kc705_route_status.rpt
report_drc -file xilinx_kc705_drc.rpt
report_timing_summary -datasheet -max_paths 10 -file xilinx_kc705_timing.rpt
report_power -file xilinx_kc705_power.rpt
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]

# Bitstream generation

write_bitstream -force xilinx_kc705.bit 
write_cfgmem -force -format bin -interface spix4 -size 16 -loadbit "up 0x0 xilinx_kc705.bit" -file xilinx_kc705.bin

# End

quit