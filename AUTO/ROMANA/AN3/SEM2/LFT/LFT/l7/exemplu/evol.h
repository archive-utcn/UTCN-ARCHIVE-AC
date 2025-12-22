typedef struct Symbol { /* intrare in tabela de simboluri */
	char *nume;
	short tip; /*VAR, PREDEF ,NEDEF */
	union {
		double val;       /* daca e VAR */
		double (*ptr)();  /* daca e PREDEF */
	}u;
	struct Symbol *urm;      /* simbolul urmator */
} Symbol;
Symbol *instal(), *caut();