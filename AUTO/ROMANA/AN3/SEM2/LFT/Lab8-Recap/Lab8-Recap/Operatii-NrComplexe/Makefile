rezultat.txt: a.out in.txt
	./a.out <in.txt >rezultat.txt
a.out:  y.tab.c
	gcc y.tab.c
y.tab.c: complex.y lex.yy.c  complex-struct.h
	yacc complex.y 
lex.yy.c: complex.l
	lex complex.l


