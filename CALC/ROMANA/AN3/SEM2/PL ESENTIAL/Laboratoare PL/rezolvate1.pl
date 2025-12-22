member1(X, [X|_]).
member1(X, [_|T]):-member1(X,T).

append1([],L,L).
append1([H|T],L,[H|R]):-append1(T,L,R).

 delete1(_,[],[]).
delete1(X,[X|T],T).
delete1(X,[H|T],[H|R]):-delete1(X,T,R).

delete_all1(_,[],[]).
delete_all1(X,[X|T],R):-delete_all1(X,T,R).
delete_all1(X,[H|T],[H|R]):-delete_all1(X,T,R).


append3([],[H|T],L3,[H|R]):-append3([],T,L3,R).
append3([],[],L,L).
append3([H|T],L1,L2,[H|R]):-append3(T,L1,L2,R).

add_the_beginning(X,L,[X|L]).

suma([], 0).
suma([H|T], S) :- suma(T, S1), S is S1 + H.

length1([],0).
length1([_|T],L):-length1(T,L1), L is L1+1.
					
suma(N1,N2,S):- S is N1+N2.

factorial(0,1).
factorial(N,F):- N>0, N1 is N-1, factorial(N1,F1), F is N* F1.


fibbonaci(0,1).
fibbonaci(1,1).
fibbonaci(N,R):- N1 is N-1,N2 is N-2, fibbonaci(N2,R2), fibbonaci(N1,R1), R is R1 +R2.

% ecuatia de gr 1
ecuatie(A,B,X):- X is (0 - B)/A.

% ecuatie de gr 2
 delta(A,B,C,D):- D is (B * B - ( 4 * A * C )).
 
 ecuatie1(A,B,C,X1,X2):- delta(A,B,C,D),
						 D >= 0,
						X1 is (( 0 - B ) + sqrt(D)) / 2 * A,
						X2 is (( 0 - B ) - sqrt(D)) / 2 * A.
						
% ABC este triunghi
triunghi(A,B,C):- A+B >C,
				  B+C >A, A+C>B.
				  
% cel mai mare divizor comun
gcd(X,X,X).
gcd(X,Y,Z):- X>Y, R is X-Y, gcd(R,Y,Z).
gcd(X,Y,Z):- X<Y, R is Y-X, gcd(X,R,Z).


% cel mai mic multiplu comun
cmmmc(A,B,R):-gcd(A,B,R1), R is (A* B) / R1.

% remove duplicates
 remove_dupli([],[]).
 remove_dupli([H|T],R):- member1(H,T),
						    % delete1(H,T,T1),
							remove_dupli(T,R).
remove_dupli([H|T],[H|R]):- remove_dupli(T,R).

					
separate_parity([],[],[]).
separate_parity([H|T],[H|E],O):-
					P is H mod 2,
					P is 1, !,
					separate_parity(T,E,O).
separate_parity([H|T],E,[H|O]):-
					separate_parity(T,E,O).				

					
replace_k(_,_,[],[]).					
replace_k(K,NewK,[K|T],[NewK|R]):- !,
						 replace_k(K,NewK,T,R).
replace_k(K, NewK,[H|T],[H|R]):- replace_k(K,NewK,T,R).
					
% delete al k element
remove_at([_|T],1,T).
remove_at([H|T],K,[H|R]) :- K > 1, 
   K1 is K - 1, remove_at(T,K1,R).
   
% reverse
reverse1([],[]).
reverse1([H|T],R):-reverse1(T,R1), append1(R1,[H],R).

reverse2([],R,R).
reverse2([H|T],A,R):-reverse2(T,[H|A],R).

reversee([H|T],R):-reverse2([H|T],[],R).
 
minimum([],M,M).
minimum([H|T],MP,M):- H<MP,!, minimum(T,H,M).
minimum([_|T],MP,M):- minimum(T,MP,M).
minimum1([H|T],R):-minimum([H|T], H,R).

maximum([],M,M).
maximum([H|T],MP,M):- H>MP,!, maximum(T,H,M).
maximum([_|T],MP,M):- maximum(T,MP,M).
maximum1([H|T],R):-maximum([H|T], H,R).

union1([],L,L).
union1([H|T],L2,R):- member1(H,L2),!,union1(T,L2,R).
union1([H|T],L1,[H|R]):- union1(T,L1,R).
 
