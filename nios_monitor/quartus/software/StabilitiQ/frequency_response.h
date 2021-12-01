#ifndef FREQUENCY_RESPONSE_H_
#define FREQUENCY_RESPONSE_H_

#include "system_parameters.h"
#include "data_structures.h"
#include <math.h>
#include <stdio.h>


#define FREQ_MODE_PERSIST_SEC 30

//--------------------------------------------------------------
// Defines for Volt-Watt response modes
// These defines could be translated to a struct (likely will be)
//--------------------------------------------------------------
#define P_MAX 30000           // Rated Maximum Real Power of Unit
#define P_MIN 0               // Rated Minimum Real Power

#define F_HSYS  0.1            // Frequency hysteresis value

#define F_LLCO 49.75          // Frequency lower limit for continuous operation
#define F_PMAX 48.0           // Frequency where power output level is maximum
#define F_STOP_CH 49.0        // Frequency where input power level is zero


#define F_ULCO 50.25          // Frequency upper limit for continuous operation
#define F_PMIN 52             // Frequency where power level is minimum


void enable_timer_sec();

void disable_timer_sec();

double increment_power(double power_latched, double sampled_data_freq);

double decrement_power(double power_ref_latched, double sampled_data_freq);

void frequency_response_update(input_t *gInput, cmd_t *gCommand, int debug);

#endif 
