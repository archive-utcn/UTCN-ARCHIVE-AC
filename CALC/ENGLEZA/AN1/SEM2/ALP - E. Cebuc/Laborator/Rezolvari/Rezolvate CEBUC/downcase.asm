INCLUDE macro.lib
;------------------------------------------------- 
; DATA section 
; data definitions 
;------------------------------------------------- 
DATA SEGMENT PARA PUBLIC 'DATA' 
	MSG1 DB "Input string=$"
	MSG2 DB "Output string=$"
	STR_SPACES DB 64 DUP(?)
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
	PRINT_STRING MSG1
	MOV BX, OFFSET STR_SPACES
	READ_CHARS:
		MOV AH, 01H
		INT 21H
		CMP AL, 0DH
		JE EXIT_READ
		CMP AL, 41H
		JL DONT_CONVERT
		CMP AL, 5AH
		JG DONT_CONVERT
		ADD AL, 20H
		DONT_CONVERT:
		MOV [BX], AL
		INC BX
		JMP READ_CHARS
	EXIT_READ:
	MOV [BX], "$"
	PRINT_STRING MSG2
	PRINT_STRING STR_SPACES
	MOV AH, 4CH	; exit program
	INT 21H
    RET   ; FAR return to DOS 
START  ENDP 
CODE ENDS 
END  START 