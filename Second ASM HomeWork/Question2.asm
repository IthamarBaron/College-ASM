Data Segment
	arr db 10,20,30,40
	len_arr = $-arr
	DELTA dw len_arr dup(0) ; used words since they are presented nicer in the turbo debuger
	avg db 0

Data Ends
Code Segment
Assume Cs:Code, Ds:Data
start: 
Mov Ax,Data
Mov Ds,Ax
	
;calculate sum
	lea si,arr
	mov cx,len_arr
	xor ax,ax
sum_loop:
	add al, [si]
	inc si
loop sum_loop

;calculate avg
	mov cx, len_arr
	div byte ptr cl
	mov avg, al

;calculate delta for each and place in DELTA
	lea si, arr
	lea di, DELTA
delta_loop:
	mov al, avg
	mov dl, [si]
	sub dl, avg
	mov [di], word ptr dl
	inc si
	add di,2
loop delta_loop
	
	
Mov Ax,4C00h
Int 21h
Code Ends
End start
