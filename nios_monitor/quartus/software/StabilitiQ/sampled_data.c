//===============================================
// File    : sampled_data.c
// Author  : James B
//-----------------------------------------------
// Created : 05 Aug 2021
// Revised : 05 Aug 2021 -- Initial release
//-----------------------------------------------
// Summary : Implemented methods declared in
//           sampled_data.h file.
//
//===============================================

#include "sampled_data.h"


void voltage_sample(input_t *gInput){
	input_t sampled_data;
	sampled_data = *gInput;
	sampled_data.sample_k  = IORD_ALTERA_AVALON_PIO_DATA(I_REG32_1_BASE);
	sampled_data.rms = RECIP_ADC_VOLT_GAIN*RECIP_SQRT_3*sqrt((alt_64)sampled_data.sample_k);
	*gInput = sampled_data;
}

void frequency_sample(input_t *gInput){
	input_t sampled_data;
	sampled_data = *gInput;
	sampled_data.timer_k   = IORD_ALTERA_AVALON_PIO_DATA(I_REG32_2_BASE);
	sampled_data.freq = 1/(FPGA_MCLK*((alt_64)sampled_data.timer_k));
	*gInput = sampled_data;
}

void sample_power_values(input_t *gInput){
	input_t power;
	power = *gInput;
	power.real_k = IORD_ALTERA_AVALON_PIO_DATA(I_REG32_3_BASE);
	power.real_power = (SQRT_3_DIV_2 * FILTER_SCALE) * sqrt((alt_64)power.real_k);
	*gInput = power;
}

void set_squares_filter(filter_t* filter_params){

	IOWR_ALTERA_AVALON_PIO_DATA(O_REG32_4_BASE, filter_params->tsx);
	IOWR_ALTERA_AVALON_PIO_DATA(O_REG32_5_BASE, filter_params->alpha);
	IOWR_ALTERA_AVALON_PIO_DATA(O_REG32_6_BASE, filter_params->beta);
}

void set_timer_filter(filter_t* filter_params){
	IOWR_ALTERA_AVALON_PIO_DATA(O_REG32_11_BASE, filter_params->tsx);
	IOWR_ALTERA_AVALON_PIO_DATA(O_REG32_8_BASE, filter_params->alpha);
	IOWR_ALTERA_AVALON_PIO_DATA(O_REG32_9_BASE, filter_params->beta);
}



void disable_fpga_filter(){
	IOWR_ALTERA_AVALON_PIO_DATA(O_REG32_7_BASE, 0x0);
}


//void sample_three_phase(phase_t *gS_three_phase){
//	phase_t phase;
//	phase = *gS_three_phase;
//	phase.voltA = IORD_ALTERA_AVALON_PIO_DATA(I_REG16_0_BASE);
//	phase.voltB = IORD_ALTERA_AVALON_PIO_DATA(I_REG16_1_BASE);
//	phase.voltC = IORD_ALTERA_AVALON_PIO_DATA(I_REG16_2_BASE);
//
//	phase.currA = IORD_ALTERA_AVALON_PIO_DATA(I_REG16_3_BASE);
//	phase.currB = IORD_ALTERA_AVALON_PIO_DATA(I_REG16_4_BASE);
//	phase.currC = IORD_ALTERA_AVALON_PIO_DATA(I_REG16_5_BASE);
//
//	phase.voltAlpha = (double)phase.voltA;
//	phase.voltBeta  = RECIP_SQRT_3 * ((alt_64)phase.voltB - phase.voltC);
//
//	phase.currAlpha = (double)phase.currA;
//	phase.currBeta  = RECIP_SQRT_3 * ((alt_64)phase.currB - phase.currC);
//
//	*gS_three_phase = phase;
//}
//
//void power_calc(phase_t *gS_three_phase, power_t *gS_power_calc){
//	power_t power;
//	power = *gS_power_calc;
//	phase_t phase;
//	phase = *gS_three_phase;
//	power.real = phase.voltAlpha*phase.currAlpha - phase.voltBeta*phase.currBeta;
//	power.reactive = phase.voltAlpha*phase.currBeta + phase.voltBeta*phase.currAlpha;
//	*gS_power_calc = power;
//}
