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
m2 db 7,8,9
   db 10,11,12		 
.code
start:
	mov eax, 0 ;in ax se vor pastra sumele elementelor de pe aceeasi 
                  ;pozitie
	
	mov esi, 0 ;pentru parcurgerea liniilor
	mov ebx, 0 ;pentru parcurgerea coloanelor	
	
	;suma prima linie
	add al, m1[ebx][esi]
	add al, m2[ebx][esi]
	mov m1[ebx][esi], al ;rezultatul se pastreaza in matricea m1
	
	mov al, 0
	inc esi
	add al, m1[ebx][esi]
	add al, m2[ebx][esi]
	mov m1[ebx][esi], al

	mov al, 0
	inc esi
	add al, m1[ebx][esi]
	add al, m2[ebx][esi]
	mov m1[ebx][esi], al

	;suma a doua linie
	mov al, 0
	mov esi, 0
	;bx se aduna cu 3 
	add ebx, 3
	add al, m1[ebx][esi]
	add al, m2[ebx][esi]
	mov m1[ebx][esi], al

	mov al, 0
	inc esi
	add al, m1[ebx][esi]
	add al, m2[ebx][esi]
	mov m1[ebx][esi], al

	mov al, 0
	inc esi
	add al, m1[ebx][esi]
	add al, m2[ebx][esi]
	mov m1[ebx][esi], al
	
	
	;apel functie exit
	push 0
	call exit
end start
