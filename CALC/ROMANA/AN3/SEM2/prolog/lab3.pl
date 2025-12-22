
member1(X, [X|_]).
member1(X, [_|T]) :- member(X, T).

append1([], L2, L2).
append1([H|T], L2, [H|CoadaR]) :- append(T, L2, CoadaR).

delete1(X, [X|T], T). % șterge prima apariție și se oprește
delete1(X, [H|T], [H|R]) :- delete1(X, T, R). % altfel iterează peste elementele listei
delete1(_, [], []). % daca a ajuns la lista vida înseamnă că elementul nu a fost găsit și putem returna lista vidă



append3(L1, L2, L3, R) :- append1(L2,L3,Rinterm), append1(L1,Rinterm,R).

add_first(X, L, [X|L]).

sum_list([], 0).
sum_list([H|T], Result) :- sum_list(T,Rinterm), Result is Rinterm + H.

separe_parity([], [], []).
separe_parity([H|T], [H|T1], Rimpar) :- 0 is H mod 2, separe_parity(T, T1, Rimpar).
separe_parity([H|T], Rpar, [H|T1]) :- 1 is H mod 2, separe_parity(T, Rpar, T1).

my_delete_all(X, [X|T], R) :- my_delete_all(X, T, R).
my_delete_all(X, [H|T], [H|R]) :- X \= H, my_delete_all(X, T, R).
my_delete_all(_, [], []).

remove_duplicates([], []).
remove_duplicates([H|T], [H|R]) :- my_delete_all(H,T,L), remove_duplicates(L,R).

remove_duplicates2([],[]).
remove_duplicates2([H|T], R) :- member1(H, T), remove_duplicates2(T,R).
remove_duplicates2([H|T], [H|R]) :- not(member1(H, T)), remove_duplicates2(T,R).

replace_all(_,_,[],[]).
replace_all(X,Y,[X|T],[Y|R]) :- replace_all(X,Y,T,R).
replace_all(X,Y,[H|T],[H|R]) :- X \= H, replace_all(X,Y,T,R).

drop_k_acc([],_,_,[]).
drop_k_acc([H|T],X,Acc,[H|R]) :- Acc \= 1, Acc1 is Acc - 1, drop_k_acc(T,X,Acc1,R).
drop_k_acc([_|T],X,Acc,R) :- Acc = 1, drop_k_acc(T,X,X,R).
drop_k(L,X,R) :- drop_k_acc(L,X,X,R).
