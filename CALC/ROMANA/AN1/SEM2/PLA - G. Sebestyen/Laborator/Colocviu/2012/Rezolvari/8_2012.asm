.386
.model flat,stdcall
includelib mscvrt.lib
extern exit :proc
extern printf : proc
public start


.data

sir DW 4, 8, 125, 76, 89, 34, 18, 12, 10
lungime_sir EQU ($-sir)/2

format db "%d "
;8 4 76 125 34 89 12 18 10

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
xchg ax,bx
push bx
push ax
jmp interschimbare
revenire:
add esi,2
loop bucla
jmp sfarsit

interschimbare:
pop ax
sub esi,2
mov sir[esi],ax
pop ebx
add esi,2
mov sir[esi],bx
dec ecx
cmp ecx,1
je sfarsit
jmp revenire





sfarsit:
mov esi,0
dec ecx
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