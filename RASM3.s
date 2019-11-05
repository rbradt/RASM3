/* -------------------------------------------
	                RASM 3
	------------------------------------------*/
	
	.global _start
	.equ BUFSIZE, 512
	.extern malloc
	.extern free
	
/* -------------------------------------------
	                DATA 
	-------------------------------------------*/
	.data
	
strPrompt1:		.asciz "Enter the first string (s1): "
strPrompt2:		.asciz "Enter the second string (s2): "
strPrompt3:		.asciz "Enter the third string (s3): "

s1:				.skip BUFSIZE
s2:				.skip BUFSIZE
s3:				.skip BUFSIZE

length:			.word 0,0,0
	
strString1:		.asciz "String1.a - Jehielle David: "
strString2:		.asciz "String2.a - Riley Bradt: "
strTest1:		.asciz "1.  s1.length() = "
strTest2:		.asciz "2.  String_equals(s1,s3) = "
strTest3:		.asciz "3.  String_equals(s1,s1) = "
strTest4:		.asciz "4.  String_equalsIgnoreCase(s1,s3) = "
strTest5:		.asciz "5.  String_equalsIgnoreCase(s1,s2) = "
strTest6:		.asciz "6.  s4 = String_copy(s1)"
strTest7:		.asciz "7.  String_substring_1(s3,4,13) = "
strTest8:		.asciz "8.  String_substring_2(s3,7) = "
strTest9:		.asciz "9.  String_charAt(s2,4) = "
strTest10:		.asciz "10. String_startsWith_1(s1,11,hat.) = "
strTest11:		.asciz "11. String_startsWith_2(s1,Cat) = "
strTest12:		.asciz "12. String_endsWith(s1,in the hat.) = "

strLengthS2:	.asciz "    s2.length() = "
strLengthS3:	.asciz "    s3.length() = "

strOutputS1:	.asciz "    s1 = "
strOutputS4:	.asciz "    s4 = "

strSubPrompt1:	.asciz "    Enter a substring to check s1 at index 11: "
strSubPrompt2:	.asciz "    Enter a substring to check s1: "
strSubPrompt3:	.asciz "    Enter a substring to check the end of s1: "

strCopiedS4:	.word 0,0,0,0
szSubstring1:	.skip BUFSIZE
szSubstring2:	.skip BUFSIZE
szSubstring3:	.skip BUFSIZE

endl:			.byte 10

/* -------------------------------------------
	                 START 
	-------------------------------------------*/
	.text
	.balign 4
_start:

	bl Header					@ Output the header
	
/* ---------------- INPUTS ------------------ */
	
	ldr r1, =strPrompt1			@ Get first input
	bl putstring
	ldr r1, =s1
	ldr r2, =BUFSIZE
	bl getstring
	
	ldr r1, =strPrompt2			@ Get second input
	bl putstring
	ldr r1, =s2
	ldr r2, =BUFSIZE
	bl getstring
	
	ldr r1, =strPrompt3			@ Get third input
	bl putstring
	ldr r1, =s3
	ldr r2, =BUFSIZE
	bl getstring
	
	ldr r1, =endl				@ Endline
	bl putch
	
/* ----------- STRING1.a TESTS -------------- */

	ldr r1, =strString1
	bl putstring
	ldr r1, =endl
	bl putch
	bl putch
	
	
/* ---------------- TEST 1 ----------------- */

	ldr r1, =strTest1			@ Outputs prompt for s1
	bl putstring
	
	ldr r1, =s1
	bl String_length			@ Gets length of s1
	ldr r1, =length
	str r0, [r1]				@ Stores into word
	bl intasc32					@ Convert int to ascii
	ldr r1, =length
	bl putstring
	
	ldr r1, =endl
	bl putch
	
	ldr r1, =strLengthS2		@ Outputs prompt for s2
	bl putstring
	
	ldr r1, =s2
	bl String_length			@ Gets length of s2
	ldr r1, =length
	str r0, [r1]				@ Stores into word
	bl intasc32					@ Convert int to ascii
	ldr r1, =length
	bl putstring
	
	ldr r1, =endl
	bl putch
	
	ldr r1, =strLengthS3		@ Outputs prompt for s3
	bl putstring
	
	ldr r1, =s3
	bl String_length			@ Gets length of s3
	ldr r1, =length
	str r0, [r1]				@ Stores into word
	bl intasc32					@ Convert int to ascii
	ldr r1, =length
	bl putstring
	
	ldr r1, =endl
	bl putch
	
/* ---------------- TEST 2 ----------------- */

	ldr r1, =strTest2			@ Outputs prompt for test 2
	bl putstring
	
	ldr r3, =s1
	ldr r2, =s3
	bl String_equals			@ Checks to see if true or false
	bl TrueOrFalse				@ Outputs true or false
	
	ldr r1, =endl
	bl putch

/* ---------------- TEST 3 ----------------- */

	ldr r1, =strTest3			@ Outputs prompt for test 3
	bl putstring
	
	ldr r3, =s1
	ldr r2, =s1
	bl String_equals			@ Checks to see if true or false
	bl TrueOrFalse				@ Outputs true or false
	
	ldr r1, =endl
	bl putch
	
