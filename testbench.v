`include "src/Systolic.v"

module tb;
    wire [31:0] out_00, out_01, out_10, out_11;
    reg reset, clk;
    reg [15:0] in_00_N, in_00_W, in_10_W, in_01_N;

    S_Array2x2 SA(
        out_00, out_01, out_10, out_11,
        in_00_N, in_00_W, in_10_W, in_01_N,
        reset, clk
    );

    initial begin
        $dumpfile("build/sys.vcd");
        $dumpvars(0, tb);
        $display(
            "[%03g] \n%02d %02d \n%02d %02d\n",
            $time, out_00, out_01, out_10, out_11
        );
        clk = 0;
        reset = 0;
        reset = 1;
        #5 reset = 0;
            in_00_N = 5; in_01_N = 0; in_00_W = 1; in_10_W = 0; 
        #5 clk = 1;

        #5 clk = 0; 
            in_00_N = 7; in_01_N = 6; in_00_W = 2; in_10_W = 3; 
        #5 clk = 1;
        
        #5 clk = 0; 
            in_00_N = 0; in_01_N = 8; in_00_W = 0; in_10_W = 4; 
        #5 clk = 1;
        #5 clk = 0; 
            in_00_N = 0; in_01_N = 0; in_00_W = 0; in_10_W = 0; 
        #5 clk = 1;
        #5 clk = 0; 
            in_00_N = 0; in_01_N = 0; in_00_W = 0; in_10_W = 0; 
        #5 clk = 1;
        #5 clk = 0; 
            in_00_N = 0; in_01_N = 0; in_00_W = 0; in_10_W = 0; 
        #5 clk = 1;
        #5 $finish;


    end
endmodule