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
numar dd 0 
suma dd 0 
mesaj db "media aritmetica a numerelor pare este %d",0

.code
start:
;a) media aritmetica a numerelor impare din sir
	mov ecx,lungime_sir
	mov eax,0
	mov edx,0
	mov ebx,0

	bucla:
	;salvam elementul curent
	mov ax,sir[ebx]
	;facem sau cu 1
	or ax,1
	;daca numerele sunt egale inseamna ca numarul este impar
	cmp ax,sir[ebx]
	jne sari
	;daca sunt aici numarul este par
	add dx,sir[ebx]
	inc numar
	sari:
	add ebx,2
	loop bucla

	mov suma,edx
	mov edx,0
	mov eax,suma
	div numar
	

	push eax
	push offset mesaj
	call printf
	add esp,8

	;apel functie exit
	push 0
	call exit
end start