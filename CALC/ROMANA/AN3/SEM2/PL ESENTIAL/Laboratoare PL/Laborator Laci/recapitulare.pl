% recapitulare pentru colocviu
% Szakacs Laszlo, grupa 6
%ex 1
cmmdc(X, 0, X) :- !.
cmmdc(X, Y, R) :- Y1 is X mod Y, cmmdc(Y, Y1, R). 

cmmdc1(X, X, X) :- !.
cmmdc1(X, Y, R) :- X>Y, !, X1 is X - Y, cmmdc1(X1, Y, R).
cmmdc1(X, Y, R) :- Y1 is Y - X, cmmdc1(X, Y1, R).

%ex 2
cmmmc(X, Y, R) :- Produs is X * Y, cmmdc1(X, Y, Aux), R is Produs/ Aux.

%ex 3
suma([], 0):- !.
suma([H|T], R) :- suma(T, R1), R is H + R1.

suma1([H|T], R) :- suma1(T, H, R).
suma1([], Acc, Acc) :- !.
suma1([H|T], Acc, R) :- Acc1 is Acc + H, suma1(T, Acc1, R).

%ex 4

separate_parity([], [], []):- !.
separate_parity([H|T], [H|E], O) :- Aux is H mod 2, Aux =0, !, separate_parity(T, E, O).
separate_parity([H|T], E, [H|O]) :- separate_parity(T, E, O).

%ex 5

replace_all(_, _, [], []).
replace_all(X, Y, [X|T], [Y|R]) :- !, replace_all(X, Y, T, R).
replace_all(X, Y, [H|T], [H|R]) :- replace_all(X, Y, T, R).

%ex 6
sterge_k(Lis, K, R) :- sterge_k(Lis, K, 1, R).
sterge_k([], _, _, []):- !.
sterge_k([_|T], K, I, R) :- Aux is I mod K, Aux =0, !, I1 is I+1, sterge_k(T, K, I1, R).
sterge_k([H|T], K, I, [H|R]) :- I1 is I+1, sterge_k(T, K, I1, R). 

%ex 7
reverse_lista_completa([], []) :- !.
reverse_lista_completa([H|T], R) :- reverse_lista_completa(T, R1), append(R1, [H], R).

reverse_pretty(Lis, R) :- reverse_lista_incompleta(Lis, R1), append(R1, [_], R).

reverse_lista_incompleta([H|_], []):- var(H), !.
reverse_lista_incompleta([H|T], R) :- reverse_lista_incompleta(T, R1), append(R1, [H], R).

%ex 8

max(X, Y, X) :- X> Y, !.
max(_, Y, Y).

adancime([], 1).
adancime([H|T], R):- atomic(H), !,adancime(T, R).
adancime([H|T], R) :- adancime(H, R1), adancime(T, R2), R3 is R1 + 1, max(R3, R2, R).
 
%ex 9
flat([], []).
flat([H|T], [H|R]) :- atomic(H), !, flat(T, R).
flat([H|T], R):- flat(H, R1), flat(T, R2), append(R1, R2, R).

flat_il([H|_], H) :- var(H), !.
flat_il([H|T], [H|R]) :- atomic(H), !, flat_il(T, R).
flat_il([H|T], R):- flat_il(H, R1), flat_il(T, R2), append(R1, R2, R).

%ex 10.

tree(t(6, t(4, t(2, nil, nil), t(5, nil, nil)), t(9, t(7, nil, nil), nil))).
tree1(t(6, t(4, t(2, _, _), t(5, _, _)), t(9, t(7, _, _), _))).

depth(nil, 0):- !.
depth(T, 0) :- var(T), !.
depth(t(_, L, R), Sol) :- depth(L, SS1), depth(R, SS2), max(SS1, SS2, Aux), Sol is Aux +1.


depth_il(T, 0) :- var(T), !.
depth_il(t(_, L, R), Sol) :- depth_il(L, SS1), depth_il(R, SS2), max(SS1, SS2, Aux), Sol is Aux +1.


