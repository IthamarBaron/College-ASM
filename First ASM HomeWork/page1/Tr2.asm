IDEAL
MODEL small
STACK 100h
DATASEG
; ----------VARS----------

	A dw 10
	B dw 15
	C dw 7
	MAX dw 0

; ----------/VARS----------

CODESEG
start:
	mov ax, @data
	mov ds, ax
; ---------CODE-----------

	MOV ax,[A]
	MOV bx,[B]
	mov cx,[C]

	CMP ax, bx
	Jl NotA
	CMP ax, cx
	jl NotA
	mov [MAX], ax;
	
NotA:
	CMP bx, ax
	Jl NotB
	CMP bx, cx
	jl NotB
	mov [MAX], bx;
	
NotB:
	CMP cx, ax
	Jl exit
	CMP cx, bx
	jl exit
	mov [MAX], cx;
	

; ---------/CODE-----------

exit:
	mov ax, 4c00h
	int 21h
END start

