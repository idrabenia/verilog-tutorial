module test;
    
    reg [3:0] duty = 12'b1000;
    reg reset = 1'b0;

    initial begin
        $dumpfile("pwm_test.vcd");
        $dumpvars(0, test);

        #1 reset = 1'b1;
        #2 reset = 1'b0;

        #110 duty = 4'b1011;
        #220 duty = 4'b0011;
        
        #330 $stop;
    end

    reg clk = 0;
    always #1 clk = !clk;

    wire out;
    pwm pwm_block(duty, clk, reset, out);

    initial begin
        $monitor("Time: %0d, Duty: %h, Out: %h", $time, duty, out);
    end

endmodule
