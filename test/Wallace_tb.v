`include "src/Wallace.v"

module tb;
    reg [15:0] A, B;
    wire [31:0] C;
    wire Cout;

    WT_Multiplier16x16 W(
        C, A, B
    );

    initial begin
        $dumpfile("WT.vcd");
        $dumpvars(0, tb);
        $monitor(
            "  [%2g] %15d * %15d = %15d",
            $time, A, B, C
        );
		#1 A=16'd1024; B=16'd60;
		#1 A=16'd65535; B=16'd60;
        #1 A=16'd1000; B=16'd500;
        #10 $finish;
    end
    
    
endmodule