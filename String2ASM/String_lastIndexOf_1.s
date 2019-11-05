	@ r1 = address, r2 = char, r0 = return, location of char in string (int)
	.global String_lastIndexOf_1
String_lastIndexOf_1:
	push {r1-r11, lr}
	
	bl String_length
	
	mov r3, r0
	loop:
		sub r3, r3, #1
		
		ldrb r4, [r1, r3]
		
		cmp r4, r2
		beq found
		
		cmp r3, #0
		bgt loop
	
	mov r0, #-1
	b return	

found:
	mov r0, r3
			
return:
	pop {r1-r11, lr}
	bx lr

	.end
