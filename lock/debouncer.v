module debouncer(
    input wire reset,
    input wire clk,
    input wire in,
    output reg q
);

    parameter DIVIDER = 15000000;

    reg [31:0] counter;

    always@(posedge clk, posedge reset) begin
        if (reset) begin
            counter <= 0;
		  end else if (counter == DIVIDER) begin
            counter <= 0;
				q <= in;
        end else begin
            counter <= counter + 1;
        end
    end

endmodule
