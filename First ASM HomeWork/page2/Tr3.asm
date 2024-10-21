IDEAL
MODEL small
STACK 100h
DATASEG
; ----------VARS----------

	X dw 2
	Y dw 4
	result dw 1

; ----------/VARS----------

CODESEG
start:
	mov ax, @data
	mov ds, ax
; ---------CODE-----------

	mov di,[Y]
	cmp di,0
	jz exit
	mov bx, [X]
	mov [result], 0
	outerLoopStart:
		mov si, 0
		loopStart:
			add	[result], bx
		inc si	
		cmp si,[X]
		jl loopStart
	dec di
	cmp di,0
	jg outerLoopStart

; ---------/CODE-----------

exit:
	mov ax, 4c00h
	int 21h
END start

