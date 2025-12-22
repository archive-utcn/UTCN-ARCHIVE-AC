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
extern printf:proc
;sectiunile programului, date, respectiv cod
.data
	
sir dw 7,10,12,1,8,9
lungime_sir dd ($-sir)/2
numar db 0 
produs dd 0 
mesaj db "produsul numerelor din sir este %d",0


.code
start:
;e)produsul elementelor din sir
	mov ecx,lungime_sir
	mov eax,1
	mov edx,0
	mov ebx,0

	bucla:
	;salvam elementul curent
	mov di,sir[ebx]
	mul edi
	add ebx,2
	loop bucla

	mov produs,eax
	push produs
	push offset mesaj
	call printf
	add esp,8

	;apel functie exit
	push 0
	call exit
end start