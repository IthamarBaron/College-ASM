IDEAL
MODEL small
STACK 100h
DATASEG
; ----------VARS----------

	A dw 10
	B dw 15
	C dw 7
	MIN dw 0

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
    jg NotA        
    CMP ax, cx
    jg NotA        
    MOV [MIN], ax
    JMP exit       

NotA:
    CMP bx, ax
    jg NotB        
    CMP bx, cx
    jg NotB        
    MOV [MIN], bx
    JMP exit       

NotB:
    MOV [MIN], cx  

	

; ---------/CODE-----------

exit:
	mov ax, 4c00h
	int 21h
END start

