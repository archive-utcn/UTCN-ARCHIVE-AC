% lab 7
max(X, Y, X) :- X>Y, !.
max(_, Y, Y). 

tree1(t(6, t(4,t(2,nil,nil),t(5,nil,nil)), t(9,t(7,nil,nil),nil))).

inorder(t(K,L,R), List):-inorder(L,LL), inorder(R,LR),
append(LL, [K|LR], List).
inorder(nil, []).

% cheie, subarbore stâng și subarbore drept
preorder(t(K,L,R), List):-preorder(L,LL), preorder(R, LR),
append([K|LL], LR, List).
preorder(nil, []).
% subarbore stâng, subarbore drept și apoi cheia
postorder(t(K,L,R), List):-postorder(L,LL), postorder(R, LR),
append(LL, LR,R1), append(R1, [K], List).
postorder(nil, []).


pretty_print(nil, _).
pretty_print(t(K,L,R), D):- D1 is D+1, pretty_print(L, D1), print_key(K, D), pretty_print(R, D1).

print_key(K, D):- D>0, !, D1 is D - 1, write('\t'), print_key(K, D1).
print_key(K, _):- write(K), write('\n').


search_key(Key, t(Key, _, _)):-!.
search_key(Key, t(K, L, _)):-Key<K, !, search_key(Key, L).
search_key(Key, t(_, _, R)):-search_key(Key, R).


insert_key(Key, nil, t(Key, nil, nil)). % inserează cheia în arbore
insert_key(Key, t(Key, L, R), t(Key, L, R)):-!. % cheia există deja
insert_key(Key, t(K,L,R), t(K,NL,R)):- Key<K,!,insert_key(Key,L,NL).
insert_key(Key, t(K,L,R), t(K,L,NR)):- insert_key(Key, R, NR).

delete_key(Key, t(Key, L, nil), L):-!.
delete_key(Key, t(Key, nil, R), R):-!.
delete_key(Key, t(Key, L, R), t(Pred,NL,R)):-!,get_pred(L,Pred,NL).
delete_key(Key, t(K,L,R), t(K,NL,R)):-Key<K,!,delete_key(Key,L,NL).
delete_key(Key, t(K,L,R), t(K,L,NR)):-delete_key(Key,R,NR).
% caută nodul predecesor
get_pred(t(Pred, L, nil), Pred, L):-!.
get_pred(t(Key, L, R), Pred, t(Key, L, NR)):-get_pred(R, Pred, NR).


height(nil, 0).
height(t(_, L, R), H):-height(L, H1), height(R, H2), max(H1, H2, H3), H is H3+1.

%ex1

tree_ternar(t(6, t(4, t(2, nil, nil, nil), t(7, nil, nil, nil), nil),t(5, nil, nil, nil), t(9, t(3, nil, nil, nil), nil, nil))).

inordine_ternar(t(K,L,M, R), Lis) :- inordine_ternar(L, LL), inordine_ternar(R, RR), inordine_ternar(M, MM), append(LL, [K|MM], Aux), append(Aux, RR, Lis).
inordine_ternar(nil, []).

preordine_ternar(t(K,L,M, R), Lis) :- preordine_ternar(L, LL), preordine_ternar(R, RR), preordine_ternar(M, MM), append([K|LL], MM, Aux), append(Aux, RR, Lis).
preordine_ternar(nil, []).

postordine_ternar(t(K,L,M, R), Lis) :- postordine_ternar(L, LL), postordine_ternar(R, RR), postordine_ternar(M, MM), append(LL, MM, Aux), append(Aux, RR, Aux2), append(Aux2, [K], Lis).
postordine_ternar(nil, []).

% ex 2
max(H1, H2, H3, H4) :- max(H1, H2, Aux), max(Aux, H3, H4).
height_ternar(nil, 0).
height_ternar(t(_, L, M, R), H):- height_ternar(L, H1), height_ternar(M, H2), height_ternar(R, H3), max(H1, H2, H3, H4), H is H4+1.

% ex 3

delete_key2(Key, t(Key, L, nil), L):-!.
delete_key2(Key, t(Key, nil, R), R):-!.
delete_key2(Key, t(Key, L, R), t(Succ,L,NR)):-!,get_succ(R,Succ,NR).
delete_key2(Key, t(K,L,R), t(K,NL,R)):-Key<K,!,delete_key2(Key,L,NL).
delete_key2(Key, t(K,L,R), t(K,L,NR)):-delete_key(Key,R,NR).
% caută nodul predecesor
get_succ(t(Succ, nil, R), Succ, R):-!.
get_succ(t(Key, L, R), Succ, t(Key, NL, R)):-get_succ(L, Succ, NL).


% ex 4

take_frunze(t(K, nil, nil), [K]) :- !.
take_frunze(t(_,L,R), List):- take_frunze(L,LL), take_frunze(R,LR), append(LL, LR, List).
take_frunze(nil, []).


% ex 5

diam(nil, 0) :- !.
diam(t(_, L, R), Nr) :- diam(L, LL), diam(R, RR), height(L, HL), height(R, HR), Aux is HL + HR +1, max(LL, RR, Aux, Nr).

% ex 6
/*
colecteaza_nod_pretty(T, R) :- colecteaza_nod_height(T, 0, R).
colecteaza_nod_height(T, I, R) :- 

colecteaza_nod(nil, []).
colecteaza_nod(t(K, L, R), 
*/
% ex 7
%symmetric_pretty(T) :- symmetric(T, R).

symmetric(nil) :- !.
symmetric(t(_, L, R)) :- height(L, Aux1), height(R, Aux2), Aux1 = Aux2, !, symmetric(L), symmetric(R).