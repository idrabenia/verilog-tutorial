
module system(
	input wire [3:0] buttons,
	output wire [3:0] leds
);

	wire [11:0] in;
	wire [11:0] out;
	wire carry;
	
	assign in[3:0] = ~buttons;
	assign in[11:4] = 8'hff;

	bcd_inc block(in, out, carry);
	
	assign leds = ~out[3:0];

endmodule
