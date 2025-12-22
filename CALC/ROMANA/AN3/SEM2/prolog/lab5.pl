is_ordered([H1, H2|T]):-H1 =< H2, is_ordered([H2|T]).
is_ordered([_]). % daca ii doar un element ii deja ordonata

perm(L, [H|R]):-append(A, [H|T], L), append(A, T, L1), perm(L1, R).
perm([], []).

perm_sort(L,R):-perm(L, R), is_ordered(R), !.



min1([H|T], M) :- min1(T, M), M<H, !.		%se parcurge L pana obtinem lista vida, se intra pe a doua ramura pentru initializarea lui M, iar apoi dupa revenirea din min1, se verifica daca M mai mic decat H, atunci nu se mai intra pe ramura 2 de atribuire pt M. 
min1([H|_], H).

sel_sort(L, [M|R]):- min1(L, M), delete(M, L, L1), sel_sort(L1, R).
sel_sort([], []).



ins_sort([H|T], R):- ins_sort(T, R1), insert_ord(H, R1, R).
ins_sort([], []).

insert_ord(X, [H|T], [H|R]):-X>H, !, insert_ord(X, T, R).
insert_ord(X, T, [X|T]).



bubble_sort(L,R):-one_pass(L,R1,F), nonvar(F), !, bubble_sort(R1,R).
bubble_sort(L,L). 

one_pass([H1,H2|T], [H2|R], F):-H1>H2, !, F=1, one_pass([H1|T],R,F).
one_pass([H1|T], [H1|R], F):-one_pass(T, R, F).
one_pass([], [] ,_).



quick_sort([H|T], R):- % alegem pivot primul element
partition(H, T, Sm, Lg), 
quick_sort(Sm, SmS), % sortam sublista cu elementele mai mici decât pivotul
quick_sort(Lg, LgS), % sortam sublista cu elementele mai mari decât pivotul
append(SmS, [H|LgS], R).
quick_sort([], []).

partition(H, [X|T], [X|Sm], Lg):-X<H, !, partition(H, T, Sm, Lg).
partition(H, [X|T], Sm, [X|Lg]):-partition(H, T, Sm, Lg).
partition(_, [], [], []).




merge_sort(L, R):-
split(L, L1, L2), % împarte L în doua subliste de lungimi egale
merge_sort(L1, R1),
merge_sort(L2, R2), 
merge(R1, R2, R). % interclasează sublistele ordonate
merge_sort([H], [H]). % split returnează fail dacă lista ii vidă sau are doar un singur element
merge_sort([], []).
split(L, L1, L2):-
length(L, Len), 
Len>1, 
K is Len/2, 
splitK(L, K, L1, L2).

splitK([H|T], K, [H|L1], L2):-K>0,!,K1 is K-1,splitK(T, K1, L1, L2).
splitK(T, _, [], T).

merge([H1|T1], [H2|T2], [H1|R]):-H1<H2, !, merge(T1, [H2|T2], R).
merge([H1|T1], [H2|T2], [H2|R]):-merge([H1|T1], T2, R).
merge([], L, L).
merge(L, [], L).
