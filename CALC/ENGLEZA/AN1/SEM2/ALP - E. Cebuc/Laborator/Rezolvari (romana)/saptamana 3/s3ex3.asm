.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem msvcrt.lib, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern exit: proc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;declaram simbolul start ca public - de acolo incepe executia
public start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;sectiunile programului, date, respectiv cod
.data
NUM1 DW 10 
NUM2 DW 5
REZ DW 0 ; rezultatul final

.code
start:
    ;Cerinta REZ = AX*NUM1+(NUM2*AX+BX)
    ;initializam eax cu 2, bx cu 8 
    mov eax,2
    mov bx,8

    ;salvam valoarea lui eax in stiva
    push eax

    ;ne ocupam de prima parte si ultima parte adica:
    ;REZ=AX*NUM1 + bx
    mov cx,NUM1 ; copiam NUM1 in cx
    mul cx ; facem inmultirea in ax

    ;adunam in REZ pe ax si pe bx
    add REZ,ax
    add REZ,bx

    ;ne ocupam de a 2-a parte adica : NUM2*AX

    ;scoatem din stiva pe 2 in eax
    pop eax

    ;copiam in cx NUM2
    mov cx,NUM2

    ;inmultim AX*CX in AX
    mul cx

    ;adunam in REZ pe ax
    add REZ,AX

    ;apel functie exit
    push 0
    call exit
end start