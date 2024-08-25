module test;
    reg reset = 0;
    reg [3:0] numbers = 4'b0;
    reg try = 0;
    reg clk = 0;

    initial begin
        $dumpfile("lock_top_test.vcd");
        $dumpvars(0,test);

        #5 reset = 1;
        #10 reset = 0;

        #15 numbers[0] = 1;
        #20 numbers[0] = 0;

        #25 numbers[1] = 1;
        #30 numbers[1] = 0;
        #35 numbers[1] = 1;
        #40 numbers[1] = 0;

        #45 numbers[2] = 1;
        #50 numbers[2] = 0;
        #55 numbers[2] = 1;
        #60 numbers[2] = 0;
        #65 numbers[2] = 1;
        #70 numbers[2] = 0;

        #73 try = 1;
        #74 try = 0;

        #75 numbers[3] = 1;
        #80 numbers[3] = 0;
        #85 numbers[3] = 1;
        #90 numbers[3] = 0;
        #95 numbers[3] = 1;
        #100 numbers[3] = 0;
        #105 numbers[3] = 1;
        #110 numbers[3] = 0;

        #115 try = 1;
        
        #120 $stop;
    end

    always begin
        #2 clk = !clk;
    end

    wire open;
    lock_top c(reset, clk, numbers, try, open);

    initial begin
        $monitor("Time: %0d, Numbers: %h, Try: %h, Open: %d", 
            $time, numbers, try, open);
    end
endmodule
