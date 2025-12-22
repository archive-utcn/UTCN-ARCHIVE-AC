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
	  ;pentru citirea de la tastatura
	  msg DB "Dati sirul de caractere: ", 0 ;mesajul , output
      sir DB 40 dup(0) ;Stringul
      format_sir DB "%s", 0 ;format
	  
	  
	  format DB "%c", 0 ;pentru scriere in fisier caracter cu caracter
      mod_citire DB "w", 0 ;mod de deschidere a fisierului , mod de scriere
      nume_fisier DB "caractere.txt", 0 ;numele fisierului
.code
	start:
	
        ;citim sirul de caractere de la tastatura
		push offset msg ;mesajul
		call printf ;functia printf
		add esp, 4 ;curatam stiva
		
		;bagam intr-un sir
        push offset sir
        push offset format_sir
        call scanf
        add esp, 8
		
		;determinam lungimea sirului 
		lea edi,sir
		mov al,0
		repne scasb
		sub edi,offset sir
		sub edi,2
		
		xor esi,esi ; esi=00000000h contor
		xor ebx,ebx ; ebx=00000000h pastrarea caracterelor
		
        ;bagam in stiva litera cu litera
		loop_sir:
		cmp esi,edi
		jg adauga_in_fisier
        mov bl, sir[esi]
        push ebx
		inc esi
        loop loop_sir
		
		
		adauga_in_fisier:
		;deschiderea fisierului in mod scriere
		push offset mod_citire ;in mod scriere
		push offset nume_fisier ;numele fisierului
		call fopen   ; functia fopen
		add esp, 8   ; curatam stiva
		mov esi, eax ; salvam pointer-ul la fisier
		
		
		bucla_scriere:
		cmp edi,0              ;comparam edi-ul (lungimea sirului ) < 0 ?
		jl inchidere_fisier    ; daca edi<0 inseamna ca am parcurs sirul
	
		;pentru scriere avem printf(stream , format , variabila) in ordine inversa				
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



