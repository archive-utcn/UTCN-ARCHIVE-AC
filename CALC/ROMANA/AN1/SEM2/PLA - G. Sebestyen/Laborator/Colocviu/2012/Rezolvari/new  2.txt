.model tiny
.code
org 100h
main proc near

mov ah,09h
mov dx, offset message
int 21h

mov ah,4ch
mov al, 00
int 21h

endp
message db "Hello world $"
end main