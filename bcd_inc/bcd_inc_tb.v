module test;
    
    reg [11:0] a = 12'h000;

    initial begin
        $dumpfile("bcd_inc_test.vcd");
        $dumpvars(0, test);

        #5 a = 'h001;
        #10 a = 'h009;
        #15 a = 'h099;
        #20 a = 'h999;
        #25 a = 'h099;
        #30 a = 'h999;
        #35 a = 'h111;
        #40 a = 'h889;
        
        #90 $stop;
    end

    wire [11:0] out;
    wire carry_out;
    bcd_inc incr(a, out, carry_out);

    initial begin
        $monitor("Time: %0d, a: %h, out: %h, c_out: %h", $time, a, out, carry_out);
    end

endmodule
