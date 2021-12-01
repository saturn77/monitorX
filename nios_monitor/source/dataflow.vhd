library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work; 
use work.Basic_Data_Types.all;

entity dataflow is 
    port (
        MCLK    : in  std_logic; 
        HRST    : in  std_logic; 
        i_TSX   : in  slv32; 
        i_EN    : in  std_logic; 
        o_Sample_Flag : out std_logic; 
        o_Toggle_Flag : out std_logic
    );
    end entity dataflow; 

architecture rtl of dataflow is 

signal sample_counter : uvc32;      -- Dataflow period interval counter 
signal sample_flag    : std_logic;  -- Start dataflow processes downstream
signal toggle_flag    : std_logic;  -- Toggle flag 

begin 

o_Sample_Flag <= sample_flag;

----------------------------------------------
-- Sampling process where Nios or external VHDL
-- assigns value to i_TSX and then enables the
-- module 
----------------------------------------------
pMain : process(all) begin 
    if HRST = '1' or i_EN = '0' then 
        sample_counter <= (others =>'0'); 
        sample_flag    <= '0';
    else if rising_edge(MCLK) then 
        if i_EN then 
            if (sample_counter < unsigned(i_TSX)) then 
                sample_counter <= sample_counter + 1; 
                sample_flag <= '0'; 
            else 
                sample_counter <= (others => '0'); 
                sample_flag <= '1'; 
            end if;  
        else 
            sample_counter <= (others => '0'); 
            sample_flag <= '0'; 
        end if; 
    end if;
    end if; 
    end process pMain;

pToggle : process(all) begin
    if HRST = '1' or i_EN = '0' then  
        toggle_flag <= '0'; 
    else if rising_edge(MCLK) then 
        if (sample_flag) then 
            toggle_flag <= not(toggle_flag); 
        end if; 
    end if; 
end if; 
end process pToggle; 

end rtl; 