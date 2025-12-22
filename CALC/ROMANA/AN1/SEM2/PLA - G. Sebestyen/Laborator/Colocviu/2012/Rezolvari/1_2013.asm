.386
.model flat,stdcall
includelib msvcrt.lib
extern exit:proc
extern scanf:proc
extern printf:proc
public start
.data

n dd 0
k dd 0
procent dd 2
format db "%d",0
msg db "n=",0
mesaj db "k=",0
var dd 0
.code
start:
push offset msg
call printf
add esp,4
push offset n
push offset format
call scanf
add esp,8
;push offset mesaj
;call printf
;add esp,4
;push offset k
;push offset format
;call scanf
;add esp,8


;mov ecx,n
;mov ebx,0
;mov eax,k
;mov edx,2
;div dl;       k%2
;cmp ah,1
;je impar
;jmp par

mov ecx,n
mov ebx,0
mov k,1
impar:
mov eax,k
push k
inc k
mul k
inc k
mul k
add var,eax
pop k
inc k
dec ecx
cmp ecx,0
je final
jmp par

par:
mov eax,k
mov ebx,5
add eax,4
div bl
mov ah,0
add var,eax
dec ecx
inc k
cmp ecx,0
je final
jmp impar

final:
push var
push offset format
call printf
add esp,8
push 0 
call exit
end start