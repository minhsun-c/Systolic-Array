`ifndef _PROCESSING_ELEMENT
`define _PROCESSING_ELEMENT

`include "src/Wallace.v"
`include "src/CLA.v"


module P_Element (
    output reg [31:0] out,
    output [15:0] out_S, out_E,
    input [15:0] in_N, in_W,
    input clk, reset
);
    wire [31:0] multiply_rst;
    wire [31:0] temp_out;

    reg [15:0] rin_N, rin_W;

    WT_Multiplier16x16 MUL(multiply_rst, rin_N, rin_W);
    CLA_Adder32 ADD( , temp_out, out, multiply_rst, 1'b0);
    assign out_E = rin_W;
    assign out_S = rin_N;
    
    always @(posedge clk) begin
        rin_N <= in_N;
        rin_W <= in_W;
        out <= temp_out;
    end
    always @(posedge reset) begin
        out = 32'b0;
        rin_N = 16'b0;
        rin_W = 16'b0;
    end
    
endmodule

`endif