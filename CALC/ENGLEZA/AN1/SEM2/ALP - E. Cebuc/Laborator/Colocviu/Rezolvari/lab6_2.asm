DATA SEGMENT PUBLIC 'DATA'
	string 	DB 	1,2,3,4,5,6,7,8,9
DATA ENDS

DATA1 segment public 'DATA'
	string1 db	10 dup ('$')
	pos		dw	02H
	len		dw	04H
DATA1 ENDS

CODE SEGMENT PARA PUBLIC 'CODE'
 START PROC FAR
	ASSUME CS: CODE, DS:DATA, ES:DATA1

	PUSH 	DS
	XOR 	AX, AX
	PUSH 	AX
	
	MOV 	AX,DATA1
	MOV 	ES,AX
	Mov 	AX,DATA
	MOV 	DS,AX
	MOV 	CX,len
	MOV 	SI,pos
	MOV 	DI,0
NEXT:
	MOV 	BL,string[SI]
	MOV 	string1[DI],BL
	INC 	SI
	INC 	DI
LOOP NEXT
	
RET
START ENDP
CODE ENDS
END START	

