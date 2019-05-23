; Data
section 	.data
extern printMSG
extern exitNormal
extern printRAX
extern printRBX
extern printRCX
extern printRDX
extern printABCD

; Code 
section		.text
	
global _start

_start:
	; Header
	mov rdi, 0xd
	call printMSG
	mov rdi, 0x0
	call printMSG
	
	; Shift Left
	mov rdi, 0x12
	call printMSG
	mov rdi, 0x0
	call printMSG
	mov rdi, 0x14
	call printMSG
	mov rdi, 0x0
	call printMSG
	
	mov	rax,	0x1
	shl	rax,	0x1
	call	printRAX
	shl	rax,	0x1
	call	printRAX
	shl	rax,	0x1
	call	printRAX

	; Shift Right
	mov rdi, 0x15
	call printMSG
	mov rdi, 0x0
	call printMSG

	mov	rax,	0x1000
	shr	rax,	0x1
	call	printRAX
	shr	rax,	0x1
	call	printRAX
	shr	rax,	0x1
	call	printRAX

	; Arithmetic Shift Left
	mov rdi, 0x14
	call printMSG
	mov rdi, 0x0
	call printMSG

	mov	rax,	0x1
	sal	rax,	0x1
	call	printRAX
	sal	rax,	0x1
	call	printRAX
	sal 	rax,	0x1
	call	printRAX

	; Arithmetic Shift Right
	mov rdi, 0x15
	call printMSG
	mov rdi, 0x0
	call printMSG

	mov	rax,	0x8000000000000008
	sar	rax,	0x1
	call	printRAX
	sar	rax,	0x1
	call	printRAX
	sar	rax,	0x1
	call	printRAX

	; Rotate Left
	mov rdi, 0x13
	call printMSG
	mov rdi, 0x0
	call printMSG
	mov rdi, 0x14
	call printMSG
	mov rdi, 0x0
	call printMSG

	mov	rax,	0xF000000000000000
	rol	rax,	0x1
	call	printRAX
	rol	rax,	0x1
	call	printRAX
	rol	rax,	0x1
	call	printRAX

	; Rotate Right
	mov rdi, 0x15
	call printMSG
	mov rdi, 0x0
	call printMSG
	
	mov	rax, 	0xF
	ror	rax,	0x1
	call	printRAX
	ror	rax,	0x1
	call	printRAX
	ror	rax,	0x1
	call	printRAX
	
	call	exitNormal
