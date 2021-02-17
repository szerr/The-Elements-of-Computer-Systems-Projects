// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.

@R2 // 初始化输出内存
M=0

(start)
@R1
D=M
@outPut
D;JEQ // if R1==0 goto outPut
@R1
M=D-1

@R0
D=M
@R2
M=D+M

@start
0;JMP

(outPut)