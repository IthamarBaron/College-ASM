IDEAL
MODEL small
STACK 100h
DATASEG
; ----------VARS----------

	A dw 4
	B dw 13
	result dw 0
	remainder dw 0

; ----------/VARS----------

CODESEG
start:
	mov ax, @data
	mov ds, ax
; ---------CODE-----------

; B / A
	mov bx, [B]
	mov ax, [A]
	mov [remainder], bx
	
	mov si, 0
	cmp bx,ax
	jl cantDiv
	loopStart:
		
		sub	[remainder], ax
		inc si	
	
	cmp [remainder] ,ax
	jge loopStart
	cantDiv:
	mov [result], si
	
; ---------/CODE-----------

exit:
	mov ax, 4c00h
	int 21h
END start

