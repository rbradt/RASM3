@ Input
@ r1 = string
@ r2 = substring to find in original string

@ Output
@ r0 = index of substring in string

	.global String_lastIndexOf_3
String_lastIndexOf_3:
	push {r1-r11, lr}
	
	bl String_length
	
	push {r0-r2}
	mov r1, r2
	bl String_length
	mov r6, r0
	pop {r0-r2}
	
	mov r8, #-1
	mov r3, r0
	sub r7, r6, #1
	
	loop:
		sub r3, r3, #1
		
		ldrb r4, [r1, r3]
		ldrb r5, [r2, r7]
		
		cmp r4, r5
		beq next
		bne reset
		
		reset:
			sub r7, r6, #1
			ldrb r5, [r2, r7]
			cmp r4, r5
			bne end
			
		next:
			cmp r7, #0
			moveq r8, r3
			cmp r7, #0
			beq return
			sub r7, r7, #1	
			
		end:
		cmp r3, #0
		bgt loop
	
return:
	mov r0, r8
	pop {r1-r11, lr}
	bx lr

	.end
