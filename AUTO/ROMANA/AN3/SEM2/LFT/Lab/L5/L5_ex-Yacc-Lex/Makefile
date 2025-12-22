output.txt: a.out input.in 
	./a.out <input.in >output.txt
		
a.out: lex.yy.c
	gcc lex.yy.c
lex.yy.c: y.tab.c *.l 
	lex *.l		
y.tab.c: *.y 
	yacc *.y
