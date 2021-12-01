/*
 * system.h - SOPC Builder system and BSP software package information
 *
 * Machine generated for CPU 'nios2_gen2_0' in SOPC Builder design 'NiosBase'
 * SOPC Builder design path: C:/intelProjects/nios_monitor/quartus/NiosBase.sopcinfo
 *
 * Generated: Wed Dec 01 15:21:08 EST 2021
 */

/*
 * DO NOT MODIFY THIS FILE
 *
 * Changing this file will have subtle consequences
 * which will almost certainly lead to a nonfunctioning
 * system. If you do modify this file, be aware that your
 * changes will be overwritten and lost when this file
 * is generated again.
 *
 * DO NOT MODIFY THIS FILE
 */

/*
 * License Agreement
 *
 * Copyright (c) 2008
 * Altera Corporation, San Jose, California, USA.
 * All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 *
 * This agreement shall be governed in all respects by the laws of the State
 * of California and by the laws of the United States of America.
 */

#ifndef __SYSTEM_H_
#define __SYSTEM_H_

/* Include definitions from linker script generator */
#include "linker.h"


/*
 * CPU configuration
 *
 */

#define ALT_CPU_ARCHITECTURE "altera_nios2_gen2"
#define ALT_CPU_BIG_ENDIAN 0
#define ALT_CPU_BREAK_ADDR 0x00040820
#define ALT_CPU_CPU_ARCH_NIOS2_R1
#define ALT_CPU_CPU_FREQ 50000000u
#define ALT_CPU_CPU_ID_SIZE 1
#define ALT_CPU_CPU_ID_VALUE 0x00000000
#define ALT_CPU_CPU_IMPLEMENTATION "tiny"
#define ALT_CPU_DATA_ADDR_WIDTH 0x13
#define ALT_CPU_DCACHE_LINE_SIZE 0
#define ALT_CPU_DCACHE_LINE_SIZE_LOG2 0
#define ALT_CPU_DCACHE_SIZE 0
#define ALT_CPU_EXCEPTION_ADDR 0x00020020
#define ALT_CPU_FLASH_ACCELERATOR_LINES 0
#define ALT_CPU_FLASH_ACCELERATOR_LINE_SIZE 0
#define ALT_CPU_FLUSHDA_SUPPORTED
#define ALT_CPU_FREQ 50000000
#define ALT_CPU_HARDWARE_DIVIDE_PRESENT 0
#define ALT_CPU_HARDWARE_MULTIPLY_PRESENT 0
#define ALT_CPU_HARDWARE_MULX_PRESENT 0
#define ALT_CPU_HAS_DEBUG_CORE 1
#define ALT_CPU_HAS_DEBUG_STUB
#define ALT_CPU_HAS_ILLEGAL_INSTRUCTION_EXCEPTION
#define ALT_CPU_HAS_JMPI_INSTRUCTION
#define ALT_CPU_ICACHE_LINE_SIZE 0
#define ALT_CPU_ICACHE_LINE_SIZE_LOG2 0
#define ALT_CPU_ICACHE_SIZE 0
#define ALT_CPU_INST_ADDR_WIDTH 0x13
#define ALT_CPU_NAME "nios2_gen2_0"
#define ALT_CPU_OCI_VERSION 1
#define ALT_CPU_RESET_ADDR 0x00020000


/*
 * CPU configuration (with legacy prefix - don't use these anymore)
 *
 */

#define NIOS2_BIG_ENDIAN 0
#define NIOS2_BREAK_ADDR 0x00040820
#define NIOS2_CPU_ARCH_NIOS2_R1
#define NIOS2_CPU_FREQ 50000000u
#define NIOS2_CPU_ID_SIZE 1
#define NIOS2_CPU_ID_VALUE 0x00000000
#define NIOS2_CPU_IMPLEMENTATION "tiny"
#define NIOS2_DATA_ADDR_WIDTH 0x13
#define NIOS2_DCACHE_LINE_SIZE 0
#define NIOS2_DCACHE_LINE_SIZE_LOG2 0
#define NIOS2_DCACHE_SIZE 0
#define NIOS2_EXCEPTION_ADDR 0x00020020
#define NIOS2_FLASH_ACCELERATOR_LINES 0
#define NIOS2_FLASH_ACCELERATOR_LINE_SIZE 0
#define NIOS2_FLUSHDA_SUPPORTED
#define NIOS2_HARDWARE_DIVIDE_PRESENT 0
#define NIOS2_HARDWARE_MULTIPLY_PRESENT 0
#define NIOS2_HARDWARE_MULX_PRESENT 0
#define NIOS2_HAS_DEBUG_CORE 1
#define NIOS2_HAS_DEBUG_STUB
#define NIOS2_HAS_ILLEGAL_INSTRUCTION_EXCEPTION
#define NIOS2_HAS_JMPI_INSTRUCTION
#define NIOS2_ICACHE_LINE_SIZE 0
#define NIOS2_ICACHE_LINE_SIZE_LOG2 0
#define NIOS2_ICACHE_SIZE 0
#define NIOS2_INST_ADDR_WIDTH 0x13
#define NIOS2_OCI_VERSION 1
#define NIOS2_RESET_ADDR 0x00020000


/*
 * Define for each module class mastered by the CPU
 *
 */

#define __ALTERA_AVALON_ONCHIP_MEMORY2
#define __ALTERA_AVALON_PIO
#define __ALTERA_AVALON_TIMER
#define __ALTERA_AVALON_UART
#define __ALTERA_NIOS2_GEN2
#define __DMA_RX


/*
 * System configuration
 *
 */

