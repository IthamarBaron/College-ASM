
Data Segment
	
	N db 4
	message DB 'a',10,13,'$'

Data Ends
Code Segment
Assume Cs:Code, Ds:Data


start: 
Mov Ax,Data
Mov Ds,Ax
	
	mov cl,N
	xor ch,ch
loopStart:
		mov bl,0
	innerLoopStart:
		cmp bl,ch
		je innerLoopEnd
		
		MOV AH, 02h
		MOV DL, ' ' 
		INT 21h       

		inc bl
		jmp innerLoopStart
	innerLoopEnd:
	cmp ch,cl
	jge finish
	MOV AH, 09h
	LEA DX, message  
	INT 21h          
	inc ch
	jmp loopStart

finish:

Int 21h
Code Ends
End start