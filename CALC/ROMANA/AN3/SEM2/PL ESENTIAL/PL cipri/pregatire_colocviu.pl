cmmdc1(X,X,X).
cmmdc1(X,Y,Z):- X > Y, Diff is X-Y,
				cmmdc1(Diff,Y,Z).
cmmdc1(X,Y,Z):- X < Y,Diff is Y-X,
				cmmdc1(X,Diff,Z).


cmmdc2(X,0,X).
cmmdc2(X,Y,Z):- Rest is X mod Y,
				cmmdc2(Y,Rest,Z).


cmmmc1(X,Y,Rez) :- cmmdc1(X,Y,Rez1),Rez is X*Y/Rez1.


%backwards

fact1(0,1).
fact1(N,F) :- N>0,N1 is N-1, fact1(N1,F1), F is N*F1.

%forward

fact2(0,Acc,F) :- F = Acc.
fact2(N,Acc,F) :- N > 0, 
N1 is N-1, 
Acc1 is Acc*N, 
fact2(N1,Acc1,F).
fact2(N,F) :- fact2(N,1,F). % acumulatorul este inițializat cu 1

suma_lista([],0).
suma_lista([H|T],Rez):- suma_lista(T,Rez1), Rez is H + Rez1.

separate_parity([],[],[]).
separate_parity([H|T],[H|LP],LI):- 0 is H mod 2, !,separate_parity(T, LP, LI).
separate_parity([H|T],LP,[H|LI]):- separate_parity(T, LP, LI).

 

sterge_kDiv([],_,_,[]).
sterge_kDiv([_|T],K,Counter,Rez):- 0 is Counter mod K,!, Counter1 is Counter + 1,sterge_kDiv(T,K,Counter1,Rez).
sterge_kDiv([H|T],K,Counter,[H|Rez]):- Counter1 is Counter + 1, sterge_kDiv(T,K,Counter1,Rez).

sterge_kDivPreatty(List,K,Rez):- sterge_kDiv(List,K,1,Rez).

reverse_completa([],Acc,Acc).
reverse_completa([H|T],Acc,Rez):-reverse_completa(T,[H|Acc],Rez).

reverse_completa_preatty(List,Rez):- reverse_completa(List,[],Rez).

reverse_incompleta(L,Acc,Rez):- var(L),!,append(Acc,[_],Rez).
reverse_incompleta([H|T],Acc,Rez):-reverse_incompleta(T,[H|Acc],Rez).

reverse_incompleta_preatty(Lista,Rez):- reverse_incompleta(Lista,[],Rez).

max(R1,R2,R3):- R1>R2,!, R3=R1.
max(_,R2,R2).

depth([],1).
depth([H|T],R):- atomic(H), !, depth(T,R).
depth([H|T],R):- depth(H,R1), depth(T,R2), R3 is R1+1, max(R3,R2,R).

member1(X,[X|_]):-!.
member1(X,[_|T]) :- member1(X,T).

append1([],L2,L2).
append1([H|T],L2,[H|CoadaR]):- append1(T,L2,CoadaR). 

delete1(X,[X|T],T):- !.
delete1(X,[H|T],[H|R]):-delete1(X,T,R).
delete1(_,[],[]).

deleteAll(X,[X|T],R):- deleteAll(X,T,R).
deleteAll(X,[H|T],[H|R]):- deleteAll(X,T,R).
deleteAll(_,[],[]).


append3(L1,L2,L3,R):-append1(L1,L2,Rez1),append1(Rez1,L3,R).

addFirst(X,L1,[X|L1]). 

addFirst1(X,L,Rez) :- append1(L2,L,Rez),L2 = [X].


sumaListaForward([],L,L).
sumaListaForward([H|T],Acc,Rez):- Acc1 is H + Acc,sumaListaForward(T,Acc1,Rez).

remove_duplicates([],[]).
remove_duplicates([H|T],R):- member(H,T),!,remove_duplicates(T,R).
remove_duplicates([H|T],[H|R]):- remove_duplicates(T,R).

remove_duplicates1([],[]).
remove_duplicates1([H|T],[H|R]):- member(H,T),!,deleteAll(H,T,Rez),remove_duplicates1(Rez,R).
remove_duplicates1([H|T],[H|R]):- remove_duplicates1(T,R).

