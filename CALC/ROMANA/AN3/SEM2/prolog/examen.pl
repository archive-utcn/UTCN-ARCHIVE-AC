tree1(t(6, t(4,t(2,nil,nil),t(5,nil,nil)), t(9,t(7,nil,nil),nil))).

replace(_,_,nil,nil).

replace(K,NK,t(K,L,R),t(NK,L,R)):-!.

replace(K,NK,t(Key,L,R),t(Key,NL,R)):-
	K<Key,
	!,
	replace(K,NK,L,NL).

replace(K,NK,t(Key,L,R),t(Key,L,NR)):-
	replace(K,NK,R,NR).