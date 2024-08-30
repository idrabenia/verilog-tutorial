module decoder_2_4(
    input wire [1:0] code,
    output wire [3:0] out
);

    assign out[0] = ~code[1] & ~code[0];
    assign out[1] = ~code[1] & code[0];
    assign out[2] = code[1] & ~code[0];
    assign out[3] = code[1] & code[0];

endmodule