#define ALT_DEVICE_FAMILY "Cyclone V"
#define ALT_ENHANCED_INTERRUPT_API_PRESENT
#define ALT_IRQ_BASE NULL
#define ALT_LOG_PORT "/dev/null"
#define ALT_LOG_PORT_BASE 0x0
#define ALT_LOG_PORT_DEV null
#define ALT_LOG_PORT_TYPE ""
#define ALT_NUM_EXTERNAL_INTERRUPT_CONTROLLERS 0
#define ALT_NUM_INTERNAL_INTERRUPT_CONTROLLERS 1
#define ALT_NUM_INTERRUPT_CONTROLLERS 1
#define ALT_STDERR "/dev/uart_0"
#define ALT_STDERR_BASE 0x41160
#define ALT_STDERR_DEV uart_0
#define ALT_STDERR_IS_UART
#define ALT_STDERR_PRESENT
#define ALT_STDERR_TYPE "altera_avalon_uart"
#define ALT_STDIN "/dev/uart_0"
#define ALT_STDIN_BASE 0x41160
#define ALT_STDIN_DEV uart_0
#define ALT_STDIN_IS_UART
#define ALT_STDIN_PRESENT
#define ALT_STDIN_TYPE "altera_avalon_uart"
#define ALT_STDOUT "/dev/uart_0"
#define ALT_STDOUT_BASE 0x41160
#define ALT_STDOUT_DEV uart_0
#define ALT_STDOUT_IS_UART
#define ALT_STDOUT_PRESENT
#define ALT_STDOUT_TYPE "altera_avalon_uart"
#define ALT_SYSTEM_NAME "NiosBase"


/*
 * dma_rx_0 configuration
 *
 */

#define ALT_MODULE_CLASS_dma_rx_0 dma_rx
#define DMA_RX_0_BASE 0x41080
#define DMA_RX_0_IRQ -1
#define DMA_RX_0_IRQ_INTERRUPT_CONTROLLER_ID -1
#define DMA_RX_0_NAME "/dev/dma_rx_0"
#define DMA_RX_0_SPAN 128
#define DMA_RX_0_TYPE "dma_rx"


/*
 * hal configuration
 *
 */

#define ALT_INCLUDE_INSTRUCTION_RELATED_EXCEPTION_API
#define ALT_MAX_FD 32
#define ALT_SYS_CLK TIMER_0
#define ALT_TIMESTAMP_CLK none


/*
 * i_reg16_0 configuration
 *
 */

#define ALT_MODULE_CLASS_i_reg16_0 altera_avalon_pio
#define I_REG16_0_BASE 0x41530
#define I_REG16_0_BIT_CLEARING_EDGE_REGISTER 1
#define I_REG16_0_BIT_MODIFYING_OUTPUT_REGISTER 0
#define I_REG16_0_CAPTURE 0
#define I_REG16_0_DATA_WIDTH 16
#define I_REG16_0_DO_TEST_BENCH_WIRING 0
#define I_REG16_0_DRIVEN_SIM_VALUE 0
#define I_REG16_0_EDGE_TYPE "NONE"
#define I_REG16_0_FREQ 50000000
#define I_REG16_0_HAS_IN 1
#define I_REG16_0_HAS_OUT 0
#define I_REG16_0_HAS_TRI 0
#define I_REG16_0_IRQ -1
#define I_REG16_0_IRQ_INTERRUPT_CONTROLLER_ID -1
#define I_REG16_0_IRQ_TYPE "NONE"
#define I_REG16_0_NAME "/dev/i_reg16_0"
#define I_REG16_0_RESET_VALUE 0
#define I_REG16_0_SPAN 16
#define I_REG16_0_TYPE "altera_avalon_pio"


/*
 * i_reg16_1 configuration
 *
 */

#define ALT_MODULE_CLASS_i_reg16_1 altera_avalon_pio
#define I_REG16_1_BASE 0x41520
#define I_REG16_1_BIT_CLEARING_EDGE_REGISTER 1
#define I_REG16_1_BIT_MODIFYING_OUTPUT_REGISTER 0
#define I_REG16_1_CAPTURE 0
#define I_REG16_1_DATA_WIDTH 16
#define I_REG16_1_DO_TEST_BENCH_WIRING 0
#define I_REG16_1_DRIVEN_SIM_VALUE 0
#define I_REG16_1_EDGE_TYPE "NONE"
#define I_REG16_1_FREQ 50000000
#define I_REG16_1_HAS_IN 1
#define I_REG16_1_HAS_OUT 0
#define I_REG16_1_HAS_TRI 0
#define I_REG16_1_IRQ -1
#define I_REG16_1_IRQ_INTERRUPT_CONTROLLER_ID -1
#define I_REG16_1_IRQ_TYPE "NONE"
#define I_REG16_1_NAME "/dev/i_reg16_1"
#define I_REG16_1_RESET_VALUE 0
#define I_REG16_1_SPAN 16
#define I_REG16_1_TYPE "altera_avalon_pio"


/*
 * i_reg16_2 configuration
 *
 */

#define ALT_MODULE_CLASS_i_reg16_2 altera_avalon_pio
#define I_REG16_2_BASE 0x41510
#define I_REG16_2_BIT_CLEARING_EDGE_REGISTER 1
#define I_REG16_2_BIT_MODIFYING_OUTPUT_REGISTER 0
#define I_REG16_2_CAPTURE 0
#define I_REG16_2_DATA_WIDTH 16
#define I_REG16_2_DO_TEST_BENCH_WIRING 0
#define I_REG16_2_DRIVEN_SIM_VALUE 0
#define I_REG16_2_EDGE_TYPE "NONE"
#define I_REG16_2_FREQ 50000000
#define I_REG16_2_HAS_IN 1
#define I_REG16_2_HAS_OUT 0
#define I_REG16_2_HAS_TRI 0
#define I_REG16_2_IRQ -1
#define I_REG16_2_IRQ_INTERRUPT_CONTROLLER_ID -1
#define I_REG16_2_IRQ_TYPE "NONE"
#define I_REG16_2_NAME "/dev/i_reg16_2"
#define I_REG16_2_RESET_VALUE 0
#define I_REG16_2_SPAN 16
#define I_REG16_2_TYPE "altera_avalon_pio"


/*
 * i_reg16_3 configuration
 *
 */

#define ALT_MODULE_CLASS_i_reg16_3 altera_avalon_pio
#define I_REG16_3_BASE 0x41500
#define I_REG16_3_BIT_CLEARING_EDGE_REGISTER 1
#define I_REG16_3_BIT_MODIFYING_OUTPUT_REGISTER 0
#define I_REG16_3_CAPTURE 0
#define I_REG16_3_DATA_WIDTH 16
#define I_REG16_3_DO_TEST_BENCH_WIRING 0
#define I_REG16_3_DRIVEN_SIM_VALUE 0
#define I_REG16_3_EDGE_TYPE "NONE"
#define I_REG16_3_FREQ 50000000
#define I_REG16_3_HAS_IN 1
#define I_REG16_3_HAS_OUT 0
#define I_REG16_3_HAS_TRI 0
#define I_REG16_3_IRQ -1
#define I_REG16_3_IRQ_INTERRUPT_CONTROLLER_ID -1
#define I_REG16_3_IRQ_TYPE "NONE"
#define I_REG16_3_NAME "/dev/i_reg16_3"
#define I_REG16_3_RESET_VALUE 0
#define I_REG16_3_SPAN 16
#define I_REG16_3_TYPE "altera_avalon_pio"


