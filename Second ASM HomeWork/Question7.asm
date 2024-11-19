Data Segment
	
	coefficients db 5,2,1,4
	N = $ - coefficients
	sum dw 0
	X = 2
Data Ends
Code Segment
Assume Cs:Code, Ds:Data
start: 
Mov Ax,Data
Mov Ds,Ax
	
	xor ax,	ax
	mov al, coefficients[0]
	add sum, ax
	
	mov si,	1
	mov cx,	N-1

loop_over_c:
	xor dx,	dx
	mov ax,	sum
	mov bx,	X
	mul	bx
	mov sum, ax
	add sum, dx ; since mul -> DX:AX 
	xor bx,bx
	mov bl,	coefficients[si]
	add sum, bx
	inc si
loop loop_over_c

	
Mov Ax,4C00h
Int 21h
Code Ends
End start
