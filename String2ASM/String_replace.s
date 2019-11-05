
	.global String_replace
	.extern malloc
	.extern free

/***************************************************************
 * String_replace
 *	This function replaces a specified character with another
 *
 * input:
 *	r1: The address of the null terminated string
 *	r2:	Old character
 *	r3:	New character to replace old character
 *
 * output:
 *	r0: Address of the new string with swapped characters
 ***************************************************************/	
String_replace:
	push {r1-r11, lr}
	
	bl String_length
	mov r5, r0
	add r0, #1
	
	push {r1-r5}
	bl malloc
	pop {r1-r5}
	
	mov r6, #-1
	strCopy:
		add r6, r6, #1
		
		ldrb r4, [r1, r6]
		
		cmp r4, r2		@ str[i] == oldChar
		beq replace
		
		strb r4, [r0, r6]
		b endLoop
			
		replace:
			strb r3, [r0, r6]
		
		endLoop:
			cmp r6, r5
			blt strCopy
	
	mov r9, #0
	add r5, #1
	strb r9, [r0, r5]
	pop {r1-r11, lr}
	bx lr

	.end
	
