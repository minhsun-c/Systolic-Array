`ifndef _CARRY_SAVE_ADDER
`define _CARRY_SAVE_ADDER

`include "src/FAdder.v"

module CSA_Adder8 (
    output [7:0] Cout,
    output [7:0] Sum,
    input [7:0] A, B, C
);
   FAdder F0 (.Cout(Cout[0]), .Sum(Sum[0]), .A(A[0]), .B(B[0]), .Cin(C[0]));
   FAdder F1 (.Cout(Cout[1]), .Sum(Sum[1]), .A(A[1]), .B(B[1]), .Cin(C[1]));
   FAdder F2 (.Cout(Cout[2]), .Sum(Sum[2]), .A(A[2]), .B(B[2]), .Cin(C[2]));
   FAdder F3 (.Cout(Cout[3]), .Sum(Sum[3]), .A(A[3]), .B(B[3]), .Cin(C[3]));
   FAdder F4 (.Cout(Cout[4]), .Sum(Sum[4]), .A(A[4]), .B(B[4]), .Cin(C[4]));
   FAdder F5 (.Cout(Cout[5]), .Sum(Sum[5]), .A(A[5]), .B(B[5]), .Cin(C[5]));
   FAdder F6 (.Cout(Cout[6]), .Sum(Sum[6]), .A(A[6]), .B(B[6]), .Cin(C[6]));
   FAdder F7 (.Cout(Cout[7]), .Sum(Sum[7]), .A(A[7]), .B(B[7]), .Cin(C[7]));
endmodule

module CSA_Adder32 (
    output [31:0] Cout,
    output [31:0] Sum,
    input [31:0] A, B, C
);
    assign Cout[0] = 1'b0;
	FAdder F0 (.Cout(Cout[1]), .Sum(Sum[0]), .A(A[0]), .B(B[0]), .Cin(C[0]));
	FAdder F1 (.Cout(Cout[2]), .Sum(Sum[1]), .A(A[1]), .B(B[1]), .Cin(C[1]));
	FAdder F2 (.Cout(Cout[3]), .Sum(Sum[2]), .A(A[2]), .B(B[2]), .Cin(C[2]));
	FAdder F3 (.Cout(Cout[4]), .Sum(Sum[3]), .A(A[3]), .B(B[3]), .Cin(C[3]));
	FAdder F4 (.Cout(Cout[5]), .Sum(Sum[4]), .A(A[4]), .B(B[4]), .Cin(C[4]));
	FAdder F5 (.Cout(Cout[6]), .Sum(Sum[5]), .A(A[5]), .B(B[5]), .Cin(C[5]));
	FAdder F6 (.Cout(Cout[7]), .Sum(Sum[6]), .A(A[6]), .B(B[6]), .Cin(C[6]));
	FAdder F7 (.Cout(Cout[8]), .Sum(Sum[7]), .A(A[7]), .B(B[7]), .Cin(C[7]));
	FAdder F8 (.Cout(Cout[9]), .Sum(Sum[8]), .A(A[8]), .B(B[8]), .Cin(C[8]));
	FAdder F9 (.Cout(Cout[10]), .Sum(Sum[9]), .A(A[9]), .B(B[9]), .Cin(C[9]));
	FAdder F10 (.Cout(Cout[11]), .Sum(Sum[10]), .A(A[10]), .B(B[10]), .Cin(C[10]));
	FAdder F11 (.Cout(Cout[12]), .Sum(Sum[11]), .A(A[11]), .B(B[11]), .Cin(C[11]));
	FAdder F12 (.Cout(Cout[13]), .Sum(Sum[12]), .A(A[12]), .B(B[12]), .Cin(C[12]));
	FAdder F13 (.Cout(Cout[14]), .Sum(Sum[13]), .A(A[13]), .B(B[13]), .Cin(C[13]));
	FAdder F14 (.Cout(Cout[15]), .Sum(Sum[14]), .A(A[14]), .B(B[14]), .Cin(C[14]));
	FAdder F15 (.Cout(Cout[16]), .Sum(Sum[15]), .A(A[15]), .B(B[15]), .Cin(C[15]));
	FAdder F16 (.Cout(Cout[17]), .Sum(Sum[16]), .A(A[16]), .B(B[16]), .Cin(C[16]));
	FAdder F17 (.Cout(Cout[18]), .Sum(Sum[17]), .A(A[17]), .B(B[17]), .Cin(C[17]));
	FAdder F18 (.Cout(Cout[19]), .Sum(Sum[18]), .A(A[18]), .B(B[18]), .Cin(C[18]));
	FAdder F19 (.Cout(Cout[20]), .Sum(Sum[19]), .A(A[19]), .B(B[19]), .Cin(C[19]));
	FAdder F20 (.Cout(Cout[21]), .Sum(Sum[20]), .A(A[20]), .B(B[20]), .Cin(C[20]));
	FAdder F21 (.Cout(Cout[22]), .Sum(Sum[21]), .A(A[21]), .B(B[21]), .Cin(C[21]));
	FAdder F22 (.Cout(Cout[23]), .Sum(Sum[22]), .A(A[22]), .B(B[22]), .Cin(C[22]));
	FAdder F23 (.Cout(Cout[24]), .Sum(Sum[23]), .A(A[23]), .B(B[23]), .Cin(C[23]));
	FAdder F24 (.Cout(Cout[25]), .Sum(Sum[24]), .A(A[24]), .B(B[24]), .Cin(C[24]));
	FAdder F25 (.Cout(Cout[26]), .Sum(Sum[25]), .A(A[25]), .B(B[25]), .Cin(C[25]));
	FAdder F26 (.Cout(Cout[27]), .Sum(Sum[26]), .A(A[26]), .B(B[26]), .Cin(C[26]));
	FAdder F27 (.Cout(Cout[28]), .Sum(Sum[27]), .A(A[27]), .B(B[27]), .Cin(C[27]));
	FAdder F28 (.Cout(Cout[29]), .Sum(Sum[28]), .A(A[28]), .B(B[28]), .Cin(C[28]));
	FAdder F29 (.Cout(Cout[30]), .Sum(Sum[29]), .A(A[29]), .B(B[29]), .Cin(C[29]));
	FAdder F30 (.Cout(Cout[31]), .Sum(Sum[30]), .A(A[30]), .B(B[30]), .Cin(C[30]));
	FAdder F31 (.Cout(), .Sum(Sum[31]), .A(A[31]), .B(B[31]), .Cin(C[31]));
endmodule

`endif 