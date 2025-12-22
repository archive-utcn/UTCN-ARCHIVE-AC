f:\etc\yacc -ov %1.c -D ytab.h %1.y
bcc %1.c cod.c init.c math.c simbol.c tsyacc.lib tslex.lib
del *.obj
