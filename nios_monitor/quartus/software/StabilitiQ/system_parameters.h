/*
 * system_parameters.h
 *
 *  Created on: Jul 21, 2021
 *      Author: james
 */

#ifndef SYSTEM_PARAMETERS_H_
#define SYSTEM_PARAMETERS_H_




#define VERSION_REL "1.44"
#define VERSION_SW  "0.11"
#define VERSION_HW  "1.43"
#define VERSION_DATE "07 SEP 2021"
#define VERSION_MANUF_PARTNUM "Cyclone-VE A9"

#define FPGA_MCLK 20e-9    // FPGA Main Clock Period

#define RECIP_SQRT_3  0.5773502691896258
#define RECIP_SQRT_2 0.7071067811865475
#define SQRT_3       1.7320508075688772
#define SQRT_2       1.4142135623730951
#define SQRT_3_DIV_2 0.8660254037844386
#define SQRT_3_DIV_2_SQRT_2 0.6123724356957945
#define FILTER_SCALE RECIP_SQRT_2
#define CNTS_PER_VOLT 2.0
//---------------------------------------------
// signal_processing.vhd Global Variables
//---------------------------------------------
// Gains applied to all functions operating
// on this data.
//---------------------------------------------
#define RECIP_ADC_VOLT_GAIN 0.25  // Voltage gain applied in signal_processing.vhd
#define RECIP_ADC_CURR_GAIN 0.25  // Current gain applied in signal_processing.vhd

#endif /* SYSTEM_PARAMETERS_H_ */
