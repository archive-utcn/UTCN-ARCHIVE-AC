tree(t(6, t(4, t(2, nil, nil), t(5, nil, nil)), t(9, t(7, nil, nil), nil))).
tree1(t(6, t(4,t(2,_,_),t(5,_,_)), t(9,t(7,_,_),_))).
tree2(t(8, t(5, _, t(7, _, _)), t(9, _, t(11, _, _)))).

insert_key(Key,nil,t(Key,nil,nil)).
insert_key(Key,t(Key,L,R),t(Key,L,R)):-!.
insert_key(Key,t(K,L,R),t(K,NL,R)):- Key<K,!,insert_key(Key,L,NL).
insert_key(Key,t(K,L,R),t(K,L,NR)):- insert_key(Key,R,NR).

len([],0).
len([_|T],R):- len(T,R1), R is R1+1.

sublist(0,_,[]).
sublist(N,[H|T],[H|R]):- N>0, N1 is N-1, sublist(N1,T,R).

extract([H|T],Lung,K,R):- Lung>=K,!, sublist(K,[H|T],Rez), Lung1 is Lung-1,extract(T,Lung1,K,Rez2),append([Rez],Rez2,R).
extract(_,_,_,[]). 

all_subls(L,K,R):-len(L,Lung), extract(L,Lung,K,R).

nr_nod(nil,0).
nr_nod(t(_,L,R),Rez):-nr_nod(L,Rez1),nr_nod(R,Rez2), Rez is Rez1+Rez2+1.

verifica(nil).
verifica(t(_,L,R)):-verifica(L),nr_nod(L,NL),verifica(R),nr_nod(R,NR), D is NL-NR, abs(D)=<1.
isPBT(T):-verifica(T).

verificare(t(_,L,R)):-var(L),var(R),!.
frunze_incom(L,[]):-var(L),!.
frunze_incom(t(K,L,R),[K]):-verificare(t(K,L,R)),!.
frunze_incom(t(_,L,R),Lista):-frunze_incom(L,Lista1),frunze_incom(R,Lista2), append(Lista1,Lista2,Lista).

lista_arbori([],[]).
lista_arbori([H|T],L):-frunze_incom(H,Lista),lista_arbori(T,Lista2),append(Lista,Lista2,L).

search_it(_, T):-var(T),!,fail.
search_it(Key, t(Key, _, _)):-!.
search_it(Key, t(K, L, _)):-Key<K, !, search_it(Key, L).
search_it(Key, t(_, _, R)):-search_it(Key, R).

cautare_ic(_,T,0):-var(T),!.
cautare_ic(X,t(X,_,_),1):-!.
cautare_ic(X,t(K,L,_),D):-X<K,!,cautare_ic(X,L,D).
cautare_ic(X,t(_,_,R),D):-cautare_ic(X,R,D).

cauta_arbori([],_,0).
cauta_arbori([H|T],X,D):-cautare_ic(X,H,D1),D1=0, cauta_arbori(T,X,D),!.
cauta_arbori(_,_,1).

cauta_primu(L,X):-cauta_arbori(L,X,D),D>0.

member_il(_,L):-var(L),!,fail.
member_il(X,[X|_]):-!.
member_il(X,[_|T]):-member_il(X,T).

append_il(V,L2,L2):-var(V),!.
append_il([H|T],L2,[H|R]):-append_il(T,L2,R).

sterg_incom([_|L],L):- var(L),!.
sterg_incom([H|T],[H|R]):-sterg_incom(T,R).

ins_bi(Key,nil,t(Key,nil,nil)):-!.
ins_bi(Key,t(Key,_,_),t(Key,_,_)):-!.
ins_bi(Key,t(K,L,R),t(K,NL,R)):- Key<K,!,ins_bi(Key,L,NL).
ins_bi(Key,t(K,L,R),t(K,L,NR)):- ins_bi(Key,R,NR).

inter([],L2,L2):-!.
inter(L1,[],L1):-!.
inter([H1|T1],[H2|T2],[H1|R]):- H1<H2,!,inter(T1,[H2|T2],R).
inter(L1,[H2|T2],[H2|R]):- !,inter(L1,T2,R).

gen(I,N,[I|R]):-I < N,!, I1 is I+1, gen(I1,N,R).
gen(_,N,[N]).

generator(N,R):-gen(1,N,R).

max([],R,R).
max([H|T],PM,R):-H>PM,!,max(T,H,R).
max([_|T],PM,R):-max(T,PM,R).

maxim([H|T],R):-max(T,H,R).

min([],R,R).
min([H|T],PM,R):-H<PM,!,min(T,H,R).
min([_|T],PM,R):-min(T,PM,R).

minim([H|T],R):-min(T,H,R).

part([H|T],I,P,[H|L1],L2):- I=<P,!,I1 is I+1, part(T,I1,P,L1,L2).
part(L,_,_,[],L).

partitionare(L,P,L1,L2):-part(L,1,P,L1,L2).