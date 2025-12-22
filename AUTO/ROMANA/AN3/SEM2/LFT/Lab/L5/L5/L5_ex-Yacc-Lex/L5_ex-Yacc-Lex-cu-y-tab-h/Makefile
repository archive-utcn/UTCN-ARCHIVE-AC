output.txt: a.out input.in 
	./a.out <input.in >output.txt
		
a.out: y.tab.c lex.yy.c
	gcc lex.yy.c y.tab.c 
lex.yy.c: y.tab.h *.l 
	lex *.l		
y.tab.c: *.y 
	yacc *.y -d