/*
 * i_reg16_4 configuration
 *
 */

#define ALT_MODULE_CLASS_i_reg16_4 altera_avalon_pio
#define I_REG16_4_BASE 0x414f0
#define I_REG16_4_BIT_CLEARING_EDGE_REGISTER 1
#define I_REG16_4_BIT_MODIFYING_OUTPUT_REGISTER 0
#define I_REG16_4_CAPTURE 0
#define I_REG16_4_DATA_WIDTH 16
#define I_REG16_4_DO_TEST_BENCH_WIRING 0
#define I_REG16_4_DRIVEN_SIM_VALUE 0
#define I_REG16_4_EDGE_TYPE "NONE"
#define I_REG16_4_FREQ 50000000
#define I_REG16_4_HAS_IN 1
#define I_REG16_4_HAS_OUT 0
#define I_REG16_4_HAS_TRI 0
#define I_REG16_4_IRQ -1
#define I_REG16_4_IRQ_INTERRUPT_CONTROLLER_ID -1
#define I_REG16_4_IRQ_TYPE "NONE"
#define I_REG16_4_NAME "/dev/i_reg16_4"
#define I_REG16_4_RESET_VALUE 0
#define I_REG16_4_SPAN 16
#define I_REG16_4_TYPE "altera_avalon_pio"


/*
 * i_reg16_5 configuration
 *
 */

#define ALT_MODULE_CLASS_i_reg16_5 altera_avalon_pio
#define I_REG16_5_BASE 0x414e0
#define I_REG16_5_BIT_CLEARING_EDGE_REGISTER 1
#define I_REG16_5_BIT_MODIFYING_OUTPUT_REGISTER 0
#define I_REG16_5_CAPTURE 0
#define I_REG16_5_DATA_WIDTH 16
#define I_REG16_5_DO_TEST_BENCH_WIRING 0
#define I_REG16_5_DRIVEN_SIM_VALUE 0
#define I_REG16_5_EDGE_TYPE "NONE"
#define I_REG16_5_FREQ 50000000
#define I_REG16_5_HAS_IN 1
#define I_REG16_5_HAS_OUT 0
#define I_REG16_5_HAS_TRI 0
#define I_REG16_5_IRQ -1
#define I_REG16_5_IRQ_INTERRUPT_CONTROLLER_ID -1
#define I_REG16_5_IRQ_TYPE "NONE"
#define I_REG16_5_NAME "/dev/i_reg16_5"
#define I_REG16_5_RESET_VALUE 0
#define I_REG16_5_SPAN 16
#define I_REG16_5_TYPE "altera_avalon_pio"


/*
 * i_reg16_6 configuration
 *
 */

#define ALT_MODULE_CLASS_i_reg16_6 altera_avalon_pio
#define I_REG16_6_BASE 0x414d0
#define I_REG16_6_BIT_CLEARING_EDGE_REGISTER 1
#define I_REG16_6_BIT_MODIFYING_OUTPUT_REGISTER 0
#define I_REG16_6_CAPTURE 0
#define I_REG16_6_DATA_WIDTH 16
#define I_REG16_6_DO_TEST_BENCH_WIRING 0
#define I_REG16_6_DRIVEN_SIM_VALUE 0
#define I_REG16_6_EDGE_TYPE "NONE"
#define I_REG16_6_FREQ 50000000
#define I_REG16_6_HAS_IN 1
#define I_REG16_6_HAS_OUT 0
#define I_REG16_6_HAS_TRI 0
#define I_REG16_6_IRQ -1
#define I_REG16_6_IRQ_INTERRUPT_CONTROLLER_ID -1
#define I_REG16_6_IRQ_TYPE "NONE"
#define I_REG16_6_NAME "/dev/i_reg16_6"
#define I_REG16_6_RESET_VALUE 0
#define I_REG16_6_SPAN 16
#define I_REG16_6_TYPE "altera_avalon_pio"


/*
 * i_reg32_0 configuration
 *
 */

#define ALT_MODULE_CLASS_i_reg32_0 altera_avalon_pio
#define I_REG32_0_BASE 0x41550
#define I_REG32_0_BIT_CLEARING_EDGE_REGISTER 1
#define I_REG32_0_BIT_MODIFYING_OUTPUT_REGISTER 0
#define I_REG32_0_CAPTURE 1
#define I_REG32_0_DATA_WIDTH 32
#define I_REG32_0_DO_TEST_BENCH_WIRING 0
#define I_REG32_0_DRIVEN_SIM_VALUE 0
#define I_REG32_0_EDGE_TYPE "RISING"
#define I_REG32_0_FREQ 50000000
#define I_REG32_0_HAS_IN 1
#define I_REG32_0_HAS_OUT 0
#define I_REG32_0_HAS_TRI 0
#define I_REG32_0_IRQ 2
#define I_REG32_0_IRQ_INTERRUPT_CONTROLLER_ID 0
#define I_REG32_0_IRQ_TYPE "LEVEL"
#define I_REG32_0_NAME "/dev/i_reg32_0"
#define I_REG32_0_RESET_VALUE 0
#define I_REG32_0_SPAN 16
#define I_REG32_0_TYPE "altera_avalon_pio"


/*
 * i_reg32_1 configuration
 *
 */

#define ALT_MODULE_CLASS_i_reg32_1 altera_avalon_pio
#define I_REG32_1_BASE 0x41540
#define I_REG32_1_BIT_CLEARING_EDGE_REGISTER 1
#define I_REG32_1_BIT_MODIFYING_OUTPUT_REGISTER 0
#define I_REG32_1_CAPTURE 0
#define I_REG32_1_DATA_WIDTH 32
#define I_REG32_1_DO_TEST_BENCH_WIRING 0
#define I_REG32_1_DRIVEN_SIM_VALUE 0
#define I_REG32_1_EDGE_TYPE "NONE"
#define I_REG32_1_FREQ 50000000
#define I_REG32_1_HAS_IN 1
#define I_REG32_1_HAS_OUT 0
#define I_REG32_1_HAS_TRI 0
#define I_REG32_1_IRQ -1
#define I_REG32_1_IRQ_INTERRUPT_CONTROLLER_ID -1
#define I_REG32_1_IRQ_TYPE "NONE"
#define I_REG32_1_NAME "/dev/i_reg32_1"
#define I_REG32_1_RESET_VALUE 0
#define I_REG32_1_SPAN 16
#define I_REG32_1_TYPE "altera_avalon_pio"


