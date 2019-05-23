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

startPrompt 	db "Welcome to the amazing dice game, press enter to start "
startPromptLen 	dq 54
rerollPrompt	db "Enter any numbers you want to keep "
rerollPromptLen	dq 35 

section		.bss
roll 	resb 5
die 	resb 1
reroll 	resb 5

; Code 
section		.text
	
global _start

_start:
	; Header
	mov rdi, 0xd
	call printMSG
	mov rdi, 0x0
	call printMSG

	; Dice Game (Stuart)
	; Prompt the user
	mov rsi, startPrompt
	mov dl, [startPromptLen]
	call printByteArray
	call printEndl

	call getByteArray

	; Roll for 5 random values
	mov rcx, 0
	rollTheDice:
		rdrand rax
		xor rdx, rdx
		mov rbx, 6
		div rbx
		inc rdx
		call printRDX
		mov byte [roll+rcx-1], dl
		inc rcx	
	cmp rcx, 5
	jle rollTheDice	

	; Display the roll to user
	mov rcx, 5
	displayDice:	
		mov al, byte [roll+rcx-1]
		add al, 0x30
		mov byte [die], al
		mov rsi, die 
		mov rdx, 0x1
		call printByteArray
	cmp rcx, 0
	jne displayDice
	
	call printEndl

	; Display the reroll prompt	
	mov rsi, rerollPrompt
	mov dl, [rerollPromptLen]
	call printByteArray
	call printEndl

	; Accept 0-5 numbers
	mov rsi, reroll
	mov dl, 0x5
	call getByteArray

	; reroll the appropriate dice
	; display the roll
	
	call	exitNormal
