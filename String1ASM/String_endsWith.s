/* ----------------------------------------------------
	Subroutine String_endsWith checks whether a
	substring exists at the end of the original string.
	
		R1: Has original string
		R2: Substring from user to check
		R3:	Substring length.
		R4:	OG string length.
		LR: Contains the return address
		
	Returned register contents:
		R0: 1 for true, 0 for false
		
	All registers are preserved as per AAPCS.
	--------------------------------------------------- */
	
	.global String_endsWith
	
String_endsWith:
	push {r1-r11, lr}
	
	cmp r4, r3				@ Compare OG string length to substring length
	blt returnFalse
	
	sub r5, r4, r3			@ OG strlen - sub strlen (= beginIndex)
	
	mov r8, #-1
endsWithLoop:
	add  r8, #1
	ldrb r6, [r1, r5]			@ Load OG string from index in r5
	ldrb r7, [r2, r8]			@ Load substring from user
	
	cmp r6, r7
	bne returnFalse
	
	add r5, #1
	cmp r8, r4
	blt endsWithLoop
	
returnTrue:
	mov r0, #1
	b end
	
returnFalse:
	mov r0, #0
	
end:
	pop {r1-r11, lr}
	bx lr
