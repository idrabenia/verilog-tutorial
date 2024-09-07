
module system(
	input wire clk,
	input wire reset,
	input wire [3:0] btns,
	output wire signal
);
	wire locked, clk_1;
	
	pll pll_block(~reset, clk, clk_1, locked);
	pwm pwm_block(~btns, clk_1, ~reset, signal);

endmodule
