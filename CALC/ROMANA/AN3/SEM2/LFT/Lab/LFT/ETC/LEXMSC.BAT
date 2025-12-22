rem Make Microsoft C libraries for MKS LEX & YACC
rem Change MODEL to build a different memory model library
rem With MODEL=s, the small model library will be rebuilt
set MODEL=S
rem Compiling objects
cl -c -A%MODEL% -I%ROOTDIR%\etc -nologo main.c memmove.c yycommnt.c
cl -c -A%MODEL% -I%ROOTDIR%\etc -nologo yyerror.c yymain.c yymapch.c yywrap.c
rem Building libraries
erase %MODEL%liblex.lib
erase %MODEL%libyacc.lib
lib %MODEL%liblex +main +memmove +yycommnt +yyerror +yymapch +yywrap;
lib %MODEL%libyacc +yymain;
