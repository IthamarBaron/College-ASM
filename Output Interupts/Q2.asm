
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
	OR ch,1
	AND ch,1
loopStart:
	cmp ch,cl
	je finish
		MOV AH, 09h
		LEA DX, message  
		INT 21h     
	inc ch
	jmp loopStart

finish:

Int 21h
Code Ends
End start