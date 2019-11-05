/* ----------------------------------------------------
	Subroutine String_substring_1 creates a new string
	from the letters of the old string, using a beginIndex
	and ending with an endIndex.
	
		R1: Has string to take letters from
		R2: beginIndex
		R3: endIndex
		LR: Contains the return address
		
	Returned register contents:
		R0: The new string.
		
	All registers are preserved as per AAPCS.
	--------------------------------------------------- */
	
	.global String_substring_1
	.extern malloc
	
String_substring_1:
	push {r1-r11, lr}
	
	mov r0, #10
	add r0, #1
	mov r5, r0							@ Length is in r5
	
	push {r1-r11}
	bl malloc
	pop {r1-r11}
	
	mov r8, #-1
	add r3, #1							@ To account for null
substringLoop:
	add r8, #1
	cmp r2, r3
	beq endSubLoop
	
	ldrb r4, [r1, r2]					@ Load from beginIndex (4)
	strb r4, [r0, r8]					@ Store the byte
	
	add r2, #1
	b substringLoop
	
endSubLoop:
	mov r4, #0
	strb r4, [r0, r5]
	pop {r1-r11, lr}
	bx lr
