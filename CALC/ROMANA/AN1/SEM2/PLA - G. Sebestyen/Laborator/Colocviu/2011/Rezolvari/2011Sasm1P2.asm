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
sir1 DB 5, 10, 12, 4, 3
n EQU $-sir1
sir2 DB 0,0,0,0

;Proiect 2
;Se dă un șir de numere de tip BYTE, a cărui lungime se presupune a fi n. Să se construiască un al doilea șir, de lungime n-2, care pentru fiecare element din primul șir cu excepția primului și a ultimului, conține media aritmetică a sa și a vecinilor săi (stâng și drept). Șirul al doilea se va afișa pe ecran.
;Șirul se poate defini în program, nu trebuie citit de la tastatură.
;Exemplu:
;sir1 DB 5, 10, 12, 4, 3
;n EQU $-sir1
;Programul va trebui să afișeze: 9 8 6, deoarece (5+10+12)/3=9, (10+12+4)/3=8, (12+4+3)/3=6
.code
start:
mov ecx,n
sub ecx,2
;in ecx lungimea sirului
mov edx,1
;in edx la ce pozitie din sir sunt

bucla:
mov ebx,0
mov eax,edx
add bl,sir1[eax]
sub eax,1
add bl,sir1[eax]
add eax,2
add bl,sir1[eax]
mov eax,ebx
push edx
mov edx,0
mov ebx,3
div ebx
pop edx
mov sir2[edx],al
add edx,1
loop bucla

mov edx,1
mov ecx,n
sub ecx,2

bucla_:
pusha
mov eax,0
mov al,sir2[edx] 
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