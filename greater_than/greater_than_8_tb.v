module test;
    
    reg [7:0] a = 'b0000;
    reg [7:0] b = 'b0000;

    initial begin
        $dumpfile("greater_than_8_test.vcd");
        $dumpvars(0, test);

        #5 a = 'h00; b = 'h00;
        #10 a = 'h01; b = 'h10;
        #15 a = 'h10; b = 'h10;
        #20 a = 'h75; b = 'h76;
        #25 a = 'h57; b = 'h67;
        #30 a = 'h88; b = 'h87;
        #35 a = 'hff; b = 'hff;
        #40 a = 'hfa; b = 'hfb;
        
        #90 $stop;
    end

    wire out;
    greater_than_8 comp(a, b, out);

    initial begin
        $monitor("Time: %0d, A: %b, B: %b, Out: %b", $time, a, b, out);
    end

endmodule