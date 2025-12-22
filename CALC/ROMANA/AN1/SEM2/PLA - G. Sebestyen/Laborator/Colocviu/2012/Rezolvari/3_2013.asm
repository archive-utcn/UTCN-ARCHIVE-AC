.386
.model flat,stdcall
includelib msvcrt.lib
public start
extern exit:proc
extern printf :proc


.data
n dd 7
k dd 1
var dd 0
format db "%d"
.code
start :

mov ecx,2
mov eax,0
mov ebx,7
mov edx,0

altfel:
mov eax,k
add eax,1
div bl
mov dl,al
add var,edx
dec n
inc k
cmp n,0
je final
loop altfel

div3:
mov eax,k
mul k
add var,eax
mov ecx,2
dec n
inc k
cmp n,0
je final
jmp altfel



final :
push var
push offset format
call printf
add esp,8
push 0 
call exit
end start
