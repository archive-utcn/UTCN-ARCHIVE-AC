#include <stdio.h>

typedef struct elem {
	int info;
	struct elem* next;
} ELEM, *LIST;

void partition(int p, LIST xs, LIST* ls, LIST* gs) {
	if (xs == NULL) {
		*ls = NULL;
		*gs = NULL;
	}
	else {
		partition(p, xs->next, ls, gs);
		if (xs->info < p) {
			xs->next = *ls;
			*ls = xs;
		}
		else {
			xs->next = *gs;
			*gs = xs;
		}
	}
}

void qsdr(LIST xs, LIST *rez, LIST ys) {
	LIST ls, gs;
	if (xs == ys) {
		*rez = ys;
	}
	else {
		partition(xs->info, xs->next, &ls, &gs);
		qsdr(gs, &(xs->next), ys);
		qsdr(ls, rez, xs);
	}
}
