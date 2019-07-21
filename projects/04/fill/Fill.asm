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

@R0
M=0

(KEYMONITOR)
	@KBD
	D=M
	@FILL
	D;JNE
	@KEYMONITOR
	0;JMP
(FILL)
	@R0		
	D=M		// D = R0
	@4096
	D=D-A	// D = R0 - 1
	@END
	D;JGE	// If (R0 - 4096) > 0 goto end
	@R0 	// load current screen offset
	D=M		// store offset to D 
	@SCREEN
	A=A+D	// set A to currenet pixel
	M=0  	
	M=!M 	// turn pixel on
	@R0		// increment offset
	M=M+1
	@FILL
	0;JMP
(END)
	@END
	0;JMP