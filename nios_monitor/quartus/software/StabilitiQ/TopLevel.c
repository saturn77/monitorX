#include "system_parameters.h"
#include "data_structures.h"
#include "comm_messages.h"
#include "voltage_response.h"
#include "frequency_response.h"
#include "sampled_data.h"
#include "Hardware_In_Loop.h"
#include "system_parameters.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <math.h>
#include "system.h"

//Altera includes
#include "sys/alt_irq.h"
#include "sys/alt_stdio.h"
#include "sys/alt_sys_init.h"
#include "alt_types.h"
#include "altera_avalon_pio_regs.h"
#include "sys/alt_driver.h"
#include "io.h"
#include "altera_avalon_timer.h"
#include "altera_avalon_timer_regs.h"
#include "altera_avalon_uart.h"
#include "altera_avalon_uart_fd.h"
#include "altera_avalon_uart_regs.h"

//=======================================================
//  FINITE STATE MACHINE functions and handlers
//=======================================================
static void state_INIT(void);
static void state_ENA(void);
static void state_RUN(void);
static void (*state)(void) = state_INIT;

//=========================================================
// Enumerated data type for Mode of operation
// Data structure from data_structures.h
// Initialize to Volt_Watt method
//=========================================================
op_mode_t gMode = Volt_Watt;

//=========================================================
// Input Data (sampled from sum of squares) Data Structure
// Data structure from data_structures.h
// Initialize to zero all members of structure
//=========================================================
input_t gInput = { 0 };  // global sampled data input structure

//=========================================================
// Commands type Data Structure
// Data structure from data_structures.h
// Declare a global command variable structure, gCommand
// and initialize it to zero for all members
//=========================================================

cmd_t gCommand = { 0 };

//=========================================================
// FREQUENCY Response Variables and Declarations
// "frequency_response.h"
// "frequency_response.c"
//=========================================================

int g_max_power_reached = 0; // global latch indicating MAX POWER state was reached
int g_min_power_reached = 0; // global latch indicating MIN POWER state was reached
state_general_t ST_GENERAL = NOMINAL;

//=========================================================
// HardwareinLoop function prototypes, variables, and types
//=========================================================

typedef enum {
	FREQ_INCREASE,
	FREQ_DECREASE,
} hil_mode_t;

int gAmp = 0;
int g_main_count = 0;    // HIL main count for simulation index
int g_hil_finish = 0;    // HIL simulation has finished
hil_mode_t g_hil_mode = FREQ_INCREASE;  // HIL mode on direction of freq
int g_hil_pivot = 27;    // HIL pivot freq at which turns around

int hil_amplitude = 650; // default amplitude HIL sine waves

int hil_timer_cnts = TIMER_CNTS_50HZ;

filter_t hil_params = { 100, 0, 5000 };
char* cmd_buffer;

void put_reset_handler(){
	int put_rst = strcmp(cmd_buffer, "put rst");
	if (!put_rst) {
		g_main_count = 0;
		g_hil_finish = 0;
		clear_dma();
		delay_msec(1);
		printf("Reset of HIL recursive data completed.\r\n");
		set_HIL_amplitude(hil_amplitude, 1);     // HIL::set amplitude with a display message
		set_HIL_timer_cnts(TIMER_CNTS_50HZ, 1);  // HIL::set timer cnts (period) with display message
//		gCommand.active_power_max = 0;
//		gCommand.apparent_power = 0;
//		gCommand.reactive_power = 0;
//		gInput.freq = 0;
//		gInput.real_k = 0;
//		gInput.real_power = 0.0;
//		gInput.rms = 0.0;
//		gInput.sample_k = 0;
//		gInput.timer_k = 0;
		memset(&gInput,0,sizeof(gInput));
		memset(&gCommand,0,sizeof(gCommand));
		gCommand.active_power_max = 14200.0;
		ST_GENERAL = NOMINAL;
		hil_timer_cnts = TIMER_CNTS_50HZ;

	}

}

