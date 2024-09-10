
module system(
	input wire clk,
	input wire reset,
	input wire btn,
	output wire out
);

	wire out_reg;
	
	debouncer #(19) db(clk, ~reset, ~btn, out_reg);
	
	assign out = ~out_reg;

endmodule
