;------------------------------------------------- 
; DATA section 
; data definitions 
;------------------------------------------------- 
DATA SEGMENT PARA PUBLIC 'DATA' 
	MESSAGE db 'The average is: ','$'
	SIR DB 8, 10, 10
	LGSIR  DB $-SIR  ;length of array 
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
	MOV CH,0 
	MOV CL,LGSIR  ; in CX the number of elements 
	MOV AX,0   ; initialize sum with zero 
	MOV SI,0   ; first element 
	NEXT: 
		ADD AL,SIR[SI] ; add of the current element 
		INC SI ; next element 
		LOOP NEXT  ; Decrement CX and jump to next if CX differs from 0 
	DIV LGSIR ; compute average

    ;MOV DX,offset MESSAGE ; print text
	LEA DX, MESSAGE
	MOV AH, 09H
	INT 21H
	MOV AH, 02H	; print digit
	MOV DL, AL ; move average into DL
	ADD DL, 30H ; convert digit to its corresponding ascii character
	INT 21H
	MOV AH, 4CH	; exit program
	INT 21H
    RET   ; FAR return to DOS 
START  ENDP 
CODE ENDS 
END  START 