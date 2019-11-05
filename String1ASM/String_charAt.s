/* ----------------------------------------------------
	Subroutine String_charAt accepts a number (index)
	and finds the character to output. If impossible,
	returns 0.
	
		R1: Has string to take character from
		R2: Index
		LR: Contains the return address
		
	Returned register contents:
		R0: The character.
		
	All registers are preserved as per AAPCS.
	--------------------------------------------------- */
	
	.global String_charAt
	.extern malloc
	
String_charAt:
	push {r1-r11, lr}
	
	mov r0, #2
	push {r1-r11}
	bl malloc
	pop {r1-r11}
	
	ldrb r4, [r1, r2]				@ Load from index
	strb r4, [r0]					@ Store the byte
	
end:
	mov r4, #0
	strb r4, [r0, #2]
	pop {r1-r11, lr}
	bx lr
