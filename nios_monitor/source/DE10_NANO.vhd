--******************************************************
--
--  Title    : Overloaded Test - DE10_NANO
--
--  Filename : DE10_NANO.vhd  (Target Device is DE10-Nano from Terasic)
--
--  Project  : Quartus Synthesis Analysis with Nios Monitor
--
--  Author   : James B <fpga@atlantixeng.com>
--
--  History  : 0.1 -- Initial Release -- 01 Dec 2021
--             0.2 -- 
--
--  Platform : Window 10 64 Bit Professional
--             Quartus Prime 20.1 Build 720 Standard Edition 
--             Eclipse Mars.2 Release (4.5.2)
--
--  Descrip  : Test overloaded VHDL functionality synthesized by
--             Quartus by using Nios to write values, use "bits"
--             function, and then read them back. Print out the
--             read valus operated on by "bits" function. 
--  
--  License   : General Public License (GPL) 
--
--******************************************************

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Basic_Data_Types.all;
use work.support_functions.all; 

entity DE10_NANO is
  port (
    FPGA_CLK1_50 : in std_logic;   --! Primary PCB FPGA Clock, 50 MHz
    LED          : out slv8;       --! LED Outputs 
    SW           : in slv4;        --! Four Slide switches
    KEY          : in slv2;        --! Two Push buttons 
    GPIO_9       : in std_logic;   -- UART Rx 
    GPIO_11      : out std_logic;  -- UART Tx 
	 GPIO_13      : out std_logic;  -- Debug of Nios timing
	 GPIO_15      : out std_logic;  -- Debug of Nios timing
	 GPIO_17      : out std_logic;  -- Debug of Nios timing
	 GPIO_19      : out std_logic   -- Debug of Nios timing
	 
  );
end DE10_NANO;