inters([],_,[]).
inters([H|T],L2,[H|R]):- member1(H,L2),!,inters(T,L2,R).
inters([_|T],L2,R):- inters(T,L2,R).
 

diferenta(L,[],L).
diferenta(L,[H|T],R):- member1(H,L),!, delete1(H,L,R1),diferenta(R1,T,R).
diferenta(L,[_|T],R):- diferenta(L,T,R).

diferenta1([],_,[]).
diferenta1([H|T],L,R):- member1(H,L),!,diferenta1(T,L,R).
diferenta1([H|T],L,[H|R]):-diferenta1(T,L,R).
 

minim1([H],H).
% minim1([X,Y],X):- X=<Y, !.
% minim1([X,Y],Y):- X>Y, !.
minim1([H|X],H):- minim1(X,Y), H=<Y, !. 
minim1([_|X],Y):- minim1(X,Y).
 
 
delete_minim([],[]).
delete_minim(L,R):- minim1(L,M), delete1(M,L,R).
 
 
% remove_at1([H|T],K,R) :- K > 1, 
% K1 is K - 1, length1([H|T],LEN), LEN=K1,!, append1()).
% remove_at1([H|T],K,[H|R]):-remove_at1(T,K,R).
 
			

rle([H|T],Prec,Nr,Rez):-
			H=Prec,
			!,
			Nr1 is Nr + 1,
			rle(T, Prec, Nr1, Rez).
rle([H|T],Prec,Nr,[ [Prec,Nr] | Rez ]):-
			rle(T,H,1,Rez).			

rle([],Prec,Nr, [ [Prec,Nr] ]).


rle_encode([H|T],Rez):-
			rle(T,H,1,Rez).
rle_encode([],[]).
 
reverse3([],[]).
reverse3([H|T],R):- reverse3(T,R1), append1(R1,[H],R).

reverse_k(L,K,Rez):- append1(L1,L2,L),
					K1 is K-1,
					length(L1,LEN),
					K1=LEN,
					reverse3(L2,L3),
					append1(L1,L3,Rez).


perm_sort(L, R):-perm(L,R), is_ordered(R), !.
					
perm(L, [H|R]):-append(A, [H|T], L), append(A, T, L1), perm(L1, R).
perm([], []).

is_ordered([_]).
is_ordered([H1, H2|T]):-H1 =< H2, is_ordered([H2|T]).


sel_sort(L, [M|R]):- minimum1(L, M), delete1(M, L, L1), sel_sort(L1, R).
sel_sort([], []).


insert_ord(X, [H|T], [H|R]):-X>H, !, insert_ord(X, T, R).
insert_ord(X, T, [X|T]). 

bubble_sort(L, R):-one_pass(L, R1, F), nonvar(F), !, bubble_sort(R1, R).
bubble_sort(L, L).

one_pass([H1, H2|T], [H2|R], F):- H1>H2, !, F = 1, one_pass([H1|T], R, F).
one_pass([H1|T], [H1|R], F):-one_pass(T, R, F).
one_pass([], [] ,_).


% L1 = [1,2,3,[4]].
% L2 = [[1],[2],[3],[4,5]].
% L3 = [[],2,3,4,[5,[6]],[7]].
% L4 = [[[[1]]],1, [1]].
% L5 = [1,[2],[[3]],[[[4]]],[5,[6,[7,[8,[9],10],11],12],13]].
% L6= [alpha, 2,[beta],[gamma,[8]]].


max(X,Y,X):-
		X>Y,!.
max(_,Y,Y).

depth([],1).
depth([H|T],R):-atomic(H),!,depth(T,R).
depth([H|T],R):- depth(H,R1), depth(T,R2), R3 is R1+1, max(R3,R2,R).


flatten([],[]).
flatten([H|T],[H|R]):- 
						atomic(H), !,
						flatten(T,R).
flatten([H|T],R):-
					flatten(H,R1),
					flatten(T,R2),
					append1(R1,R2,R).
					
					
heads3([],[],_).
heads3(H|T],[H|R],1):-atomic(H),!,heads3(T,R,0).
heads3([H|T],R,0):-atomic(H),!,heads3(T,R,0).
heads3([H|T],R,_):-heads3(H,R1,1),heads3(T,R2,0), append(R1,R2,R).
heads(L,R) :- heads3(L, R,1).

