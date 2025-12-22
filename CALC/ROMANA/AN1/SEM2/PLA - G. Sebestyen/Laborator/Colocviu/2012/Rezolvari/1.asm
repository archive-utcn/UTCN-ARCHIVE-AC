.386
.model flat, stdcall
includelib msvcrt.lib
extern exit :proc
extern printf :proc

public start


;Avem în memorie un șir de numere de tip WORD. Se dau două numere (deasemenea în memorie, nu trebuie citite de la tastatură) a și b. Toate aparițiile lui a trebuie înlocuite cu b și toate aparițiile lui b trebuie înlocuite cu a.
;Șirul rezultat se va afișa pe ecran. Atenție: șirul trebuie să se modifice și în memorie, nu e suficient să se afișeze rezultatul.
;Exemplu:
;sir DW 100, 24, 75, 24, 86, 91, 75, 24
;lungime_sir EQU ($-sir)/2
;a DW 75
;b DW 24
;Programul va trebui să afișeze: 100 75 24 75 86 91 24 75
.data
sir DW 100, 24, 75, 24, 86, 91, 75, 24
lungime_sir EQU ($-sir)/2
a DW 75
b DW 24
format db "%d ",0

.code
start:
mov esi,0
mov ecx,lungime_sir
mov edx,0
mov ebx,0
bucla:
mov dx,[a]
mov bx,[b]
cmp sir[esi],dx
je inlocuire_b
cmp sir[esi],bx
je inlocuire_a
add esi,2
loop bucla
mov ecx,lungime_sir
mov esi,0
jmp sfarsit


inlocuire_a:
xchg dx,sir[esi]
add esi,2
cmp ecx,1
je sfarsit1
dec ecx
jmp bucla
inlocuire_b:
xchg bx,sir[esi]
add esi,2
cmp ecx,1
je sfarsit1
dec ecx
jmp bucla
sfarsit1:
mov ecx,lungime_sir
mov esi,0
sfarsit:
push ecx
mov eax,0
mov ax,sir[esi]
push eax
push offset format
call printf
add esp,8
add esi,2
pop ecx
loop sfarsit


push 0 
call exit
end start


