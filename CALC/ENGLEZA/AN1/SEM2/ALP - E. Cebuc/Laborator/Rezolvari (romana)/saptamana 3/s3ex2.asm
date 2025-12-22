.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem msvcrt.lib, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern exit: proc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;declaram simbolul start ca public - de acolo incepe executia
public start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;sectiunile programului, date, respectiv cod
.data
NUM1 DB 10 
NUM2 DB 5
REZ DB 0

.code
start:
	;initializam pe eax cu 0
	mov eax, 0
	
	;in al si bl punem niste valori oarecare
	mov al, 2
	mov bl, 4
	
	;pastram vechea valoare a lui al pe stiva
	push eax
	
	mov ecx, 0
	mov cl, NUM2
	;al*NUM2
	mul cl
		
	add REZ, bl
	add REZ, al
	
	;luam de pe stiva vechea valoare a lui al
	pop eax
	mov cl, NUM1
	;al*NUM1
	mul cl
	
	add REZ, al
	
	;apel functie exit
	push 0
	call exit
end start
