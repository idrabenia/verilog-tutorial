module greater_than_8(
    input wire [7:0] a,
    input wire [7:0] b,
    output wire result
);

    wire cmp2_out, eq2_out, cmp1_out;

    greater_than_4 cmp2(a[7:4], b[7:4], cmp2_out);
    greater_than_4 cmp1(a[3:0], b[3:0], cmp1_out);

    assign eq2_out = 
        ~(a[7] ^ b[7]) & 
        ~(a[6] ^ b[6]) & 
        ~(a[5] ^ b[5]) & 
        ~(a[4] ^ b[4]);
        
    assign result = cmp2_out | (eq2_out & cmp1_out);

endmodule