%ex 11.
inordine(nil, []) :-!.
inordine(T, []) :- var(T), !.
inordine(t(K, L, R), Lis) :- inordine(L, LL), inordine(R, RR), append(LL, [K|RR], Lis).

inordine_il(nil, T, T) :- var(T), !.
inordine_il(L, L, L) :- var(L), !.
inordine_il(t(K, L, R), RS, RE) :- inordine_il(L, LE, LS), inordine_il(R, LEL, LSL), RS= LE, LS= [K|LEL], RE= LSL.

preorder(nil,0):-!.
preorder(T,[]):-var(T),!.
preorder(t(_,L,R),Rez):-preorder(L,LL),preorder(R,RR),append([K|LL],LL,RR).

preorder(nil, T,T):-!.
preorder(L,L,L):-var(L),!.
preorder(t(K,L,R),RS,RE):-preorder(L,LE,LS),preorder(R,LRE,LRS),RS=[K|LE],LS=LRE,RE=LRS.

postorder(nil,0):-!.
postorder(T,[]):-var(T),!.
postorder(t(_,L,R),Rez):-preorder(L,LL),preorder(R,RR),append(LL,RR,Rezz),append(Rezz,[K],Rez).

postorder(nil,T,T):-!.
postorder(L,L,L):-var(L),!.
postorder(t(K,L,R),LS,LE):-postorder(L,LSL,LEL), postorder(R,LSR,LER),LS=LSL,LEL=LSR,append(LER,[K],LE).


%ex 12.
collect_k(nil, []).
collect_k(t(K, nil, nil), [K]) :- !.
collect_k(t(_, L, R), Sol) :- collect_k(L, LL), collect_k(R, RR), append(LL, RR, Sol).
 

%ex 13.
delete_all(_, [], []) :-!.
delete_all(X, [X|T], R) :- !, delete_all(X, T, R).
delete_all(X, [H|T], [H|R]) :- delete_all(X, T, R).

member(X, [X|_]) :-!.
member(X, [_|T]) :- member(X, T).


sterge_duplicate([], []).
sterge_duplicate([H|T], [H|R]) :- member(H, T), !,delete_all(H, T, R1), sterge_duplicate(R1, R).
sterge_duplicate([H|T], [H|R]) :- sterge_duplicate(T, R).


sterge_duplicate1(Lis, R):- sterge_duplicate1(Lis, [], R).
sterge_duplicate1([], Acc, Acc) :- !.
sterge_duplicate1([H|T], Acc, R) :- member(H, Acc), !, sterge_duplicate1(T, Acc, R).
sterge_duplicate1([H|T], Acc, R) :- append(Acc, [H], Acc1), sterge_duplicate1(T, Acc1, R).



% ex 14
minim([H|T], M) :- minim(T, M), M<H, !.
minim([H|_], H).

maxim([H|T], R) :-  maxim(T, H, R).
maxim([H|T], X, R):- H>X, !, maxim(T, H, R).
maxim([_|T], X, R):- maxim(T, X, R).
maxim([], X, X).


sterge_min(Lis, R) :- minim(Lis, Aux), delete_all(Aux, Lis, R).
sterge_max(Lis, R) :- maxim(Lis, Aux), delete_all(Aux, Lis, R).

% ex 15.
reverse_k(Lis, K, R) :- reverse_k(Lis, K, 0, R).
reverse_k([H|T], K, I, [H|R]) :- I<K,!, I1 is I + 1, reverse_k(T, K, I1, R).
reverse_k([H|T], K, I, R) :- I1 is I + 1, reverse_k(T, K, I1, R1), append(R1, [H], R).
reverse_k([], _, _, []):-!.


% ex 16.

rle_encode([H|T], R) :- rle_encode(T, H, 1, R).
rle_encode([], X, 1, [X]) :- !.
rle_encode([], X, I, [(X, I)]).
rle_encode([H|T], H, I, R) :- !, I1 is I+1, rle_encode(T, H, I1, R).
rle_encode([H|T], X, 1, R) :- !, rle_encode(T, H, 1, R1), R= [X|R1].
rle_encode([H|T], X, I, R) :- !, rle_encode(T, H, 1, R1), R= [(X, I)|R1].


