#include "comm_messages.h"


char rx_buff[RX_BUFFER_SIZE];
//char rx_buff2[RX_BUFFER_2_SIZE];
//char cmd_bufferX[7];
//char value_bufferX[4];
extern char* cmd_buffer;
//extern char* value_buffer;




char rx_buffer[11];

void substring(char s[], char sub[], int p, int len) {
   int j = 0;

   while (j < len) {
      sub[j] = s[p+j];
      j++;
   }
   //sub[c] = '\0';
}

void clear_terminal_handler(){
	int put_clear = strcmp(cmd_buffer, "cls all");
	if (!put_clear) {
		clear_terminal();
		clear_dma();
		delay_msec(1);
	}
}




void read_data_stack() {

//	for (int kk = 0; kk < 11; kk++){
//		rx_buffer[kk] = (char) IORD(DMA_RX_0_BASE, kk);
//		rx_buffer[kk] = (char) IORD(DMA_RX_0_BASE, kk);
//	}
//
//	substring(rx_buffer,cmd_bufferX,0,7);
//	substring(rx_buffer,value_bufferX,7,4);
//	cmd_buffer = cmd_bufferX;
//	value_buffer = value_bufferX;

	for (int k = 0; k < RX_BUFFER_SIZE; k++) {
		rx_buff[k] = (char) IORD(DMA_RX_0_BASE, k);
		rx_buff[k] = (char) IORD(DMA_RX_0_BASE, k);
	}
	cmd_buffer = rx_buff;


//	for (int kk = CMD_STRLEN; kk < (CMD_STRLEN + RX_BUFFER_2_SIZE); kk++) {
//		rx_buff2[kk - CMD_STRLEN] = (char) IORD(DMA_RX_0_BASE, kk);
//		rx_buff2[kk - CMD_STRLEN] = (char) IORD(DMA_RX_0_BASE, kk);
//	}
//	value_buffer = rx_buff2;
	return;

}

void uart_print_buffer() {
	//printf("index \tRX_BUFF \tCMD_BUFF \r\n");
	//for (int i = 0; i < CMD_STRLEN; i++) {
		//printf("%d\t", i);
		//printf("%c \r\n", *(rx_buff + i));
	printf("cmd_buffer = %s\r\n", cmd_buffer);
	//printf("value_buffer = %s \r\n", value_buffer);
	//clear_dma();
	//}
	return;
}


void get_version_handler() {
	int get_version = strcmp(cmd_buffer, GET_VER);
	if (!get_version) {
		//clear_terminal();
		display_Version(0);
		clear_dma();
	}
	return;
}

void get_menu_handler() {
	int get_cmd = strcmp(cmd_buffer, GET_CMD);
	if (!get_cmd) {
		//clear_terminal();
		display_Menu(0);
		clear_dma();
	}
	return;
}

void display_welcome_message() {
	printf("****************************************\r\n");
	printf("**** Welcome to Stabiliti-Q Program ****\r\n");
	printf("****************************************\r\n");
	delay_msec(100);                    // pause for banner
}

void display_Version(int complete) {
	printf("\r\n");
	printf("  ************************************\r\n");
	printf("  *    CET FPGA Diagnostics Program  *\r\n");
	printf("  *    REL  Version : %s           *\r\n", VERSION_REL);
	printf("  *    SW   Version : %s           *\r\n", VERSION_SW);
	printf("  *    FPGA Version : %s           *\r\n", VERSION_HW);
	printf("  *    DATE Revised : %s    *\r\n", VERSION_DATE);
	printf("  *    %s                 *\r\n", VERSION_MANUF_PARTNUM);
	if (complete) {
		printf("  *    Design and Manufactured       *\r\n");
		printf("  *    UNITED STATES of AMERICA      *\r\n");
		printf("  ************************************\r\n");
	} else {
		printf("  ************************************\r\n");
	}
	printf("\r\n");

}

void display_Menu(int clear){
	if (clear){
	clear_terminal();
	}
	printf("\r\n");
	printf("  -------------------------------------------\r\n");
	printf("  CE+T Controller Interface \r\n");
	printf("  CMD        Description \r\n");
	printf("  -------------------------------------------\r\n");
	printf("  cls all    Clear this terminal window.\r\n");
	printf("  get cmd    Get the CMD menu as displayed here.\r\n");
	printf("  get ver    Get the VERsion message.\r\n");
	printf("  put ena    Put the fsm into ENA state.\r\n");
	printf("  put run    Put the fsm into RUN state.\r\n");
	printf("  put rst    Put ReSeT, reset the HIL data.\r\n");
	printf("  freq 01    General test Freq Decrease.\r\n");
	printf("  freq 02    General test Freq Decrease to MAX POWER.\r\n");
	printf("  freq 03    General test Freq Increase.\r\n");
	printf("  freq 04    General test Freq Increase to MIN POWER.\r\n");
	printf("\r\n");
	delay_msec(5);
	printf("\t*** Now ready to accept commands.\r\n");
};

void clear_dma(void) {
	for (int k = 0; k < CMD_STRLEN + RX_BUFFER_2_SIZE; k++)
		IOWR(DMA_RX_0_BASE, k, 0);
}

void delay_msec(int msec) {
	int local_time = 1000 * msec;
	usleep(local_time);
}

void clear_terminal(){
	printf("\033c");
	printf("\r\n");
	delay_msec(500);  // pause before displaying banner
}

void print_mode(int gMode){
	switch (gMode)
	{
	case Volt_Watt : {
		printf("**** Mode is Volt-Watt.\r\n");
		break;
	}
	case Volt_Watt_Var : {
		printf("**** Mode is Volt-Var and Volt-Watt.\r\n");
		break;
	}
	case Volt_Watt_Multimode : {
		printf("**** Mode is Volt-Watt Multimode.\r\n");
		break;
	}
	case Power_Factor : {
		printf("**** Mode is Power Factor.\r\n");
		break;
	}
	case Var : {
		printf("**** Mode is Var.\r\n");
		break;
	}
	case Freq : {
		printf("**** Mode is Frequency.\r\n");
		break;
	}
	case Freq_Multimode : {
		printf("**** Mode is Frequency-Multimode. \r\n");
		break;
	}
	}
}

void run_simple_test_sequence(){
	printf("\r\n*** Starting simple test sequence\r\n\r\n");
	printf("\t");
	for (int j=0; j<10;j++){
			if (j % 2 )
			printf("|/");
			else
				printf("\\|");
		delay_msec(100);
	}
	printf("\r\n\r\n*** Test sequence success.\r\n\n");
	delay_msec(1000);
}
