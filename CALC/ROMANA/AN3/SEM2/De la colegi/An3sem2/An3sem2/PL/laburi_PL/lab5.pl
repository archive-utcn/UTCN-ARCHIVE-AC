% SORTARE PRIN PERMUTARI
perm(L, [H|R]):-append(A, [H|T], L), append(A, T, L1), perm(L1, R).
perm([], []).

is_ordered([H1, H2|T]) :- H1 =< H2, is-ordered([H2|T]).
is_ordered([_]). % daca ii doar un element ii deja ordonata

perm_sort(L,R) :- perm(L,R), is_ordered(R), !.

% SORTARE PRIN SELECTIE (SELECTION SORT)
sel_sort(L, [M|R]) :- min1(L,M), delete1(M,L,L1), sel_sort(L1,R),!.
sel_sort([],[]).

min1([H|T], M) :- min1(T, M), M<H, !.
min1([H|_], H).

delete1(X, [X|T], T) :- !.
delete1(X, [H|T], [H|R]) :- delete1(X, T, R).
delete1(_, [], []).

% SORTARE PRIN INSERTIE (INSERTION SORT)
ins_sort([H|T], R) :- ins_sort(T, R1), insert_ord(H,R1,R).
ins_sort([], []).

insert_ord(X, [H|T], [H|R]) :- X>H, !, insert_ord(X,T,R).
insert_ord(X, T, [X|T]).

% SORTARE BULE (BUBBLE SORT)
bubble_sort(L, R) :- one_pass(L,R1,F), nonvar(F), !, bubble_sort(R1, R).
bubble_sort(L,L).

one_pass([H1,H2|T], [H2|R], F) :- H1 > H2, !, F=1, one_pass([H1|T],R,F).
one_pass([H1|T], [H1|R], F) :- one_pass(T,R,F).
one_pass([],[],_).

% SORTARE RAPIDA (QUCIKSORT)
quick_sort([H|T], R) :- partition(H, T, Sm, Lg), % alegem pivot primul element
						quick_sort(Sm, SmS), % sortam sublista cu elemente mai mici decat pivotul
						quick_sort(Lg, LgS), % sortam sublista cu elemente mai mari decat pivotul
						append(SmS, [H|LgS], R).
quick_sort([],[]).

partition(H, [X|T], [X|Sm], Lg) :- X<H, !, partition(H, T, Sm, Lg).
partition(H, [X|T], Sm, [X|Lg]) :- partition(H, T, Sm, Lg).
partition(_, [], [], []).

% SORTARE PRIN INTERCLASARE (MERGE SORT)
merge_sort(L, R) :- split(L, L1, L2), merge_sort(L1, R1), merge_sort(L2, R2), merge(R1, R2, R).
merge_sort([H],[H]).
merge_sort([],[]).

split(L, L1, L2) :- length(L, Len), Len > 1, K is Len/2, splitK(L, K, L1, L2).
splitK([H|T], K, [H|L1], L2) :- K>0, !, K1 is K-1, splitK(T, K1, L1, L2).
splitK(T, _, [], T).

merge([H1|T1], [H2|T2], [H1|R]) :- H1 < H2, !, merge(T1,[H2|T2], R).
merge([H1|T1], [H2|T2], [H2|R]) :- merge([H1|T1], T2, R).
merge([], L, L).
merge(L, [], L).


% EX1 Rescrieți predicatul perm fără a apela predicatul append. Extragerea și ștergerea unui element trebuie realizate altfel.

perm1(L, [A|R]):- member(A, L), delete1(A, L, L1), perm1(L1, R).
perm1([], []).


% EX2 Rescrieți predicatul sel_sort astfel încât să sorteze descrescător.

max1([H|T], M) :- max1(T, M), M>H, !.
max1([H|_], H).

sel_sort2(L, [M|R]) :- max1(L,M), delete1(M,L,L1), sel_sort2(L1,R),!.
sel_sort2([],[]).

% EX3 Scrieți un predicat care să sorteze o listă de caractere ASCII. Sugestie: folosiți char_code
% ?- sort_chars([e, t, a, v, f], L).
% L = [a, e, f, t, v] ;
% false

sort_chars(L, [M|R]) :- minz(L,M), delete1(M,L,L1), sort_chars(L1,R), !.
sort_chars([],[]).

minz([H|T], M) :- minz(T, M), char_code(H,X1), char_code(M,X2), X1 > X2, !.
minz([H|_], H).

% EX4 Scrieți un predicat care să sorteze o lista de sub-liste în funcție de lungimea sub-listelor.
% ?- sort_len([[a, b, c], [f], [2, 3, 1, 2], [], [4, 4]], R).
% R = [[], [f], [4, 4], [a, b, c], [2, 3, 1, 2]] ;
% false

sort_len(L,[M|R]) :- minx(L,M), delete1(M,L,L1), sort_len(L1, R), !.
sort_len([],[]).

minx([H|T],M) :- minx(T,M), length(H,X1), length(M,X2), X1 > X2, !.
minx([H|_],H).