#ifndef DATA_STRUCTURES_H_
#define DATA_STRUCTURES_H_

///========================================================
///  Data Structures and Data Types (Enumerations)
///  Functional areas for the structures:
///  1. input_t   - input signals, sample and rms value
///  2. cmd_t     - commands from processor
///  3. op_mode_t - operational mode such as Volt-Watt, etc.
///
///========================================================

//=========================================================
// Enumerated data type for main Frequency Control
// state machine
//=========================================================
typedef enum {
	NOMINAL, FREQ_FALLING, MAX_POWER, FREQ_RISING, MIN_POWER
} state_general_t;

//=========================================================
// Input Data (sampled from sum of squares) Data Structure
// Typically the input is the sampled sum_of_squares value
// or any of the three phase type (voltage, current)
//=========================================================
typedef struct  {
	int unsigned sample_k;  // current sample value
	double rms;             // calculated volt RMS value
	int unsigned timer_k;   // current timer capture value
	double freq;            // calculated freq Hz value
	int unsigned real_k;    // real power sample
	double real_power;      // real power calculated
} input_t;



//typedef struct {
//	short int voltA;
//	short int voltB;
//	short int voltC;
//	short int currA;
//	short int currB;
//	short int currC;
//	double voltAlpha;
//	double voltBeta;
//	double currAlpha;
//	double currBeta;
//} phase_t;

//=========================================================
// Commands type Data Structure
// The commands would be coming from the COMMS processor
// interface and be set by the user.
//=========================================================
typedef struct {
	double active_power_max;
	double active_power_latched;
	double reactive_power;
	double apparent_power;
} cmd_t;

void set_commands(cmd_t *gCommand);

//=========================================================
// Enumerated data type for Mode of operation
//=========================================================
typedef enum {
	Volt_Watt,
	Volt_Watt_Multimode,
	Volt_Watt_Var,
	Power_Factor,
	Var,
	Freq,
	Freq_Multimode
} op_mode_t;




//=========================================================
// Filters type Data Structure
// There is a low pass filter in the FPGA fabric that
// filters the sum of squares value (and others perhaps)
// and this is the is the data structure for the filter
//=========================================================
typedef struct {
	int unsigned alpha;
	int unsigned beta;
	int unsigned tsx;
} filter_t;

void set_fpga(filter_t* filter_params);

void disable_fpga_filter();

#endif
