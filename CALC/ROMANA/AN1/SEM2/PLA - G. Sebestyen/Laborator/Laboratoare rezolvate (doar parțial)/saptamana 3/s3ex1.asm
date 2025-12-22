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

.code
start:
	;initializez pe eax si ebx cu valori oarecare
	mov eax, 2
	mov ebx, 12
	
	;pastrez vechea valoare a lui eax in edx
	mov edx, eax

	;eax*7 = eax*8 - aex
	;eax*8 = eax << 3 (eax deplasat aritmetic la stanga cu 3 pozitii)
	mov ecx, 3
	sal eax, cl
	
	;eax=eax*7
	sub eax, edx
	
	;pastrez vechea valoare a lui ebx in edx
	mov edx, ebx
	
	;ebx*2
	sal ebx, 1

	;eax = eax-ebx*2
	sub eax, ebx
	
	mov ebx, edx
	;ebx/8 = ebx >> 3 (deplasare la dreapta cu 3 pozitii)
	sar ebx, cl
	
	sub eax, ebx
	
	;apel functie exit
	push 0
	call exit
end start