remove_duplicates2([],[]).
remove_duplicates2([H|T],[H|R]):-deleteAll(H,T,Rez),remove_duplicates2(Rez,R).

drop_every_k([],_,_,[]).
drop_every_k([_|T],K,Counter,Rez):- Counter = K ,!, drop_every_k(T,K,1,Rez).
drop_every_k([H|T],K,Counter,[H|Rez]):- Counter1 is Counter + 1,drop_every_k(T,K,Counter1,Rez).
drop_every_k_preatty(Lista,K,Rez):- drop_every_k(Lista,K,1,Rez).

length1([],0).
length1([_|T],Rez):- length1(T,Rez2), Rez is 1+Rez2.

length2([],Acc,Acc).
length2([_|T],Acc,Rez):- Acc1 is Acc + 1, length2(T,Acc1,Rez).
length2_pretty(L, R) :- length2(L, 0, R).

reverse_backwards([],[]).
reverse_backwards([H|T],R):- reverse_backwards(T,R1), append1(R1,[H],R).

min_backwards([H|T],M):- min_backwards(T,M),M<H,!.
min_backwards([H|_],H).

min_forward([H|T],Mp,M):- H<Mp,!,min_forward(T,H,M).
min_forward([_|T],Mp,M):- min_forward(T,Mp,M).
min_forward_preatty([H|T],Min):- min_forward(T,H,Min).



max_consec([H|T],Acc,Max,R):- get_first_equal(H,T),Acc1 is Acc + 1
							,Acc1 > Max, !,max_consec(T,Acc1,Acc1,R).
max_consec([H|T],Acc,Max,R):- get_first_equal(H,T),Acc1 is Acc + 1
							,Acc1 =< Max,!, max_consec(T,Acc1,Max,R).
%cand nu is egale
max_consec([_|T],_,Max,R):- max_consec(T,1,Max,R).
max_consec([],_,Max,Max):-!.
get_first_equal(_,[]):-false.
get_first_equal(H,[H|_]).


union1([],L,L).
union1([H|T],L2,Rez):- member(H,L2),!,union1(T,L2,Rez).
union1([H|T],L2,[H|Rez]):- union1(T,L2,Rez).

inters([],_,[]).
inters([H|T],L2,[H|Rez]):- member(H,L2),!,inters(T,L2,Rez).
inters([_|T],L2,Rez):- inters(T,L2,Rez).

diff1([],_,[]).
diff1([H|T],L2,Rez):- member(H,L2),!,diff1(T,L2,Rez).
diff1([H|T],L2,[H|Rez]):- diff1(T,L2,Rez).

del_min(L,Rez):- min_backwards(L,Min), deleteAll(Min,L,Rez).

reverse_k([],_,[]).
reverse_k(Lista,K,Rez):- K1 is K -1 ,K1=0,!,reverse_backwards(Lista,Rez).
reverse_k([H|T],K,[H|Rez]):- K1 is K-1, reverse_k(T,K1,Rez).

get_Next([H|_],H).
rle_encode([],[],_).
rle_encode([H|T],Rez,Acc):-get_Next(T,NextH), NextH = H, ! , Acc1 is Acc + 1, rle_encode(T,Rez,Acc1).
rle_encode([H|T],[[H,Acc]|Rez],Acc):- rle_encode(T,Rez,1).


rotate_right([H|T],K,Acc,FinalList,KeepList):- Acc1 is Acc + 1,length1([H|T],N), K1 is N - K , Acc1 = K1,
												reverse_backwards([H|KeepList],RevedList),
												append1(T,RevedList,FinalList).
rotate_right([H|T],K,Acc,Rez,KeepList):-rotate_right(T,K,Acc,Rez,[H|KeepList]).


min_list([H|T],Min1):- min_list(T,Min1),Min1<H,!.
min_list([H|_],H).

sel_sort(L,[M|R]):- min_list(L,M), delete1(M,L,L1), sel_sort(L1,R).
sel_sort([],[]).


flatten([],[]).
flatten([H|T],[H|R]):- atomic(H),!,flatten(T,R).
flatten([H|T],R):- flatten(H,R1),flatten(T,R2),append(R1,R2,R).

