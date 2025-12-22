.386
.model flat,stdcall
includelib mscvrt.lib
extern exit :proc
extern printf : proc
public start


.data
mat_width EQU 4
mat_height EQU 3
mat DD 1, 2, 3, 4
DD     5, 6, 7, 8
DD     9, 10, 11, 12
format db "%d ",0
dim_linie dd 0
.code
start:
mov esi,0
mov edi,0
mov ecx,mat_width


mov dim_linie,4
shl dim_linie,2

bucla:
push ecx
push mat[edi][esi]
push offset format
call printf
add esp,8
add esi,4
pop ecx
loop bucla
mov ecx,2
mov esi,0
bucla2:
add esi,12
push ecx
add edi,16
push mat[edi][esi]
push offset format
call printf
add esp,8
sub esi,12
pop ecx
loop bucla2

mov ecx,3
add edi,12
bucla3:
push ecx
sub esi,4
push mat[edi][esi]
push offset format
call printf
add esp,8
pop ecx
loop bucla3
sub edi,16
push mat[edi][esi]
push offset format
call printf





push 0
call exit
end start