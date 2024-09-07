
module pwm(
    input wire [3:0] duty,
    input wire clk,
    input wire reset, 
    output wire signal
);

    reg [3:0] counter;
    reg [3:0] counter_next;
    reg signal_reg;
    reg signal_next;

    always@(posedge clk, posedge reset) begin
        if (reset) begin
            signal_reg <= 1'b1;
            counter <= 4'b0;
        end else begin
            signal_reg <= signal_next;
            counter <= counter_next;
        end
    end

    always@* begin
        counter_next = counter + 1;
        signal_next = (counter < duty) ? 1'b1 : 1'b0;
    end

    assign signal = signal_reg;

endmodule
