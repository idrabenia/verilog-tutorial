module test;
    
    reg reset = 0;

    initial begin
        $dumpfile("test.vcd");
        $dumpvars(0,test);
        #5 reset = 0;
        #10 reset = 1;
        #15 reset = 0;
        #100 $stop;
    end

    reg clk = 0;
    always begin 
        #5 clk = !clk;
    end

    wire [1:0] q;
    counter_3 c(clk, reset, q);

    initial begin
        $monitor("Time: %0d, State: %h", $time, q);
    end

endmodule