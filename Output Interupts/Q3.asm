
Data Segment
	
	N db 4
	nl DB 10,13,'$'

Data Ends
Code Segment
Assume Cs:Code, Ds:Data


start: 
Mov Ax,Data
Mov Ds,Ax
	
	mov cl,N
	inc cl
	mov ch,1
loopStart:
	cmp ch,cl
	je finish

	mov bl,1
	paddingLoop:
	cmp bl,ch
	jae paddingEnd
		
		MOV AH, 02h
		MOV DL, '-' 
		int 21h
		
	inc bl
	jmp paddingLoop
	paddingEnd:
	
	xor bl,bl
	charLoop: ; print the chars
		MOV AH, 02h
		MOV DL, 'a' 
		add dl,bl
		INT 21h 
		inc bl
		cmp bl,ch
		jne charLoop

		
	MOV AH, 09h
	LEA DX, nl  
	INT 21h          

	inc ch
	jmp loopStart

finish:

Int 21h
Code Ends
End start