member3(H,[H|_]).
member3(X,[H|_]):- member3(X,H).
member3(X,[_|T]):- member3(X,T).

nr_atomic([],0).
nr_atomic([H|T],R):- atomic(H), !,nr_atomic(T,R1),R is R1+1.
nr_atomic([H|T],R):- nr_atomic(H,R1), nr_atomic(T,R2), R is R1+R2.

elem([],0).

elem([H|T],R):-atomic(H),elem(T,R1),R is R1+1.

elem([_|T],R):-elem(T,R).


atomic_el([H|T],[H|R]):-
					atomic(H),
					!,
					atomic_el(T,R).
atomic_el([H|T],R):-
					atomic_el(H,R1),
					atomic_el(T,R2),
					append(R1,R2,R).
atomic_el([],[]).


sum_atomic([],0).
sum_atomic([H|T],R):- atomic(H),!, sum_atomic(T,R1), R is R1+H.
sum_atomic([_|T],R):- sum_atomic(T, R).


tails([],[]).
tails([H],[H]):-
				atomic(H),!.
% tails([H],[H|R]):-
%		 	tails(H,R).
tails([H|T],R):-
			atomic(H),
			!,
			tails(T,R).
tails([H|T],R):-
			tails(H,R1),
			tails(T,R2),
			append(R1,R2,R).
			
			
			
tree1(t(6,t(4,t(2,nil,nil),t(5,nil,nil)),t(9,t(7,nil,nil),t(11,nil,nil)))).
inorder(t(K,L,R),List):- inorder(L,LL), inorder(R,LR), append1(LL, [K|LR],List).
inorder(nil,[]).
preorder(t(K,L,R), List):- preorder(L,LL), preorder(R, LR), 
							append1([K|LL],LR, List).
preorder(nil, []).

postorder(t(K,L,R), List):- postorder(L, LL), postorder(R, LR),
							append1(LL,LR, List1), append1(List1, [K],List).
postorder(nil, []).


search_key(Key, t(Key,_,_)):-!.
search_key(Key, t(K,L,_)):- Key<K,!,
							search_key(Key,L).
search_key(Key, t(K,_,R)):- Key>K,!,
							search_key(Key,R).
							

 insert_key(Key,nil, t(Key, nil, nil)).
 insert_key(Key, t(Key, L, R), t(Key, L, R)):-!.
 insert_key(Key, t(K,L,R), t(K, NL,R)):- Key<K, !,
										insert_key(Key,L,NL).
 insert_key(Key, t(K,L,R), t(K, L,NR)):- 
									insert_key(Key,R,NR).		


stergere_key(_, nil, nil).
stergere_key(Key, t(Key,nil,R),R):-!.
stergere_key(Key, t(Key,L,nil),L):-!.
stergere_key(Key, t(Key,L,R), t(K,NL,R)):-!, sterge_nod(L,K,NL).
stergere_key(Key, t(Key1,L,R),t(Key1,NL,R)):- Key<Key1,!,
											stergere_key(Key, L,NL).
stergere_key(Key, t(Key1,L,R),t(Key1,L,NR)):- 
											stergere_key(Key, R,NR).					



inorder1(t(Key,L,R)):-
					inorder1(L),
					write(Key),
					write('    '),
					inorder1(R).
inorder1(nil).

preorder1(t(Key,L,R)):-
					write(Key),
					write('    '),
					preorder1(L),
					preorder1(R).
preorder1(nil).
						


leafs(nil,[]).
leafs(t(Key,nil,nil),[Key]):-!.
leafs(t(_,L,R),List):- leafs(L,L1),
					leafs(R,R1),
					append1(L1,R1,List).
maxx(A,B,A):- A>B,!.
maxx(_,B,B).
height(nil,0).
height(t(_,L,R),H):-
					height(L,H1),
					height(R,H2),
					maxx(H1,H2,H3),
					H is H3+1.
					
diameter(nil,0).
diameter(t(_,L,R),D):-
					diameter(L,D1),
					diameter(R,D2),
					height(L,H1),
					height(R,H2),
					H3 is H1+H2+1,
					maxx(D1,D2,D3),
					maxx(D3,H3,D).
					
					
