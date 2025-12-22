;------------------------------------------------- 
; DATA section 
; data definitions 
;------------------------------------------------- 
DATA SEGMENT PARA PUBLIC 'DATA' 
mesaj db 'average : $'
mesaj1 db 'cititi un numar :$' 
mesaj2 db 'rest : $'
cons db 3
aux db ?
aux1 db ?
DATA ENDS 
;------------------------------------------------- 
; STACK section 
;------------------------------------------------- 
STCK SEGMENT PARA STACK 'stack' use16
	DB 64 DUP ('my_stack')	; reserve 256 bytes for stack
STCK ENDS
;------------------------------------------------- 
; CODE section 
;------------------------------------------------- 
CODE SEGMENT PARA PUBLIC 'CODE' 
ASSUME CS:CODE, DS:DATA 
START  PROC FAR 
	PUSH DS 
	XOR AX,AX 
	PUSH AX 
	MOV AX,DATA 
	MOV DS,AX 
;------------------------------------------------- 
mov cx , 3
xor ax, ax
xor bx, bx
citeste :
lea dx,mesaj1
mov ah,09h
int 21h

mov ah,01h
int 21h
add bl, al

loop citeste

mov al, bl
cbw 
div cons

mov aux, ah
mov aux1, al

lea dx , mesaj
mov ah , 09h
int 21h

mov dl , aux1
mov ah, 02h
int 21h

lea dx , mesaj2
mov ah , 09h
int 21h

mov dl , aux
mov ah , 02h
int 21h

;------------------------------------------------- 
    RET   ; FAR return to DOS 
START  ENDP 
CODE ENDS 
END  START 