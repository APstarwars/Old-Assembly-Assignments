; Data
section 	.data
extern printMSG
extern exitNormal
extern printRAX
extern printRBX
extern printRCX
extern printRDX
extern getByteArray
extern printByteArray
extern printEndl

title		db	"Enter 5 Characters "
titleSize	db	0x13
reverse 	db	"Reverse "
reverseSize	db	0x8
sort		db	"Sort "
sortSize	db	0x5
numberOfBytes	dq	0x5

section		.bss
array		resb	5
reversed	resb	5

; Code 
section		.text
	
global _start

_start:
	; Header
	mov rdi, 0xd
	call printMSG
	mov rdi, 0x0
	call printMSG

	; Data Input
	mov rsi, title 
	mov dl, [titleSize] 
	call printByteArray
	call printEndl
	xor rsi, rsi

	mov rsi, array	
	mov dl, [numberOfBytes]
	call getByteArray
	call printByteArray
	call printEndl
	
	; Reversal
	mov rsi, reverse 
	mov dl, [reverseSize] 
	call printByteArray
	call printEndl
	xor rsi, rsi

	xor rax, rax
	mov rcx, [numberOfBytes]
	mov rbx, 0
	startLoop:
		mov al, byte [array+rbx]
		mov byte [reversed+rcx-1], al
		xor rax, rax
		inc rbx
	loop startLoop
	xor rbx, rbx

	mov rsi, reversed 
	mov dl, [numberOfBytes]
	call printByteArray
	call printEndl
	xor rsi, rsi
	
	; Sorting	
	mov rsi, sort 
	mov dl, [sortSize] 
	call printByteArray
	call printEndl
	xor rsi, rsi

	xor rax, rax
	xor rbx, rbx
	sortLoop:
		xor rdx, rdx		
		mov rcx, 1 
		compareLoop:
			mov al, byte [array+rcx-1]
			mov bl, byte [array+rcx]
			cmp al, bl 
			jg swap
			paws:	
			inc rcx 
		cmp rcx, [numberOfBytes]
		jl compareLoop	
	cmp rdx, 0
	jne sortLoop

	mov rsi, array 
	mov rdx, [numberOfBytes]
	call printByteArray
	call printEndl
	xor rsi, rsi

	jmp exit
	swap:
		mov byte [array+rcx-1], bl
		mov byte [array+rcx], al
		inc rdx	
	jmp paws

	exit:
	xor rdx, rdx	
	call	exitNormal
