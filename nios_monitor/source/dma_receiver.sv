//==========================================================================
//  Title    :  Direct Memory Access Receiver 
//  Filename :  dma_receiver.sv 
//  Language :  IEEE 1800-2012, System Verilog
//  Platform :  Linux Mint, Windows 10, Altera Quartus 17+
//  Author   :  James Bonanno
//  Revised  :  22 Mar 2018 -- Initial Release 
//              02 Apr 2018 -- Wrapped with Avalon Bus
//              22 May 2018 -- Made av_mm_write a slave process to the 
//                             uart or comms device writing to this module. 
//                             Implemented the state_main fsm to handle this
//                             arbitration between av_mm_write and dly_RX_DONE. 
// 
//  Descrip  :  The data stack acts as receive buffer with DMA access. The size
//              of each buffer is statically allocated as a maximum, and each
//              message can have a unique size within the max stack size if
//              the protocol has a msgSize element. 
//
//              This module works in conjection with the data_parser OR 
//              software that may be contained in an embedded processor 
//              such as NIOS, or RISC-V, or other processors. 
//              This module is processor AGNOSTIC. 
//
//==========================================================================


module dma_receiver #(
    parameter DEPTH = 32,  
    parameter clock_nsec = 20, 
    parameter WATCHDOG_nsec = 100000)
