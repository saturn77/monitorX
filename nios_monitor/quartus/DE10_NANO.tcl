# Copyright (C) 1991-2015 Altera Corporation. All rights reserved.
# Your use of Altera Corporation's design tools, logic functions 
# and other software and tools, and its AMPP partner logic 
# functions, and any output files from any of the foregoing 
# (including device programming or simulation files), and any 
# associated documentation or information are expressly subject 
# to the terms and conditions of the Altera Program License 
# Subscription Agreement, the Altera Quartus Prime License Agreement,
# the Altera MegaCore Function License Agreement, or other 
# applicable license agreement, including, without limitation, 
# that your use is for the sole purpose of programming logic 
# devices manufactured by Altera and sold by Altera or its 
# authorized distributors.  Please refer to the applicable 
# agreement for further details.

# Quartus Prime: Generate Tcl File for Project
# File: DE10_NANO.tcl
# Generated on: Fri Jul 02 13:13:22 2021

# Load Quartus Prime Tcl Project package
package require ::quartus::project

set need_to_close_project 0
set make_assignments 1

# Check that the right project is open
if {[is_project_open]} {
	if {[string compare $quartus(project) "DE10_NANO"]} {
		puts "Project DE10_NANO is not open"
		set make_assignments 0
	}
} else {
	# Only open if not already open
	if {[project_exists DE10_NANO]} {
		project_open -revision DE10_NANO DE10_NANO
	} else {
		project_new -revision DE10_NANO DE10_NANO
	}
	set need_to_close_project 1
}

