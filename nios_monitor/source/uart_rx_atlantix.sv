//======================================================
// Universal Asynchronous Receiver 
// Filename : uart_rx_atlantix.sv 
// Language : System Verilog IEEE-18000 Standard 
// Platform : Riviera-Pro, Linux Mint 17
// 
// This is a configurable uart reciever that is part
// of the Atlantix Engineering IP Core modules. This
// module is migrated from the original VHDL code. 
//
// Copyright 2003-2015, **Atlantix Engineering LLC**
// All Rights Reserved 
// 
// Released under GPL Software License. 
//======================================================

module uart_rx_atlantix #(
parameter  MCLKS_SKEW    = 217,
parameter  MCLKS_PER_BIT = 434) 
(
input  logic        MCLK,
input  logic        HRST,
input  logic        i_RXD,
output logic [7:0]  o_DATA,
output logic        o_DONE
);


localparam MODULO        = 100; 

//================================================
// Data types for the module 
//================================================

typedef enum logic[3:0] {IDLE  = 4'b0001,
                         SHIFT = 4'b0010,
					     LOAD  = 4'b0100,
					     DONE  = 4'b1000} state_t;
					
state_t state; 

logic[2:0]  regD;             // filter reg
logic       rx_start;         // start detected
logic       TransferDone;     // frame transfer done 
logic[7:0]  bitCount;         // bit count for frame 
logic[11:0] sampleCount;
logic       sampleDone; 
logic       registerData;     // reg output data 
logic       shiftEnable;      // shift reg incoming data
logic       rx_shift;         // fsm enable shift
logic       rx_load;          // fsm enable load 
logic       rx_done;          // fsm done 
logic       rx_idle;          // fsm idle 
logic[10:0] shiftReg; 

//=================================================
//  SHIFT REGISTER 
//=================================================
SHIFT_REG_MODULE #(.BITS(11))
uSHIFT_REG
(
.MCLK(MCLK),
.HRST(HRST),
.ENABLE(shiftEnable),
.shiftReg(shiftReg),
.regD(regD)
);

//=================================================
//  BIT COUNTER 
//=================================================
bCOUNTER  #(.BITS_TO_RECEIVE(10))
uBIT_COUNTER
(
.MCLK(MCLK),          // 100 MHz MCLK 
.HRST(HRST),          // Hardware reset
.ENABLE(rx_shift),    // Enable during ShiftEnable
.SAMPLE(sampleDone),  // Sample in middle of bit period 
.BitCount(bitCount)   // Current value of bit count 
); 

//=================================================
//  SAMPLE COUNTER
//=================================================

always_ff@(posedge MCLK) begin :  pSampleCnt 
    if (HRST || rx_idle) begin 
        sampleCount     <= MCLKS_SKEW;
        sampleDone  <= 1'b0;
		end 	
    else if (rx_shift) begin 
            if (sampleCount > 0) begin 
                sampleCount <= sampleCount - 1;
                sampleDone  <= 1'b0;
				end 
            else begin 
                sampleCount <= MCLKS_PER_BIT;
                sampleDone  <= 1'b1;
                end 
			end 
    end 


logic rstSampleCnt;

always_comb begin 
    rstSampleCnt <= (rx_idle || HRST) ? 1'b1 : 1'b0;
	end 

//=================================================
// Rx Filter (prevents false starts & aligns 
// Rx samples near bit center) 
//=================================================
  always_ff@(posedge MCLK) begin : pFilter
  if (HRST) begin
      regD     <= 0;
	  rx_start <= 0;
	  end
  else begin 
	  regD     <= {regD[1:0], i_RXD};
      rx_start <= regD[2] && (!regD[1]);
	  end
  end
 
//=================================================
//  Main State Machine 
//=================================================
always_ff@(posedge MCLK) begin : pMain 
if (HRST) 
   state <= IDLE;
else 
    case(state) 
	IDLE : begin
	       if (rx_start) 
	           state <= SHIFT;
		   else 
		       state <= IDLE;
		   end 
    SHIFT : begin 
	        if (TransferDone) 
			    state <= LOAD;
		    else 
			    state <= SHIFT;
		    end 
	LOAD  : begin 
	        state <= DONE;
			end 
	DONE  : begin 
	        state <= IDLE;
			end 
	endcase
end





//======================================================
// Combinatorial logics & combininatorial FSM outputs 
//======================================================
always_comb begin 
    registerData  <= (bitCount == 1 && sampleCount == MCLKS_SKEW)? 1'b1 : 1'b0;
    TransferDone  <= (bitCount == 0 )? 1'b1 : 1'b0 ; 
	shiftEnable   <= (state == IDLE && rx_start) || sampleDone; 
	rx_shift      <= (state == SHIFT) ? 1'b1 : 1'b0;
	rx_load       <= (state == LOAD)  ? 1'b1 : 1'b0;
	rx_done       <= (state == DONE)  ? 1'b1 : 1'b0;
	rx_idle       <= (state == IDLE)  ? 1'b1 : 1'b0; 
	
end 
logic o_DONEx; 

always_ff@(posedge MCLK) begin 
if (HRST) begin  
   o_DATA <= 0; 
   o_DONEx <= 1'b0;
   end 
else if (registerData) begin 
   o_DATA <= shiftReg[10:3]; 
   o_DONEx <= 1'b1;
   end 
   else begin 
   o_DONEx <= 1'b0;
   end 
end 


always_ff@(posedge MCLK) begin 
	o_DONE <= o_DONEx; 
	end 

endmodule 

//=================================================
//  Bit Counter -- Count total number of bits 
//=================================================
module bCOUNTER
#(parameter BITS_TO_RECEIVE = 10)
(
input  logic      MCLK,          // 100 MHz MCLK 
input  logic      HRST,          // Hardware reset
input  logic      ENABLE,        // Enable during ShiftEnable
input  logic      SAMPLE,        // Sample in middle of bit period 
output logic[7:0] BitCount       // Current value of bit count 
);   

always_ff@(posedge MCLK) begin : pMain 
if (HRST) begin 
    BitCount <= BITS_TO_RECEIVE;
	end 
else if (ENABLE) begin 
    if (SAMPLE) 
	    BitCount <= BitCount - 1;
	end 
else 
	 BitCount <= BITS_TO_RECEIVE;
end : pMain 

endmodule 
//=================================================
//  Sample Counter -- Counter during bit periods
//  this counter determines where to sample in bit
//  by signal ZERO_FLAG 
//  This counter is designed for generic reuse
//  Category of "Generic Down Counter" 
//=================================================
module downCounter#(
parameter INITIAL   = 43,
parameter MODULO    = 100)
(
input  logic                     MCLK,          // 100 MHz clock 
input  logic                     HRST,          // Hardware reset counter to Initial Value
input  logic                     i_ENABLE,      // Enable the counter shift enable 
input  logic                     i_RELOAD,      // Reload the counter to Modulo Value  
output logic[11:0]               o_COUNT,       // Value of counter 
output logic                     o_ZERO_FLAG    // Counter has reached zero count flag 
);

always_ff@(posedge MCLK) begin :  pMain 
    if (HRST) begin 
        o_COUNT      <= INITIAL;
        o_ZERO_FLAG  <= 1'b0;
		end 
    else if (i_ENABLE) begin 
            if (o_COUNT > 0) begin 
                o_COUNT      <= o_COUNT - 1;
                o_ZERO_FLAG  <= 1'b0;
				end 
            else begin 
                o_COUNT      <= MODULO;
                o_ZERO_FLAG  <= 1'b1;
                end 
			end 
	else if (i_RELOAD) begin 
	    o_COUNT     <= MODULO;
		o_ZERO_FLAG <= 1'b0;
		end 
    end 

endmodule
//=================================================
//  Shift Register module -- shift right 
//=================================================
module SHIFT_REG_MODULE#(
parameter BITS = 10)
(
input  logic           MCLK,
input  logic           HRST,
input  logic           ENABLE,
output logic[BITS-1:0] shiftReg,
input  logic[2:0]      regD
);

always_ff@(posedge MCLK) begin
if (HRST) 
   shiftReg <= 0;
else if (ENABLE) 
   shiftReg <= {(regD[2] && regD[1]), shiftReg[$left(shiftReg):1]}; 
end 

endmodule  

