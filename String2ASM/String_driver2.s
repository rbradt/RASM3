	.data
szIndexOf1:	.asciz	"String_indexOf_1(s2,'g')	= "
szIndexOf2:	.asciz	"\nString_indexOf_2(s2,'g',9)	= "
szIndexOf3:	.asciz	"\nString_indexOf_3(s2,\"eggs\")	= "
szLastIndexOf1:	.asciz	"\nString_lastIndexOf_1(s2,'g')	= "
szLastIndexOf2:	.asciz	"\nString_lastIndexOf_2(s2,'g',6)	= "
szLastIndexOf3:	.asciz	"\nString_lastIndexOf_3(s2,\"egg\")	= "
szReplace:	.asciz	"\nString_replace(s1,'a','o')	= \""
szToLowerCase:	.asciz	"\nString_toLowerCase(s1)		= \""
szToUpperCase:	.asciz	"\nString_toUpperCase(s1)		= \""
szConcat:	.asciz	"\nString_concat(s1, \" \");\nString_concat(s1, s2)		= \""

szQuote:	.asciz	"\""
szNewline:	.asciz	"\n"

szSpace:	.asciz	" "
szEggs:		.asciz	"eggs"
szEgg:		.asciz	"egg"

buffer:		.space	12

	.text
	.global String_driver2

	@ r1 = string one
	@ r2 = string two
	@ r3 = string three

String_driver2:
	push {r4-r11, lr}
	
	/* ----- IndexOf_1 ----- */
	push {r1-r3}		@ IndexOf_1
	ldr r1, =szIndexOf1
	bl putstring

	mov r1, r2			@ call String_indexOf_1
	mov r2, #'g'
	bl String_indexOf_1
	
	ldr r1, =buffer		@ output result
	mov r3, #0
	str r3, [r1]
	bl intasc32
	bl putstring
	pop {r1-r3}

	
	/* ----- IndexOf_2 ----- */
	push {r1-r3}		@ IndexOf_2
	ldr r1, =szIndexOf2
	bl putstring

	mov r1, r2			@ call String_indexOf_2
	mov r2, #'g'
	mov r3, #9
	bl String_indexOf_2

	ldr r1, =buffer		@ output result
	mov r3, #0
	str r3, [r1]
	bl intasc32
	bl putstring
	pop {r1-r3}
	
	
	/* ----- IndexOf_3 ----- */
	push {r1-r3}		@ IndexOf_3
	ldr r1, =szIndexOf3
	bl putstring
	
	mov r1, r2			@ call String_indexOf_3
	ldr r2, =szEggs
	bl String_indexOf_3
	
	ldr r1, =buffer		@ output result
	mov r3, #0
	str r3, [r1]
	bl intasc32
	bl putstring
	pop {r1-r3}
	
	
	/* --- LastIndexOf_1 --- */
	push {r1-r3}		@ LastIndexOf_1
	ldr r1, =szLastIndexOf1
	bl putstring
	
	mov r1, r2			@ call String_lastIndexOf_1
	mov r2, #'g'
	bl String_lastIndexOf_1
	
	ldr r1, =buffer		@ output result
	mov r3, #0
	str r3, [r1]
	bl intasc32
	bl putstring
	pop {r1-r3}
	
	
	/* --- LastIndexOf_2 --- */
	push {r1-r3}		@ LastIndexOf_2
	ldr r1, =szLastIndexOf2
	bl putstring
	
	mov r1, r2			@ call String_lastIndexOf_2
	mov r2, #'g'
	mov r3, #6
	bl String_lastIndexOf_2
	
	ldr r1, =buffer		@ output result
	mov r3, #0
	str r3, [r1]
	bl intasc32
	bl putstring
	pop {r1-r3}
	
	
	/* --- LastIndexOf_3 --- */
	push {r1-r3}		@ LastIndexOf_3
	ldr r1, =szLastIndexOf3
	bl putstring
	
	mov r1, r2			@ call String_lastIndexOf_3
	ldr r2, =szEgg
	bl String_lastIndexOf_3
	
	ldr r1, =buffer		@ output result
	mov r3, #0
	str r3, [r1]
	bl intasc32
	bl putstring
	pop {r1-r3}
	
	
	/* ------ Replace ------ */
	push {r1}				@ Replace
	ldr r1, =szReplace
	bl putstring
	pop {r1}
	
	push {r2-r3}			@ replace 'a' with 'o' in string one
	mov r2, #'a'
	mov r3, #'o'
	bl String_replace
	pop {r2-r3}
	
	mov r1, r0				@ output new string
	bl putstring
	
	push {r1}
	ldr r1, =szQuote
	bl putstring
	pop {r1}
	
	
	/* ---- ToLowerCase ---- */
	push {r1}				@ ToLowerCase
	ldr r1, =szToLowerCase
	bl putstring
	pop {r1}
	
	bl String_toLowerCase	@ Convert string one to uppercase
	
	push {r1}				@ Output lowercase string
	mov r1, r0
	bl putstring
	pop {r1}
	
	push {r1-r3}			@ Free allocated memory
	bl free
	
	ldr r1, =szQuote
	bl putstring
	pop {r1-r3}
	
	
	/* ---- ToUpperCase ---- */
	push {r1}				@ ToUpperCase
	ldr r1, =szToUpperCase
	bl putstring
	pop {r1}
	
	bl String_toUpperCase	@ Convert string one to uppercase
	
	push {r0-r3}			@ Free allocated memory
	mov r0, r1
	bl free
	pop {r0-r3}
	
	mov r1, r0				@ Output uppercase string
	bl putstring
	push {r1}
	ldr r1, =szQuote
	bl putstring
	pop {r1}
	
	
	/* ------ Concat ------- */
	push {r1}				@ Concat
	ldr r1, =szConcat
	bl putstring
	pop {r1}
	
	push {r2}				@ Concat string one and " "
	ldr r2, =szSpace
	bl String_concat
	
	push {r0}				@ Free string one and store new concatinated string
	mov r0, r1
	bl free
	pop {r0}
	mov r1, r0
	pop {r2}

	bl String_concat		@ Concat the new string one and string two
	
	push {r0-r3}			@ Free string one and store new concatinated string
	mov r0, r1
	bl free
	pop {r0-r3}
	
	mov r1, r0				@ Output string one
	bl putstring
	ldr r1, =szQuote
	bl putstring
	ldr r1, =szNewline
	bl putstring

	bl free					@ Free allocated memory
	
	pop {r4-r11, lr}
	bx lr

	.end
