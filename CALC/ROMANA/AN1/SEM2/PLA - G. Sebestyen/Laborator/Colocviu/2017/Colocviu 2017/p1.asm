.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem biblioteci, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern exit: proc
extern printf: proc
extern scanf: proc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;declaram simbolul start ca public - de acolo incepe executia
public start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;sectiunile programului, date, respectiv cod
.data
x DD 4
n DD 1
k DD 1
suma DD 0
fractie DD 0
putere DD 0
format_rezultat DB "E(%d, %d) = %d", 10, 0
mesajn DB "n = ", 0
mesajx DB "x = ", 0
format DB "%d", 0
;aici declaram date


.code

calcul_fractie MACRO
	mov EAX, x
	add EAX, 7
	mov EBX, 5
	xor EDX, EDX
	div EBX
	mov fractie, EAX
ENDM

calcul_putere MACRO
LOCAL suma, mutare
	mov ECX, 1
	mov EAX, fractie
	
suma:
	cmp ECX, k
	je mutare
	
	mov EBX, fractie
	mul EBX
	inc ECX
	jmp suma
	
mutare:
	mov putere, EAX
	
ENDM

test_putere MACRO
LOCAL par, iesire
	mov EAX, suma
	mov EDX, k
	and EDX, 1H
	
	cmp EDX, 0
	je par
	
	add EAX, putere
	jmp iesire
	
par:
	sub EAX, putere
	
iesire:
	mov suma, EAX
	
ENDM

start:
	;RANDUL 1 - PROBLEMA1

	;mesaj pentru n
	push offset mesajn
	call printf
	add ESP, 4
	
	;citire n
	push offset n
	push offset format
	call scanf
	add ESP, 8
	
	;mesaj pentru x
	push offset mesajx
	call printf
	add ESP, 4
	
	;citire x
	push offset x
	push offset format
	call scanf
	add ESP, 8
	
	calcul_fractie
	
	mov EDI, n
bucla:
	cmp k, EDI
	jg final
	
	
	calcul_putere
	test_putere
	
	inc k
	jmp bucla
	
final:
	push suma
	push n
	push x
	push offset format_rezultat
	call printf
	add ESP, 16
	;terminarea programului
	push 0
	call exit
end start

