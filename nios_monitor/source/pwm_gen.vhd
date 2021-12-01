library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Basic_Data_Types.all;

entity pwm_gen is 
	 port(
		 CLK 			   : in std_logic;  -- Main FPGA Clock 
		 HRST 		   : in std_logic;  -- Reset synchronous to MCLK
		 CONTROL_RESET : in std_logic;  -- Control reset of controller 
		 START_PWM 		: in std_logic;  -- Start PWM frame
		 DUTY_MAX      : in slv16;      -- Maximum duty cycle
		 DUTY_MIN      : in slv16;      -- Minimum duty cycle
		 DUTY_IN       : in slv16;      -- Commanded duty cycle
		 PWM_OUT 	   : out std_logic  -- PWM output signal
	     );
end pwm_gen;

architecture rtl of pwm_gen is

	-----------------------------------------
	-- Constants for the module 
	-----------------------------------------

	-----------------------------------------
	-- Data types for the module 
	-----------------------------------------
	type    state_type is (S0, S1, S2, S3 );
	signal  state 			: state_type;

	-----------------------------------------
	-- Signals for the module 
	-----------------------------------------
	signal  cnt_val 		: uvc16; 
	signal pwm_counter   : uvc16; 
	
begin

	
	/*-----------------------------
		Dataflow Controller FSM
	-----------------------------*/	
	process (all)
	begin
		if HRST or CONTROL_RESET then
		   pwm_counter <= 0; 
			state      	<= S0;
			cnt_val     <= 0;
			ld_cnt		<= '0';
			PWM_OUT     <= '0';
			
		elsif rising_edge(CLK) then
			case state is
				
				when S0 =>  
					if PWM_START then
						if(unsigned(DUTY_IN) > unsigned(DUTY_MIN) AND (unsigned(DUTY_IN) < unsigned(DUTY_MAX)) ) then
							state		<= S1;
						end if;
					else
						state 		<= S0;
					end if;
					pwm_counter <= 0; 
					cnt_val     <= 0;
					PWM_OUT 	   <= '0';

					when S1 => 
						state    <= S2; 
						cnt_val 	<= unsigned(DUTY_IN) - 1;	
						PWM_OUT 	<= '1';
					
			   	when S2 => 
						if pwm_counter < cnt_val then 
							pwm_counter <= pwm_counter + 1; 
							state <= S2; 
						else
							state <= S3; 
						end if;

					when s3 => 
						state <= S0; 
				 	
					when others =>		null;
			end case;
		end if;
	end process;
	


  end rtl;
