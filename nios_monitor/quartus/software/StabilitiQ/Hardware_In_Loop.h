/*
 * Hardware_In_Loop.h
 *
 *  Created on: Aug 9, 2021
 *      Author: james
 */

#ifndef HARDWARE_IN_LOOP_H_
#define HARDWARE_IN_LOOP_H_

#include "system_parameters.h"
#include "system.h"
#include "data_structures.h"
#include "comm_messages.h"

#include <math.h>
#include <stdio.h>

#include "alt_types.h"
#include "altera_avalon_pio_regs.h"

//=================================
// HIL related system wide parameters
//=================================

#define TIMER_CNTS_50HZ 974 // default timer HIL value for sine waves
#define TIMER_CNTS_DELTA 3  // amount by which timer counts changes
#define HIL_START_INDEX 5


void select_HIL_inputs();

void set_HIL_amplitude(int amplitude, int display_msg);

void set_HIL_timer_cnts(int freq, int display_msg);

void set_HIL_filter(filter_t* filter_params);

//=================================================
// Unit Test - Increase or Decrease Amplitude
//
// Description : Increase or decrease amplitude
//               in a linear fashion to test the
//               voltage response modes.
//=================================================
//void HIL_test_amplitude(int index, int increase_mode, int hil_amplitude);
///=================================================
/// Function : HIL_test_frequency
/// Brief    : Unit Test - Increase/Decrease Frequency
/// Description :
/// Raise or lower the frequency in a linear
/// fashion, writing to the frequency register each time
/// to test the frequency response mode.
///-------------------------------------------------
/// Arguments:
/// 1. index - assigned from the main loop (caller)
/// 2. increase_mode - sets increment/decrement operation
///-------------------------------------------------
/// Locals:
/// 1. new_timer_cnts (static) -- timer counts accumulator
/// ------------------------------------------------
/// Globals:
/// 1. TIMER_CNTS_50HZ  - default timer counts 50 Hz
/// 2. HIL_INDEX_START  - main loop index to start HIL
/// 3. TIMER_CNTS_DELTA - change of timer counts (changes frequency)
///=================================================
int HIL_test_frequency(int index, int increase_mode);

void HIL_display_results(int main_count, input_t *gInput, cmd_t *gCommand, int sec, state_general_t state);

#endif /* HARDWARE_IN_LOOP_H_ */
