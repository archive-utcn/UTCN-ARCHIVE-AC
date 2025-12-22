b([],_,_,[]).
b([H|T], A, B, [H|R]):- H>=A, H=<B, !, b(T,A,B,R).
b([_|T],A,B,R):- b(T,A,B,R).