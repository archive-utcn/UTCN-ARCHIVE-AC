.386
.model flat,stdcall
includelib mscvrt.lib
extern exit :proc
extern printf : proc
public start


.data

x DD 111111000111110b
masca dd 1b
contor dd 0
format db " numaru de biti de unu este %d"
.code
start:
mov ecx,16
mov esi,0
mov eax,0
mov edx,0
bucla:
mov ebx,x
and masca,ebx
shr x,1
cmp masca,0
je refacere_masca
inc contor
cmp contor,edx
jg schimbare_contor
loop bucla
jmp sfarsit


refacere_masca:
mov masca,1
mov contor,0
dec ecx
cmp ecx,0
je sfarsit
jmp bucla

schimbare_contor:
mov edx,contor
dec ecx
jmp bucla

sfarsit:
push edx
push offset format
call printf
add esp,8
push 0
call exit
end start