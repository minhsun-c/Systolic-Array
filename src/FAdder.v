`ifndef _FULL_ADDER
`define _FULL_ADDER

module FAdder (
    output Cout,
    output Sum,
    input A, B,
    input Cin
);
   assign Cout = (A & B) | (A & Cin) | (B & Cin);
   assign Sum = A ^ B ^ Cin;
endmodule

`endif 