architecture rtl of DE10_NANO is

  ----------------------------------------------
  -- Constants for the module 
  ----------------------------------------------
  constant X_MODULO : std_logic_vector(25 downto 0) := 26D"60000000"; --! HB Led PWM Period
  constant Y_MODULO : std_logic_vector(25 downto 0) := 26D"740000";   --! HB Led PWM Duty
  
  constant X_MODULO_INTR : std_logic_vector(25 downto 0) := 26D"500000"; --! Interrupt Period
  constant Y_MODULO_INTR : std_logic_vector(25 downto 0) := 26D"600";    --! Interrupt Duty

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
  signal counterX    : counter_t; --! PWM Period Counter
  signal counterY    : counter_t; --! PWM Duty Counter
  signal pll_locked  : std_logic; --! *asserted* high PLL good
  signal btn_reg1    : slv2;      --! DFF Sync 1 of pushbuttons
  signal btn_reg2    : slv2;      --! DFF Sync 2 of pushbuttons
  signal slide_reg1  : slv4;      --! DFF Sync 1 of slide switches
  signal slide_reg2  : slv4;      --! DFF Sync 2 of slide switches
  signal por         : std_logic; --! Power on reset, asserted 127 cycles
  signal por_counter : uvc6;      --! Counter for power on reset
  signal led_hb      : std_logic; 
  signal MCLK        : std_logic;
  signal CLK_10      : std_logic;
  signal CLK_50      : std_logic;
  signal CLK_100     : std_logic; 
  signal HRST        : std_logic;
  signal x_sine      : slv16;     --! output of test generator - placeholder only
  signal x_cosine    : slv16;     --! output of test generator - placeholder only
  signal x_halfwave  : std_logic; --! output of test generator - placeholder only

  ----------------------------------------------
  -- Signals related to NIOS Processor 
  -- Inputs are coming from VHDL module, associated with adc
  -- Outputs are computed RMS and ROCOF values 
  -- General purpose 32 bit input/output register (iReg32_0/oReg32_0) 
  ---------------------------------------------- 
  
  signal nios_intr: std_logic; --! interrupt Nios for sample of adc data 
  signal iReg32_0 : slv32; --! nios output reg 0: 32 bit 
  signal iReg32_1 : slv32; --! nios output reg 1: 32 bit 
  signal iReg32_2 : slv32;
  signal iReg32_3 : slv32;
  signal iReg32_4 : slv32;
  signal iReg32_5 : slv32; 
  signal iReg32_6 : slv32; 
  signal iReg32_7 : slv32; 
  

  signal iReg16_0 : slv16; --! nios output reg 1: 16 bit 
  signal iReg16_1 : slv16; --! nios output reg 1: 16 bit 
  signal iReg16_2 : slv16; --! nios output reg 1: 16 bit 
  signal iReg16_3 : slv16; --! nios output reg 1: 16 bit
  signal iReg16_4 : slv16; 
  signal iReg16_5 : slv16; 
  signal iReg16_6 : slv16;  

  signal vab_test : slv16; --! input reg 16 bit; Vab test value 
  signal vbc_test : slv16; --! input reg 16 bit; Vbc test value
  signal vca_test : slv16; --! input reg 16 bit; Vca test value
  signal Ia_test  : slv16; 
  signal Ib_test  : slv16; 
  signal Ic_test  : slv16; 
  signal oReg32_0 : slv32; --! nios output reg 0: 32 bit 
  signal oReg32_1 : slv32; --! nios output reg 1: 32 bit 
  signal oReg32_2 : slv32; --! nios output reg 2: 32 bit 
  signal oReg32_3 : slv32; --! nios output reg 3: 32 bit 
  signal oReg32_4 : slv32; --! nios output reg 4: 32 bit
  signal oReg32_5 : slv32; --! nios output reg 5: 32 bit
  signal oReg32_6 : slv32; --! nios output reg 6: 32 bit
  signal oReg32_7 : slv32; --! nios output reg 7: 32 bit
  signal oReg32_8 : slv32; --! nios output reg 8: 32 bit
  signal oReg32_9 : slv32; --! nios output reg 9: 32 bit
  signal oReg32_10: slv32; --! nios output reg 10: 32 bit
  signal oReg32_11: slv32; --! nios output reg 11: 32 bit
  signal oReg32_12: slv32; --! nios output reg 12: 32 bit
  signal oReg32_13: slv32; --! nios output reg 13: 32 bit
  
  signal volt_amplitude : slv16; --! amplitude to HIL generator 
  signal freq_timer     : slv16; --! timer freq to HIL generator
  
  signal pwm_cnt  : uvc16;     --! counter for pwm (1000 cnts for 100 kHz at 100 MHz MCLK)
  signal pwm_sync : std_logic; --! pwm sync (one MCLK high to start PWM frame)
  signal pwm_out  : std_logic; --! pwm output for controller

  signal nios_filter_alpha     : slv16;
  signal nios_filter_beta      : slv16; 
  signal nios_filter_alpha2    : slv16; 
  signal nios_filter_beta2     : slv16; 
  signal nios_filter_alpha_hil : slv16; 
  signal nios_filter_beta_hil  : slv16; 
  signal nios_en_HIL           : std_logic; 
  signal nios_filter_tsx       : slv32;
  signal nios_filter_tsx2      : slv32; 
  signal sum_squares_filt      : slv32; 
  signal timer_freq_filt       : slv32; 
  signal nios_filter_real_power: slv32; 
  signal nios_filter_reactive_power : slv32; 
  
  signal uart_rx_data          : slv8; 
  signal uart_rx_done          : std_logic; 
  signal blank_signal          : std_logic; 
  
  signal adc_sense_record      : adc_sense_t; 
  signal test_reg_s16 : signed(15 downto 0); 
  signal test_reg_u16 : unsigned(15 downto 0); 
  signal test_reg_slv : std_logic_vector(15 downto 0); 
  
  signal counter_value : integer range 0 to 65535; 
  
  ----------------------------------------------
  -- Alias for the module 
  -- VHDL wrap Quartus IP verilog module
  ----------------------------------------------   
  alias cpu_reset_n : std_logic is btn_reg2(1);

  component main_pll is
    port (
      refclk   : in std_logic := 'X'; --! clk from pcb
      rst      : in std_logic := 'X'; --! reset set to off
      outclk_0 : out std_logic; --! clk 10 MHz
      outclk_1 : out std_logic; --! clk 50 MHz
      outclk_2 : out std_logic; --! clk 100 MHz
      locked   : out std_logic --! pll is okay
    );
  end component main_pll;
  
  	------------------------------------
	-- DUT Component Declaration 
	-- VHDL wrapping SystemVerilog module
	------------------------------------  
  component uart_rx_atlantix
	generic(
		MCLKS_SKEW    : integer := 217;
		MCLKS_PER_BIT : integer := 434
	);
	port(
		MCLK   : in std_logic;
		HRST   : in std_logic;
		i_RXD  : in std_logic;
		o_DATA : out std_logic_vector(7 downto 0);
		o_DONE : out std_logic
	);
	end component;

  
  component NiosBase is
    port (
      clk_clk : in std_logic := 'X'; -- clk
		
		coe_done          : in  std_logic                     := 'X';             -- done
      coe_data          : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- data

      i_reg32_0_export : in std_logic_vector(31 downto 0) := (others => 'X'); 
		i_reg32_1_export : in  std_logic_vector(31 downto 0) := (others => 'X'); 

      i_reg16_0_export : in std_logic_vector(15 downto 0) := (others => 'X'); 
      i_reg16_1_export : in std_logic_vector(15 downto 0) := (others => 'X'); 
      i_reg16_2_export : in std_logic_vector(15 downto 0) := (others => 'X');  
      i_reg16_3_export : in std_logic_vector(15 downto 0) := (others => 'X'); 
      i_reg16_4_export : in std_logic_vector(15 downto 0) := (others => 'X'); 
      i_reg16_5_export : in std_logic_vector(15 downto 0) := (others => 'X'); 
      i_reg16_6_export : in std_logic_vector(15 downto 0) := (others => 'X'); 
      
		o_reg32_0_export : out std_logic_vector(31 downto 0);                   
      o_reg32_1_export : out std_logic_vector(31 downto 0);                   
      o_reg32_2_export : out std_logic_vector(31 downto 0);                   
      o_reg32_3_export : out std_logic_vector(31 downto 0);                   
      o_reg32_4_export : out std_logic_vector(31 downto 0);                   
		o_reg32_5_export : out std_logic_vector(31 downto 0);                   
		o_reg32_6_export : out std_logic_vector(31 downto 0);                   
		o_reg32_7_export : out std_logic_vector(31 downto 0);                   
		
      reset_reset_n : in std_logic := 'X'; -- reset_n
      uart_rxd      : in std_logic := 'X'; -- rxd
      uart_txd      : out std_logic;        -- txd
		
		o_reg32_8_export  : out std_logic_vector(31 downto 0);                    -- export
		o_reg32_9_export  : out std_logic_vector(31 downto 0);                    -- export
		o_reg32_10_export : out std_logic_vector(31 downto 0);                    -- export
		o_reg32_11_export : out std_logic_vector(31 downto 0);                    -- export
		o_reg32_12_export : out std_logic_vector(31 downto 0); 
		o_reg32_13_export : out std_logic_vector(31 downto 0); 
		i_reg32_2_export  : in  std_logic_vector(31 downto 0) := (others => 'X'); -- export
		i_reg32_3_export  : in  std_logic_vector(31 downto 0) := (others => 'X'); -- export
		i_reg32_4_export  : in  std_logic_vector(31 downto 0) := (others => 'X'); -- export
		i_reg32_5_export  : in  std_logic_vector(31 downto 0) := (others => 'X'); -- export
		i_reg32_6_export  : in  std_logic_vector(31 downto 0) := (others => 'X'); -- export
		i_reg32_7_export  : in  std_logic_vector(31 downto 0) := (others => 'X')  -- export 
	
 );
  end component NiosBase;
  

  -----------------------------------
  -- ** Main Architectural Body **S
  ----------------------------------- 
