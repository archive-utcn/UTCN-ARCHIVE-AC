GCC = gcc
OBJECTS = car.o ident.o lexem.o numar.o lex.o


lex.exe : $(OBJECTS)
	$(GCC) -o lex.exe car.c ident.c lexem.c numar.c lex.c

car.o : lex.h afisare.h

ident.o : lex.h

lexem.o : lex.h afisare.h

numar.o : lex.h afisare.h



clean :
	rm -f *~ *.o core
.PHONY : clean