; calculate 2^(1/3)
;------------------------------------------------- 
; DATA section 
; data definitions 
;------------------------------------------------- 
DATA SEGMENT PARA PUBLIC 'DATA' \
	THREE DD 3.0 
	REZULTAT DQ ?
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
	FINIT ; init coprocessor 
	
	FLD1 ; load 1.0 onto the stack
	FDIV THREE ; compute 1/3
	F2XM1 ; 2^(1/3)-1.0
	FLD1 ; load 1.0 onto the stack
	FADD ; 2^(1/3)-1.0+1.0
	FSTP REZULTAT; pop result from stack
	FWAIT ;synchronize with processor
	
    RET   ; FAR return to DOS 
START  ENDP 
CODE ENDS 
END  START 