begin

  main_pll_inst : component main_pll
    port map(
      refclk   => FPGA_CLK1_50, --!  refclk.clk
      rst      => '0',          --!  reset.reset
      outclk_0 => CLK_10,       --!  Aux  Clock : 10 MHz 
      outclk_1 => MCLK,         --!  Main Clock : 50 MHz 
      outclk_2 => CLK_100,      --!  Aux  Clock : 100 MHz 
      locked   => pll_locked    --!  locked.export
    );
	 	
	--------------------------------
	-- Interrupt generator for Nios 
	--------------------------------
	uInterrupt : entity work.XY_COUNTER(RTL)
	port map(
		MCLK     => MCLK, 
		HRST     => HRST, 
		X_MODULO => oReg32_2(25 downto 0), --X_MODULO_INTR, 
		Y_MODULO => oReg32_3(25 downto 0), --Y_MODULO_INTR, 
		o_FLAG   => nios_intr
	);
	

    HRST <= not(pll_locked) and por; --! HRST is POR or'd with any others
    MCLK <= MCLK;
	
	uUart : component uart_rx_atlantix 
	generic map(
		MCLKS_SKEW   => 217,
		MCLKS_PER_BIT => 434)
	port map  (
		MCLK   => MCLK,
		HRST   => HRST,
		i_RXD  => GPIO_9,
		o_DATA => uart_rx_data,
		o_DONE => uart_rx_done
	);
		
    ----------------------------------------------
    --! Nios CPU with 32768 on chip memory with 
    --  1. 32 bit input reg -- 8 total
    --  2. 16 bit input reg -- 7 total
    --  3. 32 bit output regs at 32 bit
    ---------------------------------------------- 

    u0 : component NiosBase
      port map(
        clk_clk          => MCLK,       -- clk.clk
		  
		  coe_done         => uart_rx_done,          --        coe.done
        coe_data         => uart_rx_data,          --           .data
				
        i_reg32_0_export => iReg32_0,   -- 32 bit input INTERRUPTS
		  i_reg32_1_export => iReg32_1,   -- filtered sum of squares
		  i_reg32_2_export => iReg32_2,   -- Filtered Freq timer 32 bit value
		  i_reg32_3_export => iReg32_3,   -- i_reg32_3.export
		  i_reg32_4_export => iReg32_4,   -- i_reg32_4.export
		  i_reg32_5_export => iReg32_5,   -- i_reg32_5.export
		  i_reg32_6_export => iReg32_6,   -- i_reg32_6.export
		  i_reg32_7_export => iReg32_7,   -- i_reg32_7.export

        i_reg16_0_export => iReg16_0,   -- signed test_reg
        i_reg16_1_export => iReg16_1,   -- unsigned test_reg
        i_reg16_2_export => iReg16_2,   -- slv test_reg
        i_reg16_3_export => iReg16_3,   -- now spare 

        i_reg16_4_export => iReg16_4,   -- built in self test vab
        i_reg16_5_export => iReg16_5,   -- built in self test vbc
        i_reg16_6_export => iReg16_6,   -- built in self test vca

        o_reg32_0_export => oReg32_0,   -- amplitude sine wave (HIL setting)

        o_reg32_1_export => oReg32_1,   -- 
        o_reg32_2_export => oReg32_2,   -- 
        o_reg32_3_export => oReg32_3,   --   
        o_reg32_4_export => oReg32_4,   --  
		  o_reg32_5_export => oReg32_5,   -- 
		  o_reg32_6_export => oReg32_6,   -- 
		  o_reg32_7_export => oReg32_7,   -- 
		  
		  o_reg32_8_export => oReg32_8,   --  
		  o_reg32_9_export => oReg32_9,   --  
		  o_reg32_10_export => oReg32_10, --  
		  o_reg32_11_export => oReg32_11, --  
		  o_reg32_12_export => oReg32_12, --   
		  o_reg32_13_export => oReg32_13, --   

        reset_reset_n => cpu_reset_n,   --  reset.reset_n
        uart_rxd      => blank_signal,  --  uart.rxd
        uart_txd      => GPIO_11        --  uart.txd
		  	  
      );
		
		
		----------------------------------------------
		-- Register the interrupt process 
		----------------------------------------------
		process(all) begin 
		if HRST then 
			iReg32_0 <= (others => '0'); 
		else if rising_edge(MCLK) then 
			iReg32_0(0) <= nios_intr; 
		end if; 
		end if;
		end process; 
			
 
		
		-------------------------------------------
		-- Unsigned counter from 0 to 65535
		-- Generated within Nios 
		-------------------------------------------
		process(all) begin 
		if rising_edge(MCLK) then 
			counter_value <= to_integer(unsigned(oReg32_0(15 downto 0))); 
		end if; 
		end process; 

		-------------------------------------------
		-- Unsigned counter value converter with bits
		-- Assigned to different types
		-------------------------------------------		
		test_reg_s16 <= bits(counter_value, 16); 
		test_reg_u16 <= bits(counter_value, 16); 
		test_reg_slv <= bits(counter_value, 16); 
		
		-------------------------------------------
		-- Read in Nios the different types
		-- The input registers are std_logic_types
		-- but will not change the "signedness"
		-- of the value 
		-------------------------------------------			
		process(all) begin 
		if rising_edge(MCLK) then 
		iReg16_1 <= std_logic_vector(test_reg_s16);
		iReg16_2 <= std_logic_vector(test_reg_u16); 
		iReg16_3 <= test_reg_slv;
		-------------------------------------------
		-- Read back what Nios wrote for counter 
		-------------------------------------------
		iReg16_4 <= std_logic_vector(to_unsigned(counter_value,16)); 
		end if; 
		end process;
		
		GPIO_13            <= oReg32_1(0); 
		GPIO_15            <= pwm_out;
		GPIO_17            <= nios_intr;
		GPIO_19            <= iReg32_0(0);

      ----------------------------------------------
      --! Period counter (X Counter). The counter
      --! sets the length of the PWM period. 
      ---------------------------------------------- 
      power_on_reset : process (MCLK)
      begin
        if rising_edge(MCLK) then
          if por_counter <= X"111111" then
            por            <= '1';
            por_counter    <= por_counter + 1;
          else
            por <= '0';
          end if;
        end if;
      end process power_on_reset;

		---------------------------------------------
		-- Hearbeat counter FPGA logic alive
		---------------------------------------------
		uHB : entity work.XY_COUNTER(RTL)
		port map(
			MCLK     => MCLK, 
			HRST     => HRST, 
			X_MODULO => X_MODULO, 
			Y_MODULO => Y_MODULO, 
			o_FLAG   => led_hb
		);

      ----------------------------------------------
      --! Assign the LEDs including Heartbeat signals
      ----------------------------------------------  
      assign_led : process (all)
      begin
        if HRST then
          LED <= (others => '1');
        elsif rising_edge(MCLK) then
          LED(0)          <= led_hb;
          LED(1)          <= '0';
          LED(3 downto 2) <= not(btn_reg2);
          LED(7 downto 4) <= slide_reg2;
        end if;
      end process assign_led;
		
      ----------------------------------------------
      --! Register the push button Switch input
      ----------------------------------------------
      register_switches : process (all)
      begin
        if HRST then
          btn_reg1 <= (others => '0');
          btn_reg2 <= (others => '0');
        elsif rising_edge(MCLK) then
          btn_reg1 <= KEY;
          btn_reg2 <= btn_reg1;
        end if;
      end process register_switches;
		
      ----------------------------------------------
      --! Register the slide switch inputs
      ---------------------------------------------- 
      register_buttons : process (all)
      begin
        if HRST then
          slide_reg1 <= (others => '0');
          slide_reg2 <= (others => '0');
        elsif rising_edge(MCLK) then
          slide_reg1 <= SW;
          slide_reg2 <= slide_reg1;
        end if;
      end process register_buttons;
 
		GEN_SYNC : process(all) begin 
		if (HRST) then  
			pwm_sync <= '0'; 
			pwm_cnt <= (others => '0'); 
		elsif rising_edge(MCLK) then 
			if (pwm_cnt < 999) then 
				pwm_cnt <= pwm_cnt + 1;
				pwm_sync <= '0';
			else 
				pwm_cnt <= (others => '0'); 
				pwm_sync <= '1';
			end if; 
		end if; 
		end process GEN_SYNC;

      ----------------------------------------------
      --! PWM Generator 
      ---------------------------------------------- 		
		uut : entity work.pwm_gen_fsm(rtl)
		port map(
			clk           => MCLK, 
			hrst          => HRST, 
			control_reset => '0', 
			start_pwm     => pwm_sync,  
			duty_max      => 16D"990", 
			duty_min      => 16D"5", 
			duty_in       => oReg32_2(15 downto 0), 
			pwm_out       => pwm_out
		);

    end architecture rtl;