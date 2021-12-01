library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Basic_Data_Types.all;

entity XY_COUNTER is
  port (
    MCLK     : in std_logic;                       --! Main clock
    HRST     : in std_logic;                       --! Reset for module
    X_MODULO : in std_logic_vector(25 downto 0);   --! X Modulo (PWM Period)
    Y_MODULO : in std_logic_vector(25 downto 0);   --! Y Modulo (PWM Duty)
    o_FLAG   : out std_logic                       --! Flag or PWM Pulse
  );
end XY_COUNTER;

architecture RTL of XY_COUNTER is
  ----------------------------------------------
  --! Record data type for counter type
  ----------------------------------------------
  type counter_t is record
    flag  : std_logic;
    value : unsigned(25 downto 0);
  end record counter_t;

  ----------------------------------------------
  -- Signals for the module 
  ----------------------------------------------
  signal counterX : counter_t; --! PWM Period Counter
  signal counterY : counter_t; --! PWM Duty Counter

begin
  ----------------------------------------------
  --! Period counter (X Counter). The counter
  --! sets the length of the PWM period. 
  ----------------------------------------------
  duty_period_counter : process (all)
  begin
    if HRST then
      counterX.value <= (others => '0');
      counterX.flag  <= '0';
    elsif rising_edge(MCLK) then
      if counterX.value < unsigned(X_MODULO) then
        counterX.value <= counterX.value + 1;
        counterX.flag  <= '0';
      else
        counterX.value <= (others => '0');
        counterX.flag  <= '1';
      end if;
    end if;
  end process duty_period_counter;

  ----------------------------------------------
  --! Duty cycle counter (Y Counter). The counter 
  --! counts up to the Y MODULO terminal value.
  ----------------------------------------------
  duty_cycle_counter : process (all)
  begin
    if HRST or counterX.flag then
      counterY.value <= (others => '0');
      counterY.flag  <= '0';
    elsif rising_edge(MCLK) then
      if counterY.value < unsigned(Y_MODULO) then
        counterY.flag  <= '1';
        counterY.value <= counterY.value + 1;
      else
        counterY.flag <= '0';
      end if;
    end if;
  end process duty_cycle_counter;

  o_FLAG <= counterY.flag;

end architecture RTL;