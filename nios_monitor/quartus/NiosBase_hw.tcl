# _hw.tcl file for NiosBase
package require -exact qsys 14.0

# module properties
set_module_property NAME {NiosBase_export}
set_module_property DISPLAY_NAME {NiosBase_export_display}

# default module properties
set_module_property VERSION {1.0}
set_module_property GROUP {default group}
set_module_property DESCRIPTION {default description}
set_module_property AUTHOR {author}

set_module_property COMPOSITION_CALLBACK compose
set_module_property opaque_address_map false

proc compose { } {
    # Instances and instance parameters
    # (disabled instances are intentionally culled)
    add_instance clk_0 clock_source 20.1
    set_instance_parameter_value clk_0 {clockFrequency} {50000000.0}
    set_instance_parameter_value clk_0 {clockFrequencyKnown} {1}
    set_instance_parameter_value clk_0 {resetSynchronousEdges} {NONE}

    add_instance i_reg16_0 altera_avalon_pio 20.1
    set_instance_parameter_value i_reg16_0 {bitClearingEdgeCapReg} {1}
    set_instance_parameter_value i_reg16_0 {bitModifyingOutReg} {0}
    set_instance_parameter_value i_reg16_0 {captureEdge} {0}
    set_instance_parameter_value i_reg16_0 {direction} {Input}
    set_instance_parameter_value i_reg16_0 {edgeType} {RISING}
    set_instance_parameter_value i_reg16_0 {generateIRQ} {0}
    set_instance_parameter_value i_reg16_0 {irqType} {LEVEL}
    set_instance_parameter_value i_reg16_0 {resetValue} {0.0}
    set_instance_parameter_value i_reg16_0 {simDoTestBenchWiring} {0}
    set_instance_parameter_value i_reg16_0 {simDrivenValue} {0.0}
    set_instance_parameter_value i_reg16_0 {width} {16}

    add_instance i_reg16_1 altera_avalon_pio 20.1
    set_instance_parameter_value i_reg16_1 {bitClearingEdgeCapReg} {1}
    set_instance_parameter_value i_reg16_1 {bitModifyingOutReg} {0}
    set_instance_parameter_value i_reg16_1 {captureEdge} {0}
    set_instance_parameter_value i_reg16_1 {direction} {Input}
    set_instance_parameter_value i_reg16_1 {edgeType} {RISING}
    set_instance_parameter_value i_reg16_1 {generateIRQ} {0}
    set_instance_parameter_value i_reg16_1 {irqType} {LEVEL}
    set_instance_parameter_value i_reg16_1 {resetValue} {0.0}
    set_instance_parameter_value i_reg16_1 {simDoTestBenchWiring} {0}
    set_instance_parameter_value i_reg16_1 {simDrivenValue} {0.0}
    set_instance_parameter_value i_reg16_1 {width} {16}

    add_instance i_reg16_2 altera_avalon_pio 20.1
    set_instance_parameter_value i_reg16_2 {bitClearingEdgeCapReg} {1}
    set_instance_parameter_value i_reg16_2 {bitModifyingOutReg} {0}
    set_instance_parameter_value i_reg16_2 {captureEdge} {0}
    set_instance_parameter_value i_reg16_2 {direction} {Input}
    set_instance_parameter_value i_reg16_2 {edgeType} {RISING}
    set_instance_parameter_value i_reg16_2 {generateIRQ} {0}
    set_instance_parameter_value i_reg16_2 {irqType} {LEVEL}
    set_instance_parameter_value i_reg16_2 {resetValue} {0.0}
    set_instance_parameter_value i_reg16_2 {simDoTestBenchWiring} {0}
    set_instance_parameter_value i_reg16_2 {simDrivenValue} {0.0}
    set_instance_parameter_value i_reg16_2 {width} {16}

    add_instance i_reg16_3 altera_avalon_pio 20.1
    set_instance_parameter_value i_reg16_3 {bitClearingEdgeCapReg} {1}
    set_instance_parameter_value i_reg16_3 {bitModifyingOutReg} {0}
    set_instance_parameter_value i_reg16_3 {captureEdge} {0}
    set_instance_parameter_value i_reg16_3 {direction} {Input}
    set_instance_parameter_value i_reg16_3 {edgeType} {RISING}
    set_instance_parameter_value i_reg16_3 {generateIRQ} {0}
    set_instance_parameter_value i_reg16_3 {irqType} {LEVEL}
    set_instance_parameter_value i_reg16_3 {resetValue} {0.0}
    set_instance_parameter_value i_reg16_3 {simDoTestBenchWiring} {0}
    set_instance_parameter_value i_reg16_3 {simDrivenValue} {0.0}
    set_instance_parameter_value i_reg16_3 {width} {16}

    add_instance i_reg16_4 altera_avalon_pio 20.1
    set_instance_parameter_value i_reg16_4 {bitClearingEdgeCapReg} {1}
    set_instance_parameter_value i_reg16_4 {bitModifyingOutReg} {0}
    set_instance_parameter_value i_reg16_4 {captureEdge} {0}
    set_instance_parameter_value i_reg16_4 {direction} {Input}
    set_instance_parameter_value i_reg16_4 {edgeType} {RISING}
    set_instance_parameter_value i_reg16_4 {generateIRQ} {0}
    set_instance_parameter_value i_reg16_4 {irqType} {LEVEL}
    set_instance_parameter_value i_reg16_4 {resetValue} {0.0}
    set_instance_parameter_value i_reg16_4 {simDoTestBenchWiring} {0}
    set_instance_parameter_value i_reg16_4 {simDrivenValue} {0.0}
    set_instance_parameter_value i_reg16_4 {width} {16}

    add_instance i_reg16_5 altera_avalon_pio 20.1
    set_instance_parameter_value i_reg16_5 {bitClearingEdgeCapReg} {1}
    set_instance_parameter_value i_reg16_5 {bitModifyingOutReg} {0}
    set_instance_parameter_value i_reg16_5 {captureEdge} {0}
    set_instance_parameter_value i_reg16_5 {direction} {Input}
    set_instance_parameter_value i_reg16_5 {edgeType} {RISING}
    set_instance_parameter_value i_reg16_5 {generateIRQ} {0}
    set_instance_parameter_value i_reg16_5 {irqType} {LEVEL}
    set_instance_parameter_value i_reg16_5 {resetValue} {0.0}
    set_instance_parameter_value i_reg16_5 {simDoTestBenchWiring} {0}
    set_instance_parameter_value i_reg16_5 {simDrivenValue} {0.0}
    set_instance_parameter_value i_reg16_5 {width} {16}

    add_instance i_reg16_6 altera_avalon_pio 20.1
    set_instance_parameter_value i_reg16_6 {bitClearingEdgeCapReg} {1}
    set_instance_parameter_value i_reg16_6 {bitModifyingOutReg} {0}
    set_instance_parameter_value i_reg16_6 {captureEdge} {0}
    set_instance_parameter_value i_reg16_6 {direction} {Input}
    set_instance_parameter_value i_reg16_6 {edgeType} {RISING}
    set_instance_parameter_value i_reg16_6 {generateIRQ} {0}
    set_instance_parameter_value i_reg16_6 {irqType} {LEVEL}
    set_instance_parameter_value i_reg16_6 {resetValue} {0.0}
    set_instance_parameter_value i_reg16_6 {simDoTestBenchWiring} {0}
    set_instance_parameter_value i_reg16_6 {simDrivenValue} {0.0}
    set_instance_parameter_value i_reg16_6 {width} {16}

    add_instance i_reg32_0 altera_avalon_pio 20.1
    set_instance_parameter_value i_reg32_0 {bitClearingEdgeCapReg} {1}
    set_instance_parameter_value i_reg32_0 {bitModifyingOutReg} {0}
    set_instance_parameter_value i_reg32_0 {captureEdge} {1}
    set_instance_parameter_value i_reg32_0 {direction} {Input}
    set_instance_parameter_value i_reg32_0 {edgeType} {RISING}
    set_instance_parameter_value i_reg32_0 {generateIRQ} {1}
    set_instance_parameter_value i_reg32_0 {irqType} {LEVEL}
    set_instance_parameter_value i_reg32_0 {resetValue} {0.0}
    set_instance_parameter_value i_reg32_0 {simDoTestBenchWiring} {0}
    set_instance_parameter_value i_reg32_0 {simDrivenValue} {0.0}
    set_instance_parameter_value i_reg32_0 {width} {32}

    add_instance i_reg32_1 altera_avalon_pio 20.1
    set_instance_parameter_value i_reg32_1 {bitClearingEdgeCapReg} {1}
    set_instance_parameter_value i_reg32_1 {bitModifyingOutReg} {0}
    set_instance_parameter_value i_reg32_1 {captureEdge} {0}
    set_instance_parameter_value i_reg32_1 {direction} {Input}
    set_instance_parameter_value i_reg32_1 {edgeType} {RISING}
    set_instance_parameter_value i_reg32_1 {generateIRQ} {0}
    set_instance_parameter_value i_reg32_1 {irqType} {LEVEL}
    set_instance_parameter_value i_reg32_1 {resetValue} {0.0}
    set_instance_parameter_value i_reg32_1 {simDoTestBenchWiring} {0}
    set_instance_parameter_value i_reg32_1 {simDrivenValue} {0.0}
    set_instance_parameter_value i_reg32_1 {width} {32}

    add_instance i_reg32_2 altera_avalon_pio 20.1
    set_instance_parameter_value i_reg32_2 {bitClearingEdgeCapReg} {1}
    set_instance_parameter_value i_reg32_2 {bitModifyingOutReg} {0}
    set_instance_parameter_value i_reg32_2 {captureEdge} {0}
    set_instance_parameter_value i_reg32_2 {direction} {Input}
    set_instance_parameter_value i_reg32_2 {edgeType} {RISING}
    set_instance_parameter_value i_reg32_2 {generateIRQ} {0}
    set_instance_parameter_value i_reg32_2 {irqType} {LEVEL}
    set_instance_parameter_value i_reg32_2 {resetValue} {0.0}
    set_instance_parameter_value i_reg32_2 {simDoTestBenchWiring} {0}
    set_instance_parameter_value i_reg32_2 {simDrivenValue} {0.0}
    set_instance_parameter_value i_reg32_2 {width} {32}

    add_instance i_reg32_3 altera_avalon_pio 20.1
    set_instance_parameter_value i_reg32_3 {bitClearingEdgeCapReg} {1}
    set_instance_parameter_value i_reg32_3 {bitModifyingOutReg} {0}
    set_instance_parameter_value i_reg32_3 {captureEdge} {0}
    set_instance_parameter_value i_reg32_3 {direction} {Input}
    set_instance_parameter_value i_reg32_3 {edgeType} {RISING}
    set_instance_parameter_value i_reg32_3 {generateIRQ} {0}
    set_instance_parameter_value i_reg32_3 {irqType} {LEVEL}
    set_instance_parameter_value i_reg32_3 {resetValue} {0.0}
    set_instance_parameter_value i_reg32_3 {simDoTestBenchWiring} {0}
    set_instance_parameter_value i_reg32_3 {simDrivenValue} {0.0}
    set_instance_parameter_value i_reg32_3 {width} {32}

    add_instance i_reg32_4 altera_avalon_pio 20.1
    set_instance_parameter_value i_reg32_4 {bitClearingEdgeCapReg} {1}
    set_instance_parameter_value i_reg32_4 {bitModifyingOutReg} {0}
    set_instance_parameter_value i_reg32_4 {captureEdge} {0}
    set_instance_parameter_value i_reg32_4 {direction} {Input}
    set_instance_parameter_value i_reg32_4 {edgeType} {RISING}
    set_instance_parameter_value i_reg32_4 {generateIRQ} {0}
    set_instance_parameter_value i_reg32_4 {irqType} {LEVEL}
    set_instance_parameter_value i_reg32_4 {resetValue} {0.0}
    set_instance_parameter_value i_reg32_4 {simDoTestBenchWiring} {0}
    set_instance_parameter_value i_reg32_4 {simDrivenValue} {0.0}
    set_instance_parameter_value i_reg32_4 {width} {32}

    add_instance i_reg32_5 altera_avalon_pio 20.1
    set_instance_parameter_value i_reg32_5 {bitClearingEdgeCapReg} {1}
    set_instance_parameter_value i_reg32_5 {bitModifyingOutReg} {0}
    set_instance_parameter_value i_reg32_5 {captureEdge} {0}
    set_instance_parameter_value i_reg32_5 {direction} {Input}
    set_instance_parameter_value i_reg32_5 {edgeType} {RISING}
    set_instance_parameter_value i_reg32_5 {generateIRQ} {0}
    set_instance_parameter_value i_reg32_5 {irqType} {LEVEL}
    set_instance_parameter_value i_reg32_5 {resetValue} {0.0}
    set_instance_parameter_value i_reg32_5 {simDoTestBenchWiring} {0}
    set_instance_parameter_value i_reg32_5 {simDrivenValue} {0.0}
    set_instance_parameter_value i_reg32_5 {width} {32}

    add_instance i_reg32_6 altera_avalon_pio 20.1
    set_instance_parameter_value i_reg32_6 {bitClearingEdgeCapReg} {1}
    set_instance_parameter_value i_reg32_6 {bitModifyingOutReg} {0}
    set_instance_parameter_value i_reg32_6 {captureEdge} {0}
    set_instance_parameter_value i_reg32_6 {direction} {Input}
    set_instance_parameter_value i_reg32_6 {edgeType} {RISING}
    set_instance_parameter_value i_reg32_6 {generateIRQ} {0}
    set_instance_parameter_value i_reg32_6 {irqType} {LEVEL}
    set_instance_parameter_value i_reg32_6 {resetValue} {0.0}
    set_instance_parameter_value i_reg32_6 {simDoTestBenchWiring} {0}
    set_instance_parameter_value i_reg32_6 {simDrivenValue} {0.0}
    set_instance_parameter_value i_reg32_6 {width} {32}

    add_instance i_reg32_7 altera_avalon_pio 20.1
    set_instance_parameter_value i_reg32_7 {bitClearingEdgeCapReg} {1}
    set_instance_parameter_value i_reg32_7 {bitModifyingOutReg} {0}
    set_instance_parameter_value i_reg32_7 {captureEdge} {0}
    set_instance_parameter_value i_reg32_7 {direction} {Input}
    set_instance_parameter_value i_reg32_7 {edgeType} {RISING}
    set_instance_parameter_value i_reg32_7 {generateIRQ} {0}
    set_instance_parameter_value i_reg32_7 {irqType} {LEVEL}
    set_instance_parameter_value i_reg32_7 {resetValue} {0.0}
    set_instance_parameter_value i_reg32_7 {simDoTestBenchWiring} {0}
    set_instance_parameter_value i_reg32_7 {simDrivenValue} {0.0}
    set_instance_parameter_value i_reg32_7 {width} {32}

    add_instance nios2_gen2_0 altera_nios2_gen2 20.1
    set_instance_parameter_value nios2_gen2_0 {bht_ramBlockType} {Automatic}
    set_instance_parameter_value nios2_gen2_0 {breakOffset} {32}
    set_instance_parameter_value nios2_gen2_0 {breakSlave} {None}
    set_instance_parameter_value nios2_gen2_0 {cdx_enabled} {0}
    set_instance_parameter_value nios2_gen2_0 {cpuArchRev} {1}
    set_instance_parameter_value nios2_gen2_0 {cpuID} {0}
    set_instance_parameter_value nios2_gen2_0 {cpuReset} {0}
    set_instance_parameter_value nios2_gen2_0 {data_master_high_performance_paddr_base} {0}
    set_instance_parameter_value nios2_gen2_0 {data_master_high_performance_paddr_size} {0.0}
    set_instance_parameter_value nios2_gen2_0 {data_master_paddr_base} {0}
    set_instance_parameter_value nios2_gen2_0 {data_master_paddr_size} {0.0}
    set_instance_parameter_value nios2_gen2_0 {dcache_bursts} {false}
    set_instance_parameter_value nios2_gen2_0 {dcache_numTCDM} {0}
    set_instance_parameter_value nios2_gen2_0 {dcache_ramBlockType} {Automatic}
    set_instance_parameter_value nios2_gen2_0 {dcache_size} {2048}
    set_instance_parameter_value nios2_gen2_0 {dcache_tagramBlockType} {Automatic}
    set_instance_parameter_value nios2_gen2_0 {dcache_victim_buf_impl} {ram}
    set_instance_parameter_value nios2_gen2_0 {debug_OCIOnchipTrace} {_128}
    set_instance_parameter_value nios2_gen2_0 {debug_assignJtagInstanceID} {0}
    set_instance_parameter_value nios2_gen2_0 {debug_datatrigger} {0}
    set_instance_parameter_value nios2_gen2_0 {debug_debugReqSignals} {0}
    set_instance_parameter_value nios2_gen2_0 {debug_enabled} {1}
    set_instance_parameter_value nios2_gen2_0 {debug_hwbreakpoint} {0}
    set_instance_parameter_value nios2_gen2_0 {debug_jtagInstanceID} {0}
    set_instance_parameter_value nios2_gen2_0 {debug_traceStorage} {onchip_trace}
    set_instance_parameter_value nios2_gen2_0 {debug_traceType} {none}
    set_instance_parameter_value nios2_gen2_0 {debug_triggerArming} {1}
    set_instance_parameter_value nios2_gen2_0 {dividerType} {no_div}
    set_instance_parameter_value nios2_gen2_0 {exceptionOffset} {32}
    set_instance_parameter_value nios2_gen2_0 {exceptionSlave} {onchip_memory2_0.s1}
    set_instance_parameter_value nios2_gen2_0 {fa_cache_line} {2}
    set_instance_parameter_value nios2_gen2_0 {fa_cache_linesize} {0}
    set_instance_parameter_value nios2_gen2_0 {flash_instruction_master_paddr_base} {0}
    set_instance_parameter_value nios2_gen2_0 {flash_instruction_master_paddr_size} {0.0}
    set_instance_parameter_value nios2_gen2_0 {icache_burstType} {None}
    set_instance_parameter_value nios2_gen2_0 {icache_numTCIM} {0}
    set_instance_parameter_value nios2_gen2_0 {icache_ramBlockType} {Automatic}
    set_instance_parameter_value nios2_gen2_0 {icache_size} {4096}
    set_instance_parameter_value nios2_gen2_0 {icache_tagramBlockType} {Automatic}
    set_instance_parameter_value nios2_gen2_0 {impl} {Tiny}
    set_instance_parameter_value nios2_gen2_0 {instruction_master_high_performance_paddr_base} {0}
    set_instance_parameter_value nios2_gen2_0 {instruction_master_high_performance_paddr_size} {0.0}
    set_instance_parameter_value nios2_gen2_0 {instruction_master_paddr_base} {0}
    set_instance_parameter_value nios2_gen2_0 {instruction_master_paddr_size} {0.0}
    set_instance_parameter_value nios2_gen2_0 {io_regionbase} {0}
    set_instance_parameter_value nios2_gen2_0 {io_regionsize} {0}
    set_instance_parameter_value nios2_gen2_0 {master_addr_map} {0}
    set_instance_parameter_value nios2_gen2_0 {mmu_TLBMissExcOffset} {0}
    set_instance_parameter_value nios2_gen2_0 {mmu_TLBMissExcSlave} {None}
    set_instance_parameter_value nios2_gen2_0 {mmu_autoAssignTlbPtrSz} {1}
    set_instance_parameter_value nios2_gen2_0 {mmu_enabled} {0}
    set_instance_parameter_value nios2_gen2_0 {mmu_processIDNumBits} {8}
    set_instance_parameter_value nios2_gen2_0 {mmu_ramBlockType} {Automatic}
    set_instance_parameter_value nios2_gen2_0 {mmu_tlbNumWays} {16}
    set_instance_parameter_value nios2_gen2_0 {mmu_tlbPtrSz} {7}
    set_instance_parameter_value nios2_gen2_0 {mmu_udtlbNumEntries} {6}
    set_instance_parameter_value nios2_gen2_0 {mmu_uitlbNumEntries} {4}
    set_instance_parameter_value nios2_gen2_0 {mpu_enabled} {0}
    set_instance_parameter_value nios2_gen2_0 {mpu_minDataRegionSize} {12}
    set_instance_parameter_value nios2_gen2_0 {mpu_minInstRegionSize} {12}
    set_instance_parameter_value nios2_gen2_0 {mpu_numOfDataRegion} {8}
    set_instance_parameter_value nios2_gen2_0 {mpu_numOfInstRegion} {8}
    set_instance_parameter_value nios2_gen2_0 {mpu_useLimit} {0}
    set_instance_parameter_value nios2_gen2_0 {mpx_enabled} {0}
    set_instance_parameter_value nios2_gen2_0 {mul_32_impl} {2}
    set_instance_parameter_value nios2_gen2_0 {mul_64_impl} {0}
    set_instance_parameter_value nios2_gen2_0 {mul_shift_choice} {0}
    set_instance_parameter_value nios2_gen2_0 {ocimem_ramBlockType} {Automatic}
    set_instance_parameter_value nios2_gen2_0 {ocimem_ramInit} {0}
    set_instance_parameter_value nios2_gen2_0 {regfile_ramBlockType} {Automatic}
    set_instance_parameter_value nios2_gen2_0 {register_file_por} {0}
    set_instance_parameter_value nios2_gen2_0 {resetOffset} {0}
    set_instance_parameter_value nios2_gen2_0 {resetSlave} {onchip_memory2_0.s1}
    set_instance_parameter_value nios2_gen2_0 {resetrequest_enabled} {1}
    set_instance_parameter_value nios2_gen2_0 {setting_HBreakTest} {0}
    set_instance_parameter_value nios2_gen2_0 {setting_HDLSimCachesCleared} {1}
    set_instance_parameter_value nios2_gen2_0 {setting_activateMonitors} {1}
    set_instance_parameter_value nios2_gen2_0 {setting_activateTestEndChecker} {0}
    set_instance_parameter_value nios2_gen2_0 {setting_activateTrace} {0}
    set_instance_parameter_value nios2_gen2_0 {setting_allow_break_inst} {0}
    set_instance_parameter_value nios2_gen2_0 {setting_alwaysEncrypt} {1}
    set_instance_parameter_value nios2_gen2_0 {setting_asic_add_scan_mode_input} {0}
    set_instance_parameter_value nios2_gen2_0 {setting_asic_enabled} {0}
    set_instance_parameter_value nios2_gen2_0 {setting_asic_synopsys_translate_on_off} {0}
    set_instance_parameter_value nios2_gen2_0 {setting_asic_third_party_synthesis} {0}
    set_instance_parameter_value nios2_gen2_0 {setting_avalonDebugPortPresent} {0}
    set_instance_parameter_value nios2_gen2_0 {setting_bhtPtrSz} {8}
    set_instance_parameter_value nios2_gen2_0 {setting_bigEndian} {0}
    set_instance_parameter_value nios2_gen2_0 {setting_branchpredictiontype} {Dynamic}
    set_instance_parameter_value nios2_gen2_0 {setting_breakslaveoveride} {0}
    set_instance_parameter_value nios2_gen2_0 {setting_clearXBitsLDNonBypass} {1}
    set_instance_parameter_value nios2_gen2_0 {setting_dc_ecc_present} {1}
    set_instance_parameter_value nios2_gen2_0 {setting_disable_tmr_inj} {0}
    set_instance_parameter_value nios2_gen2_0 {setting_disableocitrace} {0}
    set_instance_parameter_value nios2_gen2_0 {setting_dtcm_ecc_present} {1}
    set_instance_parameter_value nios2_gen2_0 {setting_ecc_present} {0}
    set_instance_parameter_value nios2_gen2_0 {setting_ecc_sim_test_ports} {0}
    set_instance_parameter_value nios2_gen2_0 {setting_exportHostDebugPort} {0}
    set_instance_parameter_value nios2_gen2_0 {setting_exportPCB} {0}
    set_instance_parameter_value nios2_gen2_0 {setting_export_large_RAMs} {0}
    set_instance_parameter_value nios2_gen2_0 {setting_exportdebuginfo} {0}
    set_instance_parameter_value nios2_gen2_0 {setting_exportvectors} {0}
    set_instance_parameter_value nios2_gen2_0 {setting_fast_register_read} {0}
    set_instance_parameter_value nios2_gen2_0 {setting_ic_ecc_present} {1}
    set_instance_parameter_value nios2_gen2_0 {setting_interruptControllerType} {Internal}
    set_instance_parameter_value nios2_gen2_0 {setting_itcm_ecc_present} {1}
    set_instance_parameter_value nios2_gen2_0 {setting_mmu_ecc_present} {1}
    set_instance_parameter_value nios2_gen2_0 {setting_oci_export_jtag_signals} {0}
    set_instance_parameter_value nios2_gen2_0 {setting_oci_version} {1}
    set_instance_parameter_value nios2_gen2_0 {setting_preciseIllegalMemAccessException} {0}
    set_instance_parameter_value nios2_gen2_0 {setting_removeRAMinit} {0}
    set_instance_parameter_value nios2_gen2_0 {setting_rf_ecc_present} {1}
    set_instance_parameter_value nios2_gen2_0 {setting_shadowRegisterSets} {0}
    set_instance_parameter_value nios2_gen2_0 {setting_showInternalSettings} {0}
    set_instance_parameter_value nios2_gen2_0 {setting_showUnpublishedSettings} {0}
    set_instance_parameter_value nios2_gen2_0 {setting_support31bitdcachebypass} {1}
    set_instance_parameter_value nios2_gen2_0 {setting_tmr_output_disable} {0}
    set_instance_parameter_value nios2_gen2_0 {setting_usedesignware} {0}
    set_instance_parameter_value nios2_gen2_0 {shift_rot_impl} {1}
    set_instance_parameter_value nios2_gen2_0 {tightly_coupled_data_master_0_paddr_base} {0}
    set_instance_parameter_value nios2_gen2_0 {tightly_coupled_data_master_0_paddr_size} {0.0}
    set_instance_parameter_value nios2_gen2_0 {tightly_coupled_data_master_1_paddr_base} {0}
    set_instance_parameter_value nios2_gen2_0 {tightly_coupled_data_master_1_paddr_size} {0.0}
    set_instance_parameter_value nios2_gen2_0 {tightly_coupled_data_master_2_paddr_base} {0}
    set_instance_parameter_value nios2_gen2_0 {tightly_coupled_data_master_2_paddr_size} {0.0}
    set_instance_parameter_value nios2_gen2_0 {tightly_coupled_data_master_3_paddr_base} {0}
    set_instance_parameter_value nios2_gen2_0 {tightly_coupled_data_master_3_paddr_size} {0.0}
    set_instance_parameter_value nios2_gen2_0 {tightly_coupled_instruction_master_0_paddr_base} {0}
    set_instance_parameter_value nios2_gen2_0 {tightly_coupled_instruction_master_0_paddr_size} {0.0}
    set_instance_parameter_value nios2_gen2_0 {tightly_coupled_instruction_master_1_paddr_base} {0}
    set_instance_parameter_value nios2_gen2_0 {tightly_coupled_instruction_master_1_paddr_size} {0.0}
    set_instance_parameter_value nios2_gen2_0 {tightly_coupled_instruction_master_2_paddr_base} {0}
    set_instance_parameter_value nios2_gen2_0 {tightly_coupled_instruction_master_2_paddr_size} {0.0}
    set_instance_parameter_value nios2_gen2_0 {tightly_coupled_instruction_master_3_paddr_base} {0}
    set_instance_parameter_value nios2_gen2_0 {tightly_coupled_instruction_master_3_paddr_size} {0.0}
    set_instance_parameter_value nios2_gen2_0 {tmr_enabled} {0}
    set_instance_parameter_value nios2_gen2_0 {tracefilename} {}
    set_instance_parameter_value nios2_gen2_0 {userDefinedSettings} {}

    add_instance o_reg32_0 altera_avalon_pio 20.1
    set_instance_parameter_value o_reg32_0 {bitClearingEdgeCapReg} {0}
    set_instance_parameter_value o_reg32_0 {bitModifyingOutReg} {0}
    set_instance_parameter_value o_reg32_0 {captureEdge} {0}
    set_instance_parameter_value o_reg32_0 {direction} {Output}
    set_instance_parameter_value o_reg32_0 {edgeType} {RISING}
    set_instance_parameter_value o_reg32_0 {generateIRQ} {0}
    set_instance_parameter_value o_reg32_0 {irqType} {LEVEL}
    set_instance_parameter_value o_reg32_0 {resetValue} {0.0}
    set_instance_parameter_value o_reg32_0 {simDoTestBenchWiring} {0}
    set_instance_parameter_value o_reg32_0 {simDrivenValue} {0.0}
    set_instance_parameter_value o_reg32_0 {width} {32}

    add_instance o_reg32_1 altera_avalon_pio 20.1
    set_instance_parameter_value o_reg32_1 {bitClearingEdgeCapReg} {0}
    set_instance_parameter_value o_reg32_1 {bitModifyingOutReg} {0}
    set_instance_parameter_value o_reg32_1 {captureEdge} {0}
    set_instance_parameter_value o_reg32_1 {direction} {Output}
    set_instance_parameter_value o_reg32_1 {edgeType} {RISING}
    set_instance_parameter_value o_reg32_1 {generateIRQ} {0}
    set_instance_parameter_value o_reg32_1 {irqType} {LEVEL}
    set_instance_parameter_value o_reg32_1 {resetValue} {0.0}
    set_instance_parameter_value o_reg32_1 {simDoTestBenchWiring} {0}
    set_instance_parameter_value o_reg32_1 {simDrivenValue} {0.0}
    set_instance_parameter_value o_reg32_1 {width} {32}

    add_instance o_reg32_10 altera_avalon_pio 20.1
    set_instance_parameter_value o_reg32_10 {bitClearingEdgeCapReg} {0}
    set_instance_parameter_value o_reg32_10 {bitModifyingOutReg} {0}
    set_instance_parameter_value o_reg32_10 {captureEdge} {0}
    set_instance_parameter_value o_reg32_10 {direction} {Output}
    set_instance_parameter_value o_reg32_10 {edgeType} {RISING}
    set_instance_parameter_value o_reg32_10 {generateIRQ} {0}
    set_instance_parameter_value o_reg32_10 {irqType} {LEVEL}
    set_instance_parameter_value o_reg32_10 {resetValue} {0.0}
    set_instance_parameter_value o_reg32_10 {simDoTestBenchWiring} {0}
    set_instance_parameter_value o_reg32_10 {simDrivenValue} {0.0}
    set_instance_parameter_value o_reg32_10 {width} {32}

    add_instance o_reg32_11 altera_avalon_pio 20.1
    set_instance_parameter_value o_reg32_11 {bitClearingEdgeCapReg} {0}
    set_instance_parameter_value o_reg32_11 {bitModifyingOutReg} {0}
    set_instance_parameter_value o_reg32_11 {captureEdge} {0}
    set_instance_parameter_value o_reg32_11 {direction} {Output}
    set_instance_parameter_value o_reg32_11 {edgeType} {RISING}
    set_instance_parameter_value o_reg32_11 {generateIRQ} {0}
    set_instance_parameter_value o_reg32_11 {irqType} {LEVEL}
    set_instance_parameter_value o_reg32_11 {resetValue} {0.0}
    set_instance_parameter_value o_reg32_11 {simDoTestBenchWiring} {0}
    set_instance_parameter_value o_reg32_11 {simDrivenValue} {0.0}
    set_instance_parameter_value o_reg32_11 {width} {32}

    add_instance o_reg32_2 altera_avalon_pio 20.1
    set_instance_parameter_value o_reg32_2 {bitClearingEdgeCapReg} {0}
    set_instance_parameter_value o_reg32_2 {bitModifyingOutReg} {0}
    set_instance_parameter_value o_reg32_2 {captureEdge} {0}
    set_instance_parameter_value o_reg32_2 {direction} {Output}
    set_instance_parameter_value o_reg32_2 {edgeType} {RISING}
    set_instance_parameter_value o_reg32_2 {generateIRQ} {0}
    set_instance_parameter_value o_reg32_2 {irqType} {LEVEL}
    set_instance_parameter_value o_reg32_2 {resetValue} {0.0}
    set_instance_parameter_value o_reg32_2 {simDoTestBenchWiring} {0}
    set_instance_parameter_value o_reg32_2 {simDrivenValue} {0.0}
    set_instance_parameter_value o_reg32_2 {width} {32}

    add_instance o_reg32_3 altera_avalon_pio 20.1
    set_instance_parameter_value o_reg32_3 {bitClearingEdgeCapReg} {0}
    set_instance_parameter_value o_reg32_3 {bitModifyingOutReg} {0}
    set_instance_parameter_value o_reg32_3 {captureEdge} {0}
    set_instance_parameter_value o_reg32_3 {direction} {Output}
    set_instance_parameter_value o_reg32_3 {edgeType} {RISING}
    set_instance_parameter_value o_reg32_3 {generateIRQ} {0}
    set_instance_parameter_value o_reg32_3 {irqType} {LEVEL}
    set_instance_parameter_value o_reg32_3 {resetValue} {0.0}
    set_instance_parameter_value o_reg32_3 {simDoTestBenchWiring} {0}
    set_instance_parameter_value o_reg32_3 {simDrivenValue} {0.0}
    set_instance_parameter_value o_reg32_3 {width} {32}

    add_instance o_reg32_4 altera_avalon_pio 20.1
    set_instance_parameter_value o_reg32_4 {bitClearingEdgeCapReg} {0}
    set_instance_parameter_value o_reg32_4 {bitModifyingOutReg} {0}
    set_instance_parameter_value o_reg32_4 {captureEdge} {0}
    set_instance_parameter_value o_reg32_4 {direction} {Output}
    set_instance_parameter_value o_reg32_4 {edgeType} {RISING}
    set_instance_parameter_value o_reg32_4 {generateIRQ} {0}
    set_instance_parameter_value o_reg32_4 {irqType} {LEVEL}
    set_instance_parameter_value o_reg32_4 {resetValue} {0.0}
    set_instance_parameter_value o_reg32_4 {simDoTestBenchWiring} {0}
    set_instance_parameter_value o_reg32_4 {simDrivenValue} {0.0}
    set_instance_parameter_value o_reg32_4 {width} {32}

    add_instance o_reg32_5 altera_avalon_pio 20.1
    set_instance_parameter_value o_reg32_5 {bitClearingEdgeCapReg} {0}
    set_instance_parameter_value o_reg32_5 {bitModifyingOutReg} {0}
    set_instance_parameter_value o_reg32_5 {captureEdge} {0}
    set_instance_parameter_value o_reg32_5 {direction} {Output}
    set_instance_parameter_value o_reg32_5 {edgeType} {RISING}
    set_instance_parameter_value o_reg32_5 {generateIRQ} {0}
    set_instance_parameter_value o_reg32_5 {irqType} {LEVEL}
    set_instance_parameter_value o_reg32_5 {resetValue} {0.0}
    set_instance_parameter_value o_reg32_5 {simDoTestBenchWiring} {0}
    set_instance_parameter_value o_reg32_5 {simDrivenValue} {0.0}
    set_instance_parameter_value o_reg32_5 {width} {32}

    add_instance o_reg32_6 altera_avalon_pio 20.1
    set_instance_parameter_value o_reg32_6 {bitClearingEdgeCapReg} {0}
    set_instance_parameter_value o_reg32_6 {bitModifyingOutReg} {0}
    set_instance_parameter_value o_reg32_6 {captureEdge} {0}
    set_instance_parameter_value o_reg32_6 {direction} {Output}
    set_instance_parameter_value o_reg32_6 {edgeType} {RISING}
    set_instance_parameter_value o_reg32_6 {generateIRQ} {0}
    set_instance_parameter_value o_reg32_6 {irqType} {LEVEL}
    set_instance_parameter_value o_reg32_6 {resetValue} {0.0}
    set_instance_parameter_value o_reg32_6 {simDoTestBenchWiring} {0}
    set_instance_parameter_value o_reg32_6 {simDrivenValue} {0.0}
    set_instance_parameter_value o_reg32_6 {width} {32}

    add_instance o_reg32_7 altera_avalon_pio 20.1
    set_instance_parameter_value o_reg32_7 {bitClearingEdgeCapReg} {0}
    set_instance_parameter_value o_reg32_7 {bitModifyingOutReg} {0}
    set_instance_parameter_value o_reg32_7 {captureEdge} {0}
    set_instance_parameter_value o_reg32_7 {direction} {Output}
    set_instance_parameter_value o_reg32_7 {edgeType} {RISING}
    set_instance_parameter_value o_reg32_7 {generateIRQ} {0}
    set_instance_parameter_value o_reg32_7 {irqType} {LEVEL}
    set_instance_parameter_value o_reg32_7 {resetValue} {0.0}
    set_instance_parameter_value o_reg32_7 {simDoTestBenchWiring} {0}
    set_instance_parameter_value o_reg32_7 {simDrivenValue} {0.0}
    set_instance_parameter_value o_reg32_7 {width} {32}

    add_instance o_reg32_8 altera_avalon_pio 20.1
    set_instance_parameter_value o_reg32_8 {bitClearingEdgeCapReg} {0}
    set_instance_parameter_value o_reg32_8 {bitModifyingOutReg} {0}
    set_instance_parameter_value o_reg32_8 {captureEdge} {0}
    set_instance_parameter_value o_reg32_8 {direction} {Output}
    set_instance_parameter_value o_reg32_8 {edgeType} {RISING}
    set_instance_parameter_value o_reg32_8 {generateIRQ} {0}
    set_instance_parameter_value o_reg32_8 {irqType} {LEVEL}
    set_instance_parameter_value o_reg32_8 {resetValue} {0.0}
    set_instance_parameter_value o_reg32_8 {simDoTestBenchWiring} {0}
    set_instance_parameter_value o_reg32_8 {simDrivenValue} {0.0}
    set_instance_parameter_value o_reg32_8 {width} {32}

    add_instance o_reg32_9 altera_avalon_pio 20.1
    set_instance_parameter_value o_reg32_9 {bitClearingEdgeCapReg} {0}
    set_instance_parameter_value o_reg32_9 {bitModifyingOutReg} {0}
    set_instance_parameter_value o_reg32_9 {captureEdge} {0}
    set_instance_parameter_value o_reg32_9 {direction} {Output}
    set_instance_parameter_value o_reg32_9 {edgeType} {RISING}
    set_instance_parameter_value o_reg32_9 {generateIRQ} {0}
    set_instance_parameter_value o_reg32_9 {irqType} {LEVEL}
    set_instance_parameter_value o_reg32_9 {resetValue} {0.0}
    set_instance_parameter_value o_reg32_9 {simDoTestBenchWiring} {0}
    set_instance_parameter_value o_reg32_9 {simDrivenValue} {0.0}
    set_instance_parameter_value o_reg32_9 {width} {32}

    add_instance onchip_memory2_0 altera_avalon_onchip_memory2 20.1
    set_instance_parameter_value onchip_memory2_0 {allowInSystemMemoryContentEditor} {0}
    set_instance_parameter_value onchip_memory2_0 {blockType} {AUTO}
    set_instance_parameter_value onchip_memory2_0 {copyInitFile} {0}
    set_instance_parameter_value onchip_memory2_0 {dataWidth} {32}
    set_instance_parameter_value onchip_memory2_0 {dataWidth2} {32}
    set_instance_parameter_value onchip_memory2_0 {dualPort} {0}
    set_instance_parameter_value onchip_memory2_0 {ecc_enabled} {0}
    set_instance_parameter_value onchip_memory2_0 {enPRInitMode} {0}
    set_instance_parameter_value onchip_memory2_0 {enableDiffWidth} {0}
    set_instance_parameter_value onchip_memory2_0 {initMemContent} {1}
    set_instance_parameter_value onchip_memory2_0 {initializationFileName} {onchip_mem.hex}
    set_instance_parameter_value onchip_memory2_0 {instanceID} {NONE}
    set_instance_parameter_value onchip_memory2_0 {memorySize} {131072.0}
    set_instance_parameter_value onchip_memory2_0 {readDuringWriteMode} {DONT_CARE}
    set_instance_parameter_value onchip_memory2_0 {resetrequest_enabled} {1}
    set_instance_parameter_value onchip_memory2_0 {simAllowMRAMContentsFile} {0}
    set_instance_parameter_value onchip_memory2_0 {simMemInitOnlyFilename} {0}
    set_instance_parameter_value onchip_memory2_0 {singleClockOperation} {0}
    set_instance_parameter_value onchip_memory2_0 {slave1Latency} {1}
    set_instance_parameter_value onchip_memory2_0 {slave2Latency} {1}
    set_instance_parameter_value onchip_memory2_0 {useNonDefaultInitFile} {0}
    set_instance_parameter_value onchip_memory2_0 {useShallowMemBlocks} {0}
    set_instance_parameter_value onchip_memory2_0 {writable} {1}

    add_instance timer_0 altera_avalon_timer 20.1
    set_instance_parameter_value timer_0 {alwaysRun} {0}
    set_instance_parameter_value timer_0 {counterSize} {32}
    set_instance_parameter_value timer_0 {fixedPeriod} {0}
    set_instance_parameter_value timer_0 {period} {1}
    set_instance_parameter_value timer_0 {periodUnits} {MSEC}
    set_instance_parameter_value timer_0 {resetOutput} {0}
    set_instance_parameter_value timer_0 {snapshot} {1}
    set_instance_parameter_value timer_0 {timeoutPulseOutput} {0}
    set_instance_parameter_value timer_0 {watchdogPulse} {2}

    add_instance timer_1 altera_avalon_timer 20.1
    set_instance_parameter_value timer_1 {alwaysRun} {0}
    set_instance_parameter_value timer_1 {counterSize} {32}
    set_instance_parameter_value timer_1 {fixedPeriod} {0}
    set_instance_parameter_value timer_1 {period} {10}
    set_instance_parameter_value timer_1 {periodUnits} {MSEC}
    set_instance_parameter_value timer_1 {resetOutput} {0}
    set_instance_parameter_value timer_1 {snapshot} {1}
    set_instance_parameter_value timer_1 {timeoutPulseOutput} {0}
    set_instance_parameter_value timer_1 {watchdogPulse} {2}

    add_instance uart_0 altera_avalon_uart 20.1
    set_instance_parameter_value uart_0 {baud} {115200}
    set_instance_parameter_value uart_0 {dataBits} {8}
    set_instance_parameter_value uart_0 {fixedBaud} {1}
    set_instance_parameter_value uart_0 {parity} {NONE}
    set_instance_parameter_value uart_0 {simCharStream} {}
    set_instance_parameter_value uart_0 {simInteractiveInputEnable} {0}
    set_instance_parameter_value uart_0 {simInteractiveOutputEnable} {0}
    set_instance_parameter_value uart_0 {simTrueBaud} {0}
    set_instance_parameter_value uart_0 {stopBits} {1}
    set_instance_parameter_value uart_0 {syncRegDepth} {2}
    set_instance_parameter_value uart_0 {useCtsRts} {0}
    set_instance_parameter_value uart_0 {useEopRegister} {0}
    set_instance_parameter_value uart_0 {useRelativePathForSimFile} {0}

    # connections and connection parameters
    add_connection clk_0.clk i_reg16_0.clk clock

    add_connection clk_0.clk i_reg16_1.clk clock

    add_connection clk_0.clk i_reg16_2.clk clock

    add_connection clk_0.clk i_reg16_3.clk clock

    add_connection clk_0.clk i_reg16_4.clk clock

    add_connection clk_0.clk i_reg16_5.clk clock

    add_connection clk_0.clk i_reg16_6.clk clock

    add_connection clk_0.clk i_reg32_0.clk clock

    add_connection clk_0.clk i_reg32_1.clk clock

    add_connection clk_0.clk i_reg32_2.clk clock

    add_connection clk_0.clk i_reg32_3.clk clock

    add_connection clk_0.clk i_reg32_4.clk clock

    add_connection clk_0.clk i_reg32_5.clk clock

    add_connection clk_0.clk i_reg32_6.clk clock

    add_connection clk_0.clk i_reg32_7.clk clock

    add_connection clk_0.clk nios2_gen2_0.clk clock

    add_connection clk_0.clk o_reg32_0.clk clock

    add_connection clk_0.clk o_reg32_1.clk clock

    add_connection clk_0.clk o_reg32_10.clk clock

    add_connection clk_0.clk o_reg32_11.clk clock

    add_connection clk_0.clk o_reg32_2.clk clock

    add_connection clk_0.clk o_reg32_3.clk clock

    add_connection clk_0.clk o_reg32_4.clk clock

    add_connection clk_0.clk o_reg32_5.clk clock

    add_connection clk_0.clk o_reg32_6.clk clock

    add_connection clk_0.clk o_reg32_7.clk clock

    add_connection clk_0.clk o_reg32_8.clk clock

    add_connection clk_0.clk o_reg32_9.clk clock

    add_connection clk_0.clk onchip_memory2_0.clk1 clock

    add_connection clk_0.clk timer_0.clk clock

    add_connection clk_0.clk timer_1.clk clock

    add_connection clk_0.clk uart_0.clk clock

    add_connection clk_0.clk_reset i_reg16_0.reset reset

    add_connection clk_0.clk_reset i_reg16_1.reset reset

    add_connection clk_0.clk_reset i_reg16_2.reset reset

    add_connection clk_0.clk_reset i_reg16_3.reset reset

    add_connection clk_0.clk_reset i_reg16_4.reset reset

    add_connection clk_0.clk_reset i_reg16_5.reset reset

    add_connection clk_0.clk_reset i_reg16_6.reset reset

    add_connection clk_0.clk_reset i_reg32_0.reset reset

    add_connection clk_0.clk_reset i_reg32_1.reset reset

    add_connection clk_0.clk_reset i_reg32_2.reset reset

    add_connection clk_0.clk_reset i_reg32_3.reset reset

    add_connection clk_0.clk_reset i_reg32_4.reset reset

    add_connection clk_0.clk_reset i_reg32_5.reset reset

    add_connection clk_0.clk_reset i_reg32_6.reset reset

    add_connection clk_0.clk_reset i_reg32_7.reset reset

    add_connection clk_0.clk_reset nios2_gen2_0.reset reset

    add_connection clk_0.clk_reset o_reg32_0.reset reset

    add_connection clk_0.clk_reset o_reg32_1.reset reset

    add_connection clk_0.clk_reset o_reg32_10.reset reset

    add_connection clk_0.clk_reset o_reg32_11.reset reset

    add_connection clk_0.clk_reset o_reg32_2.reset reset

    add_connection clk_0.clk_reset o_reg32_3.reset reset

    add_connection clk_0.clk_reset o_reg32_4.reset reset

    add_connection clk_0.clk_reset o_reg32_5.reset reset

    add_connection clk_0.clk_reset o_reg32_6.reset reset

    add_connection clk_0.clk_reset o_reg32_7.reset reset

    add_connection clk_0.clk_reset o_reg32_8.reset reset

    add_connection clk_0.clk_reset o_reg32_9.reset reset

    add_connection clk_0.clk_reset onchip_memory2_0.reset1 reset

    add_connection clk_0.clk_reset timer_0.reset reset

    add_connection clk_0.clk_reset timer_1.reset reset

    add_connection clk_0.clk_reset uart_0.reset reset

    add_connection nios2_gen2_0.data_master i_reg16_0.s1 avalon
    set_connection_parameter_value nios2_gen2_0.data_master/i_reg16_0.s1 arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.data_master/i_reg16_0.s1 baseAddress {0x000413f0}
    set_connection_parameter_value nios2_gen2_0.data_master/i_reg16_0.s1 defaultConnection {0}

    add_connection nios2_gen2_0.data_master i_reg16_1.s1 avalon
    set_connection_parameter_value nios2_gen2_0.data_master/i_reg16_1.s1 arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.data_master/i_reg16_1.s1 baseAddress {0x000413e0}
    set_connection_parameter_value nios2_gen2_0.data_master/i_reg16_1.s1 defaultConnection {0}

    add_connection nios2_gen2_0.data_master i_reg16_2.s1 avalon
    set_connection_parameter_value nios2_gen2_0.data_master/i_reg16_2.s1 arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.data_master/i_reg16_2.s1 baseAddress {0x000413d0}
    set_connection_parameter_value nios2_gen2_0.data_master/i_reg16_2.s1 defaultConnection {0}

    add_connection nios2_gen2_0.data_master i_reg16_3.s1 avalon
    set_connection_parameter_value nios2_gen2_0.data_master/i_reg16_3.s1 arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.data_master/i_reg16_3.s1 baseAddress {0x000413c0}
    set_connection_parameter_value nios2_gen2_0.data_master/i_reg16_3.s1 defaultConnection {0}

    add_connection nios2_gen2_0.data_master i_reg16_4.s1 avalon
    set_connection_parameter_value nios2_gen2_0.data_master/i_reg16_4.s1 arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.data_master/i_reg16_4.s1 baseAddress {0x000413b0}
    set_connection_parameter_value nios2_gen2_0.data_master/i_reg16_4.s1 defaultConnection {0}

    add_connection nios2_gen2_0.data_master i_reg16_5.s1 avalon
    set_connection_parameter_value nios2_gen2_0.data_master/i_reg16_5.s1 arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.data_master/i_reg16_5.s1 baseAddress {0x000413a0}
    set_connection_parameter_value nios2_gen2_0.data_master/i_reg16_5.s1 defaultConnection {0}

    add_connection nios2_gen2_0.data_master i_reg16_6.s1 avalon
    set_connection_parameter_value nios2_gen2_0.data_master/i_reg16_6.s1 arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.data_master/i_reg16_6.s1 baseAddress {0x00041390}
    set_connection_parameter_value nios2_gen2_0.data_master/i_reg16_6.s1 defaultConnection {0}

    add_connection nios2_gen2_0.data_master i_reg32_0.s1 avalon
    set_connection_parameter_value nios2_gen2_0.data_master/i_reg32_0.s1 arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.data_master/i_reg32_0.s1 baseAddress {0x00041410}
    set_connection_parameter_value nios2_gen2_0.data_master/i_reg32_0.s1 defaultConnection {0}

    add_connection nios2_gen2_0.data_master i_reg32_1.s1 avalon
    set_connection_parameter_value nios2_gen2_0.data_master/i_reg32_1.s1 arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.data_master/i_reg32_1.s1 baseAddress {0x00041400}
    set_connection_parameter_value nios2_gen2_0.data_master/i_reg32_1.s1 defaultConnection {0}

    add_connection nios2_gen2_0.data_master i_reg32_2.s1 avalon
    set_connection_parameter_value nios2_gen2_0.data_master/i_reg32_2.s1 arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.data_master/i_reg32_2.s1 baseAddress {0x000412c0}
    set_connection_parameter_value nios2_gen2_0.data_master/i_reg32_2.s1 defaultConnection {0}

    add_connection nios2_gen2_0.data_master i_reg32_3.s1 avalon
    set_connection_parameter_value nios2_gen2_0.data_master/i_reg32_3.s1 arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.data_master/i_reg32_3.s1 baseAddress {0x000412b0}
    set_connection_parameter_value nios2_gen2_0.data_master/i_reg32_3.s1 defaultConnection {0}

    add_connection nios2_gen2_0.data_master i_reg32_4.s1 avalon
    set_connection_parameter_value nios2_gen2_0.data_master/i_reg32_4.s1 arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.data_master/i_reg32_4.s1 baseAddress {0x000412a0}
    set_connection_parameter_value nios2_gen2_0.data_master/i_reg32_4.s1 defaultConnection {0}

    add_connection nios2_gen2_0.data_master i_reg32_5.s1 avalon
    set_connection_parameter_value nios2_gen2_0.data_master/i_reg32_5.s1 arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.data_master/i_reg32_5.s1 baseAddress {0x00041290}
    set_connection_parameter_value nios2_gen2_0.data_master/i_reg32_5.s1 defaultConnection {0}

    add_connection nios2_gen2_0.data_master i_reg32_6.s1 avalon
    set_connection_parameter_value nios2_gen2_0.data_master/i_reg32_6.s1 arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.data_master/i_reg32_6.s1 baseAddress {0x00041280}
    set_connection_parameter_value nios2_gen2_0.data_master/i_reg32_6.s1 defaultConnection {0}

    add_connection nios2_gen2_0.data_master i_reg32_7.s1 avalon
    set_connection_parameter_value nios2_gen2_0.data_master/i_reg32_7.s1 arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.data_master/i_reg32_7.s1 baseAddress {0x00041270}
    set_connection_parameter_value nios2_gen2_0.data_master/i_reg32_7.s1 defaultConnection {0}

    add_connection nios2_gen2_0.data_master nios2_gen2_0.debug_mem_slave avalon
    set_connection_parameter_value nios2_gen2_0.data_master/nios2_gen2_0.debug_mem_slave arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.data_master/nios2_gen2_0.debug_mem_slave baseAddress {0x00040800}
    set_connection_parameter_value nios2_gen2_0.data_master/nios2_gen2_0.debug_mem_slave defaultConnection {0}

    add_connection nios2_gen2_0.data_master o_reg32_0.s1 avalon
    set_connection_parameter_value nios2_gen2_0.data_master/o_reg32_0.s1 arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.data_master/o_reg32_0.s1 baseAddress {0x00041380}
    set_connection_parameter_value nios2_gen2_0.data_master/o_reg32_0.s1 defaultConnection {0}

    add_connection nios2_gen2_0.data_master o_reg32_1.s1 avalon
    set_connection_parameter_value nios2_gen2_0.data_master/o_reg32_1.s1 arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.data_master/o_reg32_1.s1 baseAddress {0x00041370}
    set_connection_parameter_value nios2_gen2_0.data_master/o_reg32_1.s1 defaultConnection {0}

    add_connection nios2_gen2_0.data_master o_reg32_10.s1 avalon
    set_connection_parameter_value nios2_gen2_0.data_master/o_reg32_10.s1 arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.data_master/o_reg32_10.s1 baseAddress {0x000412e0}
    set_connection_parameter_value nios2_gen2_0.data_master/o_reg32_10.s1 defaultConnection {0}

    add_connection nios2_gen2_0.data_master o_reg32_11.s1 avalon
    set_connection_parameter_value nios2_gen2_0.data_master/o_reg32_11.s1 arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.data_master/o_reg32_11.s1 baseAddress {0x000412d0}
    set_connection_parameter_value nios2_gen2_0.data_master/o_reg32_11.s1 defaultConnection {0}

    add_connection nios2_gen2_0.data_master o_reg32_2.s1 avalon
    set_connection_parameter_value nios2_gen2_0.data_master/o_reg32_2.s1 arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.data_master/o_reg32_2.s1 baseAddress {0x00041360}
    set_connection_parameter_value nios2_gen2_0.data_master/o_reg32_2.s1 defaultConnection {0}

    add_connection nios2_gen2_0.data_master o_reg32_3.s1 avalon
    set_connection_parameter_value nios2_gen2_0.data_master/o_reg32_3.s1 arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.data_master/o_reg32_3.s1 baseAddress {0x00041350}
    set_connection_parameter_value nios2_gen2_0.data_master/o_reg32_3.s1 defaultConnection {0}

    add_connection nios2_gen2_0.data_master o_reg32_4.s1 avalon
    set_connection_parameter_value nios2_gen2_0.data_master/o_reg32_4.s1 arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.data_master/o_reg32_4.s1 baseAddress {0x00041340}
    set_connection_parameter_value nios2_gen2_0.data_master/o_reg32_4.s1 defaultConnection {0}

    add_connection nios2_gen2_0.data_master o_reg32_5.s1 avalon
    set_connection_parameter_value nios2_gen2_0.data_master/o_reg32_5.s1 arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.data_master/o_reg32_5.s1 baseAddress {0x00041330}
    set_connection_parameter_value nios2_gen2_0.data_master/o_reg32_5.s1 defaultConnection {0}

    add_connection nios2_gen2_0.data_master o_reg32_6.s1 avalon
    set_connection_parameter_value nios2_gen2_0.data_master/o_reg32_6.s1 arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.data_master/o_reg32_6.s1 baseAddress {0x00041320}
    set_connection_parameter_value nios2_gen2_0.data_master/o_reg32_6.s1 defaultConnection {0}

    add_connection nios2_gen2_0.data_master o_reg32_7.s1 avalon
    set_connection_parameter_value nios2_gen2_0.data_master/o_reg32_7.s1 arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.data_master/o_reg32_7.s1 baseAddress {0x00041310}
    set_connection_parameter_value nios2_gen2_0.data_master/o_reg32_7.s1 defaultConnection {0}

    add_connection nios2_gen2_0.data_master o_reg32_8.s1 avalon
    set_connection_parameter_value nios2_gen2_0.data_master/o_reg32_8.s1 arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.data_master/o_reg32_8.s1 baseAddress {0x00041300}
    set_connection_parameter_value nios2_gen2_0.data_master/o_reg32_8.s1 defaultConnection {0}

    add_connection nios2_gen2_0.data_master o_reg32_9.s1 avalon
    set_connection_parameter_value nios2_gen2_0.data_master/o_reg32_9.s1 arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.data_master/o_reg32_9.s1 baseAddress {0x000412f0}
    set_connection_parameter_value nios2_gen2_0.data_master/o_reg32_9.s1 defaultConnection {0}

    add_connection nios2_gen2_0.data_master onchip_memory2_0.s1 avalon
    set_connection_parameter_value nios2_gen2_0.data_master/onchip_memory2_0.s1 arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.data_master/onchip_memory2_0.s1 baseAddress {0x00020000}
    set_connection_parameter_value nios2_gen2_0.data_master/onchip_memory2_0.s1 defaultConnection {0}

    add_connection nios2_gen2_0.data_master timer_0.s1 avalon
    set_connection_parameter_value nios2_gen2_0.data_master/timer_0.s1 arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.data_master/timer_0.s1 baseAddress {0x000410a0}
    set_connection_parameter_value nios2_gen2_0.data_master/timer_0.s1 defaultConnection {0}

    add_connection nios2_gen2_0.data_master timer_1.s1 avalon
    set_connection_parameter_value nios2_gen2_0.data_master/timer_1.s1 arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.data_master/timer_1.s1 baseAddress {0x00041080}
    set_connection_parameter_value nios2_gen2_0.data_master/timer_1.s1 defaultConnection {0}

    add_connection nios2_gen2_0.data_master uart_0.s1 avalon
    set_connection_parameter_value nios2_gen2_0.data_master/uart_0.s1 arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.data_master/uart_0.s1 baseAddress {0x00041060}
    set_connection_parameter_value nios2_gen2_0.data_master/uart_0.s1 defaultConnection {0}

    add_connection nios2_gen2_0.debug_reset_request i_reg16_0.reset reset

    add_connection nios2_gen2_0.debug_reset_request i_reg16_1.reset reset

    add_connection nios2_gen2_0.debug_reset_request i_reg16_2.reset reset

    add_connection nios2_gen2_0.debug_reset_request i_reg16_3.reset reset

    add_connection nios2_gen2_0.debug_reset_request i_reg16_4.reset reset

    add_connection nios2_gen2_0.debug_reset_request i_reg16_5.reset reset

    add_connection nios2_gen2_0.debug_reset_request i_reg16_6.reset reset

    add_connection nios2_gen2_0.debug_reset_request i_reg32_0.reset reset

    add_connection nios2_gen2_0.debug_reset_request i_reg32_1.reset reset

    add_connection nios2_gen2_0.debug_reset_request i_reg32_2.reset reset

    add_connection nios2_gen2_0.debug_reset_request i_reg32_3.reset reset

    add_connection nios2_gen2_0.debug_reset_request i_reg32_4.reset reset

    add_connection nios2_gen2_0.debug_reset_request i_reg32_5.reset reset

    add_connection nios2_gen2_0.debug_reset_request i_reg32_6.reset reset

    add_connection nios2_gen2_0.debug_reset_request i_reg32_7.reset reset

    add_connection nios2_gen2_0.debug_reset_request o_reg32_0.reset reset

    add_connection nios2_gen2_0.debug_reset_request o_reg32_1.reset reset

    add_connection nios2_gen2_0.debug_reset_request o_reg32_10.reset reset

    add_connection nios2_gen2_0.debug_reset_request o_reg32_11.reset reset

    add_connection nios2_gen2_0.debug_reset_request o_reg32_2.reset reset

    add_connection nios2_gen2_0.debug_reset_request o_reg32_3.reset reset

    add_connection nios2_gen2_0.debug_reset_request o_reg32_4.reset reset

    add_connection nios2_gen2_0.debug_reset_request o_reg32_5.reset reset

    add_connection nios2_gen2_0.debug_reset_request o_reg32_7.reset reset

    add_connection nios2_gen2_0.debug_reset_request o_reg32_8.reset reset

    add_connection nios2_gen2_0.debug_reset_request o_reg32_9.reset reset

    add_connection nios2_gen2_0.debug_reset_request timer_0.reset reset

    add_connection nios2_gen2_0.debug_reset_request timer_1.reset reset

    add_connection nios2_gen2_0.debug_reset_request uart_0.reset reset

    add_connection nios2_gen2_0.instruction_master i_reg16_0.s1 avalon
    set_connection_parameter_value nios2_gen2_0.instruction_master/i_reg16_0.s1 arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.instruction_master/i_reg16_0.s1 baseAddress {0x000413f0}
    set_connection_parameter_value nios2_gen2_0.instruction_master/i_reg16_0.s1 defaultConnection {0}

    add_connection nios2_gen2_0.instruction_master i_reg16_1.s1 avalon
    set_connection_parameter_value nios2_gen2_0.instruction_master/i_reg16_1.s1 arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.instruction_master/i_reg16_1.s1 baseAddress {0x000413e0}
    set_connection_parameter_value nios2_gen2_0.instruction_master/i_reg16_1.s1 defaultConnection {0}

    add_connection nios2_gen2_0.instruction_master i_reg16_2.s1 avalon
    set_connection_parameter_value nios2_gen2_0.instruction_master/i_reg16_2.s1 arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.instruction_master/i_reg16_2.s1 baseAddress {0x000413d0}
    set_connection_parameter_value nios2_gen2_0.instruction_master/i_reg16_2.s1 defaultConnection {0}

    add_connection nios2_gen2_0.instruction_master i_reg16_3.s1 avalon
    set_connection_parameter_value nios2_gen2_0.instruction_master/i_reg16_3.s1 arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.instruction_master/i_reg16_3.s1 baseAddress {0x000413c0}
    set_connection_parameter_value nios2_gen2_0.instruction_master/i_reg16_3.s1 defaultConnection {0}

    add_connection nios2_gen2_0.instruction_master i_reg16_4.s1 avalon
    set_connection_parameter_value nios2_gen2_0.instruction_master/i_reg16_4.s1 arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.instruction_master/i_reg16_4.s1 baseAddress {0x000413b0}
    set_connection_parameter_value nios2_gen2_0.instruction_master/i_reg16_4.s1 defaultConnection {0}

    add_connection nios2_gen2_0.instruction_master i_reg16_5.s1 avalon
    set_connection_parameter_value nios2_gen2_0.instruction_master/i_reg16_5.s1 arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.instruction_master/i_reg16_5.s1 baseAddress {0x000413a0}
    set_connection_parameter_value nios2_gen2_0.instruction_master/i_reg16_5.s1 defaultConnection {0}

    add_connection nios2_gen2_0.instruction_master i_reg16_6.s1 avalon
    set_connection_parameter_value nios2_gen2_0.instruction_master/i_reg16_6.s1 arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.instruction_master/i_reg16_6.s1 baseAddress {0x00041390}
    set_connection_parameter_value nios2_gen2_0.instruction_master/i_reg16_6.s1 defaultConnection {0}

    add_connection nios2_gen2_0.instruction_master i_reg32_0.s1 avalon
    set_connection_parameter_value nios2_gen2_0.instruction_master/i_reg32_0.s1 arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.instruction_master/i_reg32_0.s1 baseAddress {0x00041410}
    set_connection_parameter_value nios2_gen2_0.instruction_master/i_reg32_0.s1 defaultConnection {0}

    add_connection nios2_gen2_0.instruction_master i_reg32_1.s1 avalon
    set_connection_parameter_value nios2_gen2_0.instruction_master/i_reg32_1.s1 arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.instruction_master/i_reg32_1.s1 baseAddress {0x00041400}
    set_connection_parameter_value nios2_gen2_0.instruction_master/i_reg32_1.s1 defaultConnection {0}

    add_connection nios2_gen2_0.instruction_master i_reg32_2.s1 avalon
    set_connection_parameter_value nios2_gen2_0.instruction_master/i_reg32_2.s1 arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.instruction_master/i_reg32_2.s1 baseAddress {0x000412c0}
    set_connection_parameter_value nios2_gen2_0.instruction_master/i_reg32_2.s1 defaultConnection {0}

    add_connection nios2_gen2_0.instruction_master i_reg32_3.s1 avalon
    set_connection_parameter_value nios2_gen2_0.instruction_master/i_reg32_3.s1 arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.instruction_master/i_reg32_3.s1 baseAddress {0x000412b0}
    set_connection_parameter_value nios2_gen2_0.instruction_master/i_reg32_3.s1 defaultConnection {0}

    add_connection nios2_gen2_0.instruction_master i_reg32_4.s1 avalon
    set_connection_parameter_value nios2_gen2_0.instruction_master/i_reg32_4.s1 arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.instruction_master/i_reg32_4.s1 baseAddress {0x000412a0}
    set_connection_parameter_value nios2_gen2_0.instruction_master/i_reg32_4.s1 defaultConnection {0}

    add_connection nios2_gen2_0.instruction_master i_reg32_5.s1 avalon
    set_connection_parameter_value nios2_gen2_0.instruction_master/i_reg32_5.s1 arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.instruction_master/i_reg32_5.s1 baseAddress {0x00041290}
    set_connection_parameter_value nios2_gen2_0.instruction_master/i_reg32_5.s1 defaultConnection {0}

    add_connection nios2_gen2_0.instruction_master i_reg32_6.s1 avalon
    set_connection_parameter_value nios2_gen2_0.instruction_master/i_reg32_6.s1 arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.instruction_master/i_reg32_6.s1 baseAddress {0x00041280}
    set_connection_parameter_value nios2_gen2_0.instruction_master/i_reg32_6.s1 defaultConnection {0}

    add_connection nios2_gen2_0.instruction_master i_reg32_7.s1 avalon
    set_connection_parameter_value nios2_gen2_0.instruction_master/i_reg32_7.s1 arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.instruction_master/i_reg32_7.s1 baseAddress {0x00041270}
    set_connection_parameter_value nios2_gen2_0.instruction_master/i_reg32_7.s1 defaultConnection {0}

    add_connection nios2_gen2_0.instruction_master nios2_gen2_0.debug_mem_slave avalon
    set_connection_parameter_value nios2_gen2_0.instruction_master/nios2_gen2_0.debug_mem_slave arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.instruction_master/nios2_gen2_0.debug_mem_slave baseAddress {0x00040800}
    set_connection_parameter_value nios2_gen2_0.instruction_master/nios2_gen2_0.debug_mem_slave defaultConnection {0}

    add_connection nios2_gen2_0.instruction_master o_reg32_0.s1 avalon
    set_connection_parameter_value nios2_gen2_0.instruction_master/o_reg32_0.s1 arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.instruction_master/o_reg32_0.s1 baseAddress {0x00041380}
    set_connection_parameter_value nios2_gen2_0.instruction_master/o_reg32_0.s1 defaultConnection {0}

    add_connection nios2_gen2_0.instruction_master o_reg32_1.s1 avalon
    set_connection_parameter_value nios2_gen2_0.instruction_master/o_reg32_1.s1 arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.instruction_master/o_reg32_1.s1 baseAddress {0x00041370}
    set_connection_parameter_value nios2_gen2_0.instruction_master/o_reg32_1.s1 defaultConnection {0}

    add_connection nios2_gen2_0.instruction_master o_reg32_10.s1 avalon
    set_connection_parameter_value nios2_gen2_0.instruction_master/o_reg32_10.s1 arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.instruction_master/o_reg32_10.s1 baseAddress {0x000412e0}
    set_connection_parameter_value nios2_gen2_0.instruction_master/o_reg32_10.s1 defaultConnection {0}

    add_connection nios2_gen2_0.instruction_master o_reg32_11.s1 avalon
    set_connection_parameter_value nios2_gen2_0.instruction_master/o_reg32_11.s1 arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.instruction_master/o_reg32_11.s1 baseAddress {0x000412d0}
    set_connection_parameter_value nios2_gen2_0.instruction_master/o_reg32_11.s1 defaultConnection {0}

    add_connection nios2_gen2_0.instruction_master o_reg32_2.s1 avalon
    set_connection_parameter_value nios2_gen2_0.instruction_master/o_reg32_2.s1 arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.instruction_master/o_reg32_2.s1 baseAddress {0x00041360}
    set_connection_parameter_value nios2_gen2_0.instruction_master/o_reg32_2.s1 defaultConnection {0}

    add_connection nios2_gen2_0.instruction_master o_reg32_3.s1 avalon
    set_connection_parameter_value nios2_gen2_0.instruction_master/o_reg32_3.s1 arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.instruction_master/o_reg32_3.s1 baseAddress {0x00041350}
    set_connection_parameter_value nios2_gen2_0.instruction_master/o_reg32_3.s1 defaultConnection {0}

    add_connection nios2_gen2_0.instruction_master o_reg32_4.s1 avalon
    set_connection_parameter_value nios2_gen2_0.instruction_master/o_reg32_4.s1 arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.instruction_master/o_reg32_4.s1 baseAddress {0x00041340}
    set_connection_parameter_value nios2_gen2_0.instruction_master/o_reg32_4.s1 defaultConnection {0}

    add_connection nios2_gen2_0.instruction_master o_reg32_5.s1 avalon
    set_connection_parameter_value nios2_gen2_0.instruction_master/o_reg32_5.s1 arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.instruction_master/o_reg32_5.s1 baseAddress {0x00041330}
    set_connection_parameter_value nios2_gen2_0.instruction_master/o_reg32_5.s1 defaultConnection {0}

    add_connection nios2_gen2_0.instruction_master o_reg32_6.s1 avalon
    set_connection_parameter_value nios2_gen2_0.instruction_master/o_reg32_6.s1 arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.instruction_master/o_reg32_6.s1 baseAddress {0x00041320}
    set_connection_parameter_value nios2_gen2_0.instruction_master/o_reg32_6.s1 defaultConnection {0}

    add_connection nios2_gen2_0.instruction_master o_reg32_7.s1 avalon
    set_connection_parameter_value nios2_gen2_0.instruction_master/o_reg32_7.s1 arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.instruction_master/o_reg32_7.s1 baseAddress {0x00041310}
    set_connection_parameter_value nios2_gen2_0.instruction_master/o_reg32_7.s1 defaultConnection {0}

    add_connection nios2_gen2_0.instruction_master o_reg32_8.s1 avalon
    set_connection_parameter_value nios2_gen2_0.instruction_master/o_reg32_8.s1 arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.instruction_master/o_reg32_8.s1 baseAddress {0x00041300}
    set_connection_parameter_value nios2_gen2_0.instruction_master/o_reg32_8.s1 defaultConnection {0}

    add_connection nios2_gen2_0.instruction_master o_reg32_9.s1 avalon
    set_connection_parameter_value nios2_gen2_0.instruction_master/o_reg32_9.s1 arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.instruction_master/o_reg32_9.s1 baseAddress {0x000412f0}
    set_connection_parameter_value nios2_gen2_0.instruction_master/o_reg32_9.s1 defaultConnection {0}

    add_connection nios2_gen2_0.instruction_master onchip_memory2_0.s1 avalon
    set_connection_parameter_value nios2_gen2_0.instruction_master/onchip_memory2_0.s1 arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.instruction_master/onchip_memory2_0.s1 baseAddress {0x00020000}
    set_connection_parameter_value nios2_gen2_0.instruction_master/onchip_memory2_0.s1 defaultConnection {0}

    add_connection nios2_gen2_0.instruction_master timer_0.s1 avalon
    set_connection_parameter_value nios2_gen2_0.instruction_master/timer_0.s1 arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.instruction_master/timer_0.s1 baseAddress {0x000410a0}
    set_connection_parameter_value nios2_gen2_0.instruction_master/timer_0.s1 defaultConnection {0}

    add_connection nios2_gen2_0.instruction_master timer_1.s1 avalon
    set_connection_parameter_value nios2_gen2_0.instruction_master/timer_1.s1 arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.instruction_master/timer_1.s1 baseAddress {0x00041080}
    set_connection_parameter_value nios2_gen2_0.instruction_master/timer_1.s1 defaultConnection {0}

    add_connection nios2_gen2_0.instruction_master uart_0.s1 avalon
    set_connection_parameter_value nios2_gen2_0.instruction_master/uart_0.s1 arbitrationPriority {1}
    set_connection_parameter_value nios2_gen2_0.instruction_master/uart_0.s1 baseAddress {0x00041060}
    set_connection_parameter_value nios2_gen2_0.instruction_master/uart_0.s1 defaultConnection {0}

    add_connection nios2_gen2_0.irq i_reg32_0.irq interrupt
    set_connection_parameter_value nios2_gen2_0.irq/i_reg32_0.irq irqNumber {2}

    add_connection nios2_gen2_0.irq timer_0.irq interrupt
    set_connection_parameter_value nios2_gen2_0.irq/timer_0.irq irqNumber {0}

    add_connection nios2_gen2_0.irq timer_1.irq interrupt
    set_connection_parameter_value nios2_gen2_0.irq/timer_1.irq irqNumber {1}

    add_connection nios2_gen2_0.irq uart_0.irq interrupt
    set_connection_parameter_value nios2_gen2_0.irq/uart_0.irq irqNumber {3}

    # exported interfaces
    add_interface clk clock sink
    set_interface_property clk EXPORT_OF clk_0.clk_in
    add_interface i_reg16_0 conduit end
    set_interface_property i_reg16_0 EXPORT_OF i_reg16_0.external_connection
    add_interface i_reg16_1 conduit end
    set_interface_property i_reg16_1 EXPORT_OF i_reg16_1.external_connection
    add_interface i_reg16_2 conduit end
    set_interface_property i_reg16_2 EXPORT_OF i_reg16_2.external_connection
    add_interface i_reg16_3 conduit end
    set_interface_property i_reg16_3 EXPORT_OF i_reg16_3.external_connection
    add_interface i_reg16_4 conduit end
    set_interface_property i_reg16_4 EXPORT_OF i_reg16_4.external_connection
    add_interface i_reg16_5 conduit end
    set_interface_property i_reg16_5 EXPORT_OF i_reg16_5.external_connection
    add_interface i_reg16_6 conduit end
    set_interface_property i_reg16_6 EXPORT_OF i_reg16_6.external_connection
    add_interface i_reg32_0 conduit end
    set_interface_property i_reg32_0 EXPORT_OF i_reg32_0.external_connection
    add_interface i_reg32_1 conduit end
    set_interface_property i_reg32_1 EXPORT_OF i_reg32_1.external_connection
    add_interface i_reg32_2 conduit end
    set_interface_property i_reg32_2 EXPORT_OF i_reg32_2.external_connection
    add_interface i_reg32_3 conduit end
    set_interface_property i_reg32_3 EXPORT_OF i_reg32_3.external_connection
    add_interface i_reg32_4 conduit end
    set_interface_property i_reg32_4 EXPORT_OF i_reg32_4.external_connection
    add_interface i_reg32_5 conduit end
    set_interface_property i_reg32_5 EXPORT_OF i_reg32_5.external_connection
    add_interface i_reg32_6 conduit end
    set_interface_property i_reg32_6 EXPORT_OF i_reg32_6.external_connection
    add_interface i_reg32_7 conduit end
    set_interface_property i_reg32_7 EXPORT_OF i_reg32_7.external_connection
    add_interface o_reg32_0 conduit end
    set_interface_property o_reg32_0 EXPORT_OF o_reg32_0.external_connection
    add_interface o_reg32_1 conduit end
    set_interface_property o_reg32_1 EXPORT_OF o_reg32_1.external_connection
    add_interface o_reg32_10 conduit end
    set_interface_property o_reg32_10 EXPORT_OF o_reg32_10.external_connection
    add_interface o_reg32_11 conduit end
    set_interface_property o_reg32_11 EXPORT_OF o_reg32_11.external_connection
    add_interface o_reg32_2 conduit end
    set_interface_property o_reg32_2 EXPORT_OF o_reg32_2.external_connection
    add_interface o_reg32_3 conduit end
    set_interface_property o_reg32_3 EXPORT_OF o_reg32_3.external_connection
    add_interface o_reg32_4 conduit end
    set_interface_property o_reg32_4 EXPORT_OF o_reg32_4.external_connection
    add_interface o_reg32_5 conduit end
    set_interface_property o_reg32_5 EXPORT_OF o_reg32_5.external_connection
    add_interface o_reg32_6 conduit end
    set_interface_property o_reg32_6 EXPORT_OF o_reg32_6.external_connection
    add_interface o_reg32_7 conduit end
    set_interface_property o_reg32_7 EXPORT_OF o_reg32_7.external_connection
    add_interface o_reg32_8 conduit end
    set_interface_property o_reg32_8 EXPORT_OF o_reg32_8.external_connection
    add_interface o_reg32_9 conduit end
    set_interface_property o_reg32_9 EXPORT_OF o_reg32_9.external_connection
    add_interface reset reset sink
    set_interface_property reset EXPORT_OF clk_0.clk_in_reset
    add_interface uart conduit end
    set_interface_property uart EXPORT_OF uart_0.external_connection

    # interconnect requirements
    set_interconnect_requirement {$system} {qsys_mm.clockCrossingAdapter} {HANDSHAKE}
    set_interconnect_requirement {$system} {qsys_mm.enableEccProtection} {FALSE}
    set_interconnect_requirement {$system} {qsys_mm.insertDefaultSlave} {FALSE}
    set_interconnect_requirement {$system} {qsys_mm.maxAdditionalLatency} {1}
}