# Make assignments
if {$make_assignments} {
	set_global_assignment -name FAMILY "Cyclone V"
	set_global_assignment -name DEVICE 5CSEBA6U23I7
	set_global_assignment -name ORIGINAL_QUARTUS_VERSION 16.0.2
	set_global_assignment -name LAST_QUARTUS_VERSION 15.1.0
	set_global_assignment -name PROJECT_CREATION_TIME_DATE "09:27:30 MARCH 17,2021"
	set_global_assignment -name DEVICE_FILTER_PACKAGE UFBGA
	set_global_assignment -name DEVICE_FILTER_PIN_COUNT 672
	set_global_assignment -name DEVICE_FILTER_SPEED_GRADE 7
	set_global_assignment -name MIN_CORE_JUNCTION_TEMP "-40"
	set_global_assignment -name MAX_CORE_JUNCTION_TEMP 100
	set_global_assignment -name POWER_PRESET_COOLING_SOLUTION "23 MM HEAT SINK WITH 200 LFPM AIRFLOW"
	set_global_assignment -name POWER_BOARD_THERMAL_MODEL "NONE (CONSERVATIVE)"
	set_global_assignment -name PARTITION_NETLIST_TYPE SOURCE -section_id Top
	set_global_assignment -name PARTITION_FITTER_PRESERVATION_LEVEL PLACEMENT_AND_ROUTING -section_id Top
	set_global_assignment -name PARTITION_COLOR 16764057 -section_id Top
	set_global_assignment -name VHDL_INPUT_VERSION VHDL_2008
	set_global_assignment -name VHDL_SHOW_LMF_MAPPING_MESSAGES OFF
	set_global_assignment -name PROJECT_IP_REGENERATION_POLICY ALWAYS_REGENERATE_IP
	set_global_assignment -name EDA_SIMULATION_TOOL "Riviera-PRO (VHDL)"
	set_global_assignment -name EDA_TIME_SCALE "1 ps" -section_id eda_simulation
	set_global_assignment -name EDA_OUTPUT_DATA_FORMAT VHDL -section_id eda_simulation
	set_global_assignment -name EDA_GENERATE_FUNCTIONAL_NETLIST OFF -section_id eda_board_design_timing
	set_global_assignment -name EDA_GENERATE_FUNCTIONAL_NETLIST OFF -section_id eda_board_design_symbol
	set_global_assignment -name EDA_GENERATE_FUNCTIONAL_NETLIST OFF -section_id eda_board_design_signal_integrity
	set_global_assignment -name EDA_GENERATE_FUNCTIONAL_NETLIST OFF -section_id eda_board_design_boundary_scan
	set_global_assignment -name OPTIMIZATION_MODE "HIGH PERFORMANCE EFFORT"
	set_global_assignment -name NUM_PARALLEL_PROCESSORS ALL
	set_global_assignment -name ENABLE_SIGNALTAP ON
	set_global_assignment -name USE_SIGNALTAP_FILE SignalTap_SinewaveVerify.stp
	set_global_assignment -name VHDL_FILE ../source/xy_counter.vhd
	set_global_assignment -name SYSTEMVERILOG_FILE ../source/sin_cos_generate.sv
	set_global_assignment -name VHDL_FILE ../source/CordicRotateNew.vhd
	set_global_assignment -name VHDL_FILE ../source/ATAN_16bX12.vhd
	set_global_assignment -name QIP_FILE software/CETBase/mem_init/meminit.qip
	set_global_assignment -name QSYS_FILE NiosBase.qsys
	set_global_assignment -name QIP_FILE ../ip/main_pll.qip
	set_global_assignment -name VHDL_FILE ../source/DE10_NANO.vhd
	set_global_assignment -name VHDL_FILE ../source/Basic_Data_Types.vhd
	set_global_assignment -name SIGNALTAP_FILE SignalTap_SinewaveVerify.stp
	set_global_assignment -name SYSTEMVERILOG_FILE ../source/three_phase.sv
	set_global_assignment -name SLD_FILE db/SignalTap_SinewaveVerify_auto_stripped.stp
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ADC_CONVST
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ADC_SCK
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ADC_SDI
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ADC_SDO
	set_location_assignment PIN_U9 -to ADC_CONVST
	set_location_assignment PIN_V10 -to ADC_SCK
	set_location_assignment PIN_AC4 -to ADC_SDI
	set_location_assignment PIN_AD4 -to ADC_SDO
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FPGA_CLK1_50
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FPGA_CLK2_50
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FPGA_CLK3_50
	set_location_assignment PIN_V11 -to FPGA_CLK1_50
	set_location_assignment PIN_Y13 -to FPGA_CLK2_50
	set_location_assignment PIN_E11 -to FPGA_CLK3_50
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to KEY[0]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to KEY[1]
	set_location_assignment PIN_AH17 -to KEY[0]
	set_location_assignment PIN_AH16 -to KEY[1]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LED[0]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LED[1]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LED[2]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LED[3]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LED[4]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LED[5]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LED[6]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LED[7]
	set_location_assignment PIN_W15 -to LED[0]
	set_location_assignment PIN_AA24 -to LED[1]
	set_location_assignment PIN_V16 -to LED[2]
	set_location_assignment PIN_V15 -to LED[3]
	set_location_assignment PIN_AF26 -to LED[4]
	set_location_assignment PIN_AE26 -to LED[5]
	set_location_assignment PIN_Y16 -to LED[6]
	set_location_assignment PIN_AA23 -to LED[7]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW[0]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW[1]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW[2]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW[3]
	set_location_assignment PIN_Y24 -to SW[0]
	set_location_assignment PIN_W24 -to SW[1]
	set_location_assignment PIN_W21 -to SW[2]
	set_location_assignment PIN_W20 -to SW[3]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[0]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[1]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[2]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[3]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[4]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[5]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[6]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[7]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[8]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[9]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[10]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[11]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[12]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[13]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[14]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[15]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[16]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[17]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[18]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[19]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[20]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[21]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[22]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[23]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[24]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[25]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[26]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[27]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[28]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[29]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[30]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[31]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[32]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[33]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[34]
	set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO[35]
	set_location_assignment PIN_Y15 -to GPIO[0]
	set_location_assignment PIN_AC24 -to GPIO[1]
	set_location_assignment PIN_AA15 -to GPIO[2]
	set_location_assignment PIN_AD26 -to GPIO[3]
	set_location_assignment PIN_AG28 -to GPIO[4]
	set_location_assignment PIN_AF28 -to GPIO[5]
	set_location_assignment PIN_AE25 -to GPIO[6]
	set_location_assignment PIN_AF27 -to GPIO[7]
	set_location_assignment PIN_AG26 -to GPIO[8]
	set_location_assignment PIN_AG25 -to GPIO[10]
	set_location_assignment PIN_AH24 -to GPIO[12]
	set_location_assignment PIN_AF25 -to GPIO[13]
	set_location_assignment PIN_AG23 -to GPIO[14]
	set_location_assignment PIN_AF23 -to GPIO[15]
	set_location_assignment PIN_AG24 -to GPIO[16]
	set_location_assignment PIN_AH22 -to GPIO[17]
	set_location_assignment PIN_AH21 -to GPIO[18]
	set_location_assignment PIN_AG21 -to GPIO[19]
	set_location_assignment PIN_AH23 -to GPIO[20]
	set_location_assignment PIN_AA20 -to GPIO[21]
	set_location_assignment PIN_AF22 -to GPIO[22]
	set_location_assignment PIN_AE22 -to GPIO[23]
	set_location_assignment PIN_AG20 -to GPIO[24]
	set_location_assignment PIN_AF21 -to GPIO[25]
	set_location_assignment PIN_AG19 -to GPIO[26]
	set_location_assignment PIN_AH19 -to GPIO[27]
	set_location_assignment PIN_AG18 -to GPIO[28]
	set_location_assignment PIN_AH18 -to GPIO[29]
	set_location_assignment PIN_AF18 -to GPIO[30]
	set_location_assignment PIN_AF20 -to GPIO[31]
	set_location_assignment PIN_AG15 -to GPIO[32]
	set_location_assignment PIN_AE20 -to GPIO[33]
	set_location_assignment PIN_AE19 -to GPIO[34]
	set_location_assignment PIN_AE17 -to GPIO[35]
	set_location_assignment PIN_AH27 -to GPIO_9
	set_location_assignment PIN_AH26 -to GPIO_11
	set_instance_assignment -name PARTITION_HIERARCHY root_partition -to | -section_id Top

	# Commit assignments
	export_assignments
	
	# Build project
	#load_package flow
	#execute_flow -compile

	# Close project
	if {$need_to_close_project} {
		project_close
	}
}
