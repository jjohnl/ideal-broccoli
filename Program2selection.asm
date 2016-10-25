	.ORIG 	x3000
	
	LD	R0,ARR0		; R0 <--- ARR0
	LDR	R1,R0,#1	; R1 <--- ARR1
	LD	R4,N		; R4 <--- N (counter value)
SORT	ADD	R4,R4,#0
	BRz	END
	LDR	R2,R0,#0	; R2 <--- M[R0] holds "small" value
	LDR	R3,R1,#0	; R3 <--- M[R1]	holds "current" value

	NOT	R4,R3		; Comparison of R2 and R3 (small and current)
	ADD	R4,R4,#1
	ADD	R4,R4,R2
	BRnz	NGZRES		; if Small < Current we are good, so we move down ARR
	BRp	POSRES		; if Small > Current we are NOT good, so we swap and restart
	
NGZRES	ADD	R1,R1,#1	; Increment "current" to next ARR Value
	LD	R4,N		; Resets counter value
	BR	SORT		; Branch back to Sort Process

POSRES	STR	R2,R0,#0	; Swap "small" and "current" locations
	STR	R3,R0,#1
	ADD	R0,R0,#1	; Increment "Small"   location by 1 so new small is next ARR value
	ADD	R1,R1,#1	; Increment "current" location by 1
	ADD	R4,R4,#-1	; Decrement "counter" value by 1
	BR	SORT



	TRAP 	x25
ARR0	.FILL 	x2500
	.FILL	x250E
N	.FILL	14
