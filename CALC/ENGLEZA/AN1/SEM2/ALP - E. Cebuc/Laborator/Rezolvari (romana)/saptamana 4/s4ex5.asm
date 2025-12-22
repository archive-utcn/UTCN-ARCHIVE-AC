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
Angajat struct
nume db 20 dup(0)
salariu dw 0
Angajat ends

Angajati Angajat {"georgescu",100},{"pop",100}, {"popescu",300},{"ionescu",450}	 
.code
start:
      lea esi,Angajati
      mov edi,20
      mov ebx,22
      mov eax,0

      push word ptr[esi+edi]

      add esi,ebx
      push word ptr[esi+edi]

      add esi,ebx
      push word ptr[esi+edi]

      add esi,ebx
      push word ptr[esi+edi]

      pop bx
      add ax,bx

      pop bx
      add ax,bx
      
      pop bx
      add ax,bx
      
      pop bx
      add ax,bx
            
	
	;apel functie exit
	push 0
	call exit
end start
