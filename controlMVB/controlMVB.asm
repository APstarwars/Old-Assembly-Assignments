; Data
section 	.data
extern printMSG
extern exitNormal
extern printRAX
extern printRBX
extern printRCX
extern printRDX
extern printEndl
extern getQuad

; Code 
section		.text
	
global _start

_start:
	; Header
	mov rdi, 0xd
	call printMSG
	call printEndl

	; Ask for quadword input and store in rax 
	mov	rdi,	0x16
	call	printMSG
	call	printEndl
	call	getQuad
	call	printRAX

	; Perform a binary search to find the value in rax
	mov	rbx,	0x8000000000000000
	startLoop:
		or	rcx,	rbx
		call	printRCX
		and	rcx,	rax
		shr	rbx,	0x1
		inc	rdx
		cmp	rcx,	rax
		jne	startLoop 
	call 	printRDX	
	
	call	exitNormal
