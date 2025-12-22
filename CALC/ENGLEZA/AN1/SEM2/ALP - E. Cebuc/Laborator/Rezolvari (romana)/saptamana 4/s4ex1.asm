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
sir1 dw 1,2,3
sir2 dw 0,0,0
.code
start:
	
	lea esi, sir1
	lea edi, sir2
	
	;iau din primul sir si pun in stiva
	push word ptr[esi]
	add esi, 2
	push word ptr[esi]
	add esi, 2
	push word ptr[esi]
	
	;scot de pe stiva si pun in al doilea sir
	pop word ptr[edi]
	add edi, 2
	pop word ptr[edi]
	add edi, 2
	pop word ptr[edi]
	
	;apel functie exit
	push 0
	call exit
end start



