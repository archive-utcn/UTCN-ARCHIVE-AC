% lab 11.

edge(1, 5). edge(5, 1).
edge(1, 2). edge(2, 1).
%edge(2, 3). edge(3, 2).
edge(2, 5). edge(5, 2).
edge(3, 4). edge(4, 3).
edge(4, 5). edge(5, 4).
edge(4, 6). edge(6, 4).


:- dynamic nod_vizitat/1.
d_search(X, _) :- df_search(X, _).
d_search(_, L) :- !, collect_reverse([], L).

df_search(X, L) :- asserta(nod_vizitat(X)), edge(X, Y), \+nod_vizitat(Y), df_search(Y, L).


collect_reverse(L, P) :- retract(nod_vizitat(X)), !, collect_reverse([X|L], P).
collect_reverse(L, L).




b_search(X, _) :- assertz(nod_vizitat(X)), assertz(nod_de_expandat(X)), bf_search.
b_search(_, L) :- collect_reverse([], L).

bf_search :- retract(nod_de_expandat(X)), expand(X), !, bf_search.


expand(X) :- edge(X, Y), \+nod_vizitat(Y), asserta(nod_vizitat(Y)), assertz(nod_de_expandat(Y)), fail.
expand(_).



% ex 1.
dl_search(X, Y, _) :- dlf_search(X, Y, 0, _).
dl_search(_, _, L) :- !, collect_reverse([], L).

dlf_search(X, D, Z, L) :- Z< D, !, Z1 is Z+1, asserta(nod_vizitat(X)), edge(X, Y), \+nod_vizitat(Y), dlf_search(Y, D, Z1, L).













