#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
#include <time.h>
#include "include/gen.h"

// CSA_Adder32 ADD1_0(C1_0, S1_0, pdt0, pdt1, pdt2);

int main(int args, char *argv[])
{

    const int productWidth = atoi(argv[1]);
    int remain;
    int round = 0;

    int pdtCnt, pdtStart;
    int nextC = productWidth / 2 / 3, curC, prevC = 0, CStart;
    int nextS = productWidth / 2 / 3, curS, prevS = 0, SStart;

    int farprevC = 0, farCStart;
    int farprevS = 0, farSStart;
    printModule(productWidth);
    generatePDT(productWidth);
    /* First Round */
    remain = productWidth;
    generateWire(0, productWidth / 3, productWidth);
    pdtCnt = eliminatePdt(productWidth, remain / 2);
    remain = pdtCnt + nextC + nextS;
    pdtStart = productWidth / 2 - pdtCnt;

    /* # Round */
    while (remain > 2)
    {
        round++;
        printf("/* ROUND %d */\n", round);
        curC = nextC / 3, prevC = nextC % 3;
        curS = nextS / 3, prevS = nextS % 3;
        int left = pdtCnt + prevC + prevS + farprevC + farprevS;
        int number = 0;
        generateWire(round, (curC + curS + left / 3), productWidth);
        for (int i = 0; i < curC; i++)
        {
            char in1[20], in2[20], in3[20];
            sprintf(in1, "C%d_%d", round - 1, 3 * i);
            sprintf(in2, "C%d_%d", round - 1, 3 * i + 1);
            sprintf(in3, "C%d_%d", round - 1, 3 * i + 2);
            printVerilog(productWidth, round, number, in1, in2, in3);
            number++;
            CStart += 3;
        }
        for (int i = 0; i < curS; i++)
        {
            char in1[20], in2[20], in3[20];
            sprintf(in1, "S%d_%d", round - 1, 3 * i);
            sprintf(in2, "S%d_%d", round - 1, 3 * i + 1);
            sprintf(in3, "S%d_%d", round - 1, 3 * i + 2);
            printVerilog(productWidth, round, number, in1, in2, in3);
            number++;
            SStart += 3;
        }
        int get3 = 0;
        char in[3][20];
        while (get3 + left >= 3)
        {
            if (pdtCnt > 0)
            {
                sprintf(in[get3++], "pdt%d", pdtStart);
                pdtStart++;
                pdtCnt--;
            }
            else if (farprevC > 0)
            {
                sprintf(in[get3++], "C%d_%d", round - 2, farCStart);
                farCStart++;
                farprevC--;
            }
            else if (farprevS > 0)
            {
                sprintf(in[get3++], "S%d_%d", round - 2, farSStart);
                farSStart++;
                farprevS--;
            }
            else if (prevC > 0)
            {
                sprintf(in[get3++], "C%d_%d", round - 1, CStart);
                CStart++;
                prevC--;
            }
            else if (prevS > 0)
            {
                sprintf(in[get3++], "S%d_%d", round - 1, SStart);
                SStart++;
                prevS--;
            }
            else
            {
                break;
            }
            if (get3 == 3)
            {
                printVerilog(productWidth, round, number, in[0], in[1], in[2]);
                number++;
                get3 = 0;
            }
            left--;
        }
        farprevC = prevC, farCStart = CStart;
        farprevS = prevS, farSStart = SStart;
        CStart = 0, SStart = 0;
        remain = farprevC + farprevS + (number << 1) + pdtCnt;
        nextC = number;
        nextS = number;
        printf("\n");
    }
    printf("endmodule\n");
}
