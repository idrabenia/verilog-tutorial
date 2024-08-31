module test;
    
    reg [3:0] a = 'b0000;
    reg [3:0] b = 'b0000;

    initial begin
        $dumpfile("greater_than_4_test.vcd");
        $dumpvars(0, test);

        #5 a = 'b0000; b = 'b0000;
        #10 a = 'b0000; b = 'b0001;
        #15 a = 'b0100; b = 'b0110;
        #20 a = 'b0100; b = 'b0100;
        #25 a = 'b0100; b = 'b0011;
        #30 a = 'b0011; b = 'b0100;
        #35 a = 'b1011; b = 'b1100;
        #40 a = 'b1111; b = 'b1010;
        
        #90 $stop;
    end

    wire out;
    greater_than_4 comp(a, b, out);

    initial begin
        $monitor("Time: %0d, A: %b, B: %b, Out: %b", $time, a, b, out);
    end

endmodule