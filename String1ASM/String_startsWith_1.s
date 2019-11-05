/* ----------------------------------------------------
	Subroutine String_startsWith_1 checks whether the
	substring in a specific position exists.
	
		R1: Has original string
		R2: Index
		R3: Substring from user to check
		R4:	Length of substring
		LR: Contains the return address
		
	Returned register contents:
		R0: 1 for true, 0 for false
		
	All registers are preserved as per AAPCS.
	--------------------------------------------------- */
	
	.global String_startsWith_1
	
String_startsWith_1:
	push {r1-r11, lr}
	
	mov r8, #-1
startsWithLoop:
	add  r8, #1
	ldrb r6, [r1, r2]		@ Load OG string from index (11)
	ldrb r7, [r3, r8]		@ Load substring from user
	
	cmp r7, #0				@ When done going thru substring, its true.
	beq returnTrue
	
	cmp r6, r7
	bne returnFalse
	
	add r2, #1
	cmp r8, r4
	blt startsWithLoop
	
returnTrue:
	mov r0, #1
	b end
	
returnFalse:
	mov r0, #0
	
end:
	pop {r1-r11, lr}
	bx lr
