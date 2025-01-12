;NAME: Ithamar Baron
;DATE: 10/1/25
;Question 3: evaluate +/- string.
Data Segment
	
	string db "10-10+10="
	result dw 0
 
Data Ends
Code Segment
Assume Cs:Code, Ds:Data

Evaluate proc
mov bp,sp
mov si, [bp+2]
xor ax,ax ;stores result
xor dx,dx ;stores current number

push word ptr '+' ; we add the first number

start_calculation:
cmp [si], word ptr '='
je last_evaluation

; scan for full number 
scan_for_full_number:
mov bl,byte ptr [si]
cmp bl, word ptr '0'
jb encounter_operator ;NOT A NUMBER
xor bx,bx
;Gathering the number
	cmp dx, 0
	jz first_digit_in_current_num
	; we are adding a new dig so mul by 10.
	shl dx, 1  
	push dx ;temp save result
	shl dx, 2  
	pop bx
	add dx, bx 
first_digit_in_current_num:
	xor bx,bx
	mov bl, byte ptr [si]
	add dx, bx 
	xor bx,bx
	sub dx, word ptr '0'
	inc si; advance
	jmp start_calculation

encounter_operator:
pop bx ; bx stores opertor
xor cx, cx
mov cl, byte ptr [si]
push cx; push next operator
xor cx,cx
inc si ;advance
do_operator:
cmp bx, word ptr '-'
jne do_addition
	sub ax, dx
	xor dx,dx
	jmp start_calculation
	
do_addition:
	add ax, dx
	xor dx,dx
	jmp start_calculation

last_evaluation:
pop bx ; bx stores opertor
cmp bx, word ptr '-'
jne do_last_addition
	sub ax, dx
	jmp end_of_evaluation
do_last_addition:
	add ax, dx
	jmp end_of_evaluation
end_of_evaluation:

ret 2
Evaluate endp

start: 
Mov Ax,Data
Mov Ds,Ax
	
	lea si, string
	push si
	call Evaluate
	mov result, ax

Int 21h
Code Ends
End start
