tree1(t(6, t(4,t(2,nil,nil),t(5,nil,nil)), t(9,t(7,nil,nil),nil))).
tree2(t(8, t(5, nil, t(7, nil, nil)), t(9, nil, t(11, nil, nil)))).

append1([], L2, L2).
append1([H|T], L2, [H|R1]) :- append1(T, L2, R1).

tree3(t(8, nil, t(5, nil, nil, t(7, nil, nil, nil)), t(9, nil, nil, t(11, nil, nil, nil)))).

inorder(t(K,L,R), List):-inorder(L,LL), inorder(R,LR), append1(LL, [K|LR], List).
inorder(nil, []).

% cheie, subarbore stâng și subarbore drept
preorder(t(K,L,R), List):-preorder(L,LL), preorder(R, LR), append1([K|LL], LR, List).
preorder(nil, []).

% subarbore stâng, subarbore drept și apoi cheia
postorder(t(K,L,R), List):-postorder(L,LL), postorder(R, LR), append1(LL, LR, R1), append1(R1, [K], List).
postorder(nil, []).

pretty_print(nil, _).
pretty_print(t(K,L,R), D):-D1 is D+1,pretty_print(L, D1),print_key(K, D),
pretty_print(R, D1).

% predicat care afișează cheia K la D tab-uri față de marginea din stânga și inserează o linie nouă
print_key(K, D):-D>0, !, D1 is D-1, write('\t'), print_key(K, D1).
print_key(K, _):-write(K), write('\n').
% write('\n') îi echivalent cu predicatul nl

% Predicatul search_key(Key, T) verifică dacă există un nod cu cheia Key în arborele T
search_key(Key, t(Key, _, _)):-!.
search_key(Key, t(K, L, _)):-Key<K, !, search_key(Key, L).
search_key(Key, t(_, _, R)):-search_key(Key, R).

insert_key(Key, nil, t(Key, nil, nil)). % inserează cheia în arbore
insert_key(Key, t(Key, L, R), t(Key, L, R)):-!. % cheia există deja
insert_key(Key, t(K,L,R), t(K,NL,R)):- Key<K,!,insert_key(Key,L,NL).
insert_key(Key, t(K,L,R), t(K,L,NR)):- insert_key(Key, R, NR).

delete_key(Key, t(Key, L, nil), L):-!.
delete_key(Key, t(Key, nil, R), R):-!.
delete_key(Key, t(Key, L, R), t(Pred,NL,R)):-!,get_pred(L,Pred,NL).
delete_key(Key, t(K,L,R), t(K,NL,R)):-Key<K,!,delete_key(Key,L,NL).
delete_key(Key, t(K,L,R), t(K,L,NR)):-delete_key(Key,R,NR).

% caută nodul predecesor
get_pred(t(Pred, L, nil), Pred, L):-!.
get_pred(t(Key, L, R), Pred, t(Key, L, NR)):-get_pred(R, Pred, NR).

height(nil, 0).
height(t(_, L, R), H):-height(L, H1), height(R, H2), max1(H1, H2, H3), H is H3+1.

% 1. Scrieți predicatele care iterează peste elementele unui arbore ternar
% 1.1. inorder=Left->Root->Middle->Right

inorder3(t(K,L,M,R), List):-inorder3(L,LL), inorder3(M,LM), inorder3(R,LR), append1(LL, LM, T), append1(T, [K|LR], List).
inorder3(nil, []).

% 1.2. preorder=Root->Left->Middle->Right

preorder3(t(K,L,M,R), List):-preorder3(L,LL), preorder3(M,LM), preorder3(R, LR), append1([K|LL], LM, T), append1(T, LR, List).
preorder3(nil, []).

% 1.3. postorder=Left->Middle->Right->Root

postorder3(t(K,L,M,R), List):-postorder3(L,LL), postorder3(M,LM), postorder3(R, LR), append1(LL, LM, R1), append1(R1, LR, R2), append1(R2, [K], List).
postorder3(nil, []).

% 2. Scrieți un predicat care calculează înălțimea unui arbore ternar.

height3(nil, 0).
height3(t(_, L, M, R), H):-height(L, H1), height(M, H2), height(R, H3), max1(H1, H2, H12), max1(H12, H3, H123), H is H123+1.

% 3. Rescrieți predicatul delete_key folosind nodul succesor.

