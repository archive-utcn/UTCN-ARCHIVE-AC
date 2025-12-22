.386
.model flat, stdcall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;includem biblioteci, si declaram ce functii vrem sa importam
includelib msvcrt.lib
extern exit: proc
extern printf: proc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;declaram simbolul start ca public - de acolo incepe executia
public start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;sectiunile programului, date, respectiv cod
.data
RAZA 	DQ 8.567
ARIE 	DQ 0
VOLUM   DQ 0
PATRU	DD 4.0	
TREI	DD 3.0

format	DB "Raza=%lf; Arie=%lf; Volum=%lf", 0
.code
start:
	FINIT 		;INITIALIZARE COPROCESOR
	FLD	RAZA	;INCARCARE RAZA IN STIVA COPROC
	FMUL RAZA	;CALCUL R*R
	FLDPI		;INCARCARE PI PE STIVA COPOC
	FMUL		;CALCUL R*R*PI
	FSTP ARIE	;SALVARE REZULTAT

	LEA	ESI, VOLUM	;ADRESA VLUM IN SI
	FINIT			;INITIALIZARE COPROCESOR
	FLD	RAZA		;CALCUL
	FMUL RAZA		;R*R
	FMUL RAZA		;RxRxR
	FLDPI			;ICARCARE PI
	FMUL			;INMULTIRE CU PI
	FMUL PATRU		;ÎNMULTIRE CU PATRU
	FDIV TREI		;IMPARTIRE CU TREI
	FSTP QWORD PTR [ESI]	;SALVARE REZULTAT
	
	;ca sa punem pe stiva un QWORD, trebuie sa punem pe rand cei 2 DWORD din care e format
	push dword ptr [VOLUM+4]
	push dword ptr [VOLUM]
	push dword ptr [ARIE+4]
	push dword ptr [ARIE]
	push dword ptr [RAZA+4]
	push dword ptr [RAZA]
	push offset format
	call printf
	add esp, 28
	
	;terminarea programului
	push 0
	call exit
end start
