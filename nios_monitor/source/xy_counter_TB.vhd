library main;
use main.Basic_Data_Types.all;

-- Add your library and packages declaration here...
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Basic_Data_Types.all;
use std.env.all;

entity XY_COUNTER_tb is
end XY_COUNTER_tb;

architecture XY_COUNTER_tb of XY_COUNTER_tb is


-------------------------------------------------------------------------------
-- CONSTANTS for the module 
-------------------------------------------------------------------------------
constant Tclk         : time  := 20 ns; 
constant RESET_LENGTH : time  := 500 ns;
constant X_MODULO : std_logic_vector(25 downto 0) := 26D"6510"; --! HB Led PWM Period
constant Y_MODULO : std_logic_vector(25 downto 0) := 26D"100"; --! HB Led PWM Duty

---------------------------------------------
-- Component declaration of the tested unit
---------------------------------------------
component XY_COUNTER
port(
	MCLK     : in std_logic;
	HRST     : in std_logic;
	X_MODULO : in std_logic_vector (25 downto 0);
	Y_MODULO : in std_logic_vector(25 downto 0);
	o_FLAG   : out std_logic
);
end component;

---------------------------------------------
-- Stimulus signals - signals mapped to the 
-- input and inout ports of tested entity
---------------------------------------------
signal MCLK : std_logic;
signal HRST : std_logic;


-- Observed signals - signals mapped to the output ports of tested entity

signal o_FLAG : std_logic;

-- Add your code here...
begin

-------------------------------------------------------------------------------
-- Processes for generating hardware reset and master fpga clock
-------------------------------------------------------------------------------

pHRST: process 
	begin
		HRST <= '0';
		wait for Tclk;
		HRST <='1';  				
		wait for RESET_LENGTH;
		HRST <='0';
		wait;
end process pHRST;

pMCLK: process
	begin
		MCLK <= '0';
		wait for Tclk/2;
		MCLK <= '1';
		wait for Tclk/2;	
end process pMCLK; 


-- Unit Under Test port map
UUT : entity work.XY_COUNTER(RTL)
	port map(
		MCLK     => MCLK, 
		HRST     => HRST, 
		X_MODULO => X_MODULO, 
		Y_MODULO => Y_MODULO, 
		o_FLAG   => o_FLAG
	);
	
		pMain : process
	begin

		wait for 500 us;

		finish(1);
	end process pMain;
	
end XY_COUNTER_tb;


