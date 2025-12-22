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

unghi	    DD 4.0
rezultat    DQ 0


format	DB "%lf", 0
.code
start:
	FINIT 		;INITIALIZARE COPROCESOR
	FLD	unghi 	;INCARCARE unghi IN STIVA COPROC
	FPTAN       ;CALCUL tan(unghi)
	FMUL        
	FST ST(1)	;SALVARE REZULTAT
	FMUL 
	FLD1
	FADD 
	FSQRT 
	
	FLD	unghi 	;INCARCARE unghi IN STIVA COPROC
	FPTAN       ;CALCUL tan(unghi)
	FMUL        
	
	;FST ST[0]	;SALVARE REZULTAT
	FDIV ST(0),ST(1)
	lea esi,rezultat
	FST QWORD PTR[esi]
	
	push dword ptr [rezultat+4]
	push dword ptr [rezultat]
	push offset format
	call printf
	add esp, 12
	
	;terminarea programului
	push 0
	call exit
end start
