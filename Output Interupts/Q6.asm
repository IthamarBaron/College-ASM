Data Segment
	
	N db 4
	nl DB 10,13,'$'

Data Ends
Code Segment
Assume Cs:Code, Ds:Data

start: 
    Mov Ax, Data
    Mov Ds, Ax
	
    mov cl, N
    inc cl
    mov ch, 1
loopStart:
    cmp ch, cl
    je finish

    mov bl, cl
    sub bl, ch
spaceLoop:
    cmp bl, 0
    je charLoop
    MOV AH, 02h
    MOV DL, ' '
    INT 21h
    dec bl
    jmp spaceLoop

charLoop:
    xor bl, bl
printStars:
    MOV AH, 02h
    MOV DL, '*' 
    INT 21h 
    inc bl
    cmp bl, ch
    jne printStars

    MOV AH, 09h
    LEA DX, nl  
    INT 21h          

    inc ch
    jmp loopStart

finish:
    Int 21h
Code Ends
End start
