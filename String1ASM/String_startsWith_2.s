/* ----------------------------------------------------
	Subroutine String_startsWith_2 checks whether a
	prefix exists.
	
		R1: Has original string
		R2: Substring from user to check
		R3:	Substring length.
		LR: Contains the return address
		
	Returned register contents:
		R0: 1 for true, 0 for false
		
	All registers are preserved as per AAPCS.
	--------------------------------------------------- */
	
	.global String_startsWith_2
	
String_startsWith_2:
	push {r1-r11, lr}
	
	sub r2, #1
	sub r1, #1
	
	mov r8, #-1
startsWithLoop:	
	add  r8, #1
	ldrb r4, [r1], #1		@ Load OG string
	ldrb r5, [r2], #1		@ Load substring
	
	cmp r4, r5
	bne returnFalse
	
	cmp r8, r3				@ Compare counter to length of substring
	blt startsWithLoop
	
returnTrue:
	mov r0, #1
	b end
	
returnFalse:
	mov r0, #0
	
end:
	pop {r1-r11, lr}
	bx lr
