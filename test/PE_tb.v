`include "src/PE.v"

module tb;
    reg [15:0] in_N, in_W;
    reg clk, reset;
    wire [31:0] out;
    wire [15:0] out_S, out_E;

    P_Element PE(
        out, out_S, out_E,
        in_N, in_W, clk, reset
    );

    initial begin
        $dumpfile("PE.vcd");
        $dumpvars(0, tb);
        $monitor(
            "[%2g] [N %2d] [W %2d] [S %2d] [E %2d] [O %2d]",
            $time, in_N, in_W, out_S, out_E, out
        );
        reset = 1'b0;
        clk = 0; 
        #1 reset = 1'b1;
		#1
            in_N = 16'd1; in_W = 16'd2;
            reset = 1'b0;
        clk = 1; #1
        clk = 0; #1
            in_N = 16'd3; in_W = 16'd4;
        clk = 1; #1
            reset = 1'b0;
        clk = 0; #1
            in_N = 16'd5; in_W = 16'd6;
        clk = 1; #1
        clk = 0; #1
        clk = 1; #1
        clk = 0; #1
        #10 $finish;
    end
    
    
endmodule