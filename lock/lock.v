module lock(
    input wire reset,
    input wire [3:0] numbers,
    input wire try,
    output reg open
);

    reg [3:0] counters [3:0];

    always@(posedge reset) begin
        open <= 0;
        counters[0] <= 0;
        counters[1] <= 0;
        counters[2] <= 0;
        counters[3] <= 0;
    end

    always@(posedge numbers[0]) begin
        counters[0] <= counters[0] + 1;
    end

    always@(posedge numbers[1]) begin
        counters[1] <= counters[1] + 1;
    end

    always@(posedge numbers[2]) begin
        counters[2] <= counters[2] + 1;
    end

    always@(posedge numbers[3]) begin
        counters[3] <= counters[3] + 1;
    end

    always@(posedge try) begin
        if (counters[0] == 4'h1 && counters[1] == 4'h2 
            && counters[2] == 4'h3 &&counters[3] == 4'h4) begin
            open <= 1;
        end else begin
            open <= 0;
        end
    end

endmodule
