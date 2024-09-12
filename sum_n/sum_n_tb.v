
module test;
    
    reg reset = 0;
    reg [7:0] n = 0;

    initial begin
        $dumpfile("sum_n_test.vcd");
        $dumpvars(0, test);

        #1 reset = 0;
        #1 reset = 1;
        #1 reset = 0;

        #10 n = 10;
        #200 n = 4;
        #200 n = 100;

        #1200 $stop;
    end

    reg clk = 0;
    always begin 
        #5 clk = !clk;
    end

    wire [15:0] out;
    wire completed;
    sum_n #(8) summator(clk, reset, n, out, completed);

    initial begin
        $monitor("Time: %0d, N: %d, Out: %d, Completed: %h", $time, n, out, completed);
    end

endmodule