%ex 17.
myLength([], 0).
myLength([_|T], R):- myLength(T, R1), R is R1+1.

rotate_k(Lis, K, R):- myLength(Lis, Aux), Aux1 is Aux - K, rotate_k(Lis, Aux1, [], R).
rotate_k([], _, Acc, Acc) :-!.
rotate_k(T, 0, Acc, R) :- append(T, Acc, R), !.
rotate_k([H|T], K, Acc, R) :- K1 is K-1, append(Acc, [H], Acc1), rotate_k(T, K1, Acc1, R). 
 

%ex 18.
min_char([H|T], M) :- min_char(T, M), char_code(M, Aux), char_code(H, Aux1), Aux<Aux1, !.
min_char([H|_], H).

delete1([], _, []) :-!.
delete1([H|T], H, T) :-!.
delete1([H|T], X, [H|R]):- delete1(T, X, R).

sel_sort_char([], []) :- !.
sel_sort_char(T, [M|R]) :- min_char(T, M), delete1(T, M, T1), sel_sort_char(T1, R).


%ex 19.
min_len([H|T], M) :- min_len(T, M), myLength(M, Aux), myLength(H, Aux1), Aux<Aux1, !.
min_len([H|_], H).

sort_len([], []).
sort_len(T, [M|R]) :- min_len(T, M), delete1(T, M, T1), sort_len(T1, R).


%ex 20.
sum_k([], _, 0):- !.
sum_k(_, 0, 0) :- !.
sum_k([H|T], 1, R) :- atomic(H), !, sum_k(T, 1, R1), R is H+R1.
sum_k([_|T], 1, R) :- sum_k(T,1, R).  
sum_k([H|T], K, R) :- atomic(H), !, sum_k(T, K, R).
sum_k([H|T], K, R) :- K1 is K-1, K1>0, sum_k(T, K, R1), sum_k(H, K1, R2), R is R1 + R2.



%ex 21.
replace_all_il(_, _, [], []) :- !.
replace_all_il(X, Y, [X|T], [Y|R]) :- replace_all_il(X, Y, T, R), !.
replace_all_il(X, Y, [H|T], [H|R]) :- atomic(H), !, replace_all_il(X, Y, T, R).
replace_all_il(X, Y, [H|T], R) :- replace_all_il(X, Y, H, R1), replace_all_il(X, Y, T, R2), append([R1], R2, R).



%ex 22.
coll_k(_, I, []):- I<1, !.
coll_k(nil, _, []):-!.
coll_k(t(K, _, _), 1, [K]) :- !.
coll_k(t(_, L, R), I, Lis) :- I1 is I-1, I1>(-1), !, coll_k(L, I1, R1), coll_k(R, I1, R2), append(R1, R2, Lis).


%ex 23.
edge(6, 4). edge(4, 6). edge(4, 9).
edge(4, 2). edge(2, 4).
edge(5, 4). edge(4, 5).
edge(9, 6). edge(6, 9). 
edge(7, 9). edge(9, 7).
:-dynamic solutie/1.
grad_exterior(_, _) :- asserta(solutie(0)), fail.
grad_exterior(Nod, _) :- edge(Nod, _), retract(solutie(X)), X1 is X+1, assert(solutie(X1)), fail.
grad_exterior(_, R) :- retract(solutie(R)).

grad_interior(_, _) :- asserta(solutie(0)), fail.
grad_interior(Nod, _) :- edge(_, Nod), retract(solutie(X)), X1 is X+1, assert(solutie(X1)), fail.
grad_interior(_, R) :- retract(solutie(R)).



%ex 24
:-dynamic nod/1.
nod(1). nod(2). nod(3). nod(4). nod(5). nod(6).

collect([X|R]) :- retract(nod(X)), !, collect(R).
collect([]).








