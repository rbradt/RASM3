	
	.global String_concat
	.extern malloc
	.extern free

/***************************************************************
 * String_concat
 *	This function concatenates two null terminated strings
 *	and stores the result in a new string
 *
 * input:
 *	r1: The address of the first null terminated string
 *	r2: The address of the second null terminated string
 *	    (to be attatched at the end of the first string)
 *
 * output:
 *	r0: Address of the new string
 ***************************************************************/	
String_concat:
	push {r1-r11, lr}
	mov r3, r1
	bl String_length
	mov r4, r0			@ r4 = length of string1
	
	mov r1, r2
	bl String_length
	mov r5, r0			@ r5 = length of string2
	mov r1, r3
	
	add r0, r4, r5
	add r0, r0, #1
	mov r6, r0
	push {r1-r11, lr}
	bl malloc			@ allocate correct number of bytes (r4+r5+1)
	pop {r1-r11, lr}
	
	
	mov r8, #-1
	
	copyString1:			@ copy string1 into the allocated memory
		add r8, r8, #1

		ldrb r3, [r1, r8]
		strb r3, [r0, r8]
		
		cmp r8, r4
		blt copyString1
	
	
	push {r0}
	add r0, r0, r4
	mov r8, #-1
	
	copyString2:			@ copy string2 into the allocated memory after string1
		add r8, r8, #1
	
		ldrb r3, [r2, r8]
		strb r3, [r0, r8]
		
		cmp r8, r5
		blt copyString2
	
return:					@ return address to the new string
	pop {r0}
	mov r3, #0
	strb r3, [r0, r6]
	pop {r1-r11, lr}
	bx lr
	
	.end
