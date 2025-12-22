; draw sqares, colors 0=black, 1=blue, 2=green, 3=cyan, 4=red, 5=magenta, 6=orange, 7=light gray, 8=dark gray, 9=light blue
;------------------------------------------------- 
; DATA section 
; data definitions 
;------------------------------------------------- 
DATA SEGMENT PARA PUBLIC 'DATA' 
  x_start	dw	20
  x_end		dw	50
  y_start	dw	20
  y_end		dw	50
  colour 	db 	1	; starting colour
  var1		db 	7	; number of squares going down
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
	MOV AH, 00H ; display mode 320x200 color (graphic)
	MOV AL, 4
	INT 10H

; draw some squares
LOOPDOWN:
	mov al,colour	; colour goes in al
	mov ah,0ch
	mov cx, x_start	; start drawing lines along x
	drawhoriz:
		mov dx, y_end ; put point at bottom of the square
		int 10h
		mov dx, y_start ;put point on top of the square
		int 10h
		inc cx		; move to next point
		cmp cx, x_end	; check if we reached the end
		jne drawhoriz
	drawvert:	;(y value is already y_start)
		mov cx, x_start	 ; put point on left side
		int 10h
		mov cx, x_end	;put point  on right side
		int 10h
		inc dx	; move down to next point
		cmp dx, y_end			;check for end
		jne drawvert
	; change colour and coordinates
	ADD x_start, 20
	ADD x_end, 20
	ADD y_start, 20
	ADD y_end, 20
	INC colour
	DEC var1
	CMP var1, 0
	JNE LOOPDOWN
	
    RET   ; FAR return to DOS 
START  ENDP 
CODE ENDS 
END  START 