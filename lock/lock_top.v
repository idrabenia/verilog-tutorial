module lock_top(
    input wire reset,
    input wire clk,
    input wire [3:0] buttons,
    input wire try,
    output wire open
);

    parameter FREQ_DIVIDER = 1;

    wire [3:0] buttons_debounced;
    wire try_debounced;

    debouncer d1(reset, clk, buttons[0], buttons_debounced[0]);
    defparam d1.DIVIDER = FREQ_DIVIDER;

    debouncer d2(reset, clk, buttons[1], buttons_debounced[1]);
    defparam d2.DIVIDER = FREQ_DIVIDER;

    debouncer d3(reset, clk, buttons[2], buttons_debounced[2]);
    defparam d3.DIVIDER = FREQ_DIVIDER;

    debouncer d4(reset, clk, buttons[3], buttons_debounced[3]);
    defparam d4.DIVIDER = FREQ_DIVIDER;

    debouncer d_try(reset, clk, try, try_debounced);
    defparam d_try.DIVIDER = FREQ_DIVIDER;

    lock l(reset, buttons_debounced, try_debounced, open);

endmodule
