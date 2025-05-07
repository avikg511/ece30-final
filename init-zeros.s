main:
LDA X0, a // loading the address of an array
ADDI X1, XZR, #4 // loading the count
BL InitZeros // calling init zeros
STOP

InitZeros: // X0 address of the array, X1 is the count value d
ADDI X9, XZR, #0 // initiating i

loop:
STUR XZR, [X0, #0] // storing 0 into the array
ADDI X0, X0, #8 // incrementing array
ADDI X9, X9, #1 // incrementing count
CMP X1, X9 // comparing the count and d
B.LT loop // branching is less than or equal to 
BR LR // exiting loop
