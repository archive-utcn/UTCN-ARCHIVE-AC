f:\etc\yacc -o yyy.c  -D ytab.h yyy.y
f:\etc\lex -o lll.c lll.l
bcc  yyy.c lll.c \lib\tslex.lib \lib\tsyacc.lib