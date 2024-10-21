IDEAL
MODEL small
STACK 100h
DATASEG
; ----------VARS----------

	A dw 4
	B dw 3
	result dw 0

; ----------/VARS----------

CODESEG
start:
	mov ax, @data
	mov ds, ax
; ---------CODE-----------
	mov bx, [B]
	mov [result], bx
	
	
	mov si, 1
	loopStart:
		
		add	[result], bx
		
	inc si	
	cmp si,[A]
	jl loopStart
	mov ax,[result]
	
; ---------/CODE-----------

exit:
	mov ax, 4c00h
	int 21h
END start

