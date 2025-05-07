// Address          X1
// Count, d         X2
// Done flag        X9
	MOVZ	X1, 0x1000, LSL #0	// X1 = 0x1000
	ADDI	X2, XZR, #3

MAIN:
	ADD	X3, X2, XZR	// Now, \Delta X3 w/o \Delta inp
	ADD	X4, X1, XZR	// Now, X4 contains the address
//CBNZ	X3, INIT_ZEROS
	BL	INIT_ZEROS
	B	DONE

// INPUTS:          X3 -- Count
//                  X4 -- Address to start zeroing out
INIT_ZEROS:
	SUBI	SP, SP, #32
	STUR	X30, [SP, #8]
	B	for_loop

for_loop:
//STUR	XZR, [X4, #0]	// Store 0 into addr from X4
	ADDI	X4, X4, #8	// Assuming #8 bytes b4 next val
	SUBIS	X3, X3, #1
	B.GT	for_loop
	LDUR	X30, [SP, #8]
	BR	X30

DONE:	ADDI	X9, XZR, #1
