length1([],0).
length1([_|T],R):-length1(T,NR), R is NR+1.


%delete1(_,[],[]).
delete1(X,[X|T],R):-!,delete1(X,T,R).
delete1(X,[H|T],[H|R]):-delete1(X,T,R).

reverse1([],Acc,Acc).
reverse1([H|T],Acc,R):-append([H],Acc,R1),reverse1(T,R1,R).

subsir([H|T],L,[H|R]):-subsir(T,L,R),!.
subsir(_,L,[_|T]):-subsir(L,L,T).
subsir([],_,_).

minim([H|T],M):- minim(T,M), M<H,!.
minim([H|_],H).

minim2([H|T],H):-minim2(T,NM), H<NM,!.
minim2([_|T],NM):- minim2(T,NM).
minim2([H],H).

ultim([_|T],R):-ultim(T,R).
ultim([H],H).

min2([H|T],Ac,R):-Ac<H,!,min2(T,Ac,R).
min2([H|T],_,R):-min2(T,H,R).
min2([],Ac,Ac).

%ins_ord(X,[],[X]).
ins_ord(X,[H|T],[X,H|T]):-X<H,!.
ins_ord(X,[H|T],[H|R]):-ins_ord(X,T,R).

sort1(n(L,K,R),Lin,Lout):-sort1(L,Lin,Llout),
                          append(Llout,[K],Lrin),
                          sort1(R,Lrin,Lout).
sort1(nil,L,L).

inorder1(t(K,L,R),Rez):-inorder1(L,LL),inorder1(R,RL),
                        append(LL,[K|RL],Rez).
inorder1(nil,[]).


insert_it(Key,T, t(Key, _, _)):-var(T),!.
insert_it(Key,t(Key, _, _),t(Key, _, _)):-!.
insert_it(Key, t(K, L, R),t(K,NL,R)):-Key<K, !, insert_it(Key, L, NL).
insert_it(Key, t(K, L, R),t(K,L,NR)):-insert_it(Key, R,NR).

%stergerea ultimului elem dintr-o lista dif
%?????
stergeLast([_],_,NE,NE):-!.
stergeLast([H|T],E,[H|NS],NE):-stergeLast(T,E,NS,NE).


%sub 17 feb
%1
s_inc(X,L):-var(L),!,L=[X|_].
s_inc(X,[X|_]):-!.
s_inc(X,[_|T]):-s_inc(X,T).

%2
cautare1(_,nil):-!,fail.
cautare1(X,t(X,_,_)):-!.
cautare1(X,t(_,L,R)):-cautare1(X,L);cautare1(X,R).

%3 stergere elem, daca nu e in lista returnez lista
deleteE(_,[],[]):-!.
deleteE(X,[X|T],R):-!,deleteE(X,T,R).
deleteE(X,[H|T],[H|R]):-deleteE(X,T,R).

%4 l inc-> l dif

convID(L,A,A):-var(L),!.
convID([H|T],[H|ST],E):-convID(T,ST,E).


%5 generare perm

perm1(L,[X|R]):-append(A,[X|B],L),
               append(A,B,NL),
               perm1(NL,R).
perm1([],[]).

delf([H|T],[H|R], Rez):-delf(T,R,Rez),write(R),writeln(Rez),Rez=<H,!.
delf([H|T],T,H).

%rev
revA([],L,L).
revA([H|T],Acc,R):-Acc1=[H|Acc], revA(T,Acc1,R).

%insertAI(X,T):-var(T),!,T=t(X,_,_).
insertAI(X,t(X,_,_)):-!.
insertAI(X,t(K,L,_)):-X<K,!,insertAI(X,L).
insertAI(X,t(_,_,R)):-insertAI(X,R).

%enqueue, dequeue

enq(X,S,E,S,ER):-E=[X|ER].
deq(X,S,E,SR,E):-S=[H|SR],
                 H=X.


append3(L1,L2,L3,R):-append(L2,L3,R1),append(L1,R1,R).


%
flattenLD([],L,L).
flattenLD([H|T],[H|LS],LE ):-atomic(H),!,flattenLD(T,LS,LE).
flattenLD([H|T],LS,LE):-flattenLD(H,LS,Int),flattenLD(T,Int,LE).

%SUB B 2.1

cauta(_, T):-var(T),!,fail.
cauta(X,t(Lista,L,_)):-flatten2(Lista,[HN|_]), X<HN,!,cauta(X,L),!.
cauta(X,t(Lista,_,R)):-flatten2(Lista,NLista),ultimul(NLista,Ult), X>Ult,!,cauta(X,R),!.
cauta(X,t(Lista,_,_)):-flatten2(Lista,NLista),member(X,NLista),!.


flatten2([],[]).
flatten2([H|T], [H|R]):- atomic(H), !, flatten2(T,R).
flatten2([H|T], R):- flatten2(H,R1), flatten2(T,R2), append(R1,R2,R).

ultimul([H|[]],H).
ultimul([_|T],R):-ultimul(T,R).

inorder23(T,[]):- var(T),!.
inorder23(t(Lista,L,R),Rez):-flatten2(Lista,NLista),
                             inorder23(L,NL),
                             inorder23(R,NR),
                             append(NL,NLista,XX),
                             append(XX,NR,Rez).


inorder234(T,L,L):- var(T),!.
inorder234(t(Lista,L,R),S,E):-
                             inorder234(L,SL,EL),
                             inorder234(R,SR,ER),
							 flatten2(Lista,KeyList),
                             append(KeyList,KR,KL),
                             S=SL,EL=KL,KR=SR,E=ER.
							 
lc_to_ld(Lc,Ls,Le) :- lc_to_ld(Lc,Ls,Le,Acc), append(Acc,Le,Ls).
lc_to_ld([H|T],Ls,Le,[H|Acc]) :- lc_to_ld(T,Ls,Le,Acc).
lc_to_ld([],_,_,[]).

transform([],L,L).
transform(L,FS,[H|EL]):- flatten2(L,[H|LT]),transform(LT,FS,EL).

%2
collect(T,[]):-var(T),!.
collect(t(K,L,R),[K]):-var(L),var(R),!.
collect(t(_,L,R),Rez):- collect(L,LR),collect(R,RR),append(LR,RR,Rez).

col(T,N):-collect(T,L),length(L, N).
