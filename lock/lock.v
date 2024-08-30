module lock(
    input wire reset,
    input wire [3:0] numbers,
    input wire try,
    output reg open,
	 output reg [1:0] counter_val
);

	 reg [3:0] counter [3:0];

    always@(posedge reset, posedge try) begin
        if (reset) begin
            open = 1'h0;
            counter[0] = 4'h0;
            counter[1] = 4'h0;
            counter[2] = 4'h0;
            counter[3] = 4'h0;
			counter_val = 2'h0;
        end else
		  if (try) begin 
		      counter[0] = counter[0] + numbers[0];
				counter[1] = counter[1] + numbers[1];
				counter[2] = counter[2] + numbers[2];
				counter[3] = counter[3] + numbers[3];
				
				open = counter[0] == 4'h1 && counter[1] == 4'h2 
				    && counter[2] == 4'h3 && counter[3] == 4'h4;
					 
				case (numbers)
					'b0001: counter_val = counter[0];
					'b0010: counter_val = counter[1];
					'b0100: counter_val = counter[2];
					'b1000: counter_val = counter[3];
				endcase
		  end
    end

endmodule
