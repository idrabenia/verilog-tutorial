module counter_3(clk, reset, q);

    parameter zero = 'b00;
    parameter one = 'b01;
    parameter two = 'b10;
    parameter three = 'b11;

    input clk;
    input reset;
    output [1:0] q;

    wire clk, reset;
    reg [1:0] q;

    always@(posedge clk, posedge reset) begin
        if (reset) begin
            q <= zero;
        end else begin
            case (q)
                zero: q <= one;
                one: q <= three;
                three: q <= zero;
                two: q <= zero;
            endcase
        end
    end

endmodule
