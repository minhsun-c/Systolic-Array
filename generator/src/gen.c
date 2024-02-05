#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
#include <time.h>
#include "../include/gen.h"

void printModule(int productWidth)
{
    printf("module WT_Multiplier%dx%d (\n", productWidth / 2, productWidth / 2);
    printf("\toutput [%d:0] Product,\n", productWidth - 1);
    printf("\tinput [%d:0] A, B\n);\n\n", productWidth / 2 - 1);
}

void printVerilog(int width, int round, int number, char *in1, char *in2, char *in3)
{
    printf(
        "\tCSA_Adder%d ADD%d_%d(C%d_%d, S%d_%d, %s, %s, %s);\n",
        width, round, number, round, number, round, number, in1, in2, in3);
}

void generateWire(int round, int total, int width)
{
    printf("\twire [%d:0] ", width - 1);
    for (int i = 0; i < total - 1; i++)
        printf("C%d_%d, ", round, i);
    printf("C%d_%d;\n", round, total - 1);
    printf("\twire [%d:0] ", width - 1);
    for (int i = 0; i < total - 1; i++)
        printf("S%d_%d, ", round, i);
    printf("S%d_%d;\n", round, total - 1);
    printf("\n");
}

int eliminatePdt(int width, int count)
{
    char in1[20], in2[20], in3[20];
    int round = count / 3;
    for (int i = 0; i < round; i++)
    {
        sprintf(in1, "pdt%d", 3 * i);
        sprintf(in2, "pdt%d", 3 * i + 1);
        sprintf(in3, "pdt%d", 3 * i + 2);
        printVerilog(width, 0, i, in1, in2, in3);
    }
    return count % 3;
}

void generatePDT(int width)
{
    printf("\twire [%d:0] pdt0", width - 1);
    for (int i = 1; i < width / 2; i++)
    {
        printf(", pdt%d", i);
    }
    printf(";\n\n");
    for (int i = 0; i < width / 2; i++)
    {
        if (i == 0)
        {
            printf(
                "\tassign pdt0 = {%d'b0, A & {16{B[0]}}	  };\n",
                width);
        }
        else
        {
            printf(
                "\tassign pdt%d = {%d'b0, A & {16{B[%d]}}, %d'b0};\n",
                i, width - i, i, i);
        }
    }
    printf("\n");
}