/*
 * i_reg32_2 configuration
 *
 */

#define ALT_MODULE_CLASS_i_reg32_2 altera_avalon_pio
#define I_REG32_2_BASE 0x41400
#define I_REG32_2_BIT_CLEARING_EDGE_REGISTER 1
#define I_REG32_2_BIT_MODIFYING_OUTPUT_REGISTER 0
#define I_REG32_2_CAPTURE 0
#define I_REG32_2_DATA_WIDTH 32
#define I_REG32_2_DO_TEST_BENCH_WIRING 0
#define I_REG32_2_DRIVEN_SIM_VALUE 0
#define I_REG32_2_EDGE_TYPE "NONE"
#define I_REG32_2_FREQ 50000000
#define I_REG32_2_HAS_IN 1
#define I_REG32_2_HAS_OUT 0
#define I_REG32_2_HAS_TRI 0
#define I_REG32_2_IRQ -1
#define I_REG32_2_IRQ_INTERRUPT_CONTROLLER_ID -1
#define I_REG32_2_IRQ_TYPE "NONE"
#define I_REG32_2_NAME "/dev/i_reg32_2"
#define I_REG32_2_RESET_VALUE 0
#define I_REG32_2_SPAN 16
#define I_REG32_2_TYPE "altera_avalon_pio"


/*
 * i_reg32_3 configuration
 *
 */

#define ALT_MODULE_CLASS_i_reg32_3 altera_avalon_pio
#define I_REG32_3_BASE 0x413f0
#define I_REG32_3_BIT_CLEARING_EDGE_REGISTER 1
#define I_REG32_3_BIT_MODIFYING_OUTPUT_REGISTER 0
#define I_REG32_3_CAPTURE 0
#define I_REG32_3_DATA_WIDTH 32
#define I_REG32_3_DO_TEST_BENCH_WIRING 0
#define I_REG32_3_DRIVEN_SIM_VALUE 0
#define I_REG32_3_EDGE_TYPE "NONE"
#define I_REG32_3_FREQ 50000000
#define I_REG32_3_HAS_IN 1
#define I_REG32_3_HAS_OUT 0
#define I_REG32_3_HAS_TRI 0
#define I_REG32_3_IRQ -1
#define I_REG32_3_IRQ_INTERRUPT_CONTROLLER_ID -1
#define I_REG32_3_IRQ_TYPE "NONE"
#define I_REG32_3_NAME "/dev/i_reg32_3"
#define I_REG32_3_RESET_VALUE 0
#define I_REG32_3_SPAN 16
#define I_REG32_3_TYPE "altera_avalon_pio"


/*
 * i_reg32_4 configuration
 *
 */

#define ALT_MODULE_CLASS_i_reg32_4 altera_avalon_pio
#define I_REG32_4_BASE 0x413e0
#define I_REG32_4_BIT_CLEARING_EDGE_REGISTER 1
#define I_REG32_4_BIT_MODIFYING_OUTPUT_REGISTER 0
#define I_REG32_4_CAPTURE 0
#define I_REG32_4_DATA_WIDTH 32
#define I_REG32_4_DO_TEST_BENCH_WIRING 0
#define I_REG32_4_DRIVEN_SIM_VALUE 0
#define I_REG32_4_EDGE_TYPE "NONE"
#define I_REG32_4_FREQ 50000000
#define I_REG32_4_HAS_IN 1
#define I_REG32_4_HAS_OUT 0
#define I_REG32_4_HAS_TRI 0
#define I_REG32_4_IRQ -1
#define I_REG32_4_IRQ_INTERRUPT_CONTROLLER_ID -1
#define I_REG32_4_IRQ_TYPE "NONE"
#define I_REG32_4_NAME "/dev/i_reg32_4"
#define I_REG32_4_RESET_VALUE 0
#define I_REG32_4_SPAN 16
#define I_REG32_4_TYPE "altera_avalon_pio"


/*
 * i_reg32_5 configuration
 *
 */

#define ALT_MODULE_CLASS_i_reg32_5 altera_avalon_pio
#define I_REG32_5_BASE 0x413d0
#define I_REG32_5_BIT_CLEARING_EDGE_REGISTER 1
#define I_REG32_5_BIT_MODIFYING_OUTPUT_REGISTER 0
#define I_REG32_5_CAPTURE 0
#define I_REG32_5_DATA_WIDTH 32
#define I_REG32_5_DO_TEST_BENCH_WIRING 0
#define I_REG32_5_DRIVEN_SIM_VALUE 0
#define I_REG32_5_EDGE_TYPE "NONE"
#define I_REG32_5_FREQ 50000000
#define I_REG32_5_HAS_IN 1
#define I_REG32_5_HAS_OUT 0
#define I_REG32_5_HAS_TRI 0
#define I_REG32_5_IRQ -1
#define I_REG32_5_IRQ_INTERRUPT_CONTROLLER_ID -1
#define I_REG32_5_IRQ_TYPE "NONE"
#define I_REG32_5_NAME "/dev/i_reg32_5"
#define I_REG32_5_RESET_VALUE 0
#define I_REG32_5_SPAN 16
#define I_REG32_5_TYPE "altera_avalon_pio"


/*
 * i_reg32_6 configuration
 *
 */

