module greater_than_4(
    input wire [3:0] a,
    input wire [3:0] b,
    output wire result
);
    wire cmp2_out, eq2_out, cmp1_out;

    greater_than_2 cmp2(a[3:2], b[3:2], cmp2_out);
    greater_than_2 cmp1(a[1:0], b[1:0], cmp1_out);

    assign eq2_out = ~(a[3] ^ b[3]) & ~(a[2] ^ b[2]);
    assign result = cmp2_out | (eq2_out & cmp1_out);

endmodule
