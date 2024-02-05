`include "src/CLA.v"

module tb;
    reg [31:0] A, B;
    reg Cin;
    wire [31:0] Sum;
    wire Cout;

    CLA_Adder32 ADD( 
        .Cout(Cout),
        .Sum(Sum),
        .A(A), 
        .B(B),
        .Cin(Cin)
    );

    initial begin
        $monitor(
            "[%2g] %20d + %20d + %1d = %1d * 2^32 + %20d",
            $time, A, B, Cin, Cout, Sum
        );
		#1 A=32'd1412430746; B=32'd439314084; Cin=1'd0;
		#1 A=32'd1412430746; B=32'd439314084; Cin=1'd1;
		#1 A=32'd503031402; B=32'd1953138822; Cin=1'd0;
		#1 A=32'd503031402; B=32'd1953138822; Cin=1'd1;
    end
    
    
endmodule