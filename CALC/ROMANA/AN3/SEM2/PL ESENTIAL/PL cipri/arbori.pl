tree1(t(6, t(4, t(2, nil, nil), t(5, nil, nil)), t(9, t(7, nil, nil), nil))).
tree2(t(8, t(5, nil, t(7, nil, nil)), t(9, nil, t(11, nil, nil)))). % 1.parcurgere arbore
% 2.cauta o cheie in arbore
% 3.insereaza o cheie in arbore
% 4.sterge o cheie din arbore
% 5.inaltimea unui arbore
% 6.verifica daca este sau nu arbore
% 7.numara frunzele unui arbore
% 8.colecteaza frunzele intr-o lista
% 9.colecteaza nodurile interne intr-o lista
% 10.colecteaza nodurile de pe un nivel intr-o lista
% 11.ternary tree(inorder,preorder,postorder,inaltime)
% 12. Alter the predicate for the inorder traversal of a binary search tree suchthat the keys are printed on the screen instead of collecting them in a list.
% 13. Alter the delete_key predicate for deleting a key from a binary searchtree, such that when the key is in a node with two children you apply thesecond
% solution: “hang” the left sub-tree to the right sub-tree, or viceversa.
% 14. Write a predicate which collects, in a list, all the keys found in leaf(frunza) nodes of a binary search tree.
% 15.Cate noduri din arbore binar au exact 2 copii
% 16.Suma cheilor nodurilor care au un singur copil in t3
% 17.diameteru

% 1.parcurgere arbore
inorder(t(K,L,R), List):- inorder(L,LL), inorder(R, LR), 
	append(LL, [K|LR],List).
inorder(nil, []). 
preorder(t(K,L,R), List):- preorder(L,LL), preorder(R, LR),
	append([K|LL], LR, List).
preorder(nil, []).
postorder(t(K,L,R), List):- postorder(L,LL), postorder(R, LR),
	append(LL, LR,R1), append(R1, [K], List).
postorder(nil, []). 
% 2.cauta o cheie in arbore
search_key(Key, t(Key, _, _)):- !.
search_key(Key, t(K, L, _)):- Key<K, !, search_key(Key, L).
search_key(Key, t(_, _, R)):- search_key(Key, R). 
% 3.insereaza o cheie in arbore
insert_key(Key, nil, t(Key, nil, nil)):- write('Inserted '), write(Key), nl.
insert_key(Key, t(Key, L, R), t(Key, L, R)):- !, write('Key already in tree\n').
insert_key(Key, t(K, L, R), t(K, NL, R)):- Key<K, !, insert_key(Key, L, NL).
insert_key(Key, t(K, L, R), t(K, L, NR)):- insert_key(Key, R, NR). 
% 4.sterge o cheie din arbore
delete_key(Key, nil, nil):- write(Key), write(' not in tree\n').
delete_key(Key, t(Key, L, nil), L):- !. % copil stanga sau pt frunza (L=nil)
delete_key(Key, t(Key, nil, R), R):- !. % copil dreapta
%search the key to delete
delete_key(Key, t(K, L, R), t(K, NL, R)):- Key<K, !, delete_key(Key, L, NL).
delete_key(Key, t(K, L, R), t(K, L, NR)):- delete_key(Key, R, NR). 
%delete the key
delete_key(Key, t(Key, L, R), t(Pred, NL, R)):- !, get_pred(L, Pred, NL).
get_pred(t(Pred, L, nil), Pred, L):- !.
get_pred(t(Key, L, R), Pred, t(Key, L, NR)):- get_pred(R, Pred, NR). 

% 5.inaltimea unui arbore
max(A, B, A):- A>B, !.
max(_, B, B).
height(nil, 0).
height(t(_, L, R), H):- height(L, H1), height(R, H2), max(H1, H2, H3),
	H is H3+1. 
% 6.verifica daca este sau nu arbore
istree(nil).
istree(t(_,L,R)) :- istree(L), istree(R).

% 7.numara frunzele unui arbore
count_leaves1(nil,0).
count_leaves1(t(_,nil,nil),1):- !.
count_leaves1(t(_,L,R),N):- count_leaves1(L,NL), count_leaves1(R,NR), N is NL+NR.

% 8.colecteaza frunzele intr-o lista
leaves1(nil,[]).
leaves1(t(X,nil,nil),[X]):- !.
leaves1(t(_,L,R),S):- leaves1(L,SL), leaves1(R,SR), append(SL,SR,S).

% 9.colecteaza nodurile interne intr-o lista
internals1(nil,[]).
internals1(t(_,nil,nil),[]):- !.
internals1(t(X,L,R),[X|S]):- internals1(L,SL), internals1(R,SR), append(SL,SR,S).

% 10.colecteaza nodurile de pe un nivel intr-o lista
atlevel(nil,_,[]).
atlevel(t(X,_,_),1,[X]).
atlevel(t(_,L,R),D,S):- D > 1, D1 is D-1, atlevel(L,D1,SL), atlevel(R,D1,SR), 
	append(SL,SR,S).

% 11.ternary tree
tree3(t(6, t(4, t(2, nil, nil,nil),nil,t(7,nil,nil,nil)),t(5,nil,nil,nil), t(9,nil,nil,t(3, nil, nil,nil)))).