(
    // clock bundle 
    input  clock,                     // clock for this module
    input  logic       reset,                     // Hardware reset 

	// avalon-mm interface 
	input logic  [4:0]  av_mm_addr, // Address from processor 
	input logic         av_mm_read,               // read  signal from processor  
	output logic [31:0] av_mm_readdata,           // actual data to be read by processor
	output logic        av_mm_waitrequest,        // wait request 

	input logic         av_mm_write,              // write 
	input logic  [31:0] av_mm_writedata,          // write data 

	// conduit signals 
	input  logic       coe_RX_DONE,               // Start pulse for the module 
	input  logic [7:0] coe_RX_DATA                // Received data from UART/I2C/SP

);
	//----------------------------------------------
	//   Parameters for the module 
	//----------------------------------------------
	localparam WATCHDOG_TIMEOUT = WATCHDOG_nsec / clock_nsec; // Watchdog timeout 

	//----------------------------------------------
	//   Data types for the module 
	//----------------------------------------------
	typedef enum logic[2:0] {ST_IDLE,ST_SETUP, ST_HANDSHAKE, ST_FINISH, ST_DONE} state_t;
	state_t state; 
	typedef struct 
	{
		logic[15:0] val;
	} counter_t;
	
	typedef enum logic[1:0] {
		ST_AV_IDLE = 2'b00,
		ST_AV_HANDSHAKE = 2'b01,
		ST_AV_DONE = 2'b10,
		ST_AV_FINISH = 2'b11 
	} stateav_t; 

	stateav_t state_av; 
	
	typedef enum logic [1:0] {
		ST_MAIN_S0, 
		ST_MAIN_S1
	} state_main_T; 

	state_main_T state_main; 
	//----------------------------------------------
	//   Variables for the module 
	//----------------------------------------------

	logic[7:0] stack [DEPTH];     // main declaration for STACK 
	counter_t count;
	logic [15:0] stack_index; 
	logic [15:0] txPointer; 
	logic [4:0] addr_buffer;      // buffer addr for arbitration 
	byte  data_buffer;            // mem organized as bytes
		
	logic dlyReg;
	logic startFSM; 
	logic dly_RX_Done;
	logic dly2_RX_Done; 
	logic [15:0] pointer;                     // addr to index into stack 
	logic data_count_full;                    // indicated pointer has reached DEPTH 
	logic [1:0] regE; 

	//-------------------------------------------------------------
	//-- Delay the Start by two clock's; proper FSM start 
	//-------------------------------------------------------------
	typedef struct{
		logic[31:0] count; 
		logic       flag;
	} watchdog_t;

	watchdog_t watchdog; 

	always_ff@(posedge clock) begin : pDelayStart
	if (reset) begin 
	dly_RX_Done <= 1'b0; 
	dly2_RX_Done <= 1'b0; 
	end 
	else begin
		dly_RX_Done  <= coe_RX_DONE;
		dly2_RX_Done <= dly_RX_Done;
	end 
	end 

	//-------------------------------------------------------------
	//   Watchdog Counter ==> Starts when fireset byte is received
	//   Timeouts after the count reaches WATCHDOG_TIMEOUT 
	//-------------------------------------------------------------
	always_ff@(posedge clock) 
	begin : pWatchdog 
		if (reset) begin 
			watchdog.count <= 0;
			watchdog.flag  <= 0;
		end 
		else begin 
			if (coe_RX_DONE) begin 
				watchdog.count <= 0;
				watchdog.flag  <= 0;
			end 
			else begin 
				if (watchdog.count < WATCHDOG_TIMEOUT) begin 
					watchdog.count <= watchdog.count + 1;
					watchdog.flag  <= 0;
				end 
				else begin 
					watchdog.flag <= 1;
				end; 
			end;
		end;
	end 
	//-------------------------------------------------------------
	//  Determine Final Write 
	//-------------------------------------------------------------
	always_ff@(posedge clock) begin : pPointer
		if (reset || watchdog.flag) begin
			pointer <= 0;
		end 
		else if (dly2_RX_Done) begin 
			pointer <= pointer + 1; 
		end 
	end 
	//-------------------------------------------------------------
	//  Determine Final Write 
	//-------------------------------------------------------------
	always_ff@(posedge clock) begin  
		if (reset) 
			data_count_full <= 1'b0;
		else if (pointer == DEPTH) 
			data_count_full <= 1'b1;
		else
			data_count_full <= 1'b0;
	end 

	always_ff@(posedge clock) begin 
		if (reset) 
			regE <= 2'b00; 
		else 
			regE <= {regE[0],data_count_full};
	end

	//-------------------------------------------------------------
	//  Transfer data according to avalon mm address 
	//-------------------------------------------------------------
	always_ff@(posedge clock) begin
		if (reset) begin 
			av_mm_readdata <= 0;
			for (int j = 0; j< DEPTH; j++) begin 
				stack[j] <= 0; 
			end 
			state_main <= ST_MAIN_S0; 
		end 
		else begin 
			case(state_main) 

				ST_MAIN_S0 : begin 
					if (dly_RX_Done) begin  
						if (av_mm_write) begin 
							data_buffer <= av_mm_writedata[7:0];
							addr_buffer <= av_mm_addr; 
							state_main  <= ST_MAIN_S1; 
							stack[pointer] <= coe_RX_DATA; 
						end 
						else begin 
							stack[pointer] <= coe_RX_DATA;
							state_main <= ST_MAIN_S0; 
						end 
					end 
					else begin 
						if (av_mm_read) begin 
							av_mm_readdata <= {24'b0, stack[av_mm_addr]};
						end 
						if (av_mm_write) begin 
							stack[av_mm_addr] <= av_mm_writedata[7:0]; 
						end 
						state_main <= ST_MAIN_S0; 
					end 
				end 

				ST_MAIN_S1 : begin 
					if (!av_mm_write) begin 
						state_main <= ST_MAIN_S0; 
						stack[addr_buffer] <= data_buffer;
					end 
					else 
						state_main <= ST_MAIN_S1; 
				end 

			endcase 
		end 
	end 


	always_ff@(posedge clock) begin
		if (reset) begin 
			state_av <= ST_AV_IDLE; 
			av_mm_waitrequest <= 1'b0; 
		end 
		else  begin 

			case(state_av)

				ST_AV_IDLE: begin 
					av_mm_waitrequest <= 1'b0; 
					if (av_mm_write || av_mm_read ) 
						state_av <= ST_AV_HANDSHAKE; 
					else 
						state_av <= ST_AV_IDLE; 
				end 

				ST_AV_HANDSHAKE: begin 
					av_mm_waitrequest <= 1'b1; 
					state_av <= ST_AV_DONE; 
				end 		

				ST_AV_DONE: begin 
					av_mm_waitrequest <= 1'b0; 
					state_av <= ST_AV_FINISH; 
				end 		

				ST_AV_FINISH: begin 
					av_mm_waitrequest <= 1'b0; 
					state_av <= ST_AV_IDLE; 
				end 

			endcase
		end 

	end 


endmodule 