;NAME: Ithamar Baron
;DATE: 10/1/25
;Question 4: Convert Bin string to Dec.
Data Segment
	
	string db '1010111011101000'
	result dw 0
 
Data Ends
Code Segment
Assume Cs:Code, Ds:Data

BinToInt proc
mov bp,sp
mov si, [bp+2]
xor ax,ax ;stores result

mov cx, 16 ;amount of bits
scan_full_number:

	xor dx,dx ;stores current number
	mov dl, byte ptr [si]
	sub dl, '0'
	dec cl
	shl dx, cl
	inc cl
	add ax, dx ;add to total
	inc si

loop scan_full_number

ret 2
BinToInt endp

start: 
Mov Ax,Data
Mov Ds,Ax
	
	lea si, string
	push si
	call BinToInt
	mov result, ax

Int 21h
Code Ends
End start
