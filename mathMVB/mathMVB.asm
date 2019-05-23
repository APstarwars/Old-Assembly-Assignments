; Data
section 	.data
extern printMSG
extern printReg
extern printRAX
extern printRBX
extern printRCX
extern printRDX
extern exitNormal

; Code 
section		.text
	
global _start

_start:
	;prints header
	mov rdi, 0xd
	call printMSG
	mov rdi, 0x0
	call printMSG

	;addition
	mov rdi, 0x2
	call printMSG
	mov rdi, 0x0
	call printMSG

	mov	rax,	0x0a
	call	printRAX
	add	rax,	0x0a
	call	printRAX
	;add	rax, 	0x0a; these two lines do what you ask
	;call	printRAX; but I think the math was done wrong 
	add	rax,	rax
	call	printRAX

	mov	al,	0xFF
	add	al,	0x1
	adc	al,	0x1
	call	printRAX

	inc	al
	call	printRAX

	;subtraction
	mov rdi, 0x3
	call printMSG
	mov rdi, 0x0
	call printMSG

	sub	rax,	0xa
	call	printRAX

	dec	rax
	call 	printRAX

	;multiplication
	mov rdi, 0x4
	call printMSG
	mov rdi, 0x0
	call printMSG

	mov	rbx, 	0xa
	mov	rax,	0x80
	mul	rbx	
	call	printRDX
	call	printRAX
	mov	rbx,	0x8000000000
	mov	rax,	0x8000000001
	mul	rbx
	call	printRDX
	call	printRAX

	mov	rax,	0x0
	mov	rbx,	0x0; to 0 out the registers

	mov	bl, 	0x2
	mov	al,	0x8f
	mul	bl
	call	printRAX
	mov	bl,	0x2
	mov	al,	0x8f
	imul	bl
	call	printRAX

	;division
	mov rdi, 0x5
	call printMSG
	mov rdi, 0x0
	call printMSG

	mov	rax, 	0xfffa
	mov	rdx,	0x0
	mov	rbx, 	0xf
	div	rbx
	call	printRAX
	call	printRDX

	mov	rax,	0x0
	mov	rbx,	0x0; to 0 out the registers

	mov	ax,	-22
	; dividing -25 by 0x5 produces a quotient of -5 (0xFB) and no remainder
	; the result desired is gained by dividing -22 by 0x5.	
	mov	bh,	0x5
	idiv	bh
	call	printRAX

	;ends the program	
	call	exitNormal
