`ifndef _WALLACE_TREE_MULTIPLIER
`define _WALLACE_TREE_MULTIPLIER

`include "src/CLA.v"
`include "src/CSA.v"

// 4x4 multiplier, product at most 8 bits  
module WT_Multiplier4x4 (
    output [7:0] Product,
    input [3:0] A, B
);
    wire [7:0] ppdt0, ppdt1, ppdt2, ppdt3;

    assign ppdt0 = {4'b0, A & {4{B[0]}}};
    assign ppdt1 = {3'b0, A & {4{B[1]}}, 1'b0};
    assign ppdt2 = {2'b0, A & {4{B[2]}}, 2'b0};
    assign ppdt3 = {1'b0, A & {4{B[3]}}, 3'b0};

    /* First Round - CSA */

    wire [7:0] S0, C0;

    CSA_Adder8 A0 (
        .Cout(C0), .Sum(S0), 
        .A(ppdt0), .B(ppdt1), .C(ppdt2)
    );

    /* Second Round - CSA */

    wire [7:0] S1, C1;

    CSA_Adder8 A1 (
        .Cout(C1), .Sum(S1), 
        .A({C0[6:0], 1'b0}), .B(S0), .C(ppdt3)
    );

    /* Third Round - CLA */

    CLA_Adder8 A2 (
        .Cout(), .Sum(Product),
        .A({C1[6:0], 1'b0}), .B(S1), .Cin(1'b0)
    );

endmodule

module WT_Multiplier16x16 (
    output [31:0] Product,
    input [15:0] A, B
);

    /* partial products */
	wire [31:0] pdt0, pdt1, pdt2, pdt3, pdt4, pdt5, pdt6, pdt7, 
		pdt8, pdt9, pdt10, pdt11, pdt12, pdt13, pdt14, pdt15;

	assign pdt0 = {16'b0, A & {16{B[0]}}	  };
	assign pdt1 = {15'b0, A & {16{B[1]}}, 1'b0};
	assign pdt2 = {14'b0, A & {16{B[2]}}, 2'b0};
	assign pdt3 = {13'b0, A & {16{B[3]}}, 3'b0};
	assign pdt4 = {12'b0, A & {16{B[4]}}, 4'b0};
	assign pdt5 = {11'b0, A & {16{B[5]}}, 5'b0};
	assign pdt6 = {10'b0, A & {16{B[6]}}, 6'b0};
	assign pdt7 = {9'b0, A & {16{B[7]}}, 7'b0};
	assign pdt8 = {8'b0, A & {16{B[8]}}, 8'b0};
	assign pdt9 = {7'b0, A & {16{B[9]}}, 9'b0};
	assign pdt10 = {6'b0, A & {16{B[10]}}, 10'b0};
	assign pdt11 = {5'b0, A & {16{B[11]}}, 11'b0};
	assign pdt12 = {4'b0, A & {16{B[12]}}, 12'b0};
	assign pdt13 = {3'b0, A & {16{B[13]}}, 13'b0};
	assign pdt14 = {2'b0, A & {16{B[14]}}, 14'b0};
	assign pdt15 = {1'b0, A & {16{B[15]}}, 15'b0};
	
	wire [31:0] C0_0, C0_1, C0_2, C0_3, C0_4, C0_5, C0_6, C0_7, C0_8, C0_9;
	wire [31:0] S0_0, S0_1, S0_2, S0_3, S0_4, S0_5, S0_6, S0_7, S0_8, S0_9;

	CSA_Adder32 ADD0_0(C0_0, S0_0, pdt0, pdt1, pdt2);
	CSA_Adder32 ADD0_1(C0_1, S0_1, pdt3, pdt4, pdt5);
	CSA_Adder32 ADD0_2(C0_2, S0_2, pdt6, pdt7, pdt8);
	CSA_Adder32 ADD0_3(C0_3, S0_3, pdt9, pdt10, pdt11);
	CSA_Adder32 ADD0_4(C0_4, S0_4, pdt12, pdt13, pdt14);

/* ROUND 1 */
	wire [31:0] C1_0, C1_1, C1_2;
	wire [31:0] S1_0, S1_1, S1_2;

	CSA_Adder32 ADD1_0(C1_0, S1_0, C0_0, C0_1, C0_2);
	CSA_Adder32 ADD1_1(C1_1, S1_1, S0_0, S0_1, S0_2);
	CSA_Adder32 ADD1_2(C1_2, S1_2, pdt15, C0_3, C0_4);

/* ROUND 2 */
	wire [31:0] C2_0, C2_1;
	wire [31:0] S2_0, S2_1;

	CSA_Adder32 ADD2_0(C2_0, S2_0, C1_0, C1_1, C1_2);
	CSA_Adder32 ADD2_1(C2_1, S2_1, S1_0, S1_1, S1_2);

/* ROUND 3 */
	wire [31:0] C3_0;
	wire [31:0] S3_0;

	CSA_Adder32 ADD3_0(C3_0, S3_0, C2_0, C2_1, S2_0);

/* ROUND 4 */
	wire [31:0] C4_0;
	wire [31:0] S4_0;

	CSA_Adder32 ADD4_0(C4_0, S4_0, S2_1, C3_0, S3_0);

	CLA_Adder32 ADD(.Cout(), .Sum(Product), .A(C4_0), .B(S4_0), .Cin(1'b0));


endmodule

`endif 
