.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem msvcrt.lib, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern printf: proc
extern fprintf: proc
extern scanf: proc
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
;pentru fisier
filename db "fisier.dat", 0
format db "%c", 0
mode_write db "w", 0

;pentru citire
msg db "Introduceti Stringul ", 0
format_citire db "%s", 0
sir db 20 dup(0)

.code
start:
	;citim dela tastatura un string fara spatii !
	push offset msg
	call printf
	add esp,4
	push offset sir
	push offset format_citire
	call scanf
	add esp,8
	
	;determinam lungimea sirului 
	lea edi,sir
	mov al,0
	repne scasb
	sub edi,offset sir
	sub edi,2
	
	;deschiderea fisierului in mod scriere
	push offset mode_write ;in mod scriere
	push offset filename 
	call fopen
	add esp, 8   ; curatam stiva
	mov esi, eax ; salvam pointer-ul la fisier
	
	;lea esi,sir
	xor ebx,ebx ; ebx ia valoarea 0 | resetam ebx-ul
	
	bucla_scriere:
	cmp edi,0              ;comparam edi-ul (lungimea sirului ) < 0 ?
	jl inchidere_fisier    ; daca edi<0 inseamna ca am parcurs sirul
	mov bl,sir[edi]		   ; mutam octetul in registrul bl
	
	;pentru scriere avem printf(stream , format , variabila) in ordine inversa
	push ebx				
	push offset format ; format %c
	push esi           ; stream
	call fprintf       ; apelam functia de scriere
	add esp,12         ; curatam stiva
	dec edi            ; edi--
	loop bucla_scriere
	
	
	inchidere_fisier:
	push esi    ;stream
	call fclose
	add esp, 4  ;curatam stiva
	

	push 0
	call exit
end start
