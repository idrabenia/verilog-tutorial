
module debouncer
#(
    parameter WIDTH = 19
)
(
    input wire clk,
    input wire reset,
    input wire btn,
    output wire out
);

    reg [WIDTH:0] timeout_counter;
    wire [WIDTH:0] timeout_counter_next;
    wire timeout;

    always@(posedge clk, posedge reset) begin
        if (reset) begin
            timeout_counter <= 0;
        end else begin
            timeout_counter <= timeout_counter_next;
        end
    end

    assign timeout_counter_next = timeout_counter + 1;
    assign timeout = (timeout_counter == 0) ? 1'b1 : 1'b0;

    localparam zero = 3'b000;
    localparam wait_1_start = 3'b001;
    localparam wait_1 = 3'b010;
    localparam one = 3'b011;
    localparam wait_0_start = 3'b100;
    localparam wait_0 = 3'b101;

    reg [2:0] state;
    reg [2:0] state_next;
    reg out_val;

    always@(posedge clk, posedge reset) begin
        if (reset) begin
            state <= 3'b000;
        end else begin
            state <= state_next;
        end
    end

    always@* begin
        state_next = state;
        out_val = 1'b0;

        case (state)
            zero: begin
                if (btn) begin
                    state_next = wait_1_start;
                end
            end
            wait_1_start: begin
                out_val = 1'b1;

                if (timeout) begin
                    state_next = wait_1;
                end
            end
            wait_1: begin
                out_val = 1'b1;

                if (timeout) begin
                    if (btn) begin
                        state_next = one;
                    end else begin
                        state_next = wait_0_start;
                    end
                end
            end
            one: begin
                out_val = 1'b1;

                if (!btn) begin
                    state_next = wait_0_start;
                end 
            end
            wait_0_start: begin
                if (timeout) begin
                    state_next = wait_0;
                end
            end
            wait_0: begin
                if (timeout) begin
                    if (btn) begin
                        state_next = wait_1_start;
                    end else begin
                        state_next = zero;
                    end
                end
            end
            default: begin
                state_next = zero;
                out_val = 1'b0;
            end
        endcase
    end

    assign out = out_val;

endmodule
