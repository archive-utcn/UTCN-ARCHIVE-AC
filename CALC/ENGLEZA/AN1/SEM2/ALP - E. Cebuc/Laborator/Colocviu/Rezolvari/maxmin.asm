DATA SEGMENT PARA PUBLIC 'DATA'
	sir1 DW 1,4,9,12,6
	len1 DW $-sir1
	sir2 DW 5,6,7,8,2
	len2 DW $-sir2
	string1 DW 10 dup(?)
	string2 DW 10 dup(?)
	
DATA ENDS

CODE SEGMENT PARA PUBLIC 'CODE'
ASSUME CS:CODE, DS:DATA
START PROC FAR
	

	PUSH 	DS
	XOR 	AX,AX
	PUSH 	AX ; the initialization for the returning
	MOV 	AX,DATA
	MOV 	DS, AX ; the initialization of DS date segment
	
;MIN NR	
	
	MOV 	AX,0
	MOV		SI,0
	MOV		CX,len1
MIN1:
	CMP		AX,sir1[SI]
	JGE NEXT1
	MOV		AX,sir1[SI]
NEXT1:
	INC		SI
LOOP MIN1

	ADD		AX,'0'
	MOV		string1[0],AX
	
	MOV 	AX,0
	MOV		SI,0
	MOV		CX,len2
MIN2:
	CMP		AX,sir2[SI]
	JGE NEXT2
	MOV		AX,sir2[SI]
NEXT2:
	INC		SI
LOOP MIN2

	ADD		AX,'0'
	MOV		string1[1],AX
	ADD		string1[2],'$'

;MAX NR

	MOV 	AX,0
	MOV		SI,0
	MOV		CX,len1
MAX1:
	CMP		AX,sir1[SI]
	JLE NEXT3
	MOV		AX,sir1[SI]
NEXT3:
	INC		SI
LOOP MAX1

	ADD		AX,'0'
	MOV		string2[0],AX

	
	MOV 	AX,0
	MOV		SI,0
	MOV		CX,len2
MAX2:
	CMP		AX,sir2[SI]
	JLE NEXT4
	MOV		AX,sir2[SI]
NEXT4:
	INC		SI
LOOP MAX2
	
	ADD		AX,'0'
	MOV		string2[1],AX
	ADD		string2[2],'$'
	
	LEA 	DX, string1
	MOV 	AH, 09H
	INT 	21H	
	MOV		DH,0
	MOV		DL,10H
	MOV		AH,02H
	INT		21H
	MOV		DH,0
	MOV		DL,13H
	MOV		AH,02H
	INT		21H
	LEA 	DX, string2
	MOV 	AH, 09H
	INT 	21H	
	
	MOV 	AH,01H  ;asteapta o tasta
	INT 	21H   ;a
	
	RET
START ENDP
CODE ENDS
END START