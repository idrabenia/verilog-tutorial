
module system(
	input wire clk,
	input wire reset,
	input wire [3:0] btns,
	output wire [3:0] leds
);

	wire completed;
	wire [7:0] result;
	
	sum_n #(4) summator(clk, ~reset, ~btns, result, completed);
	
	assign leds = ~{result[3], result[2], result[1], result[0]};

endmodule
