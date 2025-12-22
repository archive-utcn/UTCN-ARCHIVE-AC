l1([1,[2],[[3]],[[[4]]],[5,[6,[7,[8,[9],10],11],12],13]]).



%din lab%

depth([],1).
depth([H|T],R):- atomic(H), !, depth(T,R).
depth([H|T],R):- depth(H,R1), depth(T,R2), R3 is R1+1, max(R3,R2,R).

flatten([],[]).
flatten([H|T], [H|R]):- atomic(H), !, flatten(T,R).
flatten([H|T], R):- flatten(H,R1), flatten(T,R2), append(R1,R2,R).

heads([],[],_).
heads([H|T],[H|R],1):- atomic(H), !, heads(T,R,0).
heads([H|T],R,0):- atomic(H), !, heads(T,R,0).
heads([H|T],R,_):- heads(H,R1,1), heads(T,R2,0), append(R1,R2,R).
heads_pretty(L,R):- heads(L, R, 1).

member1(H,[H|_]).
member1(X,[H|_]):- member1(X,H).
member1(X,[_|T]):- member1(X,T).


%end_ din lab%
	
max(X,Y,X):- X>Y,!.				%am scris maxim-ul meu, cel din prolog nu mergea.
max(_,Y,Y).


count_atomic([],0).				%cand ajungem la o lista vida, initializam rezultatul cu 0.
count_atomic([H|T],R):- atomic(H), !, count_atomic(T,R1), R is R1 + 1.		%daca gasim un element atomic, reapelam pe restul listei si se aduna 1 la rezultatul de pe tail.
count_atomic([H|T],R):- count_atomic(H,R1),count_atomic(T,R2), R is R1 + R2.	%daca head-ul nu este atomic, atunci reapelam atat pe head cat si pe tail si adunam rezultatele.

sum_atomic([],0).				%cand ajungem la o lista vida, initializam suma cu 0.
sum_atomic([H|T],R):- atomic(H), !, sum_atomic(T,R1), R is R1 + H.		%daca gasim un head atomic, reapelam pe restul listei si se aduna valoarea head-ului la rezultatul de pe tail.
sum_atomic([H|T],R):- sum_atomic(H,R1),sum_atomic(T,R2), R is R1 + R2.		%daca head-ul nu este atomic, atunci reapelam atat pe head cat si pe tail si adunam rezultatele.

member2(X,L):- flatten(L,L1), member(X,L1), !.		%am pus doar un break dupa apelul de member pe lista "flattened", nu prea e nimic de adaugat.. am ales varianta aceasta deoarece era mai usor de modificat:D.


length1([], 0).
length1([_|T], Len) :- length1(T, Lcoada), Len is 1+Lcoada.		%lenght-ul meu pentru o lista simpla.


lasts([],[],_).		%daca am ajuns la o lista vida, initializam lista rezultat cu [].
lasts([H|_],[H|[]],Len):- Len = 1, atomic(H), !.		% daca length e 1 inseamna ca am ajuns la ultimul element din lista, deci adaugam pe H la rezultat (doar daca e atomic).
lasts([H|T],R,Len):-  atomic(H), !, Len1 is Len - 1, lasts(T,R,Len1).		%altfel inseamna ca nu am ajuns la ultimul element, asa ca reapelam pe tail cu length-ul scazut. (doar daca head-ul e atomic).
lasts([H|T],R,_):- length1(H,Len1), lasts(H,R1,Len1), length1(T,Len2), lasts(T,R2,Len2), append(R1,R2,R). %altfel, daca head-ul nu e atomic, reapelam atat pe head cat si pe tail cu length-urile respective fiecarei liste.
lasts_pretty(L,R):- length1(L,Len), lasts(L, R, Len). 			%apel pretty pentru lasts; se mai initializeaza si length-ul initial.


replace(_,_,[],[]):- !.		%daca am ajuns la lista vida, initializam lista rezultat cu [].
replace(X,Y,[X|T],[Y|R]):-  !, replace(X,Y,T,R).		%daca head-ul e egal cu X, atunci punem Y in locul sau in lista rezultat si reapelam pe tail. 
														%(se compara cu un element atomic, asa ca nu e nevoie de apelul atomic(H)).
replace(X,Y,[H|T],[H|R]):- 	atomic(H), !, replace(X,Y,T,R).		%altfel, daca head-ul e atomic dar nu e egal cu X, adaugam Head-ul si apelam recursiv pe tail.
replace(X,Y,[H|T],R):- replace(X,Y,H,R1), replace(X,Y,T,R2), append([R1],R2,R).		 % altfel daca nu e atomic, se apeleaza pe head si tail si se face append pe rezultate (tindandu-se cont de forma initiala a listei adanci).



sort_depth([H|T], R):- sort_depth(T, R1), insert_ord_depth(H, R1, R).	%am utilizat sortarea prin insertie.
sort_depth([], []).

insert_ord_depth(X, [H|T], [H|R]):- depth([X],Xdepth), depth([H], Hdepth), Xdepth>Hdepth, !, insert_ord_depth(X, T, R). %daca adancimea elementului e mai mare decat adancimea head-ului se trece la elementul urmator. 
insert_ord_depth(X, [H|T], [H|R]):- depth([X],Xdepth), depth([H], Hdepth), Xdepth=Hdepth, compare_deep_lists([X], [H], Cmp), Cmp=1, !, insert_ord_depth(X, T, R). %daca adancimea elementului e egala  cu adancimea head-ului, atunci apelam compare_deep_lists
																		%care returneaza 1 daca head-ul e mai mic decat X, deci putem trece la elementul urmator daca e 1. Depth a fost apelat cu [X] in loc de X simplu pentru cazul cand X e atomic.(depth(atomic) = false).														
insert_ord_depth(X, T, [X|T]).		%altfel, am gasit locul lui X si il inseram.

compare_deep_lists(L1,L2,R):- flatten(L1, L1f), flatten(L2,L2f), compare_lists(L1f,L2f,R).		%aplatizam listele si comparam elementele din ele.


compare_lists([],[],1):-!.	%cazul in care ambele liste sunt egale; eu am ales sa se returneze 1.
compare_lists(_,[],1):-!.	%cand lista 2 e vida si lista 1 nu e, lista 2 e mai mica.
compare_lists([],_,0):-!.	%cand lista 1 e vida si lista 2 nu e, lista 1 e mai mica.
compare_lists([H1|_],[H2|_],1):- H1>H2, !.		%returneaza 1 daca lista 2 e mai mica decat lista 1.
compare_lists([H1|_],[H2|_],0):- H1<H2, !.		%returneaza 0 daca lista 1 e mai mica decat lista 2
compare_lists([_|T1],[_|T2],R):- compare_lists(T1,T2,R).	%altfel daca ambele Head-uri sunt egale, se reapeleaza cu tail-urile listelor.