IDEAL
MODEL small
STACK 100h
DATASEG
; ----------VARS----------

	A dw 10
	B dw 20
	FA dw 0
	FB dw 0

; ----------/VARS----------

CODESEG
start:
	mov ax, @data
	mov ds, ax
; ---------CODE-----------

	CMP [A], -12
	jl notInRange1
	CMP [A], 29
	jg notInRange1
	MOV [FA], 1
	
notInRange1:
	
	CMP [B], -100
	jl exit
	CMP [B], 100
	jg exit
	MOV [FB], 1

; ---------/CODE-----------

exit:
	mov ax, 4c00h
	int 21h
END start

