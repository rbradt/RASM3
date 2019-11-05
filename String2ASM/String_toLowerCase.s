
	.global String_toLowerCase
	.extern malloc
	.extern free

/***************************************************************
 * String_toLowerCase
 *	This function creates a new string with lower case characters
 *
 * input:
 *	r1: The address of the null terminated string
 *
 * output:
 *	r0: Address of the new string with lower case characters
 ***************************************************************/	
String_toLowerCase:
	push {r1-r11, lr}
	
	bl String_length
	mov r2, r0
	add r0, #1
	
	push {r1-r2}
	bl malloc
	pop {r1-r2}
	
	mov r7, #0x41
	mov r8, #0x5a
	
	mov r3, #-1
	toLower:
		add r3, r3, #1
		
		ldrb r4, [r1, r3]
		
		cmp r4, r7		@ str[i] < 'A'
		blt copy
		
		cmp r4, r8		@ str[i] > 'Z'
		bgt copy
		
		add r4, r4, #0x20
		
		copy:
			strb r4, [r0, r3]
		
		cmp r3, r2
		blt toLower
	
	mov r9, #0
	add r2, #1
	strb r9, [r0, r2]
	pop {r1-r11, lr}
	bx lr

	.end
	
