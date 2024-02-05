`ifndef _2x2_SYSTOLIC_ARRAY
`define _2x2_SYSTOLIC_ARRAY

`include "src/PE.v"

/*
    in0 * in1 =
    -       -   -       -
   |  00 01  | |  00 01  |
   |  10 11  | |  10 11  |
    -       -   -       -

    systolic array:

    00 01
    10 11
*/

// 2x2 Matrix Multiplication
module S_Array2x2 (
    output [31:0] out_00, out_01, out_10, out_11,
    input [15:0] in_00_N, in_00_W, in_10_W, in_01_N,
    input reset, clk
);
    wire [15:0] out_01_E, out_10_S, out_11_E, out_11_S;
    wire [15:0] inter_00_01, inter_00_10, inter_01_11, inter_10_11;

    P_Element PE00 ( 
        .out(out_00), 
        .out_S(inter_00_10), 
        .out_E(inter_00_01), 
        .in_N(in_00_N), 
        .in_W(in_00_W), 
        .clk(clk), 
        .reset(reset)
    );
    P_Element PE01 ( 
        .out(out_01), 
        .out_S(inter_01_11), 
        .out_E(out_01_E), 
        .in_N(in_01_N), 
        .in_W(inter_00_01), 
        .clk(clk), 
        .reset(reset)
    );
    P_Element PE10 ( 
        .out(out_10), 
        .out_S(out_10_S), 
        .out_E(inter_10_11), 
        .in_N(inter_00_10), 
        .in_W(in_10_W), 
        .clk(clk), 
        .reset(reset)
    );
    P_Element PE11 ( 
        .out(out_11), 
        .out_S(out_11_S), 
        .out_E(out_11_E), 
        .in_N(inter_01_11), 
        .in_W(inter_10_11), 
        .clk(clk), 
        .reset(reset)
    );
    

endmodule

`endif
