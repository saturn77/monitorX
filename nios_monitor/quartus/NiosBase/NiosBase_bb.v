
module NiosBase (
	clk_clk,
	coe_done,
	coe_data,
	i_reg16_0_export,
	i_reg16_1_export,
	i_reg16_2_export,
	i_reg16_3_export,
	i_reg16_4_export,
	i_reg16_5_export,
	i_reg16_6_export,
	i_reg32_0_export,
	i_reg32_1_export,
	i_reg32_2_export,
	i_reg32_3_export,
	i_reg32_4_export,
	i_reg32_5_export,
	i_reg32_6_export,
	i_reg32_7_export,
	o_reg32_0_export,
	o_reg32_1_export,
	o_reg32_10_export,
	o_reg32_11_export,
	o_reg32_12_export,
	o_reg32_13_export,
	o_reg32_2_export,
	o_reg32_3_export,
	o_reg32_4_export,
	o_reg32_5_export,
	o_reg32_6_export,
	o_reg32_7_export,
	o_reg32_8_export,
	o_reg32_9_export,
	reset_reset_n,
	uart_rxd,
	uart_txd);	

	input		clk_clk;
	input		coe_done;
	input	[7:0]	coe_data;
	input	[15:0]	i_reg16_0_export;
	input	[15:0]	i_reg16_1_export;
	input	[15:0]	i_reg16_2_export;
	input	[15:0]	i_reg16_3_export;
	input	[15:0]	i_reg16_4_export;
	input	[15:0]	i_reg16_5_export;
	input	[15:0]	i_reg16_6_export;
	input	[31:0]	i_reg32_0_export;
	input	[31:0]	i_reg32_1_export;
	input	[31:0]	i_reg32_2_export;
	input	[31:0]	i_reg32_3_export;
	input	[31:0]	i_reg32_4_export;
	input	[31:0]	i_reg32_5_export;
	input	[31:0]	i_reg32_6_export;
	input	[31:0]	i_reg32_7_export;
	output	[31:0]	o_reg32_0_export;
	output	[31:0]	o_reg32_1_export;
	output	[31:0]	o_reg32_10_export;
	output	[31:0]	o_reg32_11_export;
	output	[31:0]	o_reg32_12_export;
	output	[31:0]	o_reg32_13_export;
	output	[31:0]	o_reg32_2_export;
	output	[31:0]	o_reg32_3_export;
	output	[31:0]	o_reg32_4_export;
	output	[31:0]	o_reg32_5_export;
	output	[31:0]	o_reg32_6_export;
	output	[31:0]	o_reg32_7_export;
	output	[31:0]	o_reg32_8_export;
	output	[31:0]	o_reg32_9_export;
	input		reset_reset_n;
	input		uart_rxd;
	output		uart_txd;
endmodule
