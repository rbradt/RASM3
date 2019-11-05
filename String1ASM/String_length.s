/* ----------------------------------------------------
	Subroutine String_length accepts the address of a 
	string and counts the characters in the string, 
	excluding the null character and returns that value as
	an int (word) in the r0 register. Will read a string
	of characters terminated by a null.
	
		R1: Points to first byte of string to count
		LR: Contains the return address
		
	Returned register contents:
		R0: Number of characters in the string (does not
		include null.)
		
	All registers are preserved as per AAPCS.
	--------------------------------------------------- */

	.global String_length

	.data
wString:	.word 0

.balign 4

String_length:
	push {r1-r11, lr}
	
	mov r3, #-1
	
mainLoop:
	ldrb	r2, [r1], #1
	add		r3, r3, #1
	cmp		r2, #0			@ End loop if character is null terminator
	bne		mainLoop
	
	ldr		r0, =wString
	mov		r0, r3		@ Store the count in word wString
	
	pop {r1-r11, lr}
	bx lr
