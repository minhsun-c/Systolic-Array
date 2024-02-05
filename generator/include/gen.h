#ifndef _GENERATE_VERILOG_H
#define _GENERATE_VERILOG_H

void printVerilog(int width, int round, int number, char *in1, char *in2, char *in3);
void generateWire(int round, int total, int width);
int eliminatePdt(int width, int count);
void generatePDT(int width);
void printModule(int productWidth);

#endif