delete_key2(Key, t(Key, L, nil), L):-!.
delete_key2(Key, t(Key, nil, R), R):-!.
delete_key2(Key, t(Key, L, R), t(Succ,L,NR)):-!,get_succ(R,Succ,NR).
delete_key2(Key, t(K,L,R), t(K,NL,R)):-Key<K,!,delete_key2(Key,L,NL).
delete_key2(Key, t(K,L,R), t(K,L,NR)):-delete_key2(Key,R,NR).

% caută nodul succesor

get_succ(t(Succ, nil, R), Succ, R):-!.
get_succ(t(Key, L, R), Succ, t(Key, NL, R)):-get_succ(L, Succ, NL).

% 4. Scrieți un predicat care colectează într-o listă toate cheile din frunzele arborelui binar.

frunza(t(_,L,R), Res) :- frunza(L,Acc1), frunza(R,Acc2), append(Acc1,Acc2,Res),!.
frunza(t(_,L,nil), Res) :- frunza(L, Res).
frunza(t(_,nil,R), Res) :- frunza(R, Res).
frunza(t(Key,nil,nil), [Key]).

% 5. Scrieți un predicat care calculează diametrul unui arbore binar
% 𝑑𝑖𝑎𝑚(𝑇) = max{𝑑𝑖𝑎𝑚(𝑇. 𝑙𝑒𝑓𝑡), 𝑑𝑖𝑎𝑚(𝑇. 𝑟𝑖𝑔ℎ𝑡), ℎ𝑒𝑖𝑔ℎ𝑡(𝑇. 𝑙𝑒𝑓𝑡) + ℎ𝑒𝑖𝑔ℎ𝑡(𝑇. 𝑟𝑖𝑔ℎ𝑡) + 1}

diam(nil, 0).
diam(t(_, L, R), D):-diam(L, D1), diam(R, D2), height(L, H1), height(R, H2), H12 is H1+H2+1, max1(D1, D2, D12), max1(D12,H12,D).

max1(X,Y,X):- X>Y,!.
max1(_,Y,Y).


% 6. (*) Scrieți un predicat care colectează într-o listă toate nodurile de la aceeași adâncime din arborele binar.

same_height(t(Key,L,R),[[H,Key]|Res]) :- 	height(t(Key,L,R), H),
											same_height(L,Res1),
											same_height(R,Res2),
											append1(Res1,Res2,Res), !.
same_height(t(Key,nil,nil),[[H,Key]]):- height(t(Key,nil,nil),H).		
same_height(nil,[]).	

adaugare([[H|T1]|T2],Res,H,Acc,Acc2) :- append1(T1,Acc,Accx), adaugare(T2,Res,H,Accx,Acc2),!.
adaugare([[H1|T1]|T2],Res,_,Acc,Acc2) :- append1([Acc],Acc2,Accx), adaugare(T2,Res,H1,T1,Accx).
adaugare([],[Acc|Acc2],_,Acc,Acc2).

sh(t(Key,L,R),Res) :- same_height(t(Key,L,R),Rezultat), msort(Rezultat,Res1), adaugare(Res1,Res,1,[],[]).

% 7. (*) Verificați dacă un arbore binar este simetric. Un arbore binar este simetric dacă subarborele stâng este imaginea în oglindă a subarborelui drept. Ne interesează structura arborelui nu și valorile din noduri.
% ?- tree1(T), symmetric(T).
% false
% ?- tree1(T), delete_key(2, T, T1), symmetric(T1).
% T = t(6,t(4,t(2,nil,nil),t(5,nil,nil)),t(9,t(7,nil,nil),nil)),
% T1 = t(6,t(4,nil,t(5,nil,nil)),t(9,t(7,nil,nil),nil)) ? ;
% false


%6.
adancime(t(Key,_,_),Key,Acc,Acc):-!.
adancime(nil,_,_,_):-!.
adancime(t(_,L,R),Key,Acc,Rez):- Acc1 is Acc+1, Acc2 is Acc+1, adancime(L,Key,Acc1,Rez),adancime(R,Key,Acc2,Rez).
adancime(T,Key,Rez):-adancime(T,Key,0,Rez).

collect(_,nil,_,[]):-!.
collect(T,t(Key,_,_),Ad,[Key]):- adancime(T,Key,Rez), Rez is Ad, !.
collect(T,t(_, L, R), Ad,List):-collect(T,L,Ad,LL), collect(T,R,Ad,LR), append(LL,LR,List).
collect(T,A,L):-collect(T,T,A,L).

%7.
simetrie(_,nil,[]).
simetrie(T,t(Key,nil,nil),[A]):-adancime(T,Key,A),!.
simetrie(T,t(_,L,R),List):-simetrie(T,L,L1), simetrie(T,R,L2), append(L1,L2, List).

