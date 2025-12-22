% lab 5

perm_sort(L,R):-perm(L, R), is_ordered(R), !.

perm(L, [H|R]):-append(A, [H|T], L), append(A, T, L1), perm(L1, R).
perm([], []).

is_ordered([H1, H2|T]):-H1 =< H2, !, is_ordered([H2|T]).
is_ordered([_]). % daca ii doar un element ii deja ordonata

min([H|T], M) :- min(T, M), M< H, !.
min([H|_], H).

delete1(H, [H| T], T).
delete1(X, [H| T], [H|R]) :- delete1(X, T, R).
delete1(_, [], []).

sel_sort(L, [M|R]):- min(L, M), delete1(M, L, L1), sel_sort(L1, R).
sel_sort([], []).

insert_sort([H|T], R):- insert_sort(T, R1), insert_ord(H, R1, R).
insert_sort([], []).

insert_ord(X, [H|T], [H|R]) :- X>H,!, insert_ord(X, T, R).
insert_ord(X, T, [X|T]).


bubble_sort(L,R):-one_pass(L,R1,F), nonvar(F), !, bubble_sort(R1,R).
bubble_sort(L,L).
one_pass([H1,H2|T], [H2|R], F):-H1>H2, !, F=1, one_pass([H1|T],R,F).
one_pass([H1|T], [H1|R], F):-one_pass(T, R, F).
one_pass([], [] ,_).

quick_sort([H|T], R):- partition(H, T, Sm, Lg), quick_sort(Sm, SmS), quick_sort(Lg, LgS), append(SmS, [H|LgS], R).
quick_sort([], []).

partition(H, [X|T], [X|Sm], Lg):- X<H, !, partition(H, T, Sm, Lg).
partition(H, [X|T], Sm, [X|Lg]):- partition(H, T, Sm, Lg).
partition(_, [], [], []).

%merge_sort
merge_sort(L, R):- split(L, L1, L2), merge_sort(L1, R1), merge_sort(L2, R2), merge(R1, R2, R). 
merge_sort([H], [H]). % split returnează fail dacă lista ii vidă sau are doar un singur element
merge_sort([], []).

split(L, L1, L2):- length(L, Len), Len>1, K is Len/2, splitK(L, K, L1, L2).

splitK([H|T], K, [H|L1], L2):-K>0,!,K1 is K-1,splitK(T, K1, L1, L2).
splitK(T, _, [], T).

merge([H1|T1], [H2|T2], [H1|R]):-H1<H2, !, merge(T1, [H2|T2], R).
merge([H1|T1], [H2|T2], [H2|R]):-merge([H1|T1], T2, R).
merge([], L, L).
merge(L, [], L).


% Ex 1

member1(X, [X|_]).
member1(X, [_|T]) :- member1(X, T).

perm1(L, [H|R]):- member1(H, L), delete1(H, L, L1) , perm(L1, R).
perm1([], []).


% Ex 2

max([H|T], M) :- max(T, M), M>H.
max([H|_], H).

sel_sort_desc(L, [M|R]):- max(L, M), delete1(M, L, L1), sel_sort_desc(L1, R).
sel_sort_desc([], []).

% Ex 3

min_char([H|T], M) :- min_char(T, M), char_code(M, R1), char_code(H, R2), R1<R2, !.
min_char([H|_], H).

sel_sort_char(L, [M|R]):- min_char(L, M), delete1(M, L, L1), sel_sort_char(L1, R).
sel_sort_char([], []):- !.

% Ex 4

myLength([], 0).
myLength([_|T], R) :- myLength(T, R1), R is R1 +1.

min_list([H|T], M) :- min_list(T, M), myLength(M, R1), myLength(H, R2), R1<R2, !.
min_list([H|_], H).

sel_sort_list(L, [M|R]):- min_list(L, M), delete1(M, L, L1), sel_sort_list(L1, R).
sel_sort_list([], []):- !.



