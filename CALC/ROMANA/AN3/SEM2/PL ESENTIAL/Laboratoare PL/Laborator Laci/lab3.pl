% laboratorul 3

member1(X, [X|_]).
member1(X, [_|T]) :- member1(X, T).

append1([], L2, R) :- R = L2.
append1([H|T], L2, R) :- append1(T, L2, CoadaR), R=[H|CoadaR].

append2([], L2, L2).
append2([H|T], L2, [H|CoadaR]) :- append2(T, L2, CoadaR).


delete1(X, [X|T], T). % șterge prima apariție și se oprește
delete1(X, [H|T], [H|R]) :- delete1(X, T, R). % altfel iterează peste elementele listei
delete1(_, [], []). % daca a ajuns la lista vida înseamnă că elementul nu a fost găsit și putem returna lista vidă

delete_all1(X, [X|T], R) :- delete_all1(X, T, R). % dacă s-a șters prima apariție se va continua și pe restul elementelor
delete_all1(X, [H|T], [H|R]) :- delete_all1(X, T, R).
delete_all1(_, [], []).

% exercitii
% ex1
append3(L1, L2, L3, R) :- append1(L2, L3, R1), append1(L1, R1, R).

% ex2
add_first(X, L, R) :- R=[X| L].

% ex3
sum([], 0).
sum([H|T], R) :-  sum(T, R1), R is R1 + H. 

% ex4
separate_parity([], [], []).
separate_parity([H|T], [H1|T1], T2) :- R is H mod 2, R = 0,
 H1 = H , 
separate_parity(T, T1, T2).
separate_parity([H|T], T1, [H2|T2]):- R is H mod 2, R = 1, 
H2 = H , 
separate_parity(T,T1,T2)

% ex5
remove_duplicates([], []).
remove_duplicates([H|T], L) :- member1(H, T), remove_duplicates(T, L).
remove_duplicates([H|T], [H|L]) :- \+member1(H, T), remove_duplicates(T, L).



% ex6
replace_all(X, Y, [X|T], [Y|R]) :- replace_all(X, Y, T, R).
replace_all(X, Y, [H|T], [H|R]) :- replace_all(X, Y, T, R).
replace_all(_, _, [], []).


%ex 7
drop_k([], _, _, []).
drop_k([_|T], K, K, R) :- drop_k(T, K, 1, R), !.
drop_k([H|T], K, I, [H|R]) :- Aux is I + 1, drop_k(T, K, Aux, R).
drop_k(Lis, K, R) :- drop_k(Lis, K, 1, R).