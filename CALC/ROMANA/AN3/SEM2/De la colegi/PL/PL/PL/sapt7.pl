count_atomic([],0).
count_atomic([H|T],K):- atomic(H), H\=[], ! , count_atomic(T,C), K is C+1.
count_atomic([H|T],K):- count_atomic(T,K).


sum_atomic([],0).
sum_atomic([H|T],Sum):- atomic(H), number(H), ! ,sum_atomic(T,Aux), Sum is Aux+H.
sum_atomic([H|T],Sum):-sum_atomic(T,Sum).

member1(X, [X|_]).
member1(X, [L|_]) :- member1(X, L).
member1(X, [_|T]) :- member1(X, T).

%lasts([],[]).
%lasts([H|[]],[H]):- atomic(H),!.
%lasts([H|T],R):- atomic(H), !, lasts(T,R). 
%lasts([H|T],R):- lasts(T, R1), lasts(T, R2), append(R1,R2, R).

lasts2([],[]).
lasts2([H|[]],[H]):- atomic(H),!. 
lasts2([H|T],R):- atomic(H), !, lasts2(T,R).
lasts2([H|T],R):- lasts2(H,R1), lasts2(T,R2), append(R1,R2,R).




