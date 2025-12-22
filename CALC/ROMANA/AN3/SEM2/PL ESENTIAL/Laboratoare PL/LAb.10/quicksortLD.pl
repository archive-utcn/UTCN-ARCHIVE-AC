%qsort_LD varianta cu unificari explicite
%qsort_LD(lista intrare, primul element lista intrare, ultimul element din lista de iesire)

qsort_LD([H|T], LFirst, LLast):-
	partition(H,T,Left<Right),
	qsort_LD(Left,FirstLeft,LastLeft),
	qsort_LD(Right,FirstRight,LastRight),
	LFirst=FirstLeft,
	LLast=LastRight,
	LastLeft=[H|FirstRight].
qsort_LD([],L,L).

%partition/4 predicatul este ->::::
%partition(pivot, sursa(lista de intrare), destinatie elem. < pivot, destiantie elem. >pivot)

partition(X,[H|T1],[H|Left],Right):-
	H<X,!,
	partition(X,T1,Left,Res).
partition(X,[H|T1],Left,[H|Right]) :-
	partition(X,T1,Left,Right).
partition(_,[],[],[]).

%apelare: quicksort(lista de intrare, lista oridonata de iesire)
quicksort(List, Result) :-
	qsort_LD(List, Result, []).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%	ceva nu merge

%%%%%%%%%%%%%%%%%%%% din lab.
quicksort_dl([H|T],S,E):-
	partition(H,T,Sm,Lg),
	quicksort_dl(Sm,S,[H|L]),
	quicksort_dl(Lg,L,E).
quicksort_dl([],L,L).		%%%%%nici asta nu merge.... plm