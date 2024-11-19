Data Segment
	string db "12321895"
	D_B db ?
Data Ends
Code Segment
Assume Cs:Code, Ds:Data
start: 
Mov Ax,Data
Mov Ds,Ax
	
	lea si, string
	mov cx,8
	xor ax,ax
loop1:
		mov bl,[si]
		sub bl, byte ptr '0'
		add al, bl
		inc si
loop loop1
	mov D_B, al
	
		
	
Mov Ax,4C00h
Int 21h
Code Ends
End start
