.386
.model flat,stdcall
includelib mscvrt.lib
extern exit :proc
extern printf : proc
public start


.data

sir DW 10, 11, 11, 44, 23, 23, 23, 10, 10, 9
lungime_sir EQU ($-sir)/2
format db "%d "


.code
start:

mov ecx,lungime_sir
mov esi,0
mov eax,0
mov ebx,0

bucla:
mov ax,sir[esi]
add esi,2
mov bx,sir[esi]
cmp eax,ebx
je inlocuire
loop bucla
jmp sfarsit

inlocuire:
mov sir[esi],0
dec ecx
cmp ecx,0
je sfarsit
jmp bucla


sfarsit:
mov esi,0
mov ecx,lungime_sir
mov eax,0
afisare :
push ecx
mov ax,sir[esi]
push eax
push offset format
call printf
add esp,8
add esi,2
pop ecx
loop afisare


push 0
call exit
end start