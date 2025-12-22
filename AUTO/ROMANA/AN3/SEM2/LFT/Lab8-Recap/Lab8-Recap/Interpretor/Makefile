compile: y.tab.c lex.yy.c
	 gcc *.c
	 
lex:	interpreter.l
	lex interpreter.l

yacc:	interpreter.y
	yacc -d interpreter.y

