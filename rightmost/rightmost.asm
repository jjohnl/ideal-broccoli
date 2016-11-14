; Find the rightmost bit that is set (1) in the binary representation of a given number N 
; When your program terminates, location Result should have the value 3 
;   (leftmost 1 in N:x0A18 is at location 3)

	.ORIG	x3000

	LD	R1, Counter	; initialize position counter
	LD	R2, Counter	; initialize left bit counter
	LD	R0, N
	BRn	LBi1
	BRp	LBi0
	BRz	Zero

	
LBi1	ADD	R1, R1, #-1
	BRz	Done
Loop	ADD	R0, R0, R0
	BRn	LBi1
	BRp	LBi0

LBi0	ADD	R1, R1, #-1
	BRz	Done
	ADD	R2, R2, #1
	BR	Loop
	
Done	BR	don
Zero	AND	R0, R0, R0
	ST	R0, Null
	BR	don

don	TRAP	x25
N	.FILL	x0A18
Counter .FILL	15
Result	.BLKW	1
Null	.BLKW	1
	.END