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
k DB 2
mesaj DB "%d ",0
sir DB 100, 10, 200, 5, 150
lungime_sir EQU $-sir
;Se dă un număr k și un șir de numere de tip BYTE. Să se înlocuiască fiecare element x, începând cu poziția k (numerotarea pozițiilor se face de la 0), cu valoarea 255-x. Șirul obținut se va afișa pe ecran.
;Șirul se poate defini în program, nu trebuie citit de la tastatură.
;Exemplu:
;k DB 2
;sir DB 100, 10, 200, 5, 150
;lungime_sir EQU $-sir
;Programul va trebui să afișeze: 100 10 55 250 105. Se observă că numerele 100 și 10, ce erau pe pozițiile 0 și 1 rămân nemodificate.
.code
start:
mov edx,0
mov ecx,lungime_sir
bucla:
mov ebx,0
mov bl,k
cmp edx,ebx
jl ending
mov eax,0
mov al,sir[edx]
mov sir[edx],255
sub sir[edx],al
ending:
add edx,1
loop bucla

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