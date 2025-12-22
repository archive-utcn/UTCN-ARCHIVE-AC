.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem msvcrt.lib, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern printf: proc
extern fread: proc
extern fopen: proc
extern fclose: proc
extern exit: proc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;declaram simbolul start ca public - de acolo incepe executia
public start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;sectiunile programului, date, respectiv cod
.data
filename db "fisier.dat", 0
mode_rb db "rb", 0
format db "%02X ", 0
buffer db 0

.code
start:
	;apelam fopen
	push offset mode_rb
	push offset filename
	call fopen
	add esp, 8
	mov esi, eax ;salvam pointer-ul la fisier
	
	;punem pe stiva parametrii pentru fread
	push esi ;stream
	push 1 ;count
	push 1 ;size
	push offset buffer
bucla_citire:
	call fread
	test eax, eax
	jz inchidere_fisier
	xor eax, eax ;facem eax sa fie 0
	mov al, buffer
	push eax
	push offset format
	call printf
	add esp, 8
	jmp bucla_citire
	
inchidere_fisier:
	add esp, 16 ;curatam stiva de la fread
	;apelam fclose
	push esi ;stream
	call fclose
	add esp, 4

	push 0
	call exit
end start
