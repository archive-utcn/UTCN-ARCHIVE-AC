;------------------------------------------------- 
; DATA section 
; data definitions 
;------------------------------------------------- 
DATA SEGMENT PARA PUBLIC 'DATA' 
	SIR  DB 1,2,3,4 
	LGSIR  DB $-SIR  ;length of array 
	SUM  DB ?  ; place for sum 
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
;... ... the main program instructions 
;------------------------------------------------- 
	MOV CH,0 
	MOV CL,LGSIR  ; in CX the number of elements 
	MOV AL,0   ; initialize sum with zero 
	MOV SI,0   ; first element 
	NEXT: 
		ADD AL,SIR[SI] ; add of the current element 
		INC SI   ; next element 
		LOOP NEXT  ; Decrement CX and jump to next 
	; if CX differs from 0 
	MOV SUM,AL; store result in SUM 
    RET   ; FAR return to DOS 
START  ENDP 
CODE ENDS 
END  START 