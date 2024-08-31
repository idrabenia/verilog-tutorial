// Copyright (C) 2024  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and any partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details, at
// https://fpgasoftware.intel.com/eula.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 23.1std.1 Build 993 05/14/2024 SC Lite Edition"
// CREATED		"Sat Aug 31 11:56:52 2024"

module decoder_3_8(
	in,
	out
);


input wire	[2:0] in;
output wire	[7:0] out;

wire	SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_14;




assign	out[7] = in[0] & in[1] & in[2];

assign	out[0] = SYNTHESIZED_WIRE_12 & SYNTHESIZED_WIRE_13 & SYNTHESIZED_WIRE_14;

assign	SYNTHESIZED_WIRE_14 =  ~in[0];

assign	out[1] = in[0] & SYNTHESIZED_WIRE_13 & SYNTHESIZED_WIRE_12;

assign	out[2] = SYNTHESIZED_WIRE_14 & in[1] & SYNTHESIZED_WIRE_12;

assign	out[3] = in[0] & in[1] & SYNTHESIZED_WIRE_12;

assign	out[4] = SYNTHESIZED_WIRE_14 & SYNTHESIZED_WIRE_13 & in[2];

assign	out[5] = in[0] & SYNTHESIZED_WIRE_13 & in[2];

assign	out[6] = SYNTHESIZED_WIRE_14 & in[1] & in[2];

assign	SYNTHESIZED_WIRE_12 =  ~in[2];

assign	SYNTHESIZED_WIRE_13 =  ~in[1];


endmodule