#define ALT_MODULE_CLASS_i_reg32_6 altera_avalon_pio
#define I_REG32_6_BASE 0x413c0
#define I_REG32_6_BIT_CLEARING_EDGE_REGISTER 1
#define I_REG32_6_BIT_MODIFYING_OUTPUT_REGISTER 0
#define I_REG32_6_CAPTURE 0
#define I_REG32_6_DATA_WIDTH 32
#define I_REG32_6_DO_TEST_BENCH_WIRING 0
#define I_REG32_6_DRIVEN_SIM_VALUE 0
#define I_REG32_6_EDGE_TYPE "NONE"
#define I_REG32_6_FREQ 50000000
#define I_REG32_6_HAS_IN 1
#define I_REG32_6_HAS_OUT 0
#define I_REG32_6_HAS_TRI 0
#define I_REG32_6_IRQ -1
#define I_REG32_6_IRQ_INTERRUPT_CONTROLLER_ID -1
#define I_REG32_6_IRQ_TYPE "NONE"
#define I_REG32_6_NAME "/dev/i_reg32_6"
#define I_REG32_6_RESET_VALUE 0
#define I_REG32_6_SPAN 16
#define I_REG32_6_TYPE "altera_avalon_pio"


/*
 * i_reg32_7 configuration
 *
 */

#define ALT_MODULE_CLASS_i_reg32_7 altera_avalon_pio
#define I_REG32_7_BASE 0x413b0
#define I_REG32_7_BIT_CLEARING_EDGE_REGISTER 1
#define I_REG32_7_BIT_MODIFYING_OUTPUT_REGISTER 0
#define I_REG32_7_CAPTURE 0
#define I_REG32_7_DATA_WIDTH 32
#define I_REG32_7_DO_TEST_BENCH_WIRING 0
#define I_REG32_7_DRIVEN_SIM_VALUE 0
#define I_REG32_7_EDGE_TYPE "NONE"
#define I_REG32_7_FREQ 50000000
#define I_REG32_7_HAS_IN 1
#define I_REG32_7_HAS_OUT 0
#define I_REG32_7_HAS_TRI 0
#define I_REG32_7_IRQ -1
#define I_REG32_7_IRQ_INTERRUPT_CONTROLLER_ID -1
#define I_REG32_7_IRQ_TYPE "NONE"
#define I_REG32_7_NAME "/dev/i_reg32_7"
#define I_REG32_7_RESET_VALUE 0
#define I_REG32_7_SPAN 16
#define I_REG32_7_TYPE "altera_avalon_pio"


/*
 * o_reg32_0 configuration
 *
 */

#define ALT_MODULE_CLASS_o_reg32_0 altera_avalon_pio
#define O_REG32_0_BASE 0x414c0
#define O_REG32_0_BIT_CLEARING_EDGE_REGISTER 0
#define O_REG32_0_BIT_MODIFYING_OUTPUT_REGISTER 0
#define O_REG32_0_CAPTURE 0
#define O_REG32_0_DATA_WIDTH 32
#define O_REG32_0_DO_TEST_BENCH_WIRING 0
#define O_REG32_0_DRIVEN_SIM_VALUE 0
#define O_REG32_0_EDGE_TYPE "NONE"
#define O_REG32_0_FREQ 50000000
#define O_REG32_0_HAS_IN 0
#define O_REG32_0_HAS_OUT 1
#define O_REG32_0_HAS_TRI 0
#define O_REG32_0_IRQ -1
#define O_REG32_0_IRQ_INTERRUPT_CONTROLLER_ID -1
#define O_REG32_0_IRQ_TYPE "NONE"
#define O_REG32_0_NAME "/dev/o_reg32_0"
#define O_REG32_0_RESET_VALUE 0
#define O_REG32_0_SPAN 16
#define O_REG32_0_TYPE "altera_avalon_pio"


/*
 * o_reg32_1 configuration
 *
 */

#define ALT_MODULE_CLASS_o_reg32_1 altera_avalon_pio
#define O_REG32_1_BASE 0x414b0
#define O_REG32_1_BIT_CLEARING_EDGE_REGISTER 0
#define O_REG32_1_BIT_MODIFYING_OUTPUT_REGISTER 0
#define O_REG32_1_CAPTURE 0
#define O_REG32_1_DATA_WIDTH 32
#define O_REG32_1_DO_TEST_BENCH_WIRING 0
#define O_REG32_1_DRIVEN_SIM_VALUE 0
#define O_REG32_1_EDGE_TYPE "NONE"
#define O_REG32_1_FREQ 50000000
#define O_REG32_1_HAS_IN 0
#define O_REG32_1_HAS_OUT 1
#define O_REG32_1_HAS_TRI 0
#define O_REG32_1_IRQ -1
#define O_REG32_1_IRQ_INTERRUPT_CONTROLLER_ID -1
#define O_REG32_1_IRQ_TYPE "NONE"
#define O_REG32_1_NAME "/dev/o_reg32_1"
#define O_REG32_1_RESET_VALUE 0
#define O_REG32_1_SPAN 16
#define O_REG32_1_TYPE "altera_avalon_pio"


/*
 * o_reg32_10 configuration
 *
 */

#define ALT_MODULE_CLASS_o_reg32_10 altera_avalon_pio
#define O_REG32_10_BASE 0x41420
#define O_REG32_10_BIT_CLEARING_EDGE_REGISTER 0
#define O_REG32_10_BIT_MODIFYING_OUTPUT_REGISTER 0
#define O_REG32_10_CAPTURE 0
#define O_REG32_10_DATA_WIDTH 32
#define O_REG32_10_DO_TEST_BENCH_WIRING 0
#define O_REG32_10_DRIVEN_SIM_VALUE 0
#define O_REG32_10_EDGE_TYPE "NONE"
#define O_REG32_10_FREQ 50000000
#define O_REG32_10_HAS_IN 0
#define O_REG32_10_HAS_OUT 1
#define O_REG32_10_HAS_TRI 0
#define O_REG32_10_IRQ -1
#define O_REG32_10_IRQ_INTERRUPT_CONTROLLER_ID -1
#define O_REG32_10_IRQ_TYPE "NONE"
#define O_REG32_10_NAME "/dev/o_reg32_10"
#define O_REG32_10_RESET_VALUE 0
#define O_REG32_10_SPAN 16
#define O_REG32_10_TYPE "altera_avalon_pio"


/*
 * o_reg32_11 configuration
 *
 */

