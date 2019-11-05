	.global String_length
	
String_length:
	push {r1-r11, lr}
	
	mov r0, #0			@ length = 0
	
	ldrb r2, [r1]			@ Load first char
	cmp r2, #0			@ Quit if it is null
	beq return
	
	loop:
		add r0, r0, #1		@ Char was not null; therefore, length++
		
		ldrb r2, [r1, r0]	@ Load next char
		cmp r2, #0		@ Quit if it is null
		beq return
		
		b loop			@ Continue if it was not null

	return:
		pop {r1-r11, lr}
		bx lr

	.end
