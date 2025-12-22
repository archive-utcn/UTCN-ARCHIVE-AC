append_il([], L, L).
append_il([L], L2, L2) :- var(L), !.
append_il([H|T], L2,[H|TR]) :-append_il(T, L2, TR).

insert_il(X, L):-var(L), !, L=[X|_].
insert_il(X, [X|_]):-!. % elementul există deja
insert_il(X, [_|T]):- insert_il(X, T).

reverse_il(L, _) :- var(L),!.
reverse_il([H|T], R) :- reverse_il(T, R), insert_il(H, R).

incompleteToComplete(L, []):-var(L), !.
incompleteToComplete([H|T], [H|TR]):-incompleteToComplete(T, TR).

completeToIncomplete(L, R) :- append_il(L, [_], R).

preorder(T,T):-var(T), !.
preorder(t(K,L,R), List):- preorder(L, LL), preorder(R, LR),
                          append_il([k|LL], LR, List).