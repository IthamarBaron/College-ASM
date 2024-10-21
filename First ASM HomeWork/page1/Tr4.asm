IDEAL
MODEL small
STACK 100h
DATASEG
; ----------VARS----------

	A dw 10
	B dw 15
	C dw 7
	FLAG db 0

; ----------/VARS----------

CODESEG
start:
	mov ax, @data
	mov ds, ax
; ---------CODE-----------

	mov ax, [A]
	add ax, [B]
	cmp ax, [C]
	jle exit
	
	mov ax, [A]
	add ax, [C]
	cmp ax, [B]
	jle exit
	
	mov ax, [B]
	add ax, [C]
	cmp ax, [A]
	jle exit
	
	mov [FLAG], 1
; ---------/CODE-----------

exit:
	mov ax, 4c00h
	int 21h
END start