//=========================================================
// Input data function prototypes, variables, and types
//=========================================================

filter_t squares_params = { 0x7fe6, 0xd, 5000 };
filter_t timer_params = { 0x7fed, 0x15, 500 };

int INTERRUPT_TICS_PER_SAMPLE = 500000;

static void handle_hardware_IRQ(void* context);
static void init_hardware_IRQ();
void set_hardware_timer();
void init_IRQ_data_structures();

int edge_capture;       // Edge capture register for i_Reg32_0 

typedef struct {
	int tic;            // Interrupt count at actual speed, i.e. 'tic' rate
	int interval;       // Interrupt count at interval for display purpose
	int flag;
} interrupt_t;

interrupt_t gInterrupt = { 0 }; // Global interrupt counters and flags data structure
int gToggle = 0;

int gX_MODULO_INTR = 500000;
int gY_MODULO_INTR = 600;

///=======================================================
///  \brief    Initialize interrupt data structures
///  \detailed Individual routine to set the initial values
///            of the data structure for the interrupt
///            counters and flags.
///=======================================================

int timer_sec = 0;
int g_sec_counter = 0; /// Global Int, seconds counter
int g_sec_enable = 0;  /// Global Int, seconds counter enable


void init_IRQ_data_structures() {
	gInterrupt.tic = 0;
	gInterrupt.interval = 0;
	gInterrupt.flag = 0;
}
///=======================================================
///  \brief    Hardware (FPGA) side XY counter
///  \detailed X Modulo sets the timer period, while
///            Y Modulo sets the duty cycle. The XY
///            counter then interrupts Nios and is handled
///            by the handle_interrupt_IRQ()
///=======================================================
void set_hardware_timer() {
	IOWR_ALTERA_AVALON_PIO_DATA(O_REG32_2_BASE, gX_MODULO_INTR); // timer period
	IOWR_ALTERA_AVALON_PIO_DATA(O_REG32_3_BASE, gY_MODULO_INTR); // timer duty cycle
}
///=======================================================
///  \brief    Main hardware interrupt handler
///  \detailed Interrupt is set to handle the hardware
///            tic counter from FPGA fabric which may or
///            may not enable synchronous sampling, but
///            serves as precision timer from FPGA fabric.
///=======================================================

int g_20msec = 0;
int g_mutex_hil = 0;  // A mutex to enable the HIL module

static void handle_hardware_IRQ(void* context) {

	volatile int* edge_capture_ptr = (volatile int*) context;

	*edge_capture_ptr = IORD_ALTERA_AVALON_PIO_EDGE_CAP(I_REG32_0_BASE);

	if (gToggle) {
		IOWR_ALTERA_AVALON_PIO_DATA(O_REG32_1_BASE, 0x0);  // Deassert toggle
		gToggle--;
	} else {
		IOWR_ALTERA_AVALON_PIO_DATA(O_REG32_1_BASE, 0x1);  // Assert toggle
		gToggle++;
		g_20msec++;

		if (!(g_20msec % 20)){
			g_mutex_hil = 1;
		}

		if (!(g_20msec % 50)) {
			if (g_sec_enable) {
				g_sec_counter++;
			}
		}
//		if (!(g_20msec % 175) ){
//			clear_dma();
//		}
	}
	IOWR_ALTERA_AVALON_PIO_EDGE_CAP(I_REG32_0_BASE, 0);	   // Clear edge capture
	IORD_ALTERA_AVALON_PIO_EDGE_CAP(I_REG32_0_BASE); // Read edge capture (stability)
}
///=======================================================
///  \brief    Initialize the main hardware interrupt
///  \detailed Disable the interrupt register, then set
///            the edge_capture_ptr with function pointer,
///            register the interrupt, clear the capture
///            flags, and then re-enable interrupt upon
///            finishing the routine.
///=======================================================
static void init_hardware_IRQ() {

	IOWR_ALTERA_AVALON_PIO_IRQ_MASK(I_REG32_0_BASE, 0x0); // Disable the interrupt
	void* edge_capture_ptr = (void*) &edge_capture; // Cast edge capture as context pointer

	printf("Registering the interrupt routine...\r\n"); // Register interrupt message
	delay_msec(50);                                       // Allow time to print

	alt_ic_isr_register(I_REG32_0_IRQ_INTERRUPT_CONTROLLER_ID,
	I_REG32_0_IRQ,                             // Register the interrupt handler
			handle_hardware_IRQ,                     // with alt_ic_isr_register
			edge_capture_ptr, 0x0);
	printf("Registering interrupt complete.\r\n\r\n"); // Registration completion message

	IOWR_ALTERA_AVALON_PIO_EDGE_CAP(I_REG32_0_BASE, 0x0); // Reset edge capture register
	IOWR_ALTERA_AVALON_PIO_IRQ_MASK(I_REG32_0_BASE, 0x1); // Enable the interrupt
}

