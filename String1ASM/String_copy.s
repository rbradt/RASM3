/* ----------------------------------------------------
	Subroutine String_copy
	
		R1: String to copy
		LR: Contains the return address
		
	Returned register contents:
		R3: Copied string
		
	All registers are preserved as per AAPCS.
	--------------------------------------------------- */
	
	.global String_copy
	
	.data
strPtr:		.word 0,0,0,0
	
	.extern malloc			@ Need to use for dynamic allocation
	.extern free
	
String_copy:
	push {r1-r11, lr}
	
	bl String_length
	add r0, #1
	mov r5, r0				@ Length is in r5
	sub r4, r0, #1
	
	push {r1-r11}
	bl malloc				@ r0 has address
	pop {r1-r11}
	
	mov r8, #-1
	
mainLoop:
	add r8, #1
	
	ldrb r3, [r1, r8]
	strb r3, [r0, r8]
	
	cmp r8, r4
	blt mainLoop
	
end:
	mov r3, #0
	strb r3, [r0, r5]
	pop {r1-r11, lr}
	bx lr
