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
m1 db 1,2,3
   db 4,5,6
rez db 0
rest db 0		 
.code
start:
	mov eax, 0 ;in ax se vor pastra sumele elementelor de pe aceeasi 
                  ;pozitie
	
	mov esi, 0 ;pentru parcurgerea liniilor
	mov ebx, 0 ;pentru parcurgerea coloanelor	
	mov ecx,6	


	;suma prima linie
	add al, m1[ebx][esi]

	add esi,1
	add al, m1[ebx][esi]

	add esi,1
	add al, m1[ebx][esi]

	add ebx,3
	mov esi,0
	add al, m1[ebx][esi]

	add esi,1
	add al, m1[ebx][esi]

	add esi,1
	add al, m1[ebx][esi]
	
	div cl
	mov rez,al
	mov rest,ah
		
	;apel functie exit
	push 0
	call exit
end start
