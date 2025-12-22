data segment para public 'data'
	sir db "cEVA ciudaT"
	len dw ($-sir)
	sir_mare db 100 dup (?)
	sir_mic db 100 dup (?)
data ends

code segment para public 'code'

start proc far

	assume cs:code, ds:data
	push ds
	xor ax,ax
	push ax
	mov ax,data
	mov ds,ax
	
	xor cx,cx
	xor dx,dx
	
	loopfor:
		mov si,offset sir
		add si,cx
		mov al,[si]
		cmp al,'a'
		jb lit_mare
		
		;litera mica
		mov si,offset sir_mic
		add si,dx
		mov [si],al
		inc dx
		jmp next
		
		lit_mare:
		mov si,offset sir_mare
		add si,bx
		mov [si],al
		inc bx
		
		next:
		inc cx
		cmp cx,len
	jb loopfor

	ret
start endp

code ends

end start