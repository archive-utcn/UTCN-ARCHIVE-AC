% lab 9

add2(X, LS, LE, RS, RE):- RS = LS, LE = [X|RE].


append_dl(LS1,LE1, LS2,LE2, RS,RE):- RS=LS1, LE1=LS2, RE=LE2.

inorder_dl(nil,L,L). % lista vida este reprezentată de 2 variabile egale
inorder_dl(t(K,L,R),LS,LE):- inorder_dl(L,LSL,LEL), inorder_dl(R,LSR,LER), LS=LSL, LEL=[K|LSR], LE=LER.


partition(H, [X|T], [X|Sm], Lg):- X<H, !, partition(H, T, Sm, Lg).
partition(H, [X|T], Sm, [X|Lg]):- partition(H, T, Sm, Lg).
partition(_, [], [], []).

quicksort_dl([H|T], S, E):- partition(H, T, Sm, Lg), quicksort_dl(Sm, S, [H|L]), quicksort_dl(Lg, L, E).
quicksort_dl([], L, L). % condiția de terminare s-a modificat


:-dynamic memo_fib/2.
fib(N,F):- memo_fib(N,F), !.
fib(N,F):- N>1, N1 is N-1, N2 is N-2, fib(N1,F1), fib(N2,F2), F is F1+F2, assertz(memo_fib(N,F)).
fib(0,1).
fib(1,1).

perm(L, [H|R]):-append(A, [H|T], L), append(A, T, L1), perm(L1, R).
perm([], []).

all_perm(L,_):- perm(L,L1), % predicatul de generare a unei permutări (vezi lucrare de laborator cu sortări)
assertz(p(L1)), fail.
all_perm(_,R):- collect_perms(R).

collect_perms([L1|R]):- retract(p(L1)), !, collect_perms(R).
collect_perms([]).

print_all:-memo_fib(N,F),
write(N),
write(' – '),
write(F),
nl,
fail.
print_all.

% ex 1
to_lista_diferenta([H|_], L, L) :- var(H), !.
to_lista_diferenta([H|T], [H|LS], LE) :- to_lista_diferenta(T, LS, LE).

to_lista_incompleta(L, L, _) :-var(L),!.
to_lista_incompleta([H|LS], LE, [H|Lis]) :- to_lista_incompleta(LS, LE, Lis).


% ex 2

completa_to_diferenta([], L, L).
completa_to_diferenta([H|T], [H|LS], LE) :- completa_to_diferenta(T, LS, LE).

diferenta_to_completa(L, L, []) :- var(L), !.
diferenta_to_completa([H|LS], LE, [H|Lis]) :- diferenta_to_completa(LS, LE, Lis).

% ex 3
:-dynamic rez/1.

all_decompositions(L, _) :- append(X, A, L), asserta(rez([X, A])), fail.
all_decompositions(_, R):- collect_all(R).

collect_all([L1|R]) :- retract(rez(L1)), !, collect_all(R).
collect_all([]).

% ex 4
flat_dl([], L, L).
flat_dl([H|T], [H|LS], LE) :- atomic(H), !, flat_dl(T, LS, LE).
flat_dl([H|T], LS, LE) :- flat_dl(H, LS1, LE1), flat_dl(T, LS2, LE), LS = LS1, LE1 = LS2.


% ex 5
chei_pare(nil, L, L).
chei_pare(t(K, L, R), LS, LE) :- Aux is K mod 2, Aux \= 0, !, chei_pare(L, LS1, LE1), chei_pare(R, LS2, LE), LS= LS1, LE1 = LS2.
chei_pare(t(K, L, R), [K|LS], LE) :- chei_pare(L, LS1, LE1), chei_pare(R, LS2, LE), LS= LS1, LE1 = LS2.


% ex 6
between(nil, _, _, L, L).
between(t(K, L, R), K1, K2, [K|LS], LE) :- K> K1, K < K2, !, between(L, K1, K2, LS1, LE1), between(R, K1, K2, LS2, LE), LS= LS1, LE1 = LS2.
between(t(_, L, R), K1, K2, LS, LE) :- between(L, K1, K2, LS1, LE1), between(R, K1, K2, LS2, LE), LS= LS1, LE1 = LS2.