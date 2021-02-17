// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

// 变量说明：R0 屏幕颜色，R1 屏幕当前指针位置，R2 屏幕剩余像素数量

(start)

@KBD
D=M

@setBlack
D;JNE // if key pressed goto black

@R0
M=0 // 默认屏幕为白色

@refreshScreen
0;JMP

(setBlack) // 设置为黑色
@R0
M=-1
@refreshScreen
0;JMP

(refreshScreen) // 刷新屏幕
@SCREEN // 设置屏幕初始位置
D=A
@R1
M=D

@8192 // 屏幕剩余像素数
D=A
@R2
M=D

(refreshLoop) // 屏幕刷新循环
@R0 // 获取屏幕颜色
D=M
@R1 // 开始设置颜色
A=M
M=D
@R2
D=M-1 // 屏幕剩余像素递减
@start
D;JEQ // 如果剩余刷新像素为0，则重新开始检测键盘
@R2
M=D
@R1 // 屏幕当前刷新像素递增
M=M+1
@refreshLoop
0;JMP