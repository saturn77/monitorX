	component NiosBase is
		port (
			clk_clk           : in  std_logic                     := 'X';             -- clk
			coe_done          : in  std_logic                     := 'X';             -- done
			coe_data          : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- data
			i_reg16_0_export  : in  std_logic_vector(15 downto 0) := (others => 'X'); -- export
			i_reg16_1_export  : in  std_logic_vector(15 downto 0) := (others => 'X'); -- export
			i_reg16_2_export  : in  std_logic_vector(15 downto 0) := (others => 'X'); -- export
			i_reg16_3_export  : in  std_logic_vector(15 downto 0) := (others => 'X'); -- export
			i_reg16_4_export  : in  std_logic_vector(15 downto 0) := (others => 'X'); -- export
			i_reg16_5_export  : in  std_logic_vector(15 downto 0) := (others => 'X'); -- export
			i_reg16_6_export  : in  std_logic_vector(15 downto 0) := (others => 'X'); -- export
			i_reg32_0_export  : in  std_logic_vector(31 downto 0) := (others => 'X'); -- export
			i_reg32_1_export  : in  std_logic_vector(31 downto 0) := (others => 'X'); -- export
			i_reg32_2_export  : in  std_logic_vector(31 downto 0) := (others => 'X'); -- export
			i_reg32_3_export  : in  std_logic_vector(31 downto 0) := (others => 'X'); -- export
			i_reg32_4_export  : in  std_logic_vector(31 downto 0) := (others => 'X'); -- export
			i_reg32_5_export  : in  std_logic_vector(31 downto 0) := (others => 'X'); -- export
			i_reg32_6_export  : in  std_logic_vector(31 downto 0) := (others => 'X'); -- export
			i_reg32_7_export  : in  std_logic_vector(31 downto 0) := (others => 'X'); -- export
			o_reg32_0_export  : out std_logic_vector(31 downto 0);                    -- export
			o_reg32_1_export  : out std_logic_vector(31 downto 0);                    -- export
			o_reg32_10_export : out std_logic_vector(31 downto 0);                    -- export
			o_reg32_11_export : out std_logic_vector(31 downto 0);                    -- export
			o_reg32_12_export : out std_logic_vector(31 downto 0);                    -- export
			o_reg32_13_export : out std_logic_vector(31 downto 0);                    -- export
			o_reg32_2_export  : out std_logic_vector(31 downto 0);                    -- export
			o_reg32_3_export  : out std_logic_vector(31 downto 0);                    -- export
			o_reg32_4_export  : out std_logic_vector(31 downto 0);                    -- export
			o_reg32_5_export  : out std_logic_vector(31 downto 0);                    -- export
			o_reg32_6_export  : out std_logic_vector(31 downto 0);                    -- export
			o_reg32_7_export  : out std_logic_vector(31 downto 0);                    -- export
			o_reg32_8_export  : out std_logic_vector(31 downto 0);                    -- export
			o_reg32_9_export  : out std_logic_vector(31 downto 0);                    -- export
			reset_reset_n     : in  std_logic                     := 'X';             -- reset_n
			uart_rxd          : in  std_logic                     := 'X';             -- rxd
			uart_txd          : out std_logic                                         -- txd
		);
	end component NiosBase;

	u0 : component NiosBase
		port map (
			clk_clk           => CONNECTED_TO_clk_clk,           --        clk.clk
			coe_done          => CONNECTED_TO_coe_done,          --        coe.done
			coe_data          => CONNECTED_TO_coe_data,          --           .data
			i_reg16_0_export  => CONNECTED_TO_i_reg16_0_export,  --  i_reg16_0.export
			i_reg16_1_export  => CONNECTED_TO_i_reg16_1_export,  --  i_reg16_1.export
			i_reg16_2_export  => CONNECTED_TO_i_reg16_2_export,  --  i_reg16_2.export
			i_reg16_3_export  => CONNECTED_TO_i_reg16_3_export,  --  i_reg16_3.export
			i_reg16_4_export  => CONNECTED_TO_i_reg16_4_export,  --  i_reg16_4.export
			i_reg16_5_export  => CONNECTED_TO_i_reg16_5_export,  --  i_reg16_5.export
			i_reg16_6_export  => CONNECTED_TO_i_reg16_6_export,  --  i_reg16_6.export
			i_reg32_0_export  => CONNECTED_TO_i_reg32_0_export,  --  i_reg32_0.export
			i_reg32_1_export  => CONNECTED_TO_i_reg32_1_export,  --  i_reg32_1.export
			i_reg32_2_export  => CONNECTED_TO_i_reg32_2_export,  --  i_reg32_2.export
			i_reg32_3_export  => CONNECTED_TO_i_reg32_3_export,  --  i_reg32_3.export
			i_reg32_4_export  => CONNECTED_TO_i_reg32_4_export,  --  i_reg32_4.export
			i_reg32_5_export  => CONNECTED_TO_i_reg32_5_export,  --  i_reg32_5.export
			i_reg32_6_export  => CONNECTED_TO_i_reg32_6_export,  --  i_reg32_6.export
			i_reg32_7_export  => CONNECTED_TO_i_reg32_7_export,  --  i_reg32_7.export
			o_reg32_0_export  => CONNECTED_TO_o_reg32_0_export,  --  o_reg32_0.export
			o_reg32_1_export  => CONNECTED_TO_o_reg32_1_export,  --  o_reg32_1.export
			o_reg32_10_export => CONNECTED_TO_o_reg32_10_export, -- o_reg32_10.export
			o_reg32_11_export => CONNECTED_TO_o_reg32_11_export, -- o_reg32_11.export
			o_reg32_12_export => CONNECTED_TO_o_reg32_12_export, -- o_reg32_12.export
			o_reg32_13_export => CONNECTED_TO_o_reg32_13_export, -- o_reg32_13.export
			o_reg32_2_export  => CONNECTED_TO_o_reg32_2_export,  --  o_reg32_2.export
			o_reg32_3_export  => CONNECTED_TO_o_reg32_3_export,  --  o_reg32_3.export
			o_reg32_4_export  => CONNECTED_TO_o_reg32_4_export,  --  o_reg32_4.export
			o_reg32_5_export  => CONNECTED_TO_o_reg32_5_export,  --  o_reg32_5.export
			o_reg32_6_export  => CONNECTED_TO_o_reg32_6_export,  --  o_reg32_6.export
			o_reg32_7_export  => CONNECTED_TO_o_reg32_7_export,  --  o_reg32_7.export
			o_reg32_8_export  => CONNECTED_TO_o_reg32_8_export,  --  o_reg32_8.export
			o_reg32_9_export  => CONNECTED_TO_o_reg32_9_export,  --  o_reg32_9.export
			reset_reset_n     => CONNECTED_TO_reset_reset_n,     --      reset.reset_n
			uart_rxd          => CONNECTED_TO_uart_rxd,          --       uart.rxd
			uart_txd          => CONNECTED_TO_uart_txd           --           .txd
		);

