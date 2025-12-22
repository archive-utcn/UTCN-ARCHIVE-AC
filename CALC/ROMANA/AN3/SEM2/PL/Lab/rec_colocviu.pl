cmmdc(A,A,A):-!.
cmmdc(A,B,R):- A>B,!, C is A-B, cmmdc(C,B,R).
cmmdc(A,B,R):- C is B-A, cmmdc(A,C,R).

cmmmc(A,B,R):- cmmdc(A,B,C), P is A*B, R is P/C.

suma([],0).
suma([H|T],R):- suma(T,R1), R is R1+H.

separate_parity([],[],[]).
separate_parity([H|T],[H|E],P):- 0 is H mod 2,!, separate_parity(T,E,P). 
separate_parity([H|T],E,[H|P]):- separate_parity(T,E,P).

replace_all(_,_,[],[]).
replace_all(X,Y,[X|T],[Y|R]):-replace_all(X,Y,T,R). 
replace_all(X,Y,[H|T],[H|R]):-X\=H, !, replace_all(X,Y,T,R).

stergere([],_,_,[]).
stergere([_|T],X,K,R):- 0 is K mod X,!,K1 is K+1, stergere(T,X,K1,R).
stergere([H|T],X,K,[H|R]):- K1 is K+1, stergere(T,X,K1,R).
sterge_k(L,X,R):-stergere(L,X,1,R).

reverse([],[]).
reverse([H|T],R):-reverse(T,R1),append(R1,[H],R).

app([],L,L).
app([H|T],L,[H|R]):-app(T,L,R).

reverse_i(L,[]):-var(L),!.
reverse_i([H|T],R):-reverse_i(T,R1), app(R1,[H|_],R),!.

adancime([],1).
adancime([H|T],R):-atomic(H),!,adancime(T,R).
adancime([H|T],R):-adancime(H,R1),adancime(T,R2),R11 is R1+1, max(R11,R2,R).

max(A,B,A):-A>B,!.
max(_,B,B).

flat([],[]).
flat([H|T],R):-atomic(H),!,flat(T,R1), append([H],R1,R).
flat([H|T],R):-flat(H,R1),flat(T,R2),append(R1,R2,R),!.

flat_i(L,R):-var(L),!,R=_.
flat_i([H|T],R):-atomic(H),!,flat(T,R1),app([H],R1,R).
flat_i([H|T],R):-flat_i(H,R1),flat_i(T,R2),app(R1,R2,R),!.

tree(t(6, t(4, t(2, nil, nil), t(5, nil, nil)), t(9, t(7, nil, nil), nil))).
tree1(t(6, t(4, t(2, _, _), t(5, _, _)), t(9, t(7, _, _), _))).

adancime_a(nil,0).
adancime_a(t(_,L,R),Rez):-adancime_a(L,Rez1),adancime_a(R,Rez2),max(Rez1,Rez2,RezP),Rez is RezP+1.

adancime_i(L,0):-var(L),!.
adancime_i(t(_,L,R),Rez):-adancime_i(L,Rez1),adancime_i(R,Rez2),max(Rez1,Rez2,RezP),Rez is RezP+1.

collect(nil,[]).
collect(t(H,L,R),Rez):-collect(L,Lista1),collect(R,Lista2),append(Lista1,[H|Lista2],Rez).

collect_i(L,_):-var(L),!.
collect_i(t(H,L,R),Rez):-collect_i(L,Lista1),collect_i(R,Lista2),append(Lista1,[H|Lista2],Rez),!.

collect_d(nil,L,L).
collect_d(t(H,L,R),LS,LE):-collect_d(L,L1S,L1E),collect_d(R,L2S,L2E), LS=L1S, L1E=[H|L2S], LE=L2E.

collect_di(L1,L,L):-var(L1),!.
collect_di(t(H,L,R),LS,LE):-collect_di(L,L1S,L1E),collect_di(R,L2S,L2E), LS=L1S, L1E=[H|L2S], LE=L2E.

collect_f(nil,[]).
collect_f(t(H,nil,nil),[H]):-!.
collect_f(t(_,L,R),Rez):-collect_f(L,Rez1),collect_f(R,Rez2),append(Rez1,Rez2,Rez).

sterge_duplicate([],[]).
sterge_duplicate([H|T],[H|R]):- \+(member(H,T)),!,sterge_duplicate(T,R).
sterge_duplicate([_|T],R):-sterge_duplicate(T,R).

min([H|T],M):- min(T,M),M<H,!.
min([H|_],H).

max([H|T],M):-max(T,M),M>H,!.
max([H|_],H). 

sterg([],_,[]).
sterg([X|T],X,R):-sterg(T,X,R),!.
sterg([H|T],X,[H|R]):-sterg(T,X,R).

stergere_min(L,R):-min(L,Min),sterg(L,Min,R).
stergere_max(L,R):-max(L,Max),sterg(L,Max,R).

inversati_k([H|T],I,K,Rez):-I=K,reverse([H|T],Rez).
inversati_k([H|T],I,K,[H|Rez]):- I1 is I+1,inversati_k(T,I1,K,Rez).

inversati(L,K,R):-inversati_k(L,1,K,R).

insert_sort([],[]).
insert_sort([H|T],R):-insert_sort(T,R1), insert_ord(H,R1,R).

insert_ord(X,[H|T],[H|R]):- X>H,!, insert_ord(X,T,R).
insert_ord(X,T,[X|T]).