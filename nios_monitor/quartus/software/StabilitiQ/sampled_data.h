//===============================================
// File    : sampled_data.h
// Author  : James B
//-----------------------------------------------
// Created : 05 Aug 2021
// Revised : 05 Aug 2021 -- Initial release
//-----------------------------------------------
// Summary : Nios samples external signals from
//           the FPGA fabric via PIO input
//           registers, and performs basic
//           processing such as RMS calculations.
//           The input structure operated on
//           global struct gInput
//
//           Note that gInput struct is defined
//           in data_structures.h, which is the
//           project wide data structures header.
//===============================================

#ifndef SAMPLED_DATA_H_
#define SAMPLED_DATA_H_

#include <math.h>

#include "alt_types.h"
#include "altera_avalon_pio_regs.h"

#include "system_parameters.h"
#include "data_structures.h"
#include "system.h"

//extern input_t gInput;



void voltage_sample(input_t *gInput);

void frequency_sample(input_t *gInput);

void sample_power_values(input_t *gInput);

void set_squares_filter(filter_t* filter_params);

void set_timer_filter(filter_t* filter_params);

void enable_fpga_filter();

void disable_fpga_filter();

#endif /* SAMPLED_DATA_H_ */
