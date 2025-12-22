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
mesaj db "%d ",0	
sir DB 15, 78, 12, 39, 42, 88
lungime_sir EQU $-sir

;Se dă un șir de numere de tip BYTE, cu valori cuprinse între 10 și 100. 
;Să se modifice acest șir în așa fel încât, fiecare element să devină 1, dacă e mai mic decât 60 și 2 în caz contrar. 
;Șirul modificat se va afișa pe ecran.
;Șirul se poate defini în program, nu trebuie citit de la tastatură.
;Exemplu:
;sir DB 15, 78, 12, 39, 42, 88
;lungime_sir EQU $-sir
;Programul va trebui să afișeze: 1 2 1 1 1 2

.code
start:
mov ecx,lungime_sir
bucla:
cmp sir[ecx],60
jl pune_1
mov sir[ecx],2
jmp am_pus_2
pune_1:
mov sir[ecx],1
am_pus_2:
loop bucla

cmp sir[ecx],60
jl pune_1_
mov sir[ecx],2
jmp am_pus_2_
pune_1_:
mov sir[ecx],1
am_pus_2_:

mov ecx,lungime_sir
mov edx,0
bucla_:
pusha
mov eax,0
mov al,sir[edx]
push eax
push offset mesaj
call printf
add esp,8
popa
add edx,1
loop bucla_

	;apel functie exit
	push 0
	call exit
end start