#define ALT_MODULE_CLASS_o_reg32_11 altera_avalon_pio
#define O_REG32_11_BASE 0x41410
#define O_REG32_11_BIT_CLEARING_EDGE_REGISTER 0
#define O_REG32_11_BIT_MODIFYING_OUTPUT_REGISTER 0
#define O_REG32_11_CAPTURE 0
#define O_REG32_11_DATA_WIDTH 32
#define O_REG32_11_DO_TEST_BENCH_WIRING 0
#define O_REG32_11_DRIVEN_SIM_VALUE 0
#define O_REG32_11_EDGE_TYPE "NONE"
#define O_REG32_11_FREQ 50000000
#define O_REG32_11_HAS_IN 0
#define O_REG32_11_HAS_OUT 1
#define O_REG32_11_HAS_TRI 0
#define O_REG32_11_IRQ -1
#define O_REG32_11_IRQ_INTERRUPT_CONTROLLER_ID -1
#define O_REG32_11_IRQ_TYPE "NONE"
#define O_REG32_11_NAME "/dev/o_reg32_11"
#define O_REG32_11_RESET_VALUE 0
#define O_REG32_11_SPAN 16
#define O_REG32_11_TYPE "altera_avalon_pio"


/*
 * o_reg32_12 configuration
 *
 */

#define ALT_MODULE_CLASS_o_reg32_12 altera_avalon_pio
#define O_REG32_12_BASE 0x41390
#define O_REG32_12_BIT_CLEARING_EDGE_REGISTER 0
#define O_REG32_12_BIT_MODIFYING_OUTPUT_REGISTER 0
#define O_REG32_12_CAPTURE 0
#define O_REG32_12_DATA_WIDTH 32
#define O_REG32_12_DO_TEST_BENCH_WIRING 0
#define O_REG32_12_DRIVEN_SIM_VALUE 0
#define O_REG32_12_EDGE_TYPE "NONE"
#define O_REG32_12_FREQ 50000000
#define O_REG32_12_HAS_IN 0
#define O_REG32_12_HAS_OUT 1
#define O_REG32_12_HAS_TRI 0
#define O_REG32_12_IRQ -1
#define O_REG32_12_IRQ_INTERRUPT_CONTROLLER_ID -1
#define O_REG32_12_IRQ_TYPE "NONE"
#define O_REG32_12_NAME "/dev/o_reg32_12"
#define O_REG32_12_RESET_VALUE 0
#define O_REG32_12_SPAN 16
#define O_REG32_12_TYPE "altera_avalon_pio"


/*
 * o_reg32_13 configuration
 *
 */

#define ALT_MODULE_CLASS_o_reg32_13 altera_avalon_pio
#define O_REG32_13_BASE 0x413a0
#define O_REG32_13_BIT_CLEARING_EDGE_REGISTER 0
#define O_REG32_13_BIT_MODIFYING_OUTPUT_REGISTER 0
#define O_REG32_13_CAPTURE 0
#define O_REG32_13_DATA_WIDTH 32
#define O_REG32_13_DO_TEST_BENCH_WIRING 0
#define O_REG32_13_DRIVEN_SIM_VALUE 0
#define O_REG32_13_EDGE_TYPE "NONE"
#define O_REG32_13_FREQ 50000000
#define O_REG32_13_HAS_IN 0
#define O_REG32_13_HAS_OUT 1
#define O_REG32_13_HAS_TRI 0
#define O_REG32_13_IRQ -1
#define O_REG32_13_IRQ_INTERRUPT_CONTROLLER_ID -1
#define O_REG32_13_IRQ_TYPE "NONE"
#define O_REG32_13_NAME "/dev/o_reg32_13"
#define O_REG32_13_RESET_VALUE 0
#define O_REG32_13_SPAN 16
#define O_REG32_13_TYPE "altera_avalon_pio"


/*
 * o_reg32_2 configuration
 *
 */

#define ALT_MODULE_CLASS_o_reg32_2 altera_avalon_pio
#define O_REG32_2_BASE 0x414a0
#define O_REG32_2_BIT_CLEARING_EDGE_REGISTER 0
#define O_REG32_2_BIT_MODIFYING_OUTPUT_REGISTER 0
#define O_REG32_2_CAPTURE 0
#define O_REG32_2_DATA_WIDTH 32
#define O_REG32_2_DO_TEST_BENCH_WIRING 0
#define O_REG32_2_DRIVEN_SIM_VALUE 0
#define O_REG32_2_EDGE_TYPE "NONE"
#define O_REG32_2_FREQ 50000000
#define O_REG32_2_HAS_IN 0
#define O_REG32_2_HAS_OUT 1
#define O_REG32_2_HAS_TRI 0
#define O_REG32_2_IRQ -1
#define O_REG32_2_IRQ_INTERRUPT_CONTROLLER_ID -1
#define O_REG32_2_IRQ_TYPE "NONE"
#define O_REG32_2_NAME "/dev/o_reg32_2"
#define O_REG32_2_RESET_VALUE 0
#define O_REG32_2_SPAN 16
#define O_REG32_2_TYPE "altera_avalon_pio"


/*
 * o_reg32_3 configuration
 *
 */

#define ALT_MODULE_CLASS_o_reg32_3 altera_avalon_pio
#define O_REG32_3_BASE 0x41490
#define O_REG32_3_BIT_CLEARING_EDGE_REGISTER 0
#define O_REG32_3_BIT_MODIFYING_OUTPUT_REGISTER 0
#define O_REG32_3_CAPTURE 0
#define O_REG32_3_DATA_WIDTH 32
#define O_REG32_3_DO_TEST_BENCH_WIRING 0
#define O_REG32_3_DRIVEN_SIM_VALUE 0
#define O_REG32_3_EDGE_TYPE "NONE"
#define O_REG32_3_FREQ 50000000
#define O_REG32_3_HAS_IN 0
#define O_REG32_3_HAS_OUT 1
#define O_REG32_3_HAS_TRI 0
#define O_REG32_3_IRQ -1
#define O_REG32_3_IRQ_INTERRUPT_CONTROLLER_ID -1
#define O_REG32_3_IRQ_TYPE "NONE"
#define O_REG32_3_NAME "/dev/o_reg32_3"
#define O_REG32_3_RESET_VALUE 0
#define O_REG32_3_SPAN 16
#define O_REG32_3_TYPE "altera_avalon_pio"


/*
 * o_reg32_4 configuration
 *
 */

