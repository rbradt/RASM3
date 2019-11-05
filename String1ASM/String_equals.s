/* ----------------------------------------------------
	Subroutine String_equals makes an exact comparison
	of individual characters in two strings. If any
	character in the string in a position is different
	than the character in the same position in the other
	string, the method returns "false" (0 in the r0
	register). If the length of the two strings
	is different, the method also returns "false".
	Note that "e" is NOT the same as "E".
	Otherwise "true" (1) is returned. The value is returned
	in the r0 register.
	
		R3: Has first string
		R2:	Has second string 
		LR: Contains the return address
		
	Returned register contents:
		R0: 0 if false, 1 if true.
		
	All registers are preserved as per AAPCS.
	--------------------------------------------------- */
	
	.global String_equals
	
String_equals:
	push {r1-r11, lr}
	
	mov r1, r3
	bl String_length
	mov r7, r0
	
	mov r1, r2
	bl String_length
	mov r8, r0

	cmp r7, r8
	bne returnFalse
	
	mov r9, #-1
	
mainLoop:
	add  r9, #1
	ldrb r5, [r3], #1		@ Go through the first string, put in 
	ldrb r6, [r2], #1		@ Go through the first string, put in 
	
	cmp r5, r6				@ Compare the letter
	bne returnFalse
	
	cmp r9, r0
	blt mainLoop
	
	
returnTrue:
	mov r0, #1
	b end
	
returnFalse:
	mov r0, #0
	
end:
	pop {r1-r11, lr}
	bx lr
