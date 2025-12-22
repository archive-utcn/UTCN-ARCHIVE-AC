all:	lex yacc compile

lex:	interpreter.l
	lex interpreter.l

yacc:	interpreter.y
	yacc -d interpreter.y

compile: y.tab.c lex.yy.c
	 gcc -o INTERPRETER lex.yy.c y.tab.c -ly -ll

clean:	
	rm -rf y.tab.c y.tab.h lex.yy.c INTERPRETER
