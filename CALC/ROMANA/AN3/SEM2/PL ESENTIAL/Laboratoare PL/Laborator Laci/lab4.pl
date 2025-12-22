%lab4

member(X, [X|_]) :- !.
member(X, [_|T]) :- member(X, T).


% Varianta 1 (recursivitate înapoi)
length1([], 0).
length1([_|T], Len) :- length1(T, Lcoada), Len is 1+Lcoada.

% Varianta 2 (recursivitate înainte)
length2([], Acc, Len) :- Len=Acc.
length2([_|T], Acc, Len) :- Acc1 is Acc + 1, length2(T, Acc1, Len).
length2_pretty(L, R) :- length2(L, 0, R).


union([], L, L).
union([H|T], L2, R) :- member(H, L2), !, union(T, L2, R).
union([H|T], L2, [H|R]) :- union(T, L2, R).

% ex 1
inters([], _, []).
inters([H|T], L2, R) :- \+member(H, L2), !, inters(T, L2, R).
inters([H|T], L2, [H|R]) :- inters(T, L2, R).

% ex 2
diff([], _, []).
diff([H|T], L2, R) :- member(H, L2), !, diff(T, L2, R).
diff([H|T], L2, [H|R]) :- diff(T, L2, R).

% ex3
minim([H|T], M) :- minim(T,M), M<H, !.
minim([H|_], H).

delete_all1(X, [X|T], R) :- delete_all1(X, T, R). % dacă s-a șters prima apariție se va continua și pe restul elementelor
delete_all1(X, [H|T], [H|R]) :- delete_all1(X, T, R).
delete_all1(_, [], []).

del_min(L, R):- minim(L, M), delete_all1(M, L, R).

maxim([H|T], M) :-maxim(T, M), M>H, !.
maxim([H|_], H).
del_max(L,R) :- maxim(L, M), delete_all1(M, L, R).


% ex 4

append1([], L2, R) :- R = L2.
append1([H|T], L2, R) :- append1(T, L2, CoadaR), R=[H|CoadaR].

reverse1([], []).
reverse1([H|T], R) :- reverse1(T, Rcoada), append1(Rcoada, [H], R).

reverse_k(L, K, R) :- reverse_k(L, K, 0, R).
reverse_k([H|T], K, I, [H1|R]) :- I<K, !, H1 = H, I1 is I + 1, reverse_k(T, K, I1, R ).
reverse_k(T, K, I, R):- I>= K, reverse1(T, R).

% ex 5
rle_encode([H|T], R) :- rle_encode(T, H, 1, R).
rle_encode([H|T], F, I, R) :- H= F, !, I1 is I + 1, rle_encode(T, H, I1, R).
rle_encode([H|T], X, I, [H1|R]) :- H1 = [X, I], rle_encode(T, H, 1, R).
rle_encode([], X, I, [H1|R]) :- H1 = [X, I], R = [].


% ex 6
append2([], L1, R) :- R= L1.
append2([H|T], L1, [H1|R]) :- H1 = H, append1(T, L1, R).

myLength([], 0).
myLength([_|T], R) :- myLength(T, R1), R is R1 +1.

rotate_right(Lis, K, R) :- myLength(Lis, L), K1 is L - K, rotate_right(Lis, K1, 0, R1, R2), append2(R2, R1, R).
rotate_right([H|T], K, I, R, R1) :- I<K,!, I1 is I + 1, rotate_right(T, K, I1, R2, R1), R = [H| R2]. 
rotate_right([H|T], K, I, R, R1) :- rotate_right(T, K, I, R, R2),  R1 = [H|R2].
rotate_right([], _, _, [], []).


% ex 7
getNumber([_|T], I, R) :- I1 is I - 1, getNumber(T, I1, R).
getNumber([H|_], 1, H).

rnd_select(Lis, I, R) :- myLength(Lis, L), rnd_select(Lis, I, L, R).
rnd_select(Lis, I, L, R) :- I>0, !, I1 is I - 1, rnd_select(Lis, I1, L, R1), random(1, L, Random), getNumber(Lis, Random, R2), R =[R2| R1].
rnd_select(_, 0, _, []).
