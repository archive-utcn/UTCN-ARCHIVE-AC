;------------------------------------------------- 
; DATA section 
; data definitions 
;------------------------------------------------- 
DATA SEGMENT PARA PUBLIC 'DATA' 
	TEN DB 10
	VAR1 DB 0
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
	XOR DX, DX
	XOR CX, CX
	XOR AX, AX
	XOR BX, BX
	READ_DIGITS:
		MOV AH, 01H
		INT 21H
		CMP AL, 0DH
		JE EXIT_READ
		MOV AH, 0
		SUB AX, 30H ; convert character to digit
		PUSH AX	; push digit to stack
		INC CX
		JMP READ_DIGITS
	EXIT_READ:
		POP AX
		ADD DX, AX	; add last digit read
		DEC CX
		INC VAR1
		CMP CX, 0
		JE EXIT
		CONVERT:	; add remaining digits
			MOV AX, 1
			MOV BL, VAR1
			MULTIPLY:
				MUL TEN
				DEC BL
				CMP BL, 0
			JNE MULTIPLY
			POP BX
			MUL BL
			ADD DX, AX
			INC VAR1
		LOOP CONVERT
	EXIT:
	MOV AH, 4CH	; exit program
	INT 21H
    RET   ; FAR return to DOS 
START  ENDP 
CODE ENDS 
END  START 