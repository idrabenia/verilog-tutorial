module system(
	input wire [3:0] in,
	output wire out
);

	wire [7:0] a;
	wire [7:0] b;
	wire out_int;
	
	greater_than_8 cmp(a, b, out_int);
	
	assign a = 'haa;
	
	assign b[7] = ~in[3];
	assign b[6] = 1;
	assign b[5] = ~in[2];
	assign b[4] = 1;
	assign b[3] = ~in[1];
	assign b[2] = 1;
	assign b[1] = ~in[0];
	assign b[0] = 1;
	
	assign out = ~out_int;
	
endmodule