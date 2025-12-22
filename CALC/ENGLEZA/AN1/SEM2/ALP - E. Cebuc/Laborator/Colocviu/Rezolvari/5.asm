if1
	include D:\mac5.mac;
endif

data segment para public 'data'
message1 db 13,10,'Input one by one the digits to be added (letter to finish):','$'
message2 db 13,10,'The sum equals: ','$'
sum db 0
data ends



code segment para public 'code'

start proc far
assume cs:code, ds:data

	push ds
	xor ax,ax
	push ax
	mov ax,data
	mov ds,ax

lo:
	dispstr message1

	mov ah,01	;character keyboard input
	int 21h

	sub al,30h	
	cmp al,0	; test to see if digit
	jl disp		; if another symbol was inserted display the sum
	cmp al,9
	jg disp

	add sum,al	; add current digit to sum
	jmp lo
disp:
	dispstr message2
	call transf	; call function to display a decimal number up to 255
	
	mov ah, 04Ch	; exit from program
	int 21h

start endp

transf proc near

	mov ah,0
	mov al,sum
	mov bl,100		; display the 3rd digit
	div bl
	cmp al,0		; if digit equals zero do not display
	jz next
	
	mov dl,al
	mov cl,ah
	dispch
	mov ah,cl
next:
	mov al,ah		; display the 2nd digit
	xor ah,ah
	mov bh,0
	mov bl,10
	div bl
	cmp al,0		; if digit equals zero do not display

	jz next1
	
	mov dl,al
	mov cl,ah
	dispch
	mov ah,cl

next1:
	mov dl,ah		; display the least significant digit
	dispch
	ret

transf endp

code ends
end start 