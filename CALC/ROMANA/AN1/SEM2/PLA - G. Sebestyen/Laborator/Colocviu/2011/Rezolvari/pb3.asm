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
n dd 0
n_mid dd 0
format db "%d",0
formata db "%d ",0
divizor dd 2
divizor_mid dd 0
divizor_test dd 2
prim dd 0
mesaj db "Dati numarul ",0
.code
test_prim macro divizor
bucla_test:
mov prim,0
mov eax,divizor
mov ebx,divizor_test
mov edx,0
div ebx
cmp edx,0
je gata2
cmp ebx,divizor_mid
jge gata
add divizor_test,1
jmp bucla_test
endm
start:

push offset mesaj
call printf
add esp,4

push offset n
push offset format
call scanf
add esp,8

mov edx,0
mov eax,n
mov ebx,2
div ebx
mov n_mid,eax

buclix:

mov edx,0
mov eax,n
mov ebx,divizor
div ebx
cmp edx,0
jne sari
cmp prim,1
je sari
pusha
push divizor
push offset formata
call printf
add esp,8
popa
sari:
add divizor,1
test_prim divizor
mov edx,0
mov eax,divizor
mov ebx,2
div ebx
mov divizor_mid,eax


gata2:
mov prim,1
gata:
mov eax,n_mid
mov ebx,divizor
cmp ebx,eax
jbe buclix


	;apel functie exit
	push 0
	call exit
end start