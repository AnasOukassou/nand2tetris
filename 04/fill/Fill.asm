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

(KB_LISTEN)
    @24576
    D=M
    @FILLSCREEN_WHITE
    D;JEQ

(FILLSCREEN_BLACK)
    @row
    M=0
    @color
    M=-1
    @FILLSCREEN_LOOP
    0;JMP

(FILLSCREEN_WHITE)
    @row
    M=0
    @color
    M=0

(FILLSCREEN_LOOP)
    @row
    D=M
    @8192
    D=D-A
    @KB_LISTEN
    D;JGE
    @row
    D=M
    @SCREEN
    D=A+D
    @R0
    M=D
    @color
    D=M
    @R0
    A=M
    M=D
    @row
    M=M+1
    @FILLSCREEN_LOOP
    0;JMP
