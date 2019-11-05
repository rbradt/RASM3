@ Input
@ r1 = address
@ r2 = char
@ r3 = starting index

@ Output
@ r0 = index of char in string

	.global String_indexOf_2
String_indexOf_2:
	push {r1-r11, lr}
	
	bl String_length
	
	sub r3, r3, #1
	loop:
		add r3, r3, #1
		
		ldrb r4, [r1, r3]
		
		cmp r4, r2
		beq found
		
		cmp r3, r0
		blt loop

	mov r0, #-1
	b return	

found:
	mov r0, r3
		
return:
	pop {r1-r11, lr}
	bx lr

	.end
