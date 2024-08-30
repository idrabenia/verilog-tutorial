module test;
    
    reg [1:0] in = 'b00;

    initial begin
        $dumpfile("decode_2_4_test.vcd");
        $dumpvars(0, test);

        #5 in = 'b00;
        #10 in = 'b01;
        #15 in = 'b10;
        #20 in = 'b11;
        #25 in = 'b00;

        #30 $stop;
    end

    wire [3:0] out;
    decoder_2_4 decoder(in, out);

    initial begin
        $monitor("Time: %0d, In: %b, Out: %b", $time, in, out);
    end

endmodule