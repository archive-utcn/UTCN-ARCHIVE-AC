max(A,B,A) :- A>B,!.
max(_,R,R).

max1([H|T], M) :- max1(T, M), M>H, !.
max1([H|_], H).

append([],L,L).
append([H|T],L,[H|R]):-append(T,L,R).

flatten(V,[]):-var(V),!.
flatten([],[]).
flatten([H|T], [H|R]):- atomic(H), !,flatten(T,R).
flatten([H|T], R):- flatten(H,R1), flatten(T,R2), append(R1,R2,R).

flatten2(V,L,L):-var(V),!.
flatten2([],L,L).
flatten2([H|T], [H|Le],Ls):- atomic(H), !,flatten2(T,Le,Ls).
flatten2([H|T], Le,Ls):- flatten2(H,Le,Int), flatten2(T,Int,Ls).


%ld_to_lc(Ls,Le,L).
ld_to_lc(V,_,[]):-var(V),!.
ld_to_lc([H|T],Le,[H|L]):- ld_to_lc(T,Le,L).

li_to_lc(V,[]):-var(V),!.
li_to_lc([H|T],[H|L]):- li_to_lc(T, L).

lc_to_li(L, Li):- append(L,_,Li).

lc_to_ld(L, Ls,Le):- append(L,Le,Ls).

ld_to_li(Ls,Le,L):-  ld_to_lc(Ls, Le, L1), lc_to_li(L1,L).

%member1(X,L).

member1(X,[X|_]):-!.
member1(X,[H|T]):- atomic(H),!,member1(X,T).
member1(X,[H|T]):- member1(X,H); member1(X,T).
tre(t([6,[9|_],[[12|_],15|_]|_],t([[1|_],[[3|_],6|_]|_],nil,t([[[6|_],6|_]|_],nil,nil)),t([[20|_],26|_],t([18,[19|_]|_],nil,nil),nil))).
tre1(t(5,t(3,t(2,_,_),t(4,_,_)),t(7,t(6,_,_),t(8,_,_)))).
sear(t(K,L,R),X):- flatten(K,Lc),member(X,Lc),!.
sear(t(K,L,R),X):- sear(L,X),!.
sear(t(K,L,R),X):- sear(R,X),!.

inord(nil,[]).
inord(t(K,L,R),List):-
	inord(L,Left),
	inord(R,Right),
	flatten(K,KeyF),
	flatten(Right,RightF),
	flatten(Left,LeftF),
	append3(LeftF,KeyF,RightF,List).
	
append3(L1,L2,L3,R) :- append(L2,L3,R1),append(L1,R1,R).
	
inord2(nil,L,L).
inord2(t(K,L,R),Ls, Le):-
	inord2(L,Ls,Ks),
	inord2(R,Ke,Le),
	flatten2(K,Ks,Ke).

	
	
member2(X,[X|_],[X|_]):-!.
member2(X,[H|T],[H|L]):-member2(X,T,L).

li_to_ld(Li,L,L):- var(Li),!.
li_to_ld([H|T],[H|Ls],Le):- li_to_ld(T,Ls,Le).

deletee(X,[],[]):-!.
deletee(X,[X|T],R):-!,deletee(X,T,R).
deletee(X,[H|T],[H|R]):- deletee(X,T,R).

inv([],Lp,Lp).
inv([H|T], Lp, R):-inv(T,[H|Lp],R).
inv(L,I):-inv(L,[],I).

 

inord_i(V,[]):-var(V),!.
inord_i(t(K,L,R),Rez):-
	inord_i(L,Left),
	inord_i(R,Right),
	append(Right,[K|Left],Rez).
	
insertE([H|T],E,[H|R]):-E>H,!,insertE(T,E,R).
insertE(L,E,[E|L]).

cautLI(V,_):-var(V),!,fail.
cautLI([H|T], H):-!.
cautLI([_|T],X):-cautLI(T,X).
