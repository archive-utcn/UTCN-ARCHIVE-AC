DATA SEGMENT PARA PUBLIC 'DATA'
MEM8 DB 39
DATA ENDS

CODE SEGMENT PARA PUBLIC 'CODE'
START PROC FAR 
ASSUME CS:CODE, DS:DATA
PUSH DS
XOR AX,AX
PUSH AX
MOV AX, DATA
MOV DS, AX

;MY PROGRAM'S INSTRUCTIONS

	MOV AL, 26 ;load al 			26 26
	INC AL ;increment al			 1 1
	ADD AL, 76 ;add immediate date	 76 76
									; ---- ----
									; 103 103
	ADD AL, MEM8;add memory 39 39
						; ---- ----
						; 142 -114+OF
	MOV AH, AL ;copy to ah 142
	ADD AL, AH ;add register 142
						; ----
						; 28

	MOV AH, 004CH ;TERMINATE PROGRAM
	INT 21H
				
RET
START ENDP
CODE ENDS
END START
