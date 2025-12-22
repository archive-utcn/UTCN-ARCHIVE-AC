append3(L1,L2,L3,R):- append(L2,L3,Res1),
                      append(L1,Res1,Res).

append([],L,L).
append([H|T],L,[H|R]):-
                 append(T,L,R).

add_first(X,L,R):- append([X],L,R).

sum([H|T], R):-
    sum(T, R1),
    R is R1 + H.

separate_parity([],[],[]).
separate_parity([H|T],[H|E],O):- 0 is H mod 2 , separate_parity(T,E,O).
separate_parity([H|T],E,[H|O]):- 1 is H mod 2, separate_parity(T,E,O).


%eliminam duplicatele dintr-o lista.Se pastreaza ultima aparitie
member1(X,[X|_]).
member1(X,[_|T]):-member1(X,T).

remove_duplicates([], []).
remove_duplicates([H|T],[H|R]):- \+ member(H,T),remove_duplicates(T,R).
remove_duplicates([H|T],R):-member(H,T),remove_duplicates(T,R).


replace_all(_,_,[],[]).
replace_all(X,Y,[X|T],[Y|R]):-replace_all(X,Y,T,R).
replace_all(X,Y,[H|T],[H|R]):-X\=H, replace_all(X,Y,T,R).