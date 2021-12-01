#ifndef COMM_MESSAGES_H_
#define COMM_MESSAGES_H_


#include "data_structures.h"
#include "comm_messages.h"
#include "system_parameters.h"
#include "system.h"
#include "Hardware_In_Loop.h"

#include  <stdio.h>
#include  <unistd.h>
#include  <string.h>

#include <sys/alt_stdio.h>
#include <sys/alt_driver.h>
#include "altera_avalon_uart.h"
#include "altera_avalon_uart_fd.h"
#include "altera_avalon_uart_regs.h"
#include "altera_avalon_uart.h"


//------------------------------
// UART functions and variables
//------------------------------
// cmd line protocol is of type:
// cmd | value
// Examples are:
// "get ver" (cmd, no value)
// "put hil 0" (cmd with value)
//------------------------------
#define RX_BUFFER_SIZE 7          ///< define buffer size
#define RX_BUFFER_2_SIZE 4
#define CMD_STRLEN 7

//---------------------------------------------
//  Communications GET and PUT Words
//---------------------------------------------

#define GET_CMD  "get cmd"  /// < get a list of all commands
#define GET_VER  "get ver"  /// < get version
#define GET_STA  "get sta"  /// < get status
#define GET_FSM  "get fsm"  /// < get fsm state name
#define CMD_ENA  "put ena"  /// < put fsm into en
#define CMD_RUN  "put run"  /// < put fsm into run
#define CMD_RST  "put rst"  /// < put reset of fault conditions
#define CMD_HIL  "put hil"  /// < put fms into HIL mode
#define CMD_HIL_FREQ_01 "freq 01"
#define CMD_HIL_FREQ_02 "freq 02"
#define CMD_HIL_FREQ_03 "freq 03"
#define CMD_HIL_FREQ_04 "freq 04"
#define CMD_HIL_FREQ_05 "freq 05"
#define CMD_HIL_FREQ_06 "freq 06"
#define CMD_HIL_FREQ_07 "freq 07"
#define CMD_HIL_FREQ_08 "freq 08"
#define CMD_HIL_FREQ_09 "freq 09"


//=====================================================
/*
 * This collection of functions prints messages to
 * standard out, which is a uart for this development.
 * There are functions for banners for general project
 * display and detailed version information, clearing
 * the terminal (useful for clearing the screen upon
 * initial startup or any other time), and printing
 * a simple test sequence.
 *
 * Each function has a brief and detailed description
 * in the comm_messages.c file where each function is
 * located.
 */
//=====================================================
void delay_msec(int msec);
void display_Version(int complete);
void display_welcome_message();
void clear_terminal();
void print_mode();
void run_simple_test_sequence();


void substring(char [], char[], int, int);


///=======================================================
///  \brief    Clear the terminal such as Putty.
///  \detailed Responding to a command in the terminal,
///            clear the terminal.
///=======================================================
void clear_terminal_handler();

///=======================================================
///  \brief    Reset the recursive data for the HIL.
///  \detailed Responding to a command in the terminal,
///            reset the recursive data associated with
///            the HIL simulation, mainly the globabl
///            variables of:
///            1. g_main_count
///            2. g_main_finish
///=======================================================
//void put_reset_handler();


///--------------------------------------
/// \brief Display version information for the release.
///
/// \detailed Display version information for the overall release,
///        software, and fpga fabric hardware. Also display the
///        date of the build. The version information can be
///        either hardcoded in the C file or placed into Flash
///        memory.
/// This function is called in the main state machine "state_IDLE"
///
/// \param VERSION_REL the version of the overall release.
/// \param VERSION_SW the "C" code version
/// \param VERSION_HW the "Verilog" / "VHDL" version of code
/// \param VERSION_DATE the date in which the VERSION_REL was created
///
/// \return none, void function
///
///--------------------------------------
void display_Version();

///=======================================================
///  \brief    Display the menu of commands.
///  \detailed Displaying the menu of commands available
///            to the user on the terminal command line
///            interface.
///=======================================================
void display_Menu(int);


///=======================================================
///  \brief    Read and parse uart buffer.
///  \detailed Read the data stack into a *cmd_buffer
///=======================================================
void read_data_stack();

//=========================================================
// \brief    Respond with version information to the host.
// \detailed The version information is detailed information
//           regarding major/minor version of firmware and
//           hardware.
//=========================================================
void get_version_handler();

//=========================================================
// \brief    Respond with a menu of commands.
// \detailed The menu of commands contain the available
//           commands to the user to interact with the
//           software.
//=========================================================
void get_menu_handler();

//=========================================================
// \brief    Clear the Received DMA.
// \detailed The DMA is a SystemVerilog module that is
//           absorbed into Nios via Platform Designer.
//           This function will clear the DMA.
//=========================================================
void clear_dma(void);

//=========================================================
// \brief    Print the contents of a buffer to the UART.
// \detailed Send data in a buffer up through the UART for
//           debug purposes.
//=========================================================
void uart_print_buffer();

#endif /* COMM_MESSAGES_H_ */