///=======================================================
///  \brief    Voltage Response Mode update
///  \detailed Operate on the intput_t* gInput data structure,
///            where rms is computed and compared to thresholds.
///            The return type is void, as the function
///            works on a structure pointer.
///
///            Relative AS4777 specifications are
///            1) Table 3.6 Volt-Watt response default set point values
///            2) Table 3.7 Volt-Var response set point values
///            3) Table 3.8 Volt-Watt response multi-mode inverters
///
///            Also, the derating factors are:
///            1. K_wwatt - derating constant for volt-watt
///            2. K_var_absorb  - derating volt-var absorbing
///            3. K_var_deliver - derating volt-var delivery
///            3. K_V - derating constant for volt-watt-var mode
///=======================================================

int gVar_Enabled = 1;
int gWatt_Enabled = 1;
int gWatt_Multi_Enabled = 1;

void voltage_response_update(input_t *gInput, cmd_t *gCommand);

void voltage_response_update(input_t *gInput, cmd_t *gCommand) {

	input_t sampled_data;
	sampled_data = *gInput;
	cmd_t cmd_value;
	cmd_value = *gCommand;

	if (sampled_data.rms < V_W1_CH) {
		cmd_value.active_power_max = VW_MIN_POWER_MULTI;
	} else if ((sampled_data.rms > V_W1_CH) && (sampled_data.rms < V_W2_CH)) {
		cmd_value.active_power_max = VW_MIN_POWER_MULTI
				+ K_watt_multi * (sampled_data.rms - V_W1_CH);
	}

	else if (sampled_data.rms > V_W2) {
		cmd_value.active_power_max = VW_MIN_POWER;
	} else if (sampled_data.rms > V_W1) {
		cmd_value.active_power_max = WATTS_RATED
				- K_watt * (sampled_data.rms - V_W1);
	} else {
		cmd_value.active_power_max = WATTS_RATED;
	}

	if (gVar_Enabled) {
		if (sampled_data.rms < V_V1) {
			cmd_value.reactive_power = VV_MAX_VAR_DELIVER;
		} else if ((sampled_data.rms > V_V1) && (sampled_data.rms < V_V2)) {
			cmd_value.reactive_power = VV_MAX_VAR_DELIVER
					- K_var_deliver * (sampled_data.rms - V_V1);
		} else if ((sampled_data.rms > V_V2) && (sampled_data.rms < V_V3)) {
			cmd_value.reactive_power = 0;
		} else if ((sampled_data.rms > V_V3) && (sampled_data.rms < V_V4)) {
			cmd_value.reactive_power = K_var_absorb * (sampled_data.rms - V_V3);
		} else {
			cmd_value.reactive_power = VV_MAX_VAR_ABSORB;
		}
	}

	*gInput = sampled_data;
	*gCommand = cmd_value;
}





#define VOLTAGE_RESPONSE_TEST 0
#define FREQUENCY_RESPONSE_TEST 1

