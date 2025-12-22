%eliminam duplicatele dintr-o lista.Se pastreaza ultima aparitie
member1(X,[X|_]).
member1(X,[_|T]):-member1(X,T).

remove_duplicates([], []).
remove_duplicates([H|T],[H|R]):- \+ member(H,T),remove_duplicates(T,R).
remove_duplicates([H|T],R):-member(H,T),remove_duplicates(T,R).


replace_all(_,_,[],[]).
replace_all(X,Y,[X|T],[Y|R]):-replace_all(X,Y,T,R).
replace_all(X,Y,[H|T],[H|R]):-X\=H, replace_all(X,Y,T,R).