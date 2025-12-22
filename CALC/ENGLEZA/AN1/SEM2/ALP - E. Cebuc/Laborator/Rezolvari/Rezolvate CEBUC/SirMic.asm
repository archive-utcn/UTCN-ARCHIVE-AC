STCK	SEGMENT PARA STACK 'stack' use16
	DB		64 DUP ('my_stack')	; reserve 256 bytes for stack
STCK	ENDS


DATA1	SEGMENT PARA PUBLIC 'DATA' use16
MSG DB "sir cu MAJUSCULE$"
LGSIR DW $-MSG
MSGCIT DB 100 Dup (?)
LGCIT DW ?
DATA1	ENDS

COD1	SEGMENT PARA PUBLIC 'CODE' use16

MICIT MACRO
LOCAL final
MOV AX,[BX]
CMP AL,'A'
JB final
CMP AL,'Z'
JG final
ADD AL,20h
MOV [BX],AL
final:
INC BX
ENDM


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
MICIT
loop parcurge

MOV DX,OFFSET MSGCIT ; print sir
MOV AH,09h
INT 21h
RET			; return to OS

MAIN	ENDP


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
MOV [BX],'$'
inc BX
MOV LGCIT,BX




ret
CITIRE endp
COD1	ENDS
			END	MAIN