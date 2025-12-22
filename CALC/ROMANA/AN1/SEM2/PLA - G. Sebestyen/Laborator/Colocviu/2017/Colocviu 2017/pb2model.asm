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
;aici declaram date

mat_width dd 4
mat_height dd 3

mat dd 1, 2, 7, 1
	dd 3, 7, 2, 1
	dd 4, 8, 9, 2

linie dd 0

max dd 0
suma dd 0

format_int db "%d", 0
format db "Rezultatul max este %d pe linia %d", 0

.code
start:
	;aici se scrie codul
	
	xor esi, esi
	mov ecx, mat_height
	loop1:
		push ecx
		xor edi, edi
		
		mov ecx, mat_width
		xor eax, eax
		
		loop2:
			add eax, mat[esi][edi]
			inc edi
			shl edi, 2
		loop loop2
		
		mov ecx, suma
		cmp max, ecx
		jg iese
		mov max, ecx
		mov linie, esi
		
		iese:
			inc esi
		
		pop ecx
	loop loop1
			
	
final:
	push linie
	push max
	push offset format
	call printf
	add ESP, 12
	
	;terminarea programului
	push 0
	call exit
end start
