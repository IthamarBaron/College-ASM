
Data Segment
	
	string db "a bb cc "
	stringLength = $ - string

Data Ends
Code Segment
Assume Cs:Code, Ds:Data

; on start BX,SI point to the start of the word.
; SI advances to the next delimiter, 
; on hit (found delimiter) SI swaps delimiter with $ for print 
; print using BX 
; mov bx to point to the start of the next word


start: 
Mov Ax,Data
Mov Ds,Ax
Mov Es, Ax

	cld             
	lea di, string
	mov  bx, di
	MOV  CX, stringLength   
search:
	MOV  AL, ' '
	REPNE SCASB      
	JnZ  not_found  
    ; found
	dec di
	mov [di], byte ptr '$'
	

	MOV DX, BX
	MOV AH, 09h
	INT 21h 

	;/n
	MOV DL, 0Dh
	MOV AH, 02h
	INT 21h
	;/r
	MOV DL, 0Ah
	MOV AH, 02h
	INT 21h
	
	inc di
	mov bx, di
	
jmp search

not_found:
mov ax, 4c00h
Int 21h
Code Ends
End start