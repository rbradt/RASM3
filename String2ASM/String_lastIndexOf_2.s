@ Input
@ r1 = address
@ r2 = char
@ r3 = starting index

@ Output
@ r0 = index of char in string

	.global String_lastIndexOf_2
String_lastIndexOf_2:
	push {r1-r11, lr}
	
	bl String_length
	
	sub r6, r0, r3
	loop:
		sub r0, r0, #1
		
		ldrb r4, [r1, r0]
		
		cmp r4, r2
		beq return
		
		cmp r0, r6
		bgt loop

	mov r0, #-1
		
return:
	pop {r1-r11, lr}
	bx lr

	.end