atlevel(nil,_,[]).
atlevel(t(X,_,_),1,[X]).
atlevel(t(_,L,R),D,S) :- D > 1, D1 is D-1,
  atlevel(L,D1,SL), atlevel(R,D1,SR), append(SL,SR,S).
  
  
  levelorder(T,S) :- levelorder(T,S,1).

levelorder(T,[],D) :- atlevel(T,D,[]), !.
levelorder(T,S,D) :- atlevel(T,D,SD),
   D1 is D+1, levelorder(T,S1,D1), append(SD,S1,S).
   
   
 mirror(nil, nil).
 mirror(t(_,L1,R1),t(_,L2,R2)):-mirror(L1,R2), mirror(R1,L2).

simetric(nil).
simetric(t(_,L,R)):- mirror(L,R).


member_il(_,L):- var(L),!.
member_il(X,[X|_]):-!.
member_il(X,[_|T]):- member_il(X,T).

insert_il(X,L):-var(L), !, L=[X|_].
insert_il(X,[X|_]):-!.
insert_il(X,[_|T]):-insert_il(X,T).


insert_it(Key, t(Key, _, _)):-!.
insert_it(Key, t(K, L, _)):-Key<K, !, insert_it(Key, L).
insert_it(Key, t(_, _, R)):- insert_it(Key, R).


append1_il(L1,L2,L2):-var(L1),!.
append1_il([H|T],L,[H|R]):-append1_il(T,L,R).

preord(X,_):- 
			var(X), 
			!.
preord(t(K,L,R), Res):-
						preord(L,LL), 
						preord(R,LR),
						append1_il([K|LL], LR, Res).
						
						
sublist(S,_):-var(S),!.
sublist(_,L):-var(L),!,fail.
sublist([HS|TS],[HS|TL]):-
				is_sublist(TS,TL),!.
sublist([HS|TS],[_|TL]):-
				sublist([HS|TS],TL).
				
is_sublist(S,_):-var(S),!.
is_sublist(_,L):-var(L),!,fail.
is_sublist([H|T1],[H|T2]):-
			is_sublist(T1,T2).
						
			
sublist_of([HS|TS],[HS|T2]):-
							append1(TS,_,T2).
sublist_of([HS|TS],[_|T2]) :-
							sublist_of([HS|TS],T2).
is_sublist1([H|T1],[H|T2]) :-
							is_sublist1(T1,T2).
is_sublist1([],_).

perm4(L,[X|R]):-
		 % append1(A,[X|B],L),
		% append1(A,B,P),
	     member1(X,L), 
		 delete1(L,X,P), 
		perm4(P,R).
perm4([],[]).


merge([H1|T1], [H2|T2], [H1|R]):- 
							H1<H2,!,
							merge(T1, [H2|T2], R).
merge(L, [H2|T2], [H2|R]):- merge(L,T2,R).
merge([],L,L).
merge(L,[],L).


add11(X,LS,LE,RS,RE):- RS=LS, LE=[X|RE].
						
% stergere_dl(X,LS,RS,RE):- 
						


preorder_dl(nil,L,L).
preorder_dl(t(K,L,R),LS,LE):-
				preorder_dl(L,LSL,LEL),
				preorder_dl(R,LSR,LER),
				LS = [K|LSL],
				LEL = LSR,
				% LE = LER. 
				LER=LE.
				
				

% parcurgere in postordine

postorder_dl(nil,L,L).
postorder_dl(t(K,L,R),LS,LE):-
				postorder_dl(L,LSL,LEL),
				postorder_dl(R,LSR,LER),
				LS = LSL,
				LEL = LSR,
				% LER = [K|LE].
				LE=[K|LER].
				
append_dl([],LE,LS1,LE1,LS1,LE1 ):-!.
append_dl([H|T],LE, LS1,LE1,[H|T2],RE2):- append_dl(T,LE,LS1,LE1, T2, RE2).
% reverse dl
reverse_dl([],LE,RE,RE):-!.
reverse_dl([H|T],LE,RS,RE):-
							reverse_dl(T,LE,RS1,RE1),
							append_dl(RS1,RE1,[H|RS2],RS2,RS,RE).
							
							
lenght1([],0):-!.
lenght1([H|T], L):- lenght1(T,L1), L is L1+1.