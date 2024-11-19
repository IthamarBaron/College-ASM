Data Segment
	arr1 db 5,7,9
	len1 = $-arr1
	arr2 db 0,1,2,3,4,6,8
	len2 = $-arr2
	resultArray dw (len1+len2) dup(?)
Data Ends
Code Segment
Assume Cs:Code, Ds:Data
start: 
Mov Ax,Data
Mov Ds,Ax
	
	mov si, 0
	mov di, 0
	mov bx,	0
	xor ax,ax
	xor dx,dx
	mov cx, len1+len2
merge_loop:
	cmp si,len1
	JE merge_arr2
	cmp di,len2
	JE merge_arr1
	
	mov al, arr1[si]
	mov dl, arr2[di]
	cmp al,	dl
	jg dl_is_larger
	mov resultArray[bx], ax
	add si,1
	add bx,2
	jmp next
dl_is_larger:
	mov resultArray[bx],dx
	add di,1
	add bx,2
next:
loop merge_loop
jmp EOF

merge_arr1:
	mov al, arr1[si]
	mov resultArray[bx],ax
	add bx,2
	inc si
	cmp si,len1
	JBE merge_arr1

jmp EOF

merge_arr2:
	mov al, arr2[di]
	mov resultArray[bx],ax
	add bx,2
	inc di
	cmp di,len2
	JBE merge_arr2
EOF:
Mov Ax,4C00h
Int 21h
Code Ends
End start