%inorder traversal ternary tree
pretty_print_t3(nil, _).
pretty_print_t3(t(K,L,M,R), D):-D1 is D+1, 
							  pretty_print_t3(L, D1), 
							  print_key(K, D),
							  pretty_print_t3(M, D1), 
							  pretty_print_t3(R, D1).

inorder_t3(t(K,L,M,R), List):-inorder_t3(L,LL), 
				        inorder_t3(M, LM), 
					   inorder_t3(R, LR),
											  					   append3L(LL,LM,[K|LR],List).
inorder_t3(nil, []).

preorder_t3(t(K,L,M,R), List):-preorder_t3(L,LL),  
						     preorder_t3(M, LM),
							 preorder_t3(R, LR),
							 append3L([K|LL], LM, LR, List).
preorder_t3(nil, []).

postorder_t3(t(K,L,M,R), List):-postorder_t3(L,LL), 
							  postorder_t3(M, LM),
							  postorder_t3(R, LR),
							  append3L(LL, LM, LR, R1), 
							  append(R1, [K], List).
postorder_t3(nil, []).

%heightu la ternary3
max2(A,B,C,A):- A>B, A>C, !.
max2(A,B,C,C):- C>B, C>A, !.
max2(_,B,_,B).

height_t3(nil, 0).
height_t3(t(_, L, M, R), H):-height_t3(L, H1), 
						   height_t3(M, H2), 
						   height_t3(R,H3), 
						   max2(H1, H2, H3, H4),
						   H is H4+1.



%8.4 Quiz exercises
% 12. Alter the predicate for the inorder traversal of a binary search tree suchthat the keys are printed on the screen instead of collecting them in a list.
%pretty_print(nil, _).
%pretty_print(t(K,L,R), D):-D1 is D+1, pretty_print(L, D1), print_key(K, D),
%pretty_print(R, D1).

% 13. Alter the delete_key predicate for deleting a key from a binary searchtree, such that when the key is in a node with two children you apply thesecond solution: “hang” the left sub-tree to the right sub-tree, or viceversa.
delete_key1(Key, nil , nil):-write(Key), write(' not in tree\n').
delete_key1(Key, t(Key, L, nil), L):-!. % this clause covers also case for leaf (L=nil)
delete_key1(Key, t(Key, nil, R), R):-!.
delete_key1(Key, t(Key, L, R), t(Pred, L, NR)):-!, get_pred(R, Pred, NR).
delete_key1(Key, t(K, L, R), t(K, NL, R)):-Key<K, !, delete_key1(Key, L, NL).
delete_key1(Key, t(K, L, R), t(K, L, NR)):- delete_key1(Key, R, NR).
get_pred(t(Pred, L, nil), Pred, L):-!.
get_pred(t(Key, L, R), Pred, t(Key, L, NR)):-get_pred(R, Pred, NR).

% 14. Write a predicate which collects, in a list, all the keys found in leaf(frunza) nodes of a binary search tree.
leaf(t(Key,nil,nil),[Key]):-!.
leaf(t(Key,L,R),List):-leaf(L,L1),
				       leaf(R,L2),
					   append(L1,L2,List).
leaf(nil,[]).

leaf_t3(t(Key,nil,nil,nil),[Key]):-!.
leaf_t3(t(Key,L,M,R),List):-leaf_t3(L,L1),
							leaf_t3(M,L2),
							leaf_t3(R,L3),
							append3L(L1,L2,L3,List).
leaf_t3(nil,[]).

%8.5 Problems

% 15.Cate noduri din arbore binar au exact 2 copii
count_2child_node_t(t(_,nil,R),0):-!.
count_2child_node_t(t(_,L,nil),0):-!.
count_2child_node_t(t(Key,L,R),Rez):-count_2child_node_t(L,Rez1),
									 count_2child_node_t(R,Rez2),
									 Rez is 1+Rez1+Rez2.
count_2child_node_t(nil,0).

% 16.Suma cheilor nodurilor care au un singur copil in t3
sum_1child_node_t3(t(Key,nil,nil,nil),0):-!.
sum_1child_node_t3(t(Key,L,nil,nil),Sum):-!,sum_1child_node_t3(L,Sum1),Sum is Key + Sum1.
sum_1child_node_t3(t(Key,nil,nil,R),Sum):-!,sum_1child_node_t3(R,Sum1),Sum is Key + Sum1.
sum_1child_node_t3(t(Key,nil,M,nil),Sum):-!,sum_1child_node_t3(M,Sum1),Sum is Key + Sum1.
sum_1child_node_t3(t(Key,L,M,R),Sum):-sum_1child_node_t3(L,Sum1),
									  sum_1child_node_t3(M,Sum2),
									  sum_1child_node_t3(R,Sum3),
									  Sum is Sum1+Sum2+Sum3.
sum_1child_node_t3(nil,0).

% 17.diameteru
diameter(t(K,L,R),D):-diameter(L,D1),
					  diameter(R,D2),
					  height(L,D3),
					  height(R,D4),
					  D5 is D3+D4+1,
					  max2(D1,D2,D5,D).
diameter(nil,0).

