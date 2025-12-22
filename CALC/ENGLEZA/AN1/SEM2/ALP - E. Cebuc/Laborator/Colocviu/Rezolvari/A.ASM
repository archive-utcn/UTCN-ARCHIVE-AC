DATA    SEGMENT PARA PUBLIC 'DATA'
sir dw -10,100,-350,-1,0,10,12,150,-35,-45
lsir dw $-sir
sirp dw 10 dup(0)
sirn dw 10 dup(0)
DATA    ENDS
CODE        SEGMENT PARA PUBLIC 'CODE'
        ASSUME CS:CODE, DS:DATA
START:    MOV AX,DATA
    MOV DS,AX;Initializarea segmentului DS
    mov si,0
    mov di,0
    mov dx,0
    mov cx,lsir
    shr cx,1 
et: mov ax,sir[si]
    cmp ax,0
    jl negativ
    mov sirp[di],ax
    add di,2
    jmp sfarsit
negativ:
    mov sirn[bx],ax
    add bx,2
    sfarsit:
    add si,2
loop et

        MOV AH, 4CH    ;terminarea programului 
        INT 21H
CODE        ENDS
END START