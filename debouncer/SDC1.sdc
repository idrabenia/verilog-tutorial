create_clock -period 20 [get_ports clk]
set_input_delay -clock clk -max 3 [all_inputs]
set_output_delay -clock clk -max 3 [all_outputs]