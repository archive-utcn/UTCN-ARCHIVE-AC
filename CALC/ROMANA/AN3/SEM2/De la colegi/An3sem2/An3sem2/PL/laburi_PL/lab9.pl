% Liste diferență. Efecte laterale

add2(X, LS, LE, RS, RE):- RS = LS, LE = [X|RE].
% variabila de la finalul listei va conține pe prima poziție elementul de adăugat

append_dl(LS1,LE1, LS2,LE2, RS,RE):- RS=LS1, LE1=LS2, RE=LE2.

tree1(t(6, t(4,t(2,t(1,nil,nil),nil),t(5,nil,nil)), t(9,t(7,nil,nil),nil))).
tree2(t(8, t(5, nil, t(7, nil, nil)), t(9, nil, t(11, nil, nil)))).

inorder_dl(nil,L,L). % lista vida este reprezentată de 2 variabile egale
inorder_dl(t(K,L,R),LS,LE):-
				inorder_dl(L,LSL,LEL), % apel pe subarbore stâng
				inorder_dl(R,LSR,LER), % apel pe subarbore drept
				LS=LSL,
				LEL=[K|LSR], % K este adăugat în fața la LSR
				LE=LER.

quicksort_dl([H|T], S, E):- % s-a adăugat un parametru nou
				partition(H, T, Sm, Lg), % predicatul partition a rămas la fel
				quicksort_dl(Sm, S, [H|L]),
				quicksort_dl(Lg, L, E).
quicksort_dl([], L, L). % condiția de terminare s-a modificat

% :-dynamic nume_predicat/aritate

:-dynamic memo_fib/2.
fib(N,F):- memo_fib(N,F), !.
fib(N,F):- N>1,
	N1 is N-1,
	N2 is N-2,
	fib(N1,F1),
	fib(N2,F2),
	F is F1+F2,
	assertz(memo_fib(N,F)).
fib(0,1).
fib(1,1).

% 1. Convertește o listă incompletă într-o listă diferență și viceversa.

li_to_ld(Li,Ls,Le) :- li_to_ld(Li,Ls,Le,Acc), append(Acc,Le,Ls).
li_to_ld([H|T],Ls,Le,[]) :- var(H), !.
li_to_ld([H|T],Ls,Le,[H|Acc]) :- li_to_ld(T,Ls,Le,Acc).

ld_to_li(Li,Ls,Le) :- ld_to_li(Li,Ls,Le,Acc), append(Acc,_,Li).
ld_to_li(Li,[H|T],Le,[]):-var(H), !. 
ld_to_li(Li,[H|T],Le,[H|Acc]) :- ld_to_li(Li,T,Le,Acc).

% 2. Convertește o listă completă într-o listă diferență și viceversa.

lc_to_ld(Lc,Ls,Le) :- lc_to_ld(Lc,Ls,Le,Acc), append(Acc,Le,Ls).
lc_to_ld([H|T],Ls,Le,[H|Acc]) :- lc_to_ld(T,Ls,Le,Acc).
lc_to_ld([],Ls,Le,[]).

ld_to_lc(Lc,Ls,Le) :- ld_to_lc(Lc,Ls,Le,Acc), Lc = Acc.
ld_to_lc(Lc,[H|T],Le,[]) :- var(H), !.
ld_to_lc(Lc,[H|T],Le,[H|Acc]) :- ld_to_lc(Lc,T,Le,Acc).

% 3. Generează toate descompunerile posibile a unei liste în doua sub-liste fără a folosi predicatul predefinit findall.
% ?- all_decompositions([1,2,3], List).
% List=[ [[], [1,2,3]], [[1], [2,3]], [[1,2], [3]], [[1,2,3], []] ] ;
% false

append1([], L2, L2).
append1([H|T], L2, [H|CoadaR]) :- append1(T,L2, CoadaR).

all_decompositions(Lc,R) :- all_decompositions(Lc,Acc,R,[]).
all_decompositions([H|T],[H|Acc],[Accp,Acc1|R],Accp) :- append(Accp,[H],Accp1),Acc1 = [H|Acc],all_decompositions(T,Acc,R,Accp1).
all_decompositions([],[],[[]|[Accp1]],Accp1).


% 4. Aplatizează o listă adâncă folosind liste diferență în loc de append.
% ?- flat_dl([[1], 2, [3, [4, 5]]], RS, RE).
% RS = [1, 2, 3, 4, 5|RE] ;
% false

flatten([H|T],[H|LS],LE) :- atomic(H), !, flatten(T,LS,LE).
flatten([H|T],LS,LE) :- flatten(H,LHS,LHE),
						flatten(T,LTS,LTE),
						LS = LHS,
						LHE = LTS,
						LE = LTE.
flatten([],L,L).


% 5. Colectează toate nodurile care au chei pare, dintr-un arbore binar folosind liste diferență.

inorder(t(K,L,R), List):-inorder(L,LL), inorder(R,LR), append(LL, [K|LR], List).
inorder(nil, []).

collect_nodes(T,Ls,Le) :- collect_nodes(T,Ls,Le,Acc), append(Acc,Le,Ls).
collect_nodes(T,Ls,Le,Acc) :- inorder(T,List), adaugare(List,Acc).

adaugare([H|T],[H|Acc]) :- 0 is mod(H,2), !, adaugare(T,Acc). %sau H mod 2 =:= 0
adaugare([H|T],Acc) :- adaugare(T,Acc).
adaugare([],[]).

% 6. Colectează toate nodurile care au chei între K1 și K2, dintr-un arbore binar folosind liste diferență.

collect_nodes1(T,Ls,Le,K1,K2) :- collect_nodes1(T,Ls,Le,Acc,K1,K2), append(Acc,Le,Ls).
collect_nodes1(T,Ls,Le,Acc,K1,K2) :- inorder(T,List), adaugare1(List,Acc,K1,K2).


adaugare1([H|T],[H|Acc],K1,K2) :- H >= K1, H =< K2, !, adaugare1(T,Acc,K1,K2). %sau H mod 2 =:= 0
adaugare1([H|T],Acc,K1,K2) :- adaugare1(T,Acc,K1,K2).
adaugare1([],[],K1,K2).