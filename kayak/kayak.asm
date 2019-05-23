; Data
section 	.data
extern printMSG
extern exitNormal
extern getByteArray
extern printByteArray
extern printEndl

prompt 		db	"Enter a word, and I will tell you if it is a palindrome."
promptSize	db	56
isMsg		db	"Is a palindrome."
isSize		db	16
notMsg		db	"Is not a palindrome."
notSize		db	20
emptyMsg	db	"Is an empty string."
emptySize	db	19
arraySize 	db	25

section		.bss
palindrome	resb	25

; Code 
section		.text
	
global _start

_start:
	; Header
	mov rdi, 0xd
	call printMSG
	mov rdi, 0x0
	call printMSG

	; Get char string from user
	mov rsi, prompt
	mov dl, [promptSize]
	call printByteArray
	call printEndl	
	xor rsi, rsi

	mov rsi, palindrome
	mov dl, [arraySize]
	call getByteArray
	call printByteArray
	call printEndl
	xor rsi, rsi

	cmp byte [palindrome], 0x0a
	je emptyString

	; Determines if the string is a palindrome
	xor rax, rax
	mov rcx, 0
	pushLoop:
		mov al, byte [palindrome+rcx]
		push rax
		inc rcx
	cmp byte [palindrome+rcx], 0x0a
	jne pushLoop
	
	xor rax, rax
	mov rcx, 0
	popLoop:
		pop rax
		cmp al, byte [palindrome+rcx]
		jne notPalindrome
		inc rcx
	cmp byte [palindrome+rcx], 0x0a
	jne popLoop
	
	mov rsi, isMsg
	mov dl, [isSize] 
	call printByteArray
	call printEndl	
	xor rsi, rsi

	xor rax, rax
	xor rcx, rcx
	jmp exit

	notPalindrome:
	mov rsi, notMsg
	mov dl, [notSize]
	call printByteArray
	call printEndl	
	xor rsi, rsi
	jmp exit

	emptyString:
	mov rsi, emptyMsg
	mov dl, [emptySize]
	call printByteArray
	call printEndl	
	xor rsi, rsi
	jmp exit

	exit:	
	call	exitNormal
