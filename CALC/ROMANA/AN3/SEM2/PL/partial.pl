%replace_duplicate(_,[],[]).
%replace_duplicate(X,[H|T],[X|R]):- member(H,T),!, replace_duplicate(X,T,R).
%replace_duplicate(X,[H|T],[E|R]):- replace_duplicate(X,T,R).

%remove_duplicates([],[]).
%emove_duplicates([H|T],R):- member(H,T), remove_duplicates(T,R).
%emove_duplicates([H|T],[H|R]):- remove_duplicates(T,R).

replace_all(_,_,[],[]).
replace_all(X,Y,[X|T],[Y|R]):-replace_all(X,Y,T,R).
replace_all(X,Y,[H|T],[H|R]):- X\=H, replace_all(X,Y,T,R).

replace_duplicate(_,L,[],L).
replace_duplicate(X,L,[H|T],R):-member(H,T),!,replace_all(H,X,L,L1),replace_duplicate(X,L1,T,R).
replace_duplicate(X,L,[_|T],R):-replace_duplicate(X,L,T,R).

replace_duplicate_p(X,L,R):-replace_duplicate(X,L,L,R).