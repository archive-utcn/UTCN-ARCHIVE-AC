wrapper(In,Out):-
	sort(In,[],Out).
	
sort(In,Acc,Out):-
	max(In,M),
	delete1(M,In,Int),
	sort(Int,[M|Acc],Out).
sort([],Out,Out).


max([H|T], M) :- max(T, M), M>H, !.
max([H|_], H).

min([H|T], M) :- min(T, M), M<H, !.
min([H|_], H).	


delete1(X, [X|T], T) :- !.
delete1(X, [H|T], [H|R]) :- delete1(X, T, R).
delete1(_, [], []).	


wrapper2(In,Out):-
	sort2(In,[],Out).
	
sort2(In,Acc,Out):-
	min(In,M),
	delete1(M,In,Int),
	NA = [M|Acc],
	sort2(Int,NA,Out).
sort2([],Out,Out).
