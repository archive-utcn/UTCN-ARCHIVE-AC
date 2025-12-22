.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem msvcrt.lib, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern exit: proc
extern scanf:proc 
extern printf:proc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;declaram simbolul start ca public - de acolo incepe executia
public start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
extern printf:proc
;sectiunile programului, date, respectiv cod
.data
format db "%s",0	
formati db "%d",0
formatc db "%c",0
mesaj db "dati sirul  ",0
sir db 0 
.code
start:
push offset mesaj 
call printf
add esp,4


push offset sir
push offset format
call scanf
add esp,8

mov esi,eax
mov edi,offset sir
mov ecx,0
mov eax,0
not	ecx
cld
repne	scasb
not	ecx
dec	ecx
mov edx,0
bucla:
pusha
mov ebx,0
mov bl,[sir+edx]
cmp bl,97
jl ending
cmp2:
cmp bl,122
jg ending
modifica:
sub bx,32
ending:
push ebx
push offset formatc
call printf
add esp,8

popa

add edx,1
loop bucla


	;apel functie exit
	push 0
	call exit
end start