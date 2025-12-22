echo PROGRAM BATCH PENTRU UTILIZAREA YACC-ului
f:\etc\yacc -o %1.c -D ytab.h %1.y
f:\aplic\compiler\borlandc\bin\bcc %1.c  \etc\tsyacc.lib \etc\tslex.lib 