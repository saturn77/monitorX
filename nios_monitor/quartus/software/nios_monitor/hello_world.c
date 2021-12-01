/*
 * "Hello World" example.
 *
 * This example prints 'Hello from Nios II' to the STDOUT stream. It runs on
 * the Nios II 'standard', 'full_featured', 'fast', and 'low_cost' example
 * designs. It runs with or without the MicroC/OS-II RTOS and requires a STDOUT
 * device in your system's hardware.
 * The memory footprint of this hosted application is ~69 kbytes by default
 * using the standard reference design.
 *
 * For a reduced footprint version of this template, and an explanation of how
 * to reduce the memory footprint for a given application, see the
 * "small_hello_world" template.
 *
 */

#include <stdio.h>
#include <time.h>
#include "unistd.h"
#include "alt_types.h"
#include "altera_avalon_pio_regs.h"
#include "system.h"

void delay_msec(int msec);
void display_welcome_message();
void clear_terminal();
void run_simple_test_sequence();

void clear_terminal(){
	printf("\033c");
	printf("\r\n");
	delay_msec(500);  // pause before displaying banner
}

void delay_msec(int msec) {
	int local_time = 1000 * msec;
	usleep(local_time);
}

void display_welcome_message() {
	printf("****************************************\r\n");
	printf("**** Welcome to Nios Monitor Program ***\r\n");
	printf("****************************************\r\n");
	delay_msec(200);                    // pause for banner
	printf("\r\n");
}

void run_simple_test_sequence(){
	printf("\r\n*** Starting simple test sequence\r\n\r\n");
	printf("\t");
	for (int j=0; j<10;j++){
			if (j % 2 )
			printf("|/");
			else
				printf("\\|");
		delay_msec(70);
	}
	printf("\r\n\r\n*** Test sequence success.\r\n\n");

}

static int gInt_count = 0; // counter value global int


short int reg1;
unsigned short int reg2;
unsigned short int reg3;
unsigned short int reg4; // loop back read of oReg32_0(15 downto 0)

void write_counter(int write_value){
	IOWR_ALTERA_AVALON_PIO_DATA(O_REG32_0_BASE, write_value);
	IOWR_ALTERA_AVALON_PIO_DATA(O_REG32_0_BASE, write_value);
	usleep(10);
}

void read_registers(){
	reg1 = IORD_ALTERA_AVALON_PIO_DATA(I_REG16_1_BASE);
	reg2 = IORD_ALTERA_AVALON_PIO_DATA(I_REG16_2_BASE);
	reg3 = IORD_ALTERA_AVALON_PIO_DATA(I_REG16_3_BASE);
	reg4 = IORD_ALTERA_AVALON_PIO_DATA(I_REG16_4_BASE);
}

void compare_values(int value){
	printf("%d\t%d\t%d\t%d\t%d \r\n", value,reg1,reg2,reg3,reg4);
}

int main()
{
	int k = 0;
	clear_terminal();
	display_welcome_message();
	run_simple_test_sequence();
	printf("Count\treg1\treg2\treg3\treg4 \r\n");
	printf("---------------------------------\r\n");
	for (int j = 0; j < 50; j++){
		write_counter(k);
		usleep(2);
		read_registers();
		usleep(2);
		compare_values(k);
		delay_msec(100);
		k = k + 1000;
	}

  return 0;
}
