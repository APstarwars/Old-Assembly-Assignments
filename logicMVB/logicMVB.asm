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

	; And
	mov rdi, 0xe
	call printMSG
	mov rdi, 0x0
	call printMSG

	mov	rax, 	0xa0a0a0a0
	mov	rbx,	0xb0b0b0b
	and	rax,	rbx
	call	printRAX		

	mov	rax,	0xa0a0a0a0
	mov	rbx,	0xb0b0b0b0
	and	rax,	rbx
	call	printRAX

	; Or
	mov rdi, 0xf
	call printMSG
	mov rdi, 0x0
	call printMSG

	mov	rax,	0xa0a0a0a0
	mov	rbx,	0xb0b0b0b
	or	rax,	rbx
	call	printRAX
	
	mov	rax,	0xa0a0a0a0
	mov	rbx,	0xb0b0b0b0
	or	rax,	rbx
	call	printRAX

	; Xor
	mov rdi, 0x10
	call printMSG
	mov rdi, 0x0
	call printMSG

	mov	rax, 	0xa0a0a0a0
	mov	rbx,	0xb0b0b0b
	xor	rax,	rbx
	call	printRAX
	
	mov 	rax,	0xa0a0a0a0
	mov	rbx,	0xb0b0b0b0
	xor	rax,	rbx
	call	printRAX	

	; Not
	mov rdi, 0x11
	call printMSG
	mov rdi, 0x0
	call printMSG

	mov	rax,	0xa0a0a0a0
	mov	rbx,	0xb0b0b0b
	not	rax
	not	rbx
	call	printRAX
	call	printRBX
	
	call	exitNormal
