; Data
section     .data
extern  printMSG
extern  printEndl
extern  printReg
extern  printRAX
extern  exitNormal
extern  getRand

; Code 
section     .text


;-----------------------------------------
; declare functions
global mulby4
global printXtimes  
global getRandNum
global getMax
global getMin
global getAve

;-----------------------------------------
; the first 6 parameters are in this order
;-----------------------------------------
;param  64bit   32bit   16bit   8bit
;1      rdi     edi     di      dil
;2      rsi     esi     si      sil
;3      rdx     edx     dx      dl
;4      rcx     ecx     cx      cl
;5      r8      r8d     r8w     r8b
;6      r9      r9d     r8w     r8b
;-----------------------------------------

;-----------------------------------------
; return valuesare in
;       rax     eax     ax      al
;-----------------------------------------


;-----------------------------------------
; the callee must preserve these registers 
;-----------------------------------------
;   rbx rbp r12 r13 r14 r15 
; 
;   The stack must be cleared

;-----------------------------------------------------------------------------------
; mulby4
; description:      multiplies the first parameter by 4
;
; precondition:     rdi has the value to be multiplied by 4
;
; postcondition:    rax has the value of rdi shifted left twice
;                   effectively multiplying by 4       
;
; return            rax has the value of rdi shifted left twice
;-----------------------------------------------------------------------------------
mulby4:
	mov rax, rdi
	shl rax, 2
ret
;-----------------------------------------------------------------------------------
; printXtimes 
; description:      prints the value in rdi 
;                   the value of rsi times
;
; precondition:     rdi has the value to be displayed
;                   rsi has the number of times to repeat
;
; postcondition:    the value in rdi has been displayed rsi times
;
; return            n/a
;-----------------------------------------------------------------------------------
printXtimes:
	startLoop:
		call printReg
		dec rsi
	cmp rsi, 0
	jg startLoop
ret
;-----------------------------------------------------------------------------------
; getRandNum 
; description:      returns a random number 
;                   between 0 and rdi
;
; precondition:     rdi has the max value to be generated
;
; postcondition:    rax holds a number between 0 and rdi
;           
;
; return            a number between 0 and rdi, in rax
;-----------------------------------------------------------------------------------
getRandNum:
	;rdrand rax
	call getRand
	xor rdx, rdx
	div rdi
	mov rax, rdx
	inc rax
ret
;-----------------------------------------------------------------------------------
; getMax 
; description:      returns a the largest number passed into the function 
;
; precondition:     rdi, rsi, rdx, rcx, r8 and r9 have numbers in them
;
; postcondition:    rax has the largest value passed in above
;           
;
; return            rax has the largest value passed in above
;-----------------------------------------------------------------------------------
getMax:
	mov rax, rdi

	cmp rax, rsi
	jl rsiMax
	rsiXam:

	cmp rax, rdx
	jl rdxMax
	rdxXam:

	cmp rax, rcx
	jl rcxMax
	rcxXam:

	cmp rax, r8
	jl r8Max
	r8Xam:

	cmp rax, r9
	jl r9Max
	r9Xam:

	jmp maxExit
    
	rsiMax:
		mov rax, rsi
	jmp rsiXam
	rdxMax:
		mov rax, rdx
	jmp rdxXam
	rcxMax:
		mov rax, rcx
	jmp rcxXam
	r8Max:
		mov rax, r8
	jmp r8Xam
	r9Max:
		mov rax, r9
	jmp r9Xam

	maxExit:
ret
;-----------------------------------------------------------------------------------
; getMin 
; description:      returns a the smallest number passed into the function 
;
; precondition:     rdi, rsi, rdx, rcx, r8 and r9 have numbers in them
;
; postcondition:    rax has the smallest value passed in above
;           
;
; return            rax has the smallest value passed in above
;-----------------------------------------------------------------------------------
getMin:
	mov rax, rdi

	cmp rax, rsi
	jg rsiMin
	rsiNim:

	cmp rax, rdx
	jg rdxMin
	rdxNim:

	cmp rax, rcx
	jg rcxMin
	rcxNim:

	cmp rax, r8
	jg r8Min
	r8Nim:

	cmp rax, r9
	jg r9Min
	r9Nim:

	jmp minExit
    
	rsiMin:
		mov rax, rsi
	jmp rsiNim
	rdxMin:
		mov rax, rdx
	jmp rdxNim
	rcxMin:
		mov rax, rcx
	jmp rcxNim
	r8Min:
		mov rax, r8
	jmp r8Nim
	r9Min:
		mov rax, r9
	jmp r9Nim

	minExit:
ret
;-----------------------------------------------------------------------------------
; getAve 
; description:      returns the average of all numbers passed to it
;
; precondition:     rdi, rsi, rdx, rcx, r8 and r9 have numbers in them
;
; postcondition:    rax has the average of all values passed in above
;           
;
; return            rax has the average of all values passed in above
;-----------------------------------------------------------------------------------
getAve:
	xor rax, rax
	add rax, rdi
	add rax, rsi
	add rax, rdx
	add rax, rcx
	add rax, r8
	add rax, r9

	xor rdx, rdx
	mov rcx, 0x6
	div rcx
ret
