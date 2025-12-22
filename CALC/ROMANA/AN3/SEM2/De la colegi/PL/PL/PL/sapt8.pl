tree1(t(6, t(4,t(2,nil,nil,nil),nil,t(7,nil,nil,nil)),t(5,nil,nil,nil), t(9,t(3,nil,nil,nil),nil,nil))).

inorder3(t(K,L,M,R), List):-inorder3(L,LL), inorder3(M, LM), inorder3(R,LR),
append(LL, [K|LM], Int), append(Int, LR, List).
inorder3(nil, []).

preorder3(t(K,L,M,R), List):-preorder3(L,LL), preorder3(M, LM), preorder3(R, LR),
append([K|LL], LM, Int), append(Int, LR, List).
preorder3(nil, []).

postorder3(t(K,L,M,R), List):-postorder3(L,LL), postorder3(M, LM), postorder3(R, LR),
append(LL, LM, Int1), append(Int1, LR, Int2), append(Int2, [K], List).
postorder3(nil, []).


max(X, Y, X) :- X>Y, !.
max(_, Y, Y).

height3(nil, 0).
height3(t(_, L, M, R), H):-height3(L, H1),
height3(M, H2),
height3(R, H3),
max(H1, H2, HAUX),
max(HAUX, H3, HM),
H is HM+1.

get_succ(t(Succ, nil, R), Succ, R):-!.
get_succ(t(Key, L, R), Succ, t(Key, NL, R)):-get_succ(L, Succ, NL).

delete_key(Key, t(Key, L, nil), L):-!.
delete_key(Key, t(Key, nil, R), R):-!.
delete_key(Key, t(Key, L, R), t(Succ, L, NR)):-!,get_succ(R, Succ, NR).
delete_key(Key, t(K,L,R), t(K,NL,R)):-Key<K,!,delete_key(Key,L,NL).
delete_key(Key, t(K,L,R), t(K,L,NR)):-delete_key(Key,R,NR).







