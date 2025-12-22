member1(X, [X|_]) :- !.
member1(X, [_|T]) :- member1(X, T).

delete1(X, [X|T], T) :- !.
delete1(X, [H|T], [H|R]) :- delete1(X, T, R).
delete1(_, [], []).

% Varianta 1 (recursivitate înapoi)

length1([], 0).
length1([H|T], Len) :- length1(T, Lcoada), Len is 1+Lcoada.

% Varianta 2 (recursivitate înainte)

length2([], Acc, Len) :- Len=Acc.
length2([H|T], Acc, Len) :- Acc1 is Acc + 1, length2(T, Acc1, Len).

length2_pretty(L, R) :- length2(L, 0, R).

% Varianta 1 (recursivitate înapoi)

reverse1([], []).
reverse1([H|T], R) :- reverse1(T, Rcoada), append1(Rcoada, [H], R).

% Varianta 2 (recursivitate înainte)

reverse2([], Acc, R) :- Acc=R.
reverse2([H|T], Acc, R) :- Acc1=[H|Acc], reverse2(T, Acc1, R).

reverse2_pretty(L, R) :- reverse2(L, [], R).

% Varianta 1 (recursivitate înapoi)

min1([H|T], M) :- min1(T, M), M<H, !.
min1([H|_], H).

max1([H|T], M) :- max1(T, M), M>H, !.
max1([H|_], H).

% Varianta 2 (recursivitate înainte)

min2([], Mp, M) :- M=Mp.
min2([H|T], Mp, M) :- H<Mp, !, min2(T, H, M).
min2([H|T], Mp, M) :- min2(T, Mp, M).
min2_pretty([H|T], M) :- min2(T, H, M). % la început inițializăm minimul cu primul element

union1([], L, L).
union1([H|T], L2, R) :- member1(H, L2), !, union1(T, L2, R).
union1([H|T], L2, [H|R]) :- union1(T, L2, R).

% 1. Scrieți predicatul inters(L1,L2,R) care realizează intersecția între două mulțimi.

inters([], _, []).
inters([H|T], L2, R) :- not(member1(H, L2)), !, inters(T, L2, R).
inters([H|T], L2, [H|R]) :- inters(T,L2,R). 

% 2. Scrieți predicatul diff(L1,L2,R) care realizează diferența între două mulțimi(elementele care apar în prima mulțime și nu apar în a doua mulțime).

diff([],_,[]).
diff([H|T], L2, R) :- member1(H, L2), !, diff(T, L2, R).
diff([H|T], L2, [H|R]) :- diff(T,L2,R).

% 3. Scrieți predicatele del_min(L,R) și del_max(L,R) care șterg toate aparițiile minimului, respectiva ale maximului din lista L.

delete_all(X, [X|T], R) :- delete_all(X, T, R).
delete_all(X, [H|T], [H|R]) :- X \= H, delete_all(X,T,R), !.
delete_all(_, [], []).

del_min(L,R) :- min1(L,M), del_min(L,M,R), !.
del_min(L,M,R) :- delete_all(M, L, R).
del_min([],_,[]).

del_max(L,R) :- max1(L,M), del_max(L,M,R), !.
del_max(L, M, R) :- delete_all(M, L, R).
del_max([],_,[]).

% 4. Scrieți un predicat care inversează ordinea elementelor dintr-o listă începând cu al K-lea element.
% ?- reverse_k([1, 2, 3, 4, 5], 2, R).
% R = [1, 2, 5, 4, 3] ;
% false

reverse_k([H|T], K, R) :- reverse_k([H|T], K, R, K).
reverse_k([H|T], _, R, 0) :- !, reverse2_pretty([H|T], R).
reverse_k([H|T], K, [H|R], N) :- N1 is N-1, reverse_k(T,K,R,N1).

% 5. Scrieți un predicat care codifică șirul de elemente folosind algoritmul RLE(Run-length encoding). Un șir de elemente consecutive și egale se vor înlocui cu perechi [element, număr de apariții].
% ?- rle_encode([1, 1, 1, 2, 3, 3, 1, 1], R).
% R = [[1, 3], [2, 1], [3, 2], [1, 2]] ;
% false

rle_encode([H|T], R) :- rle_encode(T, H, 1, R).
rle_encode([H|T], N, NR, Acc) :- N =:= H, !, NR1 is NR+1, rle_encode(T,N, NR1, Acc).
rle_encode([H|T], N, NR, Acc) :- NR1 is 1, rle_encode(T, H, NR1, Acc1), Acc = [[N,NR]|Acc1].
rle_encode([],N,NR,[[N,NR]]).

% 6. Scrieți un predicat care rotește o listă K poziții la dreapta.
% ?- rotate_right([1, 2, 3, 4, 5, 6], 2, R).
% R = [5, 6, 1, 2, 3, 4] ;
% false

append1([], L2, L2).
append1([H|T], L2, [H|R1]) :- append1(T, L2, R1).

rotate_right1([H|T], K, R) :- length1([H|T],Len1), Len2 is Len1-K, rotate_right1([H|T], K, R, Len2, []).
rotate_right1([H|T], K, R, N, Acc) :- N1 is N-1, append1(Acc,[H],Acc1), rotate_right1(T,K,R,N1,Acc1), !.
rotate_right1([H|T], K, R, 0, Acc) :- append1([H|T],Acc,R).

% 7. (*) Scrieți un predicat care extrage aleatoriu K element din lista L și le pune în lista rezultat R. Sugestie: folosiți funcția random(valoare_maxima).
% ?- rnd_select([a, b, c, d, e, f, g, h], 3, R).
% R = [e, d, a] ;
% false

rnd_select(_,0,[]):-!.
rnd_select(L, K, [X|R]) :- K>0,!,length1(L,L_size),L_size1 is L_size-1,random_between(0,L_size1,I),getByIndex(L,I,X),delete1(X,L,L1),K1 is K-1,rnd_select(L1,K1,R).


getByIndex([X], 0, X).
getByIndex([H|_], 0, H).
getByIndex([_|T], I, E) :- NewIndex is I-1, getByIndex(T, NewIndex, E).