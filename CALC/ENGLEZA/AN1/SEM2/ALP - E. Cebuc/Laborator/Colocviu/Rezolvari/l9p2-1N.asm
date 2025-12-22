
date segment para public 'data'
	sir db 1,2,3,4,5,6
	lung dw $-sir
date ends

cod1 segment para public 'code'
extrn suma:NEAR
prprinc proc far
	assume cs:cod1,ds:date
	push ds
	xor ax,ax
	push ax
	mov ax,date
	mov ds,ax

	xor ax,ax
	mov cx,lung
	mov bx,offset sir
	
	call suma
	ret
prprinc endp
cod1 ends
end prprinc