heads([],[],_).
heads([H|T],[H|R],1):- atomic(H), !, heads(T,R,0).
heads([H|T],R,0):- atomic(H), !,heads(T,R,0).

heads([H|T],R,_):- heads(H,R1,1), heads(T,R2,0),append(R1,R2,R).
heads_preatty(L,R):- heads(L,R,1).

member_deep(H,[H|_]):-!.
member_deep(X,[H|_]):- member_deep(X,H),!.
member_deep(X,[_|T]):-member_deep(X,T).

count_atomic([],0).
count_atomic([H|T],R):- atomic(H), !, count_atomic(T,R1),R is R1 +1.
count_atomic([H|T],R):- count_atomic(H,R1),count_atomic(T,R2), R is R1 + R2.

sum_atomic([],0).
sum_atomic([H|T],R):- atomic(H),!, sum_atomic(T,R1), R is R1 + H.
sum_atomic([H|T],R):- sum_atomic(H,R1), sum_atomic(T,R2), R is R1 + R2.


decision(H, F, Ri, [H|Ri]):-nonvar(F), !.
decision(_, _, R, R).

lasts([], [], F):-F=1.
lasts([H|T], R, _):-atomic(H), !, lasts(T, Ri, Fi), decision(H, Fi, Ri, R).
lasts([H|T], R, _):-lasts(H, R1, _), lasts(T, R2, _),append(R1, R2, R).

replace_deep(_,_,[],[]).
replace_deep(X,Y,[X|T],[Y|R]):- !,replace_deep(X,Y,T,R).
replace_deep(X,Y,[H|T],[H|R]):- atomic(H),!, replace_deep(X,Y,T,R).
replace_deep(X,Y,[H|T],[R1|R2]):- replace_deep(X,Y,H,R1),replace_deep(X,Y,T,R2).

last([],[]).
last([H],[H]):-atomic(H),!.
last([H],R):-last(H,R),!.
last([H|T],R):-atomic(H),!,last(T,R).
last([H|T],R):-last(H,R1),last(T,R2),append(R1,R2,R).

tree1(t(6, t(4,t(2,nil,nil),t(5,nil,nil)), t(9,t(7,nil,nil),nil))).
tree2(t(1,t(2,t(4,nil,nil),t(5,nil,nil)),t(3,nil,nil))).


inorder(t(K,L,R),Lista):-inorder(L,LL), inorder(R,LR), append(LL,[K|LR],Lista).
inorder(nil,[]).

preorder(t(K,L,R),Lista):-preorder(L,LL), preorder(R,LR), append([K|LL],LR,Lista).
preorder(nil,[]).

postorder(t(K,L,R),Lista):-postorder(L,LL), postorder(R,LR), append(LL,LR,Lista1), append(Lista1,[K],Lista).
postorder(nil,[]).

search_key(t(K,_,_),K):-!.
search_key(t(K,L,_),Key):- Key < K ,!, search_key(L,Key).
search_key(t(_,_,R),Key):- search_key(R,Key).

insert_key(nil,Key,t(Key,nil,nil)).
insert_key(t(Key,L,R),Key,t(Key,L,R)):-!.
insert_key(t(K,L,R),Key,t(K,NL,R)):- Key < K,!, insert_key(L,Key,NL).
insert_key(t(K,L,R),Key,t(K,L,NR)):- insert_key(R,Key,NR). 	

get_pred(t(Pred,L,nil),Pred,L):-!.
get_pred(t(Key,L,R),Pred,t(Key,L,NR)):- get_pred(R,Pred,NR).

delete_key(Key,t(Key,L,nil),L):-!.
delete_key(Key,t(Key,nil,R),R):-!.
delete_key(Key,t(Key,L,R),t(Pred,NL,R)):-!,get_pred(L,Pred,NL) .
delete_key(Key,t(K,L,R),t(K,NL,R)):- Key<K,!, delete_key(Key,L,NL).
delete_key(Key,t(K,L,R),t(K,L,NR)):- delete_key(Key,R,NR).

height(nil,0).
height(t(_,L,R),H):- height(L,H1),height(R,H2),max(H1,H2,H3), H is H3 + 1.

depth_arbore(nil,Acc,Acc).
depth_arbore(t(_,L,R),Acc,D):-Acc1 is Acc + 1,depth_arbore(L,Acc1,D1),
							depth_arbore(R,Acc1,D2),max(D1,D2,D).
