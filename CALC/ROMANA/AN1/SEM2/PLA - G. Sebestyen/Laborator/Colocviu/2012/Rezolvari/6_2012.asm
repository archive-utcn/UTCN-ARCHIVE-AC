.386
.model flat,stdcall
includelib mscvrt.lib
extern exit :proc
extern printf : proc
public start


.data

sir DB "Sirul meu"
lungime_sir dd $-sir
format db "%d",13,10


.code
start:

push 0
mov esi,0
mov ecx,lungime_sir
mov eax,0
afisare :
push ecx
mov al,sir[esi]
push eax
push offset format
call printf
add esp,8
inc esi
pop ecx
loop afisare
call exit
end start