//char* value_buffer;
///===================================================
/// \brief     Main Finite State Machine INIT state.
/// \detailed  Display the banner and menu, clear
///            and reset fpga fabric, vector to enable.
///===================================================
static void state_INIT(void) {
	clear_terminal();                        // clear terminal (putty)
	display_welcome_message();               // Stabiliti-Q banner
	display_Version(1);                      // Display complete version information

	clear_dma();                             // Clear the dma in fpga avalon module

	set_hardware_timer();                    // set XY_Counter in FPGA VHDL
	init_hardware_IRQ();                     // Register the interrupt for XY_Counter tic

	set_HIL_amplitude(hil_amplitude, 1);     // HIL::set amplitude with a display message
	set_HIL_timer_cnts(TIMER_CNTS_50HZ, 1);  // HIL::set timer cnts (period) with display message

	set_HIL_filter(&hil_params);             // HIL::set parameters of low pass to generate currents

	set_squares_filter(&squares_params);     // signal_processing.vhd set sum squares filter params
	set_timer_filter(&timer_params);         // signal_processing.vhd set freq filter params

	run_simple_test_sequence();              // Run simple test sequence

	gCommand.active_power_max = 14200.0;     // Set maximum rated power
	gCommand.reactive_power = 0.0;           // Set nominal reactive power

	gMode = Volt_Watt_Var;                   // Assign mode
	//print_mode(gMode);				     // Print the currently mode

	select_HIL_inputs();                     // Select HIL data as mux input to signal processing chain
	gInput.rms = 0.0;
	state = state_ENA;
}
///===================================================
/// \brief     Main Finite State Machine ENABLE state.
/// \detailed  Read the slide switches and data stack,
///            and call handlers for these. Check for
///            command to vector to RUN. In
///            future, support FLT inputs.
///===================================================
static void state_ENA(void) {

	read_data_stack();              // read of data stack
	read_data_stack();
	delay_msec(20);
	clear_terminal_handler();       // clear terminal if commanded
	read_data_stack();              // read of data stack
	delay_msec(20);
	get_version_handler();          // display version if commanded
	get_menu_handler();             // display menu if commanded
	put_reset_handler();            // reset of the HIL data

	read_data_stack();              // read of data stack
	delay_msec(20);

	int put_hil_freq_01 = strcmp(cmd_buffer, CMD_HIL_FREQ_01);
	if (!put_hil_freq_01) {
		printf("\r\n***Updated HIL Command \r\n");
		printf("-----------------------\r\n");
		printf("HIL FREQ TEST 01 - General Case Decrease. \r\n");
		printf("Freq will decrease then return to NOMINAL.\r\n");
		clear_dma();
		g_hil_mode = FREQ_DECREASE;
		g_hil_pivot = 18;
		g_hil_finish = 0;
	}

	int put_hil_freq_02 = strcmp(cmd_buffer, CMD_HIL_FREQ_02);
	if (!put_hil_freq_02) {
		printf("\r\n***Updated HIL Command \r\n");
		printf("-----------------------\r\n");
		printf("HIL FREQ TEST 02 - General Case Decrease to Max. \r\n");
		printf("Freq will decrease to MAX POWER, then return to NOMINAL.\r\n");
		clear_dma();
		g_hil_mode = FREQ_DECREASE;
		g_hil_pivot = 26;
		g_hil_finish = 0;
	}

	int put_hil_freq_03 = strcmp(cmd_buffer, CMD_HIL_FREQ_03);
	if (!put_hil_freq_03) {
		printf("\r\n***Updated HIL Command \r\n");
		printf("-----------------------\r\n");
		printf("HIL FREQ TEST 03 - General Case Increase. \r\n");
		printf(
				"Freq will increase to FREQ_RISING, then return to NOMINAL.\r\n");
		clear_dma();
		g_hil_mode = FREQ_INCREASE;
		g_hil_pivot = 22;
		g_hil_finish = 0;
	}

	int put_hil_freq_04 = strcmp(cmd_buffer, CMD_HIL_FREQ_04);
	if (!put_hil_freq_04) {
		printf("\r\n***Updated HIL Command \r\n");
		printf("-----------------------\r\n");
		printf("HIL FREQ TEST 04 - General Case Increase to Max. \r\n");
		printf("Freq will increase to MIN POWER, then return to NOMINAL.\r\n");
		clear_dma();
		g_hil_mode = FREQ_INCREASE;
		g_hil_pivot = 27;
		g_hil_finish = 0;
	}

	read_data_stack();
	delay_msec(20);
	int cmd_enax = strcmp(cmd_buffer, CMD_ENA);
	if (!cmd_enax) {
		printf("Already in ENA state!\r\n");
		clear_dma();
	}

	int cmd_run = strcmp(cmd_buffer, CMD_RUN);
	if (!cmd_run) {
		//printf("*** Vectoring -> state_RUN ...\r\n");


		printf("\r\n");
		printf("SIMULATION::START \r\n");
		printf("Count,\tSum Squares,\tVrms_Nios,\tFreqHz_Nios,\tTimer Cnts,\tWatts Squared,\tWatts_Nios \r\n");

		clear_dma();
		delay_msec(10);
		state = state_RUN;
	} else {
		state = state_ENA;
	}
}
///===================================================
/// \brief     Main Finite State Machine RUN state.
/// \detailed  Read the slide switches and data stack,
///            and call handlers for these. Check for
///            command to vector back to ENA. In
///            future, support FLT inputs.
///===================================================
static void state_RUN(void) {

	//------------------------------------------------
	// Power_Quality::Sample_Inputs
	//------------------------------------------------
	voltage_sample(&gInput);
	frequency_sample(&gInput);
	sample_power_values(&gInput);

	if (g_mutex_hil){

//	//------------------------------------------------
//	// Power_Quality::Update_Response_Algorithms
//	//------------------------------------------------
//	frequency_response_update(&gInput, &gCommand, 0);
//
//	//------------------------------------------------
//	// HIL::Simulation_Update
//	//------------------------------------------------
//	if (g_main_count < g_hil_pivot) {
//		switch(g_hil_mode){
//		case(FREQ_INCREASE) :
//				HIL_test_frequency(g_main_count, 1);
//				break;
//		case(FREQ_DECREASE) :
//				HIL_test_frequency(g_main_count, 0);
//				break;
//		}
//		g_hil_finish = 0;
//	}
//	else if (ST_GENERAL == NOMINAL  ) {
//		// this is the test concluded
//		g_hil_finish = 1;
//	} else {
//		switch(g_hil_mode){
//		case(FREQ_INCREASE) :
//				if (gInput.freq > 50.01) {
//					HIL_test_frequency(g_main_count, 0);
//				}
//				break;
//		case(FREQ_DECREASE) :
//				if (gInput.freq < 50.01){
//					HIL_test_frequency(g_main_count, 1);
//				}
//				break;
//		}
//		g_hil_finish = 0;
//	}

	//------------------------------------------------
	// HIL::Display_Results
	//------------------------------------------------
	HIL_display_results(g_main_count, &gInput, &gCommand, g_sec_counter, ST_GENERAL);

	g_main_count++;
	if (g_main_count == 120) g_hil_finish = 1;
	else g_hil_finish = 0;

	//delay_msec(400);
	g_mutex_hil = 0;

	}
	//------------------------------------------------
	// Next State determination
	//------------------------------------------------
	read_data_stack();
	int cmd_enax = strcmp(cmd_buffer, "put ena");

	if (g_hil_finish){
		printf("SIMULATION::END\r\n");
		state = state_ENA;
	}
	else if (!cmd_enax) {
		printf("\r\n*** Vectoring -> state_ENA ...\r\n\r\n");
		state = state_ENA;
		clear_dma();
	} else {
		state = state_RUN;
	}
}

///==============================================
///  Main Loop for Stabiliti-Q
///==============================================

int main() {
	while (1) {
		(*state)();
	}
	return 0;
}

