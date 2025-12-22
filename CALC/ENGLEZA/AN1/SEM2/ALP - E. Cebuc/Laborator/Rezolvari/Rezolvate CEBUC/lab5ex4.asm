; AX=7*AX-2*BX-BX/8
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
	MOV AX, 3
	MOV BX, 8
	MOV DX, AX ; store AX in DX
	SHL AX, 3 ; AX*8
	SUB AX, DX ; AX*8-AX = AX*7
	SHL BX, 1 ; BX*2
	MOV CX, BX
	SHR CX, 4; BX/8
	SUB AX, BX
	SUB AX, CX
	
    RET   ; FAR return to DOS 
START  ENDP 
CODE ENDS 
END  START 