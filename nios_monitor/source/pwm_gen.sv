module pwm_gen  #(parameter MODULO = 10000)
(
 input  logic       CLK,         // Main clock 
 input  logic       RST,         // Reset synchronous to MCLK
 input  logic       i_PWM_TIC,   // Enable the PWM Counter
 input  logic[15:0] i_MIN_DUTY,  // Minimum Duty Cycle
 input  logic[15:0] i_MAX_DUTY,  // Maximum Duty Cycle 
 input  logic[15:0] i_DUTY,      // Input Duty Cycle Command
 input  logic       i_START,     // Enable input
 output logic       o_PWM        // PWM duty signal 

); 


//---------------------------------------
//  Signals for the module 
//---------------------------------------
logic [31:0] count = 0; 
logic [31:0] duty_cycle = 0; 

always_ff@(posedge CLK) begin 
if (RST || i_START) begin
    duty_cycle  <= i_DUTY;
    count       <= 0; 
	o_PWM       <= 1'b0; 
	end 
else if ( duty_cycle == 0 ) begin 
    o_PWM <= 1'b0; 
	 end 
else if ( duty_cycle == MODULO) begin 
    o_PWM <= 1'b1;
	 end 
else if ( duty_cycle < i_MIN_DUTY) begin 
	o_PWM <= 1'b0;
	end 
else if (  count < duty_cycle ) begin 
        o_PWM <= 1'b1; 
		if (i_PWM_TIC)
	    count <= count + 1;  
		end 
else begin 
		o_PWM <= 1'b0; 
	end
end  

endmodule 
