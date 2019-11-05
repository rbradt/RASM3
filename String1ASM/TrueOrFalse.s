/* ----------------------------------------------------
	Subroutine TrueOrFalse will output whether something
	is true or false.
	
		R0: Holds 1 or 0
		LR: Contains the return address
		
	Returned register contents:
		None.
		
	All registers are preserved as per AAPCS.
	--------------------------------------------------- */

	.global TrueOrFalse
	
	.data
strTrue:		.asciz "TRUE"
strFalse:		.asciz "FALSE"
	
	.text
TrueOrFalse:
	push {r4-r8, r10-r11, lr}
	
	cmp r0, #1
	beq itsTrue

	ldr r1, =strFalse
	bl putstring
	
	b return
	
itsTrue:
	ldr r1, =strTrue
	bl putstring

return:
	pop {r4-r8, r10-r11, lr}
	bx lr
