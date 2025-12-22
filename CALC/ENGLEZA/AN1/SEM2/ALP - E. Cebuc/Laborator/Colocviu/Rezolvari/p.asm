;sa se eliina spatiile si taburile
; space = 20h tab09h
DATA	SEGMENT PARA PUBLIC 'DATA'
sir db 'a b		abc erf' 
leN Dw $-sir
sir2 db 20 dup(?)

DATA	ENDS
CODE		SEGMENT PARA PUBLIC 'CODE'
		ASSUME CS:CODE, DS:DATA
START:	MOV AX,DATA
		MOV DS,AX;Initializarea segmentului DS
		mov cx,len
		mov si,0
		mov di,0
	et: 
		cmp sir[si],20h
		je gata
		cmp sir[si],09h
		je gata
		mov al,sir[si]
		mov sir2[di],al
		inc di
		
gata: 
		inc si
		loop et
		
		
		
			MOV AH, 4CH	;terminarea programului 
		INT 21H
CODE		ENDS
END START