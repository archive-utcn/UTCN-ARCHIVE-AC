;------------------------------------------------- 
; DATA section 
; data definitions 
;------------------------------------------------- 
DATA SEGMENT PARA PUBLIC 'DATA' 

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
;... ... the main program's instructions 
;------------------------------------------------- 
READCH:
	MOV AH, 01H	; read character from stdin
	INT 21H
	CMP AL, '0'
	JZ READSTP
	MOV DL, AL
	SUB DL, 20H	; transform small letter in CAPS
	MOV AH, 02H
	INT 21H
	JMP READCH ; read until 0 is entered
READSTP:
	MOV AH, 4CH	; exit program
	INT 21H
    RET   ; FAR return to DOS 
START  ENDP 
CODE ENDS 
END  START 