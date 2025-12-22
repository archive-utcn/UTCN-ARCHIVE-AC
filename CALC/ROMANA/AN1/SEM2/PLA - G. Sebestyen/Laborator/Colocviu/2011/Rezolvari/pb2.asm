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
extern scanf:proc
;sectiunile programului, date, respectiv cod
.data
	
a db 0
b db 0
mesaja db "Dati numarul a  ",0
mesajb db "Dati numarul b  ",0
format db "%d",0
.code
start:
;calcul expresie (a/2+7)*b + 100/a
push offset mesaja
call printf
add esp,4
push offset a
push offset format
call scanf
add esp,8

push offset mesajb
call printf
add esp,4
push offset b
push offset format
call scanf
add esp,8

mov eax,0
mov al,a

mov ebx,2
mov edx,0

div ebx
add eax,7

mov ebx,0
mov bl,b
mul ebx

mov ecx,eax
mov eax,100
mov ebx,0
mov bl,b
div ebx
add ecx,eax

push ecx
push offset format
call printf
add esp,8
	;apel functie exit
	push 0
	call exit
end start