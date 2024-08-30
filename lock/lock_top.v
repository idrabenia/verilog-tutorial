module lock_top(
    input wire reset,
	 input wire clk,
    input wire [3:0] buttons,
    input wire try,
    output wire open_val,
	 output wire press,
	 output wire [1:0] counters_val
);

    wire [3:0] buttons_debounced;
    wire try_debounced;
	 wire [1:0] counters_val_inv;
	 
	 debouncer d0(!reset, clk, !buttons[0], buttons_debounced[0]);
	 debouncer d1(!reset, clk, !buttons[1], buttons_debounced[1]);
	 debouncer d2(!reset, clk, !buttons[2], buttons_debounced[2]);
	 debouncer d3(!reset, clk, !buttons[3], buttons_debounced[3]);
	 debouncer d_try(!reset, clk, !try, try_debounced);
	 
	 assign counters_val = ~counters_val_inv;
	 
	 assign press = !(buttons_debounced[0] | buttons_debounced[1] 
	  | buttons_debounced[2] | buttons_debounced[3]);
	  
    lock l(!reset, buttons_debounced, try_debounced, open_val, counters_val_inv);

endmodule
