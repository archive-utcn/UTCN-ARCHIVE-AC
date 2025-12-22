.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem biblioteci, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern exit: proc
extern printf: proc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;declaram simbolul start ca public - de acolo incepe executia
public start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;sectiunile programului, date, respectiv cod
.data
mat_width EQU 4
mat_height EQU 3
mat DD 1, 2, 7, 1
	dd 3, 7, 2, 1
	dd 4, 8, 9, 2
format DB "Suma maxima este %d, obtinuta pe coloana %d.", 0
coloana DD 1
maxim DD 0
;aici declaram date

.code
start:
	;RANDUL 1 - PB 2
	;aici se scrie codul
	xor ESI, ESI
	xor EDI, EDI
	
	;in ECX pastram latimea matricii 4*4
	mov EAX, mat_width
	shl EAX, 2
	mov ECX, EAX
	
	;in EDX pastram inaltimea matricii 3*ECX
	shl EAX, 2
	mov EDX, EAX
	sub EDX, ECX
	
bucla_coloane:
	cmp EDI, ECX
	je final
	
	xor EAX, EAX
	xor ESI, ESI
	
	bucla_linii:
		cmp ESI, EDX
		je continuare
		
		add EAX, mat[ESI][EDI]
		
		add ESI, ECX
		jmp bucla_linii
	
	continuare:
		cmp EAX, maxim
		jl iesire
	
		mov maxim, EAX
		mov EBX, EDI
		shr EBX, 2
		add EBX, 1
		mov coloana, EBX
		
	iesire:
		add EDI, 4
		jmp bucla_coloane
	
final:
	push coloana
	push maxim
	push offset format
	call printf
	add ESP, 12
	;terminarea programului
	push 0
	call exit
end start
