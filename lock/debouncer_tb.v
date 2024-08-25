module test;
    reg reset = 0;
    reg clk = 0;
    reg in = 0;

    initial begin
        $dumpfile("lock_debouncer.vcd");
        $dumpvars(0, test);

        #1 reset = 1;
        #2 reset = 0;

        #3 in = 1;
        #4 in = 0;
        #5 in = 1;
        #15 in = 1;

        #35 in = 0;
        
        #120 $finish;
    end

    always begin
        #5 clk = !clk;
    end

    wire q;
    debouncer d(reset, clk, in, q);
    defparam d.DIVIDER = 1;

    initial begin
        $monitor("Time: %0d, In: %h, Clk: %d, Q: %h", $time, in, clk, q);
    end
endmodule
