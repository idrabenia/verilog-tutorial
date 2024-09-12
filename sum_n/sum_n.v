
module sum_n
#(
    parameter WIDTH = 4
)
(
    input wire clk,
    input wire reset,
    input wire [WIDTH - 1:0] n,
    output wire [2 * WIDTH - 1:0] result,
    output wire completed
);

    reg [2 * WIDTH - 1:0] sum_reg, sum_next, result_reg;
    reg [WIDTH - 1:0] i_reg, i_next;
    reg [1:0] state_reg, state_next;
    reg completed_reg;

    localparam idle = 2'b00, 
        run = 2'b01, 
        finish = 2'b10;

    always@(posedge clk, posedge reset) begin
        if (reset) begin
            state_reg <= idle;
            i_reg <= 0;
            sum_reg <= 0;
        end else begin
            state_reg <= state_next;
            i_reg <= i_next;
            sum_reg <= sum_next;
        end
    end

    always@* begin
        state_next = state_reg;
        i_next = i_reg;
        sum_next = sum_reg;
        completed_reg = 1'b0; 
        result_reg = 0;

        case (state_reg)
            idle: begin
                i_next = n;
                sum_next = 0;
                state_next = run;
            end
            run: begin
                if (i_reg > 0) begin
                    i_next = i_reg - 1;
                    sum_next = sum_reg + i_reg;
                end else begin
                    state_next = finish;
                end
            end
            finish: begin
                result_reg = sum_reg;
                completed_reg = 1'b1;
                state_next = idle;
            end
        endcase
    end

    assign result = result_reg;
    assign completed = completed_reg;

endmodule
