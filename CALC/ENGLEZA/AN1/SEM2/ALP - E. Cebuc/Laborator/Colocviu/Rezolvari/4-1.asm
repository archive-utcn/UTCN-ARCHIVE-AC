extrn citire:far

data segment para public 'data'
	msg dw ?,"$"
data ends

afisare macro var
local loop_afis, loop_print
mov ax,var  ; numarul
xor cx,cx   ; numarul de cifre
loop_afis:
	xor dx,dx
	mov bx,0ah
	div bx
	push dx
	inc cx
	cmp ax,0
	jne loop_afis
	
loop_print:
	pop dx
	add dx,30h
	mov msg,dx
	mov ah,9
	lea dx,msg
	int 21h
	loop loop_print
endm
	

code segment para public 'code'

start proc far
	assume cs:code, ds:data
	push ds
	xor ax,ax
	push ax
	mov ax,data
	mov ds,ax
	
	call citire
	
	mov dx,bx
	push dx
	
	mov msg,10
	mov ah,9
	lea dx,msg
	int 21h
	
	call citire
	
	pop dx
	add bx,dx
	
	afisare bx
	
	ret
	
start endp

code ends



end start