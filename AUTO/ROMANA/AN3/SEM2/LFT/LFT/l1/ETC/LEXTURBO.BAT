rem Make Turbo C libraries for MKS LEX & YACC
rem Change MODEL to build a different memory model library
rem With MODEL=s, the small model library will be rebuilt
set MODEL=s
rem Compiling objects
bcc -A -c -m%MODEL% -I%ROOTDIR%/etc main.c memmove.c yycommnt.c
bcc -A -c -m%MODEL% -I%ROOTDIR%/etc yyerror.c yymain.c yymapch.c yywrap.c
rem Building libraries
tlib t%MODEL%lex +main +memmove +yycommnt +yyerror +yymapch +yywrap
tlib t%MODEL%yacc +yymain
