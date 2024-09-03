module test;
    
    reg [11:0] a = 12'h000;
    reg carry_in = 'h0;

    initial begin
        $dumpfile("bcd_inc_test.vcd");
        $dumpvars(0, test);

        #5 carry_in = 'h0; a = 'h001;
        #10 carry_in = 'h0; a = 'h009;
        #15 carry_in = 'h0; a = 'h099;
        #20 carry_in = 'h0; a = 'h999;
        #25 carry_in = 'h1; a = 'h099;
        #30 carry_in = 'h1; a = 'h999;
        #35 carry_in = 'h0; a = 'h111;
        #40 carry_in = 'h1; a = 'h889;
        
        #90 $stop;
    end

    wire [11:0] out;
    wire carry_out;
    bcd_inc incr(a, carry_in, out, carry_out);

    initial begin
        $monitor("Time: %0d, a: %h, c_in: %h, out: %h, c_out: %h", 
            $time, a, carry_in, out, carry_out);
    end

endmodule
