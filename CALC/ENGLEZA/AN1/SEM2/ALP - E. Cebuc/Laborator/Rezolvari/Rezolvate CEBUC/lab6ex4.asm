;------------------------------------------------- 
; DATA section 
; data definitions 
;------------------------------------------------- 
DATA SEGMENT PARA PUBLIC 'DATA' 
	LOOPNR DW 5
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

MOV     BX,0FH             ; Frequency value.

BIG_LOOP:
	MOV     DX,6000          ; Number of times to repeat whole routine.
	MOV     AL, 10110110B    ; The Magic Number (use this binary number only)
	OUT     43H, AL          ; Send it to the initializing port 43H Timer 2.
	NEXT_FREQUENCY:          ; This is were we will jump back to 2000 times.
	MOV     AX, BX           ; Move our Frequency value into AX.
	OUT     42H, AL          ; Send LSB to port 42H.
	MOV     AL, AH           ; Move MSB into AL  
	OUT     42H, AL          ; Send MSB to port 42H.
	IN      AL, 61H          ; Get current value of port 61H.
	OR      AL, 00000011B    ; OR AL to this value, forcing first two bits high.
	OUT     61H, AL          ; Copy it to port 61H of the PPI Chip
							 ; to turn ON the speaker.
	MOV     CX, 300          ; Repeat loop 100 times
	DELAY_LOOP:              ; Here is where we loop back too.
	LOOP    DELAY_LOOP       ; Jump repeatedly to DELAY_LOOP until CX = 0
	ADD     BX, 1            ; Incrementing the value of BX lowers 
							 ; the frequency each time we repeat the
							 ; whole routine
	DEC     DX               ; Decrement repeat routine count
	CMP     DX, 0            ; Is DX (repeat count) = to 0
	JNZ     NEXT_FREQUENCY   ; If not jump to NEXT_FREQUENCY
							 ; and do whole routine again.
							 ; Else DX = 0 time to turn speaker OFF
							 
	MOV		DX, 6000
	FREQ_UP:
	MOV     AX, BX           ; Move our Frequency value into AX.
	OUT     42H, AL          ; Send LSB to port 42H.
	MOV     AL, AH           ; Move MSB into AL  
	OUT     42H, AL          ; Send MSB to port 42H.
	IN      AL, 61H          ; Get current value of port 61H.
	OR      AL, 00000011B    ; OR AL to this value, forcing first two bits high.
	OUT     61H, AL          ; Copy it to port 61H of the PPI Chip
							 ; to turn ON the speaker.
	MOV     CX, 300          ; Repeat loop 100 times
	DELAY_LOOP2:              ; Here is where we loop back too.
	LOOP    DELAY_LOOP2       ; Jump repeatedly to DELAY_LOOP until CX = 0
	SUB     BX, 2            ; Incrementing the value of BX lowers 
							 ; the frequency each time we repeat the
							 ; whole routine
	DEC     DX               ; Decrement repeat routine count
	CMP     DX, 0            ; Is DX (repeat count) = to 0
	JNZ     FREQ_UP   ; If not jump to NEXT_FREQUENCY
							 ; and do whole routine again.
							 ; Else DX = 0 time to turn speaker OFF
	DEC LOOPNR
	
	MOV	BX, LOOPNR
	CMP LOOPNR, 0
	JNZ BIG_LOOP

	
	IN      AL,61H           ; Get current value of port 61H.
	AND     AL,11111100B     ; AND AL to this value, forcing first two bits low.
	OUT     61H,AL           ; Copy it to port 61H of the PPI Chip
							 ; to turn OFF the speaker.	
    RET   ; FAR return to DOS 
START  ENDP 
CODE ENDS 
END  START 