depth_arbore_preatty(t(_,L,R),D):- depth_arbore(t(_,L,R),0,D).

collect_keys_frunze(nil,[]).
collect_keys_frunze(t(Key,nil,nil),[Key]):-!.
collect_keys_frunze(t(_,L,R),Lista):- collect_keys_frunze(L,Lista1),collect_keys_frunze(R,Lista2),append(Lista1,Lista2,Lista).

collect_from_Depth(nil,_,_,[]).
collect_from_Depth(t(Key,L,R),Acc,Depth,[Key|List]):- Acc = Depth,!, Acc1 is Acc + 1,collect_from_Depth(L,Acc1,Depth,List1),collect_from_Depth(R,Acc1,Depth,List2), append(List1,List2,List).
collect_from_Depth(t(_,L,R),Acc,Depth,List):- Acc1 is Acc+1,collect_from_var(L,Acc1,Depth,List1),collect_from_Depth(R,Acc1,Depth,List2), append(List1,List2,List).

%Liste incomplete

member_il(_,L):- var(L),!,fail.
member_il(X,[X|_]):-!.
member_il(X,[_|T]):- member_il(X,T).

insert_il(X,L):-var(L),!,L=[X|_].
insert_il(X,[X|_]):-!.
insert_il(X,[_|T]):-insert_il(X,T).

delete_il(_,L,L):-var(L),!.
delete_il(X,[X|T],T):-!.
delete_il(X,[H|T],[H|R]):- delete_il(X,T,R).

search_key_il(_,T):-var(T),!,fail.
search_key_il(Key,t(Key,_,_)):-!.
search_key_il(Key,t(K,L,_)):- Key < K ,!, search_key_il(Key,L).
search_key_il(Key,t(_,_,R)):- search_key_il(Key,R).

insert_key_il(Key,t(Key,_,_)):-!.
insert_key_il(Key,t(K,L,_)):- Key < K ,!,insert_key_il(Key,L).
insert_key_il(Key,t(_,_,R)):- insert_key_il(Key,R).

delete_it(_,T,T):-var(T),!.
delete_it(Key,t(Key,L,R),L):-var(R),!.
delete_it(Key,t(Key,L,R),R):-var(L),!.
delete_it(Key, t(Key, L, R), t(Pred,NL,R)):-!,get_pred(L,Pred,NL).
delete_it(Key, t(K,L,R), t(K,NL,R)):-Key<K,!,delete_it(Key,L,NL).
delete_it(Key, t(K,L,R), t(K,L,NR)):-delete_it(Key,R,NR).

append_il(T,L2,L2):- var(T).
append_il([H|T],L2,[H|Rez]):- append_il(T,L2,Rez).

reverse_il(L,Acc,Rez):- var(L),!,append(Acc,[_],Rez).
reverse_il([H|T],Acc,Rez):-reverse_il(T,[H|Acc],Rez).
reverse_il_preatty(Lista,Rez):- reverse_il(Lista,[],Rez).

%Liste diferenta
add2(X,LS,LE,RS,RE):- RS=LS, LE = [X|RE].

append_dl(LS1,LE1,LS2,LE2,RS,RE):- RS=LS1,LE1 = LS2, RE = LE2.

inorder_dl(nil,L,L).
inorder_dl(t(K,L,R),LS,LE):-inorder_dl(L,LSL,LEL),inorder_dl(R,LSR,LER),
							LS = LSL,LEL = [K|LSR],LE=LER.

postorder_dl(nil,L,L).
postorder_dl(t(K,L,R),LS,LE):-inorder_dl(L,LSL,LEL),inorder_dl(R,LSR,LER),
							LS = LSL,LEL=LSR,LE=LER.

%Efecte laterale
:-dynamic memo_fib/2.
	fib(N,F):- memo_fib(N,F), !.
	fib(N,F):- N>1,
			N1 is N-1,
			N2 is N-2,
		fib(N1,F1),
		fib(N2,F2),
		F is F1+F2,
		assertz(memo_fib(N,F)).
		fib(0,1).
		fib(1,1).	



 

 
s(X,Y) :- i(X),!,j(Y).
s(0,0).
 
i(1).
i(2).
j(1).
j(2).
j(3).				