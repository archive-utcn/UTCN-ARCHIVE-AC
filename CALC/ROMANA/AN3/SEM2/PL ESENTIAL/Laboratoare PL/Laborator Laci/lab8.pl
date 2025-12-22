% lab 8

member2(H,[H|_]):- !.
member2(X,[H|_]):-member2(X,H).
member2(X,[_|T]):-member2(X,T).


member_il(_, L):-var(L), !, fail.
member_il(X, [X|_]):-!.
member_il(X, [_|T]):-member_il(X, T).


insert_il(X, L):-var(L), !, L=[X|_].
insert_il(X, [X|_]):-!. % elementul există deja
insert_il(X, [_|T]):- insert_il(X, T).

delete_il(_, L, L):-var(L), !. % am ajuns la finalul listei
delete_il(X, [X|T], T):-!. % ștergem prima apariție și ne oprim
delete_il(X, [H|T], [H|R]):-delete_il(X, T, R).

search_it(_, T):-var(T),!,fail.
search_it(Key, t(Key, _, _)):-!.
search_it(Key, t(K, L, _)):-Key<K, !, search_it(Key, L).
search_it(Key, t(_, _, R)):-search_it(Key, R).

insert_it(Key, t(Key, _, _)):-!.
insert_it(Key, t(K, L, _)):-Key<K, !, insert_it(Key, L).
insert_it(Key, t(_, _, R)):-insert_it(Key, R).


% ex 1

append_it([], L2, L2) :- !.
append_it([H|_], L2, L ) :- var(H), !, append_it(L2, H, L).
append_it([H|L1], L2, [H|R]) :- append_it(L1, L2, R).

% ex 2

reverse([], Acc, Acc).
reverse([H|_], Acc, R) :- var(H), !, append(Acc, _, R).
reverse([H|T], Acc, R) :- Acc1 = [H|Acc], reverse(T, Acc1, R).

reverse_pretty(Lis, R) :- reverse(Lis, [], R).

% ex 3

lista_completa_to_incompleta([], _).
lista_completa_to_incompleta([H|T], [H|R]) :- lista_completa_to_incompleta(T, R).

lista_incompleta_to_completa([H|_], []) :- var(H), !.
lista_incompleta_to_completa([H|T], [H|R]) :- lista_incompleta_to_completa(T, R).


% ex 4
preordine(L, _) :- var(L), !.
preordine(t(K, L, R), [K|Lis]) :- preordine(L, R1), preordine(R, R2), append_it(R1, R2, Lis).

/*
preordine(t(K, L, R), [K|Lis]) :- var(L), \+var(R), !, preordine(R, Lis).
preordine(t(K, L, R), [K|Lis]) :- var(R), \+var(L), !, preordine(L, Lis).
*/

% ex 5
max(X, Y, X) :- X>Y, !.
max(_, Y, Y).

height(T, 0) :- var(T), !.
height(t(_ , L, R), Nr) :- height(L, Aux), height(R, Aux2), max(Aux, Aux2, Nr1), Nr is Nr1 +1.


% ex 6

to_arbore_incomplet(nil, _).
to_arbore_incomplet(t(K, L, R), t(K, NL, NR)) :- to_arbore_incomplet(L, NL), to_arbore_incomplet(R, NR).

to_arbore_complet(T, []):- var(T), !.
to_arbore_complet(t(K, L, R), t(K, NL, NR)) :- to_arbore_complet(L, NL), to_arbore_complet(R, NR).

% ex 7

flat_il(T, _) :- var(T), !.
flat_il([H|T], [H|R]) :- atomic(H), !, flat_il(T, R).
flat_il([H|T], R) :- flat_il(H, R1), flat_il(T, R2), append_it(R1, R2, R).

% ex 8

max(X, Y, Z, W) :- max(X, Y, Aux), max(Z, Aux, W).

diam(T, 0) :- var(T), !.
diam(t(_, L, R), Nr) :- diam(L, LL), diam(R, RR), height(L, HL), height(R, HR), Aux is HL + HR +1, max(LL, RR, Aux, Nr).

% ex 9
subl_suprem(_, K):- var(K), !, fail.
subl_suprem(T, [H|K]) :-  subl_il(T, [H|K]); subl_suprem(T, K). 

subl_il(T, K) :- var(T), var(K), !.
subl_il(T, K) :- var(T), !, fail ; var(K), !, fail .
subl_il([H|_], [R|_]) :- H \= R, !, fail.
subl_il([H|T], [H|R]) :- subl_il(T, R).
