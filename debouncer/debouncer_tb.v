module test;
    
    reg reset = 0;
    reg btn = 0;

    initial begin
        $dumpfile("debouncer_test.vcd");
        $dumpvars(0, test);

        #1 reset = 0;
        #1 reset = 1;
        #1 reset = 0;

        #10 btn = 1;
        #1 btn = 0;
        #1 btn = 1;
        #1 btn = 0;
        #1 btn = 1;

        #20 btn = 0;
        #2 btn = 1;
        #2 btn = 0;
        #2 btn = 1;

        #20 btn = 0;
        #4 btn = 1;
        #4 btn = 0;
        #4 btn = 1;

        #140 btn = 0;
        #2 btn = 1;
        #2 btn = 0;
        #2 btn = 1;
        #2 btn = 0;

        #200 $stop;
    end

    reg clk = 0;
    always begin 
        #5 clk = !clk;
    end

    wire out;
    debouncer #(1) db(clk, reset, btn, out);

    initial begin
        $monitor("Time: %0d, Btn: %h, Out: %h", $time, btn, out);
    end

endmodule