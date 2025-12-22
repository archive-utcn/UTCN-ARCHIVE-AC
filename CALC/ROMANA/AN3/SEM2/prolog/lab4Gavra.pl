inters([],_,[]). 		%caz de initiere a rezultatului cu lista vida (conditie de stop)
inters([H|T1], L2, [H|R]) :- member(H, L2), !, inters(T1,L2,R).		% daca primul element din L1 exista in L2(este membru), atunci este adaugat la R-ul returnat de apelul recursiv.
inters([_|T1], L2, R) :- inters(T1, L2, R).							%altfel, daca nu e membru, nu se adauga, dar se apeleaza recursiv. 

diff([],_,[]). 	%caz de initiere a rezultatului cu lista vida (conditie de stop)
diff([H|T1], L2, R) :- member(H, L2), !, diff(T1,L2,R).		%luam pe rand elementele din L1, in mod recursiv, daca elementul head este membru in L2, nu se adauga.
diff([H|T1], L2, [H|R]) :- diff(T1, L2, R).					%altfel, daca nu e membru in L2, se adauga la rezultat.


min1([H|T], M) :- min1(T, M), M<H, !.		%se parcurge L pana obtinem lista vida, se intra pe a doua ramura pentru initializarea lui M, iar apoi dupa revenirea din min1, se verifica daca M mai mic decat H, atunci nu se mai intra pe ramura 2 de atribuire pt M. 
min1([H|_], H).								%ramura de atribuire a lui H la M cand nu este indeplinita relatia de M<H

max1([H|T], M) :- max1(T, M), M>H, !.		%la fel ca la min1, doar ca se verifica daca M>H, atunci nimic, altfel M=H.
max1([H|_], H).

delete_all(X, [X|T], R) :- !, delete_all(X,T,R).		%daca X egal cu headul listei, nu se adauga la rezultat
delete_all(X, [H|T], [H|R]) :- delete_all(X, T, R).		%altfel se adauga
delete_all(_, [], []).				%conditie de stop


del_min(L,R) :- min1(L,Min), delete_all(Min,L,R), !.	%determinam elementul minim din L si apelam delete_all de elementul respectiv
del_max(L,R) :- max1(L,Max), delete_all(Max,L,R), !.	%determinam elementul maxim din L si apelam delete_all de elementul respectiv


reverse2([], Acc, Acc).									%cand ajungem la lista vida, rezultatul ia lista din acumulator.					
reverse2([H|T], Acc, R) :- Acc1=[H|Acc], reverse2(T, Acc1, R).		%tot adaugam primul element din lista in acumulator si apelam recursiv.
reverse2(L, R) :- reverse2(L, [], R).					%apelare pretty pentru a initializa acumulatorul cu [].


reverse_k([H|T],X,[H|R]):- X > 0, !, X1 is X-1, reverse_k(T,X1,R).	%cat timp X-ul nu e zero, lista adaugam pur si simplu elemente din L in R.
reverse_k(L,_,R):- reverse2(L,R).									%ramura cand ajunge X-ul sa fie 0. Aici se apeleaza functia reverse2 care inverseaza restul listei.



count_same_x(X, [X|T], Counter, Val):- !, Counter1 is Counter + 1, count_same_x(X, T, Counter1, Val). 	% cat timp X ii egal cu headul listei, counter-ul tot creste.
count_same_x(_, _, Counter, Counter).				%salvam valoarea counter-ului in Val cand gaseste un head diferit de X,

take_different_elements([_|T], Count, R):- Count > 1, !, Count1 is Count-1, take_different_elements(T, Count1, R).		%sarim peste urmatoarele Count elemente din lista prin apelare recursiva pe coada (pana cand counte = 1).
take_different_elements([H|T], _, [[H|[NoH|[]]]|R]):- count_same_x(H, T, 1, NoH), take_different_elements(T, NoH, R).	%cand count = 1, salvam in NoH de cate ori se repeta head-ul in tail. (counter-ul incepe de la 1 pt ca se numara si head-ul). Se apeleaza din nou recursiv si la revenire adauga un element de tipul [H,NoH] in R.
take_different_elements([], _, []). 		%se initializeaza R-ul cu [] cand nu mai avem elemente in lista.

rle_encode(L, R):- take_different_elements(L, 1, R).	%apelare de functie, fara skip pe primul element (se intra direct pe ramura 2). 



reverse1([], []).
reverse1([H|T], R) :- reverse1(T, Rcoada), append1(Rcoada, [H], R).

append1([], L2, L2).
append1([H|T], L2, [H|CoadaR]) :- append1(T, L2, CoadaR).

rotate([H|T], X, R) :- X > 0, !, X1 is X-1, append1(T, [H], R1), rotate(R1, X1, R).
rotate(R,_,R).

rotate_list(L,X,R) :- reverse1(L,L1), rotate(L1,X,R1), reverse1(R1,R).



get_last([_|T],K,R) :- K > 0, !, K1 is K-1, get_last(T, K1, R).
get_last(L,_,L).

get_first([H|T],K,[H|R]) :- K > 0, !, K1 is K-1, get_first(T, K1, R).
get_first(_,_,[]).


rotate_list1(L,K,R) :- length1(L, Len), Index is (Len - K mod Len), get_first(L, Index, FirstL), get_last(L, Index, LastL), append1(LastL, FirstL, R). 



length1([], 0).
length1([_|T], Len) :- length1(T, Lcoada), Len is 1+Lcoada.


get_element_from_list(Pos, [_|T], Element):- Pos > 0, !, Pos1 is Pos-1, get_element_from_list(Pos1, T, Element).
get_element_from_list(_, [H|_], H).


rnd_select(L, X, [Rand_element|R], Len):- Rand_pos is random(Len), get_element_from_list(Rand_pos, L, Rand_element), X > 0, !, X1 is X-1, rnd_select(L, X1, R, Len).
rnd_select(L, _, [Rand_element], Len):- Rand_pos is random(Len), get_element_from_list(Rand_pos, L, Rand_element).

rnd_select(L, X, R):- length1(L,Len), X1 is X-1, rnd_select(L, X1, R, Len), !.
