;NAME: Ithamar Baron
;DATE: 10/1/25
;Question 1: count substring in string
Data Segment
	
	string db "aXabaab",0
	subString db "ab",0
 
Data Ends
Code Segment
Assume Cs:Code, Ds:Data

CountSubString proc
mov bp,sp
mov si,[bp+2] ;original string
mov di,[bp+4] ;sub string
xor ax,ax



loop_input:
cmp byte ptr[si],0
je finish
	;bl - current char in String
	;dl - current char in SubString
	mov bl, [si]
	mov dl, [di]

	cmp dl,bl
	jne skip
	;test full string
	inc di
	mov dl, byte ptr[di]
	cmp dl, 0
	je found_sub_string
	inc si;advance
	jmp loop_input
		
skip:
	cmp byte ptr [si], 'a'
	je dont_advance
		inc si;advance
	dont_advance:
	mov di,[bp+4] ;reset substring ptr
	jmp loop_input

;handle finding substring
found_sub_string:
	inc ax
	inc si;advance
	mov di,[bp+4] ;reset substring ptr
	
	jmp loop_input

finish:

ret 2*2
CountSubString endp


start: 
Mov Ax,Data
Mov Ds,Ax

	;lea bx, string
	;lea si, subString
	
	push offset substring
	push offset string
	call CountSubString
	
Mov Ax,Data
Mov Ds,Ax
	


Int 21h
Code Ends
End start