#define ALT_MODULE_CLASS_o_reg32_4 altera_avalon_pio
#define O_REG32_4_BASE 0x41480
#define O_REG32_4_BIT_CLEARING_EDGE_REGISTER 0
#define O_REG32_4_BIT_MODIFYING_OUTPUT_REGISTER 0
#define O_REG32_4_CAPTURE 0
#define O_REG32_4_DATA_WIDTH 32
#define O_REG32_4_DO_TEST_BENCH_WIRING 0
#define O_REG32_4_DRIVEN_SIM_VALUE 0
#define O_REG32_4_EDGE_TYPE "NONE"
#define O_REG32_4_FREQ 50000000
#define O_REG32_4_HAS_IN 0
#define O_REG32_4_HAS_OUT 1
#define O_REG32_4_HAS_TRI 0
#define O_REG32_4_IRQ -1
#define O_REG32_4_IRQ_INTERRUPT_CONTROLLER_ID -1
#define O_REG32_4_IRQ_TYPE "NONE"
#define O_REG32_4_NAME "/dev/o_reg32_4"
#define O_REG32_4_RESET_VALUE 0
#define O_REG32_4_SPAN 16
#define O_REG32_4_TYPE "altera_avalon_pio"


/*
 * o_reg32_5 configuration
 *
 */

#define ALT_MODULE_CLASS_o_reg32_5 altera_avalon_pio
#define O_REG32_5_BASE 0x41470
#define O_REG32_5_BIT_CLEARING_EDGE_REGISTER 0
#define O_REG32_5_BIT_MODIFYING_OUTPUT_REGISTER 0
#define O_REG32_5_CAPTURE 0
#define O_REG32_5_DATA_WIDTH 32
#define O_REG32_5_DO_TEST_BENCH_WIRING 0
#define O_REG32_5_DRIVEN_SIM_VALUE 0
#define O_REG32_5_EDGE_TYPE "NONE"
#define O_REG32_5_FREQ 50000000
#define O_REG32_5_HAS_IN 0
#define O_REG32_5_HAS_OUT 1
#define O_REG32_5_HAS_TRI 0
#define O_REG32_5_IRQ -1
#define O_REG32_5_IRQ_INTERRUPT_CONTROLLER_ID -1
#define O_REG32_5_IRQ_TYPE "NONE"
#define O_REG32_5_NAME "/dev/o_reg32_5"
#define O_REG32_5_RESET_VALUE 0
#define O_REG32_5_SPAN 16
#define O_REG32_5_TYPE "altera_avalon_pio"


/*
 * o_reg32_6 configuration
 *
 */

#define ALT_MODULE_CLASS_o_reg32_6 altera_avalon_pio
#define O_REG32_6_BASE 0x41460
#define O_REG32_6_BIT_CLEARING_EDGE_REGISTER 0
#define O_REG32_6_BIT_MODIFYING_OUTPUT_REGISTER 0
#define O_REG32_6_CAPTURE 0
#define O_REG32_6_DATA_WIDTH 32
#define O_REG32_6_DO_TEST_BENCH_WIRING 0
#define O_REG32_6_DRIVEN_SIM_VALUE 0
#define O_REG32_6_EDGE_TYPE "NONE"
#define O_REG32_6_FREQ 50000000
#define O_REG32_6_HAS_IN 0
#define O_REG32_6_HAS_OUT 1
#define O_REG32_6_HAS_TRI 0
#define O_REG32_6_IRQ -1
#define O_REG32_6_IRQ_INTERRUPT_CONTROLLER_ID -1
#define O_REG32_6_IRQ_TYPE "NONE"
#define O_REG32_6_NAME "/dev/o_reg32_6"
#define O_REG32_6_RESET_VALUE 0
#define O_REG32_6_SPAN 16
#define O_REG32_6_TYPE "altera_avalon_pio"


/*
 * o_reg32_7 configuration
 *
 */

#define ALT_MODULE_CLASS_o_reg32_7 altera_avalon_pio
#define O_REG32_7_BASE 0x41450
#define O_REG32_7_BIT_CLEARING_EDGE_REGISTER 0
#define O_REG32_7_BIT_MODIFYING_OUTPUT_REGISTER 0
#define O_REG32_7_CAPTURE 0
#define O_REG32_7_DATA_WIDTH 32
#define O_REG32_7_DO_TEST_BENCH_WIRING 0
#define O_REG32_7_DRIVEN_SIM_VALUE 0
#define O_REG32_7_EDGE_TYPE "NONE"
#define O_REG32_7_FREQ 50000000
#define O_REG32_7_HAS_IN 0
#define O_REG32_7_HAS_OUT 1
#define O_REG32_7_HAS_TRI 0
#define O_REG32_7_IRQ -1
#define O_REG32_7_IRQ_INTERRUPT_CONTROLLER_ID -1
#define O_REG32_7_IRQ_TYPE "NONE"
#define O_REG32_7_NAME "/dev/o_reg32_7"
#define O_REG32_7_RESET_VALUE 0
#define O_REG32_7_SPAN 16
#define O_REG32_7_TYPE "altera_avalon_pio"


/*
 * o_reg32_8 configuration
 *
 */

#define ALT_MODULE_CLASS_o_reg32_8 altera_avalon_pio
#define O_REG32_8_BASE 0x41440
#define O_REG32_8_BIT_CLEARING_EDGE_REGISTER 0
#define O_REG32_8_BIT_MODIFYING_OUTPUT_REGISTER 0
#define O_REG32_8_CAPTURE 0
#define O_REG32_8_DATA_WIDTH 32
#define O_REG32_8_DO_TEST_BENCH_WIRING 0
#define O_REG32_8_DRIVEN_SIM_VALUE 0
#define O_REG32_8_EDGE_TYPE "NONE"
#define O_REG32_8_FREQ 50000000
#define O_REG32_8_HAS_IN 0
#define O_REG32_8_HAS_OUT 1
#define O_REG32_8_HAS_TRI 0
#define O_REG32_8_IRQ -1
#define O_REG32_8_IRQ_INTERRUPT_CONTROLLER_ID -1
#define O_REG32_8_IRQ_TYPE "NONE"
#define O_REG32_8_NAME "/dev/o_reg32_8"
#define O_REG32_8_RESET_VALUE 0
#define O_REG32_8_SPAN 16
#define O_REG32_8_TYPE "altera_avalon_pio"


/*
 * o_reg32_9 configuration
 *
 */

