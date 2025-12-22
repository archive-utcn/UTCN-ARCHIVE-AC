.386
.model flat,stdcall
includelib mscvrt.lib
extern exit :proc
extern printf : proc
public start


.data

sir DB 10, 15, 7, 28, 16, 98, 4, 20, 1, 24
lungime_sir EQU $-sir
x DB 20
doi db 2
format db "%d "
.code
start:
mov ecx,lungime_sir
mov esi,0
mov eax,0
comparare:
mov al,x
cmp sir[esi],al
jl testare_par
inc esi
loop comparare
jmp sfarsit

testare_par:
dec ecx
mov al,sir[esi]
div doi ; sir[esi]%2
cmp ah,0
jne incrementare
mov sir[esi],0
inc esi
jmp comparare

incrementare:
inc esi
dec ecx
jmp comparare


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