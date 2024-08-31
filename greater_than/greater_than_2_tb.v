module test;
    
    reg [1:0] a = 'b00;
    reg [1:0] b = 'b00;

    initial begin
        $dumpfile("greater_than_2_test.vcd");
        $dumpvars(0, test);

        #5 a = 'b00; b = 'b00;
        #10 a = 'b00; b = 'b01;
        #15 a = 'b00; b = 'b10;
        #20 a = 'b00; b = 'b11;

        #25 a = 'b10; b = 'b00;
        #30 a = 'b10; b = 'b01;
        #35 a = 'b10; b = 'b10;
        #40 a = 'b10; b = 'b11;

        #45 a = 'b01; b = 'b00;
        #50 a = 'b01; b = 'b01;
        #55 a = 'b01; b = 'b10;
        #60 a = 'b01; b = 'b11;

        #65 a = 'b11; b = 'b00;
        #70 a = 'b11; b = 'b01;
        #75 a = 'b11; b = 'b10;
        #80 a = 'b11; b = 'b11;
        
        #90 $stop;
    end

    wire out;
    greater_than_2 comp(a, b, out);

    initial begin
        $monitor("Time: %0d, A: %b, B: %b, Out: %b", $time, a, b, out);
    end

endmodule