#define ALT_MODULE_CLASS_o_reg32_9 altera_avalon_pio
#define O_REG32_9_BASE 0x41430
#define O_REG32_9_BIT_CLEARING_EDGE_REGISTER 0
#define O_REG32_9_BIT_MODIFYING_OUTPUT_REGISTER 0
#define O_REG32_9_CAPTURE 0
#define O_REG32_9_DATA_WIDTH 32
#define O_REG32_9_DO_TEST_BENCH_WIRING 0
#define O_REG32_9_DRIVEN_SIM_VALUE 0
#define O_REG32_9_EDGE_TYPE "NONE"
#define O_REG32_9_FREQ 50000000
#define O_REG32_9_HAS_IN 0
#define O_REG32_9_HAS_OUT 1
#define O_REG32_9_HAS_TRI 0
#define O_REG32_9_IRQ -1
#define O_REG32_9_IRQ_INTERRUPT_CONTROLLER_ID -1
#define O_REG32_9_IRQ_TYPE "NONE"
#define O_REG32_9_NAME "/dev/o_reg32_9"
#define O_REG32_9_RESET_VALUE 0
#define O_REG32_9_SPAN 16
#define O_REG32_9_TYPE "altera_avalon_pio"


/*
 * onchip_memory2_0 configuration
 *
 */

#define ALT_MODULE_CLASS_onchip_memory2_0 altera_avalon_onchip_memory2
#define ONCHIP_MEMORY2_0_ALLOW_IN_SYSTEM_MEMORY_CONTENT_EDITOR 0
#define ONCHIP_MEMORY2_0_ALLOW_MRAM_SIM_CONTENTS_ONLY_FILE 0
#define ONCHIP_MEMORY2_0_BASE 0x20000
#define ONCHIP_MEMORY2_0_CONTENTS_INFO ""
#define ONCHIP_MEMORY2_0_DUAL_PORT 0
#define ONCHIP_MEMORY2_0_GUI_RAM_BLOCK_TYPE "AUTO"
#define ONCHIP_MEMORY2_0_INIT_CONTENTS_FILE "NiosBase_onchip_memory2_0"
#define ONCHIP_MEMORY2_0_INIT_MEM_CONTENT 1
#define ONCHIP_MEMORY2_0_INSTANCE_ID "NONE"
#define ONCHIP_MEMORY2_0_IRQ -1
#define ONCHIP_MEMORY2_0_IRQ_INTERRUPT_CONTROLLER_ID -1
#define ONCHIP_MEMORY2_0_NAME "/dev/onchip_memory2_0"
#define ONCHIP_MEMORY2_0_NON_DEFAULT_INIT_FILE_ENABLED 0
#define ONCHIP_MEMORY2_0_RAM_BLOCK_TYPE "AUTO"
#define ONCHIP_MEMORY2_0_READ_DURING_WRITE_MODE "DONT_CARE"
#define ONCHIP_MEMORY2_0_SINGLE_CLOCK_OP 0
#define ONCHIP_MEMORY2_0_SIZE_MULTIPLE 1
#define ONCHIP_MEMORY2_0_SIZE_VALUE 131072
#define ONCHIP_MEMORY2_0_SPAN 131072
#define ONCHIP_MEMORY2_0_TYPE "altera_avalon_onchip_memory2"
#define ONCHIP_MEMORY2_0_WRITABLE 1


/*
 * timer_0 configuration
 *
 */

#define ALT_MODULE_CLASS_timer_0 altera_avalon_timer
#define TIMER_0_ALWAYS_RUN 0
#define TIMER_0_BASE 0x411a0
#define TIMER_0_COUNTER_SIZE 32
#define TIMER_0_FIXED_PERIOD 0
#define TIMER_0_FREQ 50000000
#define TIMER_0_IRQ 0
#define TIMER_0_IRQ_INTERRUPT_CONTROLLER_ID 0
#define TIMER_0_LOAD_VALUE 49999
#define TIMER_0_MULT 0.001
#define TIMER_0_NAME "/dev/timer_0"
#define TIMER_0_PERIOD 1
#define TIMER_0_PERIOD_UNITS "ms"
#define TIMER_0_RESET_OUTPUT 0
#define TIMER_0_SNAPSHOT 1
#define TIMER_0_SPAN 32
#define TIMER_0_TICKS_PER_SEC 1000
#define TIMER_0_TIMEOUT_PULSE_OUTPUT 0
#define TIMER_0_TYPE "altera_avalon_timer"


/*
 * timer_1 configuration
 *
 */

#define ALT_MODULE_CLASS_timer_1 altera_avalon_timer
#define TIMER_1_ALWAYS_RUN 0
#define TIMER_1_BASE 0x41180
#define TIMER_1_COUNTER_SIZE 32
#define TIMER_1_FIXED_PERIOD 0
#define TIMER_1_FREQ 50000000
#define TIMER_1_IRQ 1
#define TIMER_1_IRQ_INTERRUPT_CONTROLLER_ID 0
#define TIMER_1_LOAD_VALUE 499999
#define TIMER_1_MULT 0.001
#define TIMER_1_NAME "/dev/timer_1"
#define TIMER_1_PERIOD 10
#define TIMER_1_PERIOD_UNITS "ms"
#define TIMER_1_RESET_OUTPUT 0
#define TIMER_1_SNAPSHOT 1
#define TIMER_1_SPAN 32
#define TIMER_1_TICKS_PER_SEC 100
#define TIMER_1_TIMEOUT_PULSE_OUTPUT 0
#define TIMER_1_TYPE "altera_avalon_timer"


/*
 * uart_0 configuration
 *
 */

#define ALT_MODULE_CLASS_uart_0 altera_avalon_uart
#define UART_0_BASE 0x41160
#define UART_0_BAUD 115200
#define UART_0_DATA_BITS 8
#define UART_0_FIXED_BAUD 1
#define UART_0_FREQ 50000000
#define UART_0_IRQ 3
#define UART_0_IRQ_INTERRUPT_CONTROLLER_ID 0
#define UART_0_NAME "/dev/uart_0"
#define UART_0_PARITY 'N'
#define UART_0_SIM_CHAR_STREAM ""
#define UART_0_SIM_TRUE_BAUD 0
#define UART_0_SPAN 32
#define UART_0_STOP_BITS 1
#define UART_0_SYNC_REG_DEPTH 2
#define UART_0_TYPE "altera_avalon_uart"
#define UART_0_USE_CTS_RTS 0
#define UART_0_USE_EOP_REGISTER 0

#endif /* __SYSTEM_H_ */
