Data Segment
	string db "S3k1i1b5id7i _ R9i1Z3z5L6e7r",0
	string_length = $ - string
	result dw 2 dup(0)
Data Ends
Code Segment
Assume Cs:Code, Ds:Data
start: 
Mov Ax,Data
Mov Ds,Ax
	
	lea si, string
	xor ax,	ax
scan_loop:
		mov al, [si]
		cmp al, 'A'
		jb end_check
		cmp al, 'Z'
		ja not_capital
		inc result[0]	
		jmp end_check
	not_capital:	
		cmp al, 'a'
		jb end_check
		cmp al,'z'
		ja end_check
		inc result[2]
	end_check:
		inc si
	cmp [si],byte ptr 0
	jnz scan_loop
		
	
Mov Ax,4C00h
Int 21h
Code Ends
End start
