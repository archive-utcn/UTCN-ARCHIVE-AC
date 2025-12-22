.386
.model flat,stdcall
includelib mscvrt.lib
extern exit :proc
extern printf : proc
public start


.data

sir DD 20, 24, 12, 31, 42, 19, 65, 87, 21
lungime_sir EQU ($-sir)/4
x DB 22
y db 0
zero db 0
format db "%d "
.code
start:
mov esi,0
mov eax,0
mov ecx,lungime_sir
mov ebx,0
mov edx,0
mov dl,x
push edx
add dl,5
mov y,dl
sub x,5
bucla:
mov al,x
cmp sir[esi],eax
jg compara_mai_mic
add esi,4
loop bucla
jmp sfarsit

compara_mai_mic:
mov bl,y
cmp sir[esi],ebx
jl interschimba
add esi,4
jmp bucla


interschimba:
mov ebx,0
xchg sir[esi],ebx
add esi,4
jmp bucla

sfarsit:
mov esi,0
mov ecx,lungime_sir
mov eax,0
afisare :
push ecx
mov eax,sir[esi]
push eax
push offset format
call printf
add esp,8
add esi,4
pop ecx
loop afisare




push 0
call exit
end start