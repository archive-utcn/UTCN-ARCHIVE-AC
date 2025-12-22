.386
.model flat,stdcall
includelib mscvrt.lib
extern exit :proc
extern printf : proc
public start


.data

sir DB 10, 15, 7, 0, 0, 92, 0, 1, 4
lungime_sir EQU $-sir
x DB 42
msg db "x apare deja in sir"
format db "%d "


.code
start:
mov ecx,lungime_sir
mov esi,0
mov eax,0
bucla:
mov al,sir[esi]
cmp al,x
je mesaj
inc esi
loop bucla
mov esi,0
mov ecx,lungime_sir
mov eax,0
bucla2:
mov al,sir[esi]
cmp al,0
je interschimba
inc esi
loop bucla2




interschimba:
mov al,x
xchg al,sir[esi]
jmp sfarsit

mesaj :
push offset msg
call printf
add esp,4

sfarsit:
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

push 0
call exit
end start