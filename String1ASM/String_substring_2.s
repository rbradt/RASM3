/* ----------------------------------------------------
	Subroutine String_substring_2 creates a new string
	from the letters of the old string, using a beginIndex
	and ending at the end of the original string.
	
		R1: Has string to take letters from
		R2: beginIndex
		LR: Contains the return address
		
	Returned register contents:
		R0: The new string.
		
	All registers are preserved as per AAPCS.
	--------------------------------------------------- */
	
	.global String_substring_2
	
String_substring_2:
	push {r1-r11, lr}
	
	bl String_length
	add r0, #1
	mov r5, r0				@ Length is in r5
	sub r4, r0, #1
	
	push {r1-r11}
	bl malloc
	pop {r1-r11}
	
	mov r8, #-1
substringLoop:
	add r8, #1
	cmp r2, r5						@ Compare begin index to length
	beq endSubLoop					@ If equal, end loop
	ldrb r4, [r1, r2]				@ Load from beginIndex (7)
	strb r4, [r0, r8]				@ Store the byte
	
	add r2, #1						@ Increment begin to get closer to end
	b substringLoop
	
endSubLoop:
	mov r4, #0
	strb r4, [r0, r5]
	pop {r1-r11, lr}
	bx lr
