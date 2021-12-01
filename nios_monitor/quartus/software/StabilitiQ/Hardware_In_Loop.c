#include "Hardware_In_Loop.h"


extern int hil_timer_cnts;

void select_HIL_inputs(){
	IOWR_ALTERA_AVALON_PIO_DATA(O_REG32_7_BASE, 0x1);
}


void set_HIL_amplitude (int amplitude, int display_msg){
	IOWR_ALTERA_AVALON_PIO_DATA(O_REG32_0_BASE, amplitude);
	if (display_msg){
	printf("**** The HIL amplitude (in Counts) = %d\r\n", amplitude);
	printf("**** The HIL Counts per Volt = %f \r\n", CNTS_PER_VOLT);

	delay_msec(1);
}
}
void set_HIL_timer_cnts(int timer_cnts, int display_msg){
	IOWR_ALTERA_AVALON_PIO_DATA(O_REG32_10_BASE, timer_cnts);
	if (display_msg){
	printf("**** The sinewave HIL period is set to ");
	double timer_period = 1/(1024*timer_cnts*FPGA_MCLK);
	printf("%f Hertz.\r\n", timer_period);
	}
	delay_msec(1);
}

void set_HIL_filter(filter_t* filter_params){
	IOWR_ALTERA_AVALON_PIO_DATA(O_REG32_12_BASE, filter_params->alpha);
	IOWR_ALTERA_AVALON_PIO_DATA(O_REG32_13_BASE, filter_params->beta);
}

//=================================================
// Unit Test - Increase or Decrease Amplitude
//
// Description : Increase or decrease amplitude
//               in a linear fashion to test the
//               voltage response modes.
//=================================================
//void HIL_test_amplitude(int index, int increase_mode, int hil_amplitude) {
//	if (index > 10) {
//		if (gAmp < 100) {
//			gAmp += 1;
//		} else {
//			gAmp = 100;
//		}
//		int new_amp;
//		if (increase_mode) {
//			new_amp = gAmp + hil_amplitude;
//		} else {
//			new_amp = hil_amplitude - gAmp;
//		}
//		set_HIL_amplitude(new_amp, 0);
//	} else {
//		gAmp = 0;
//	}
//}

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

int HIL_test_frequency(int index, int increase_mode) {

	if (index > HIL_START_INDEX) {

		if (increase_mode && (hil_timer_cnts > 0)) {
			hil_timer_cnts -= TIMER_CNTS_DELTA;
		} else {
			hil_timer_cnts += TIMER_CNTS_DELTA;
		}
		set_HIL_timer_cnts(hil_timer_cnts, 0);
	} else {

	}
	return hil_timer_cnts;
}


void HIL_display_results(int main_count, input_t *gInput, cmd_t *gCommand, int sec, state_general_t state){


	printf("%d ,\t%d ,\t%f , \t%f , \t%d  , \t%d, \t%f \r\n",
			main_count,
			gInput->sample_k,
			gInput->rms,
			//gInput->real_k,
			//gInput->real_power,
			gInput->freq,
			gInput->timer_k,
			gInput->real_k,
			gInput->real_power);

}
