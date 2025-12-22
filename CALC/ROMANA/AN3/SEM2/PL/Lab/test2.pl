s(_,L):-var(L),!,fail.
s(X,[X|_]):-!.
s(X,[_|T]):-s(X,T).

flatten(V,[]):-var(V),!.
flatten([H|T], [H|R]):- atomic(H), !, flatten(T,R).
flatten([H|T], R):- flatten(H,R1), flatten(T,R2), append(R1,R2,R).

tree1(t(6, t(4,t(2,_,_),t(5,_,_)), t(9,t(7,_,_),_))).

%search_it(_,T):- var(T),!,fail.
search_it(Key,t(Key,_,_)):- !.
search_it(Key,t(K,L,_)):- Key<K,!,search_it(Key,L).
search_it(Key,t(_,_,R)):- search_it(Key,R).

height(T,0):- var(T),!.
height(t(_,L,R),H):-height(L,HL),height(R,HR), max(HL,HR,HH), H is HH+1.

max(A,B,C):- A>B,!, C is A.
max(_,B,C):- C is B. 

m(X,[X|_]):-!.
m(X,[H|_]):-m(X,H).
m(X,[_|T]):-m(X,T).

insert_il(X,[X|_]).
insert_il(X,[_|T]):-insert_il(X,T).

s2(_,L):-var(L),!,fail.
s2(X,[X|_]).
s2(X,[_|T]):-s2(X,T).

member_il(_, L):-var(L), !, fail.
member_il(X, [X|_]).
member_il(X, [_|T]):-member_il(X, T).

