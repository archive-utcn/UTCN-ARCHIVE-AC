output.txt: a.out input.in output.txt
	./a.out <input.in >output.txt
		
a.out: y.tab.c
	gcc y.tab.c 
y.tab.c:  *.y lex.yy.c
	yacc *.y
lex.yy.c: *.l
	lex *.l	
