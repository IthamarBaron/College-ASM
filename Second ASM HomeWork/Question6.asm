Data Segment
	
	num1 db 0, 0, 0, 0, 0, 0, 5, 6, 7, 8, 9, 0, 2, 3, 4, 5
	num2 db 0, 0, 0, 0, 0, 0, 5, 6, 7, 8, 9, 0, 2, 3, 4, 5
	num3 dw 16 dup(0)
Data Ends
Code Segment
Assume Cs:Code, Ds:Data
start: 
Mov Ax,Data
Mov Ds,Ax

mov si,15
mov di,30
xor ax,ax
xor bx,bx
addition_loop:
	mov al, num1[si]
	add al, num2[si]
	add al,bl 	; handle carry from last time
	mov bl,0	;reset carry for next time
	cmp al,10
	JB no_carry
	sub	al,10
	mov bl,1
	no_carry:
	mov num3[di], ax
	sub di,2
	dec si
cmp si,-1
jge addition_loop
	
Mov Ax,4C00h
Int 21h
Code Ends
End start