/* ---------------- TEST 4 ----------------- */

	ldr r1, =strTest4			@ Outputs prompt for test 4
	bl putstring

	ldr r3, =s1
	ldr r2, =s3
	bl String_equalsIgnoreCase	@ Checks to see if t/f, ignoring case
	bl TrueOrFalse				@ Outputs true or false

	ldr r1, =endl
	bl putch
	
/* ---------------- TEST 5 ----------------- */

	ldr r1, =strTest5			@ Outputs prompt for test 4
	bl putstring

	ldr r3, =s1
	ldr r2, =s2
	bl String_equalsIgnoreCase	@ Checks to see if t/f, ignoring case
	bl TrueOrFalse				@ Outputs true or false

	ldr r1, =endl
	bl putch
	
/* ---------------- TEST 6 ----------------- */

	ldr r1, =strTest6			@ Outputs prompt for test 6
	bl putstring
	
	ldr r1, =endl
	bl putch
	
	ldr r1, =strOutputS1		@ Outputs prompt for s1
	bl putstring
	
	ldr r1, =s1					@ Outputs s1
	bl putstring
	
	ldr r1, =endl
	bl putch
	
	ldr r1, =strOutputS4		@ Outputs prompt for s4
	bl putstring
	
	ldr r1, =s1
	bl String_copy				@ Copies string
	
	ldr r1, =strCopiedS4
	str r0, [r1]
	ldr r1, [r1]
	bl putstring				@ Outputs s4
	
	ldr r1, =endl
	bl putch
	
	mov r1, #'z'				@ Deallocates memory
	strb r1, [r0]
	bl free
	
/* ---------------- TEST 7 ----------------- */

	ldr r1, =strTest7			@ Output prompt for test 7
	bl putstring
	
	mov r2, #4					@ beginIndex = 4
	mov r3, #13					@ endIndex = 13
	ldr r1, =s3					@ the string to get substring from
	bl String_substring_1

	mov r1, r0
	bl putstring

	ldr r1, =endl
	bl putch
	
	mov r1, #'s'				@ Deallocates memory
	strb r1, [r0]
	bl free

/* ---------------- TEST 8 ----------------- */

	ldr r1, =strTest8			@ Output prompt for test 8
	bl putstring
	
	mov r2, #7					@ beginIndex = 7
	ldr r1, =s3					@ the string to get substring from
	bl String_substring_2

	mov r1, r0
	bl putstring

	ldr r1, =endl
	bl putch

	mov r1, #'s'				@ Deallocates memory
	strb r1, [r0]
	bl free
	
/* ---------------- TEST 9 ----------------- */
	
	ldr r1, =strTest9			@ Output prompt for test 9
	bl putstring
	
	ldr r1, =s2
	mov r2, #4
	bl String_charAt
	mov r1, r0
	bl putstring

	ldr r1, =endl
	bl putch
	
	mov r1, #'s'				@ Deallocates memory
	strb r1, [r0]
	bl free

/* ---------------- TEST 10 ----------------- */
	
	ldr r1, =strSubPrompt1
	bl putstring
	ldr r1, =szSubstring1
	ldr r2, =BUFSIZE
	bl getstring				@ User input

	bl String_length			@ Length of user input in r4
	mov r4, r0
	
	ldr r1, =strTest10			@ Outputs prompt for test 10
	bl putstring
	
	ldr r1, =s1					@ OG string
	mov r2, #11					@ Index
	ldr r3, =szSubstring1		@ Substring

	bl String_startsWith_1
	bl TrueOrFalse
	
	ldr r1, =endl
	bl putch
	
/* ---------------- TEST 11 ----------------- */

	ldr r1, =strSubPrompt2
	bl putstring
	ldr r1, =szSubstring2
	ldr r2, =BUFSIZE
	bl getstring				@ User input
	
	bl String_length
	mov r3, r0					@ Length of substring
	
	ldr r1, =strTest11
	bl putstring

	ldr r1, =s1					@ OG string
	ldr r2, =szSubstring2		@ Substring
	bl String_startsWith_2
	bl TrueOrFalse
	
	ldr r1, =endl
	bl putch

/* ---------------- TEST 12 ----------------- */

	ldr r1, =strSubPrompt3
	bl putstring
	ldr r1, =szSubstring3
	ldr r2, =BUFSIZE
	bl getstring				@ User input
	
	ldr r1, =szSubstring3
	bl String_length
	mov r3, r0					@ Length of substring
	
	ldr r1, =s1
	bl String_length
	mov r4, r0					@ Length of OG string
	
	ldr r1, =strTest12
	bl putstring

	ldr r1, =s1					@ OG string
	ldr r2, =szSubstring3		@ Substring
	bl String_endsWith
	bl TrueOrFalse
	
	ldr r1, =endl
	bl putch
	bl putch

/* ---------------- String2.a TESTS ------------------ */

	ldr r1, =strString2
	bl putstring
	ldr r1, =endl
	bl putch
	bl putch

	ldr r1, =s1
	ldr r2, =s2
	ldr r3, =s3

	bl String_driver2			@ Second half of driver is function


/* -------------------------------------------
	               EXIT RASM3 
	-------------------------------------------*/

exitRASM3:	
	mov r7, #1
	svc 0
	.end
