
% lab 6

max(X, Y, X) :- X>Y, !.
max(_, Y, Y). 

depth([],1).
depth([H|T],R):- atomic(H), !, depth(T,R).
depth([H|T],R):- depth(H,R1), depth(T,R2), R3 is R1+1, max(R3,R2,R).

flatten([],[]).
flatten([H|T], [H|R]):- atomic(H), !, flatten(T,R).
flatten([H|T], R):- flatten(H,R1), flatten(T,R2), append(R1,R2,R).


heads([],[],_).
% dacă flag=1 atunci suntem la început de lista și putem extrage capul listei; în apelul recursiv setam flag=0
heads([H|T],[H|R],1):- atomic(H), !, heads(T,R,0).
% dacă flag=0 atunci nu suntem la primul element atomic și atunci continuam cu restul elementelor
heads([H|T],R,0):- atomic(H), !, heads(T,R,0).
% dacă am ajuns la aceasta clauza înseamnă că primul element nu este atomic și atunci trebuie să apelam recursiv și pe acest element
heads([H|T],R,_):- heads(H,R1,1), heads(T,R2,0), append(R1,R2,R).
heads_pretty(L,R):- heads(L, R, 1).

% ex 1
count_atomic([], 0).
count_atomic([H|T], R) :- atomic(H), !, count_atomic(T, R1), R is R1 +1.
count_atomic([_|T], R) :- count_atomic(T, R).


% ex 2
sum_atomic([], 0).
sum_atomic([H|T], R) :- atomic(H), !, sum_atomic(T, R1), R is R1 + H.
sum_atomic([_|T], R) :- sum_atomic(T, R).

% ex 3
member2(H,[H|_]):- !.
member2(X,[H|_]):-member2(X,H).
member2(X,[_|T]):-member2(X,T).

% ex 4

last_atomic([],[]).
last_atomic([H|T],[H|_]):-atomic(H), T=[].
last_atomic([H|T], R):- atomic(H), last_atomic(T, R).
last_atomic([H|T], R):- last_atomic(H, R1), last_atomic(T, R2), append(R1, R2, R).

% ex 5
replace(_, _, [], []):- !.
replace(X, Y, [X|T], [Y|R]) :- replace(X, Y, T, R), !.
replace(X, Y, [H|T], [H|R]) :- atomic(H), !, replace(X, Y, T, R).
replace(X, Y, [H|T], R) :- replace(X, Y, H, R1), replace(X, Y, T, R2), R= [R1| R2], !.

% ex 6 ?!
delete1(H, [H| T], T).
delete1(X, [H| T], [H|R]) :- delete1(X, T, R).
delete1(_, [], []).

min_depth([H|T], M) :- min_depth(T, M), depth([M], R1), depth([H], R2), R1<R2.
min_depth([H|_], H) :- !.

sel_sort_depth(L, [M|R]):- min_depth(L, M), delete1(M, L, L1), sel_sort_depth(L1, R).
sel_sort_depth([], []):- !.


 