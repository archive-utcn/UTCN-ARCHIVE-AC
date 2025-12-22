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
var1 DB 10,2,3,14
var2 DW 15,6,7,8
var3 DD 1020A0h, 011223344h, 01A2B3C4Dh 
var4 equ 10
var5 DB '1', '2', "abc"
var6 DB 4 DUP(5)

.code
start:
	mov eax, 0
	mov al, var1
	mov ah, 11
	mov ebx, 0
	mov bx, var2
	mov ecx, var3
	mov edx, var4
	add ecx, edx
	mov dl, var5
	mov dh, var6
	
	;terminarea programului
	push 0
	call exit
end start
