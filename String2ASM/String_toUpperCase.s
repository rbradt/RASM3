
	.global String_toUpperCase
	.extern malloc
	.extern free

/***************************************************************
 * String_toUpperCase
 *	This function creates a new string with upper case characters
 *
 * input:
 *	r1: The address of the null terminated string
 *
 * output:
 *	r0: Address of the new string with upper case characters
 ***************************************************************/	
String_toUpperCase:
	push {r1-r11, lr}
	
	bl String_length
	mov r2, r0
	add r0, #1
	
	push {r1-r2}
	bl malloc
	pop {r1-r2}
	
	mov r7, #0x61
	mov r8, #0x7A
	
	mov r3, #-1
	toUpper:
		add r3, r3, #1
		
		ldrb r4, [r1, r3]
		
		cmp r4, r7		@ str[i] < 'a'
		blt copy
		
		cmp r4, r8		@ str[i] > 'z'
		bgt copy
		
		sub r4, r4, #32
		
		copy:
			strb r4, [r0, r3]
		
		cmp r3, r2
		blt toUpper
	
	mov r9, #0
	add r2, #1
	strb r9, [r0, r2]
	pop {r1-r11, lr}
	bx lr

	.end
	
