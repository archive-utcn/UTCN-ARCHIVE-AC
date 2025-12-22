;------------------------------------------------- 
; DATA section 
; data definitions 
;------------------------------------------------- 
DATA SEGMENT PARA PUBLIC 'DATA' 
	TEN DB 10
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

PRINT_DIGIT MACRO DIGIT
	XOR DX, DX
	ADD DL, DIGIT
	ADD DL, 30H
	MOV AH, 02H
	INT 21H
ENDM


PRINT_DIGIT_PROC PROC
	ADD DL, 30H
	MOV AH, 02H
	INT 21H
	RET
PRINT_DIGIT_PROC ENDP	

START  PROC FAR 
	PUSH DS 
	XOR AX,AX 
	PUSH AX 
	MOV AX,DATA 
	MOV DS,AX 
	
	
;------------------------------------------------- 
;... ... the main program's instructions 
;------------------------------------------------- 
	MOV AX, 193
	XOR CX, CX
	
	GET_DIGITS:
		CMP AX, 0
		JE PRINT_NUMBER
		DIV TEN
		MOV DL, AH
		PUSH DX	; push digit to stack
		MOV AH, 0
		INC CL
		JMP GET_DIGITS
	
	PRINT_NUMBER:
		;POP BX	; pop digit from stack
		;PRINT_DIGIT BL
		POP DX
		CALL PRINT_DIGIT_PROC
	LOOP PRINT_NUMBER
	MOV AH, 4CH	; exit program
	INT 21H
    RET   ; FAR return to DOS 
START  ENDP 
CODE ENDS 
END  START 