rem Make Watcom C libraries for MKS LEX & YACC
rem Change MODEL to build a different memory model library
rem With MODEL=s, the small model library will be rebuilt
set MODEL=s
rem Compiling objects
rem WATCOM Version 7 has ANSI C function: memmove.c
wcc -za -c -m%MODEL% -i%ROOTDIR%/etc main.c
wcc -za -c -m%MODEL% -i%ROOTDIR%/etc yycommnt.c
wcc -za -c -m%MODEL% -i%ROOTDIR%/etc yyerror.c
wcc -za -c -m%MODEL% -i%ROOTDIR%/etc yymain.c
wcc -za -c -m%MODEL% -i%ROOTDIR%/etc yymapch.c
wcc -za -c -m%MODEL% -i%ROOTDIR%/etc yywrap.c
rem Building libraries
erase lex%MODEL%.lib
erase yacc%MODEL%.lib
wlib lex%MODEL% +main +yycommnt +yyerror +yymapch +yywrap
wlib yacc%MODEL% +yymain
