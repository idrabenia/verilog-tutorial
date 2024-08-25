module debouncer(
    input wire reset,
    input wire clk,
    input wire in,
    output reg q
);

    parameter DIVIDER = 10000000;

    reg clk_slow;
    reg [31:0] counter;

    always@(posedge reset) begin
        clk_slow <= 0;
    end

    always@(posedge clk) begin
        if (counter == DIVIDER) begin
            counter <= 0;
        end else begin
            counter <= counter + 1;
        end

        clk_slow <= !clk_slow;
    end

    always@(posedge clk_slow) begin
        if (in) begin
            q <= 1;
        end else begin
            q <= 0;
        end
    end

endmodule
