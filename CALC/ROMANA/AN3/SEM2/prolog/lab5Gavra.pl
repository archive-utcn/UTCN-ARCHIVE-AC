perm(L, [H|R]):-append(A, [H|T], L), append(A, T, L1), perm(L1, R).
perm([], []).


swap_elements(X,L,[X|L]).
swap_elements(X,[H|T],[H|R]) :- swap_elements(X,T,R).

%swap_elements pune pe rand elementul X pe toate pozitiile posibile in lista L. Ca exemplu putem lua apelul de swap_elements(1,[2,3,4],R). Se intra pe prima ramura si se obtine [1,2,3,4] ca prim R.
%apoi la apelul de Redo() se intra pe a doua ramura, se apeleaza swap_elements(1,[3,4],R). care returneaza [1,3,4], iar la revenirea din apel se pune 2 la inceput, astfel al doilea rezultat returnat
%va fi [2,1,3,4]. Din nou la Redo, se intra pe a doua ramura, se apeleaza swap_element(1,[4],R). si la revenire din apel se construieste lista [2,3,1,4]. La ultimul Redo(), se apelaza recursiv pe ramura2
%swap_elements(1,[],R), astfel se obtine  [2,3,4,1].

perm2([H|T], R) :- perm2(T,R1), swap_elements(H,R1,R).	%se parcurge pana la lista vida, apoi la revenire se apeleaza swap_elements cu head ul actual al listei, si cu lista rezultat de la apelul anterior,
% astfel la fiecare revenire, se pune head ul listei pe toate pozitiile posibile in R, 
%apoi se returneaza R-ul catre apelul parinte, care din nou pune head ul actual pe toate pozitiile posibile, astfel se genereaza toate permutarile listei.
perm2([],[]).	%apel de stop

perm_sort(L,R):-perm2(L, R), is_ordered(R), !.	%se obtin toate permutarile listei L prin apelul perm2 si se verifica daca o permutare astfel obtinuta este ordonata, daca da se returneaza si se taie recursivitatea.

is_ordered([H1, H2|T]):-H1 =< H2, is_ordered([H2|T]).	%functie care verifica daca permutarea obtinuta este ordonata sau nu.
is_ordered([_]). % daca ii doar un element ii deja ordonata



max1([H|T], M) :- max1(T, M), M>H, !.
max1([H|_], H).

delete1(_, [], []). 
delete1(X, [X|T], T) :- !.
delete1(X, [H|T], [H|R]) :- delete1(X, T, R). 

sel_sort(L, [M|R]):- max1(L, M), delete1(M, L, L1), sel_sort(L1, R).	%am luat functie de sel_sort si in loc sa gasesc elementul minim din lista, gasesc elementul maxim prin apelul max1(L,M). Restul este la fel.
sel_sort([], []).



sort_chars([H|T], R):- sort_chars(T, R1), insert_ord_chars(H, R1, R).
sort_chars([], []).

insert_ord_chars(X, [H|T], [H|R]):-char_code(X,Xchar), char_code(H, Hchar), Xchar>Hchar, !, insert_ord_chars(X, T, R).	%algoritmul de sortare prin insertie doar ca in loc sa compar valorile numerelor, am comparat valorile char-urilor.
insert_ord_chars(X, T, [X|T]).


length1([], 0).
length1([_|T], Len) :- length1(T, Lcoada), Len is 1+Lcoada.		%determina lungimea listei L.

sort_len([H|T], R):- sort_len(T, R1), insert_ord_len(H, R1, R).
sort_len([], []).

insert_ord_len(X, [H|T], [H|R]):- length1(X,Xlen), length1(H,Hlen), Xlen>Hlen, !, insert_ord_len(X, T, R).	%algoritm de sortare prin insertie doar ca in loc sa compar valorile numerelor, am comparat lungimile listelor element.
insert_ord_len(X, T, [X|T]).
