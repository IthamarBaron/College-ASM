Data Segment
	string db "cccacccac$"

	subString db "ab$"
	replacement db "AB$"
	tempResult db ?

Data Ends
Code Segment
Assume Cs:Code, Ds:Data

;first param string [bp+2]
;second param subString [bp+4]
;third param replacement [bp+6]
FindAndReplace proc
mov bp,sp
	xor cx,cx; index of search

	mov si, [bp+2]; offset of original string
	mov di, [bp+4]; offset of substring
	mov bx, [bp+6]; offset of replaacment
	
ret 3*2
FindAndReplace endp


LengthOfStr proc
mov bp,sp
push si
	mov si, [bp+2]; offset of original string
	mov ax,1
iterate1:
		cmp [si], byte ptr "$"
		je finish1
		inc si
		inc ax
		jmp iterate1
finish1:
pop si
ret 2
LengthOfStr endp

;first param string [bp+2]
;second param subString [bp+4]
FindFirstSubString proc
mov bp,sp

	mov si, [bp+2] ;addr of String
	mov di, [bp+4] ;addr of substring

	xor ax,ax
	xor bx,bx
	;bx index of str / ax index of substring
	xor cx,cx
	;cl used as the index of the starting appearence of substring
	mov cl,-1
	;ch flag if found

iterate:
	cmp ch,0
	jnz finish
	add si,bx
	cmp [si], byte ptr "$"
	pushf
	sub si,bx
	popf
	je finish
		add di,ax
		mov dl, [di] ; char of substring
		sub di, ax
		add si,bx
		cmp [si],dl
		pushf
		sub si,bx
		popf
		jne notStartOfSubString
			mov cl, bl ; save original starting index
			;loop over to see if the rest of the substring is here
loopOverSubstring:
			add si,bx
			cmp [si], byte ptr "$";reached end of string
			pushf
			sub si,bx
			popf
			je loopEnd
			cmp ch,1;we found the full substring
			jz loopEnd
				add di,ax
				mov dl, [di] ; char of substring
				sub di,ax
				add si, bx
				cmp [si],dl
				pushf
				sub si,bx
				popf
				jne loopEnd
				;if we have a match: advance both by 1
				inc	bx
				inc ax
				;if we reach the end of the substring at this point then we found the full substring
				add di,ax
				cmp [di],byte ptr"$"
				pushf
				sub di,ax
				popf
				jne loopOverSubstring
				mov ch,1; we found we can end it
loopEnd:
			cmp ch,1; meaning we found it
			jz finish
			xor al,al
			jmp	iterate
			;the substring starts at <cl>
notStartOfSubString:
	mov cl,-1
	inc bx
	jmp iterate

finish:
		xor ch,ch
		mov ax,cl;returning first index in ax
ret 2*2
FindFirstSubString endp

start:
	Mov Ax,Data
	Mov Ds,Ax

	push offset substring
	push offset string
	call FindFirstSubString

	Mov Ax,4C00h
	Int 21h
Code Ends
End start