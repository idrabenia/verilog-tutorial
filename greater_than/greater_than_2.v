module greater_than_2(
    input wire [1:0] a,
    input wire [1:0] b,
    output wire result
);

// Table of truth
// a  b  result
// 00 00 0
// 00 01 1
// 00 10 1
// 00 11 1
// 01 00 0
// 01 01 0
// 01 10 1
// 01 11 1
// 10 00 0
// 10 01 0
// 10 10 0
// 10 11 1
// 11 00 0
// 11 01 0
// 11 10 0
// 11 11 0

    //assign result = (~a[1] & b[1]) 
    //    | (~a[0] & b[0] & b[1])
    //    | (~a[0] & ~a[1] & b[0]); 

    assign result = ~(
        ~(~a[1] & b[1]) & 
        ~(~a[0] & b[1] & b[0]) & 
        ~(~a[0] & ~a[1] & b[0])
    );


endmodule
