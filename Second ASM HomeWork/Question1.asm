Data Segment
	arr dw 1,2,2,3,3,3,4,4,4,4,3,3,3,3 ; MUST n in array < array length
	len_arr = $-arr
	holding dw len_arr dup(0)
	result dw 2 dup(0) ;Result[0] => amount in arr, Result[1] => most common number
Data Ends
Code Segment
Assume Cs:Code, Ds:Data
start: 
	Mov Ax,Data
	Mov Ds,Ax
	
	lea Si, arr
	mov Cx, len_arr
	
setup:
	mov Di,[Si]
	add Di,Di
	inc holding[Di]
	add Si, 2
	dec Cx
loop setup
	
	lea Si, holding
	mov Cx, len_arr
	mov Ax, [si] ; max
	xor Bx,Bx
	xor Dx,Dx
search:
		inc bx
		add Si,2
		cmp [Si], Ax
		jle dont_change
		mov Ax, [Si]
		mov Dx,Bx
	dont_change:
		dec Cx
		loop search
temp:	
	mov result[0], Ax
	mov result[2], Dx
	jmp temp
	Mov Ax,4C00h
	Int 21h
Code Ends
End start
