; Data
section 	.data

; external function references
extern exitNormal

extern printABCD
extern printMSG
extern printRAX
extern printRBX
extern printRCX
extern printRDX
extern printReg

aVal	dq	0xa0a0a0a
bVal 	dq	0x0b0b0b0
cVal 	dq	0x0

; Code 
section		.text
	
global _start

_start:
	;print "CS12" 
	mov	rdi,	13
	call	printMSG
	mov	rdi,	0
	call	printMSG
	;jmp 	Exit
	
	;print "MOV"	
	mov 	rdi, 	1  
	call 	printMSG
	mov	rdi,	0
	call	printMSG	
	;jmp 	Exit

	;print a value from RAX
	mov	rdi,	9
	call	printMSG
	mov	rdi,	8
	call	printMSG	
	mov 	rax, 	[aVal]	
	call 	printRAX 	
	;jmp 	Exit

	;print a value from RBX
	mov	rdi,	10
	call	printMSG
	mov	rdi,	8
	call	printMSG
	mov 	rbx,	[bVal]	
	call 	printRBX
	;jmp 	Exit

	;print a value from RCX
	mov	rdi,	11
	call	printMSG
	mov	rdi,	8
	call	printMSG
	mov 	rcx, 	0xCCCC
	call 	printRCX
	;jmp 	Exit
	
	;print a value from RDX
	mov	rdi,	12
	call	printMSG
	mov	rdi,	8
	call	printMSG
	mov 	rdx,	0x12345678DDDDDDDD	
	call 	printRDX
	;jmp 	Exit

	;print the first four registers	
	call 	printABCD
	;jmp 	Exit

	Exit:		
	call	exitNormal
