IDEAL
MODEL small
STACK 100h
DATASEG
; ----------VARS----------

	A dw 6
	B dw 4
	result dw ?

; ----------/VARS----------

CODESEG
start:
	mov ax, @data
	mov ds, ax
; ---------CODE-----------

    mov ax, [A]    
    mov bx, [B]    

loopStart:
	cmp bx, 0      
	je found
	
		xor dx, dx  
		div bx          ; div AX by BX (AX = AX / BX, DX = AX % BX)
		
		mov ax, bx     
		mov bx, dx     

	jmp loopStart   

found:
    mov [result], ax 

	
; ---------/CODE-----------

exit:
	mov ax, 4c00h
	int 21h
END start

