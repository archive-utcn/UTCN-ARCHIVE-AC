; program care face citire/afisare
dat1	segment para public 'data'
	str1 db 1,2,3,4
dat1 ends

cod1	segment para public 'code'
	assume cs:cod1,ds:dat1,es:dat1
start	proc far
	
	push ds
	xor ax,ax
	push ax
	mov ax,dat1
	mov ds,ax

next:	mov ah,1h
	int 21h
	mov dl,al
cmp 	al,27
	je stop
	mov ah,2h
	int 21h
	mov ax,4c00h
loop	next

stop:	ret
cod1 ends
start endp
end start



;100 0001 65 'a'
;100 0001
;010 0000 32
;110 0001 97 'A'