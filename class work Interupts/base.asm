
Data Segment
	
	message1 db 'Enter First Number: $'
	message2 db 13, 10,'Enter Second Number: $'
	X db ?
	Y db ?
 
Data Ends
Code Segment
Assume Cs:Code, Ds:Data


start: 
Mov Ax,Data
Mov Ds,Ax
	
	;print first message
	mov ah,09h
	mov dx, offset message1
	int 21h
	
	;input first num
	mov ah,01h
	int 21h
	sub al, '0'
	mov x,al
		
	;print Second message
	mov ah,09h
	mov dx, offset message2
	int 21h
	
	;input Second num
	mov ah,01h
	int 21h
	sub al, '0'
	mov Y,al
	



	;graphics mode:
	mov ah,0
	mov al,13h
	int 10h	;graphics mode:


xor di,di
mov di,word ptr Y        

;outer loop
outer_loop:
	cmp di,0
	jle outer_end
	xor ax, ax
	mov al, x
	mov si,ax       
inner_loop:	
	cmp si,0
	jle inner_end

	add si, 180
	add di,	100
	;pixel
    mov ah, 0ch ;proc
	mov al, 0bh ;color
	mov cx, si;x
	mov dx, di;y
	int 10h
	sub si, 180
	sub di,	100
	
	dec si
	jmp inner_loop
inner_end:

	dec di
	jmp outer_loop
outer_end:
Int 21h
Code Ends
End start