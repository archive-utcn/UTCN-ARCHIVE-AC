member1(X,[X|_]):-!.
membwe1(X,[_|T]):-member1(X,T).

%length with forward recursion
length_fwd([], Acc, Res):- Res = Acc.
length_fwd([H|T], Acc, Res):- Acc1 is Acc+1, length_fwd(T, Acc1, Res).

%append
append1([],L,L).
append1([H|T],L,[H|R]):-append1(T,L,R).

%reverse
reverse([],[]).
reverse([H|T],Res):-reverse(T,R1),append1(R1,[H],Res).