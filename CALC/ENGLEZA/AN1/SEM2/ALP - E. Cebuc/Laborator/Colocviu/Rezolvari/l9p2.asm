date segment para public 'data'
	sir db 1,2,3,4,5,6
	lung dw $-sir
date ends

cod1 segment para public 'code'
prprinc proc far
	assume cs:cod1,ds:date
	push ds
	xor ax,ax
	push ax
	mov ax,date
	mov ds,ax

	call far ptr suma

	ret
prprinc endp
cod1 ends

cod2 segment para public 'code'
assume cs:cod2
suma proc far
	mov ax,0
	mov cx,lung
	mov si,0
	loop1:
		add al,sir[si]
		inc si
		loop loop1
	ret
suma endp
cod2 ends
end prprinc