;extrn DELETECH:far
STCK	SEGMENT PARA STACK 'stack' use16
	DB		64 DUP ('my_stack')	; reserve 256 bytes for stack
STCK	ENDS


DATA1	SEGMENT PARA PUBLIC 'DATA' use16
MSG DB "sir cu spatii$"
LGSIR DW $-MSG
MSGCIT DB 100 Dup (?)
LGCIT DW ?
DOLLAR DB "$"
DATA1	ENDS

COD1	SEGMENT PARA PUBLIC 'CODE' use16

MAIN		PROC	FAR		; main proc MUST be FAR
ASSUME	CS:COD1,DS:DATA1,SS:STCK

PUSH	DS		;save DS on stack for OS return
XOR	AX,AX		;
PUSH	AX		;put 0 on stack for OS return
MOV	AX,DATA1
MOV	DS,AX		;load data Segment register

DEC CX
CALL near ptr CITIRE
MOV BX,OFFSET MSGCIT
MOV CX,LGCIT
parcurge:
MOV AX,[BX]
CMP al,' '
jne cont
CALL near ptr DELETECH
cont:
inc bx
loop parcurge

MOV DX,OFFSET MSGCIT ; print sir
MOV AH,09h
INT 21h
RET			; return to OS

MAIN	ENDP
DELETECH proc near 
		
		;POP BX
		MOV DX,BX
		PUSH CX
		PUSH BX
		muta:
		MOV AX,[bx+1]
		MOV [BX],AX
	    INC BX
		loop muta
		MOV BX,DX
		POP BX
		POP CX
		DEC CX
	ret
DELETECH endp

CITIRE proc near
LEA BX,MSGCIT
starting:
MOV AH,01h
INT 21h
CMP AL,13
JE ending
MOV [BX],AL
inc bx
JMP starting
ending:
MOV AL, DOLLAR
MOV [BX], AL
inc BX
MOV LGCIT,BX




ret
CITIRE endp
COD1	ENDS
			END	MAIN
