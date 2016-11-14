	.ORIG 	x3000
	
	AND	R0,R0,#0	; ARR0
	AND	R1,R1,#0	; ARR1
	AND	R2,R2,#0	; Small pointer
	AND	R3,R3,#0	; Loop pointer
	AND	R4,R4,#0	; Difference for compariosn
	AND	R5,R5,#0	; Small counter
	AND	R6,R6,#0	; Loop counter
	AND	R7,R7,#0

	LD	R0,ARR0		; R0 <--- ARR0
	LD	R1,ARR1		; R1 <--- ARR1
	LD	R5,N		; R4 <--- N (counter value for small)
	LD	R6,M		; R6 <--- M (counter value for current)

SORT	LDR	R2,R0,#0	; R2 <--- M[R0] holds "small" value
	LDR	R3,R1,#0	; R3 <--- M[R1]	holds "current" value

	NOT	R4,R3		; Comparison of R2 and R3 (small and current)
	ADD	R4,R4,#1
	ADD	R4,R4,R2
	BRnz	NGZRES		; if Small < Current we are good, so we move down ARR
	BRp	POSRES		; if Small > Current we are NOT good, so we swap and restart
	
<<<<<<< HEAD
NGZRES	BRz	ENDSRT		; CC check current
	ADD	R1,R1,#1	; Small < Current GOOD, increment current pointer to check next value
	ADD	R6,R6,#-1	; Decrement current counter
	BR	SORT
	
POSRES	STR	R3,R0,#0	; Swap small and Current location in Array
	STR	R2,R1,#0
	ADD	R0,R0,#1	; increment "small" pointer by 1 so new small is what we just swapped
	ADD	R1,R0,#1	; Reset "current" pointer to location 1 past small location
=======
NGZRES	ADD	R1,R1,#1	; Increment "current" to next ARR Value
	LD	R4,N		; Resets counter value
	BR	SORT		; Branch back to Sort Process

POSRES	STR	R2,R0,#0	; Swap "small" and "current" locations
	STR	R3,R0,#1
	ADD	R0,R0,#1	; Increment "Small"   location by 1 so new small is next ARR value
	ADD	R1,R1,#1	; Increment "current" location by 1
	ADD	R4,R4,#-1	; Decrement "counter" value by 1
>>>>>>> origin/master
	BR	SORT



	TRAP 	x25
ARR0	.FILL 	x2500
ARR1	.FILL	x2501
	.FILL	x250E
N	.FILL	14
<<<<<<< HEAD
M	.FILL	15
	.END
=======
>>>>>>> origin/master
