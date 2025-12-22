rezultat..txt: a.out in.txt
	./a.out <in.txt >rezultat.txt
a.out: y.tab.c lex.yy.c
	gcc lex.yy.c y.tab.c
lex.yy.c: poli.l y.tab.h
	lex poli.l
y.tab.h y.tab.c: poli.y
	yacc -d poli.y 
