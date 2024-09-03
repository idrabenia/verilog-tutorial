
module bcd_inc(
    input wire [11:0] in,
    output wire [11:0] out,
    output wire carry_out
);

    wire [2:0] carry;

    bcd_inc_4 digit_1(in[3:0], 1'h1, out[3:0], carry[0]);
    bcd_inc_4 digit_2(in[7:4], carry[0], out[7:4], carry[1]);
    bcd_inc_4 digit_3(in[11:8], carry[1], out[11:8], carry_out);

endmodule

module bcd_inc_4(
    input wire [3:0] in,
    input wire carry_in,
    output reg [3:0] out,
    output reg carry
);

    reg [4:0] sum;

    always@* begin
        sum = in + carry_in;
        {carry, out} = (sum > 4'h9) ? sum + 4'h6 : sum;
    end

endmodule
