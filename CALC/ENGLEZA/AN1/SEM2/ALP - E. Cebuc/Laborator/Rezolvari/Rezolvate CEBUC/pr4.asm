;AX=7*AX-2*BX-BX/8
STCK SEGMENT PARA STACK 'stack' use16
	DB 64 DUP ('my_stack')	; reserve 256 bytes for stack
STCK ENDS

DATA SEGMENT PARA PUBLIC 'DATA' 

DATA ENDS 

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
	XOR AX,AX ; clear AX
	MOV AX,4 ; give value to AL
	MOV BX,AX
	SHL AX,1
	SHL AX,1
	SHL AX,1
	SUB AX,BX
	MOV BX,16
	MOV CX,BX
	SHL BX,1
	SUB AX,BX
	MOV BX,CX
	SHR BX,1
	SHR BX,1
	SHR BX,1
	SUB AX,BX
	
	
    RET   ; FAR return to DOS 
START  ENDP 
CODE ENDS 
END  START