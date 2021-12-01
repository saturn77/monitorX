/*
 * frequency_response.c
 *
 *  Created on: Aug 13, 2021
 *      Author: james
 */


///=======================================================
///  \brief    Frequency Response Mode Update
///  \detailed Operate on the intput_t* gInput data structure,
///            where frequency is computed and compared to thresholds.
///            The return type is void, as the function
///            works on a structure pointer.
///
///=======================================================

#include "frequency_response.h"



extern int g_max_power_reached; // global latch indicating MAX POWER state was reached
extern int g_min_power_reached; // global latch indicating MIN POWER state was reached
extern state_general_t ST_GENERAL;


extern int g_sec_counter; /// Global Int, seconds counter
extern int g_sec_enable;  /// Global Int, seconds counter enable

void enable_timer_sec() {
	g_sec_enable = 1;
}

void reset_timer_sec() {
	g_sec_counter = 0;
	g_sec_enable = 0;
}


double increment_power(double power_latched, double sampled_data_freq) {

	return power_latched + ((P_MAX - power_latched)* ((F_LLCO - sampled_data_freq) / (F_LLCO - F_PMAX)));
}

double decrement_power(double power_ref_latched, double sampled_data_freq) {

	return power_ref_latched
			* (1 - ((sampled_data_freq - F_ULCO) / (F_PMIN - F_ULCO)));
}

void frequency_response_update(input_t *gInput, cmd_t *gCommand, int debug) {

	input_t sampled_data;
	sampled_data = *gInput;
	cmd_t cmd_value;
	cmd_value = *gCommand;
	static double power_ref_latched = 0;

	switch (ST_GENERAL) {
	case (NOMINAL): {
		if (sampled_data.freq < F_LLCO) {
			ST_GENERAL = FREQ_FALLING;
			cmd_value.active_power_latched = sampled_data.real_power;
			power_ref_latched = sampled_data.real_power;
			if (debug){
			printf("** Transition to FREQ_FALLING\r\n");
			printf("Latched power = %f\r\n", power_ref_latched);
			}
			g_max_power_reached = 0;
			g_min_power_reached = 0;
		} else if (sampled_data.freq > F_ULCO) {
			ST_GENERAL = FREQ_RISING;
			cmd_value.active_power_latched = sampled_data.real_power;
			power_ref_latched = sampled_data.real_power;
			g_max_power_reached = 0;
			g_min_power_reached = 0;
			if (debug){
				printf("** Transition to FREQ_RISING\r\n");
				printf("Latched power = %f\r\n", power_ref_latched);
			}
		} else {
			ST_GENERAL = NOMINAL;

		}

		*gCommand = cmd_value;
		break;
	}
	case (FREQ_FALLING): {
		if (sampled_data.freq < F_PMAX) {
			ST_GENERAL = MAX_POWER;
			reset_timer_sec();
			cmd_value.active_power_max = P_MAX;
			if (debug) printf("** Transition to MAX_POWER\r\n");
		} else if (sampled_data.freq < (F_LLCO + F_HSYS)) {
			ST_GENERAL = FREQ_FALLING;
			reset_timer_sec();
			if (g_max_power_reached) {
				cmd_value.active_power_max = P_MAX;
			} else {
				double power_value = increment_power(power_ref_latched,
						sampled_data.freq);
				if (power_value > cmd_value.active_power_max) {
					cmd_value.active_power_max = power_value;
				}
			}

		} else {
			enable_timer_sec();
			//printf("g_sec_counter = %d \r\n", g_sec_counter);
			if (g_sec_counter > FREQ_MODE_PERSIST_SEC) {
				ST_GENERAL = NOMINAL;
				cmd_value.active_power_max = power_ref_latched;
				if (debug){

				printf(
						"** Transition back to NOMINAL after timeout and hysteresis conditions met.\r\n");
				printf("** Latched power is %f \r\n", power_ref_latched);
				printf("** Max power to hold is %f \r\n",
						cmd_value.active_power_max);
				}
			} else {
				ST_GENERAL = FREQ_FALLING;
			}
		}

		*gCommand = cmd_value;
		break;
	}
	case (MAX_POWER): {
		if (sampled_data.freq > F_PMAX) {
			ST_GENERAL = FREQ_FALLING;

			if (debug) printf("** Transition to FREQ_FALLING\r\n");
		} else {
			ST_GENERAL = MAX_POWER;
		}
		g_max_power_reached = 1;
		cmd_value.active_power_max = P_MAX;
		*gCommand = cmd_value;
		break;
	}

	case (FREQ_RISING): {
		if (sampled_data.freq > F_PMIN) {
			ST_GENERAL = MIN_POWER;
			reset_timer_sec();
			cmd_value.active_power_max = P_MIN;
			if (debug) printf("** Transition to MIN_POWER\r\n");
		} else if (sampled_data.freq > (F_ULCO - F_HSYS)) {
			ST_GENERAL = FREQ_RISING;
			reset_timer_sec();
			if (g_min_power_reached) {
				cmd_value.active_power_max = P_MIN;
			} else {
				double power_value = decrement_power(power_ref_latched,
						sampled_data.freq);
				if (power_value < cmd_value.active_power_max) {
					cmd_value.active_power_max = power_value;
				}
			}

		} else {
			enable_timer_sec();
			//printf("Awaiting timeout...g_sec_counter=  %d\r\n", g_sec_counter);
			if (g_sec_counter > FREQ_MODE_PERSIST_SEC) {
				ST_GENERAL = NOMINAL;
				if (debug){
				printf("\r\nEND");
				printf(
						"** Transition back to NOMINAL after timeout and hysteresis conditions met.\r\n");
				printf("** Latched power is %f \r\n", power_ref_latched);
				printf("** Min power to hold is %f \r\n",
						cmd_value.active_power_max);
				}
				//cmd_value.active_power_max = power_ref_latched;
			} else {
				ST_GENERAL = FREQ_RISING;
				//cmd_value.active_power_max = P_MAX;
			}
		}

		*gCommand = cmd_value;
		break;
	}

	case (MIN_POWER): {
		if (sampled_data.freq < F_PMIN) {
			ST_GENERAL = FREQ_RISING;
		} else {
			ST_GENERAL = MIN_POWER;
		}
		cmd_value.active_power_max = P_MIN;
		*gCommand = cmd_value;
		g_min_power_reached = 1;
		break;
	}

	}

}
