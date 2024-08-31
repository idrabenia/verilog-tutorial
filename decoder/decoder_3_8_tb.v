module test;
    
    reg [2:0] in = 'b000;

    initial begin
        $dumpfile("decoder_3_8_test.vcd");
        $dumpvars(0, test);

        #5 in = 'b001;
        #10 in = 'b010;
        #15 in = 'b011;
        #20 in = 'b100;
        #25 in = 'b101;
        #30 in = 'b110;
        #35 in = 'b111;

        #40 $stop;
    end

    wire [7:0] out;
    decoder_3_8 decoder(in, out);

    initial begin
        $monitor("Time: %0d, In: %b, Out: %b", $time, in, out);
    end

endmodule
