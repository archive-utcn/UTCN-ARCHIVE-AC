:- dynamic nod_vizitat/1.
:- dynamic depth1/1.


edge(1,2).
edge(2,1). 

edge(1,5).
edge(5,1).

edge(2,3). 
edge(3,2).

edge(2,5).
edge(5,2).     

edge(5,4).
edge(4,5).     

edge(3,4).
edge(4,3).     

edge(4,6).
edge(6,4).     

% doar am adaugat un contor depth1(_) in baza de predicate pe care il verific la fiecare parcurgere de df_search().
% nu l-am trimis ca parametru deoarece cand se face backtrack-ing pe edge, valoarea parametrului k nu se decrementeaza.

% d_search(Source, Path)
d_search(X,_,K):- retractall(depth1(_)),assert(depth1(K)),df_search(X,_). % parcurgerea nodurilor
d_search(_,L,_):-!, collect_reverse([],L). % colectarea rezultatelor

df_search(X,L):-
	retract(depth1(K)),
	K>0,
	K1 is K-1,
	assert(depth1(K1)),
	asserta(nod_vizitat(X)),
	edge(X,Y),
	not(nod_vizitat(Y)),
	df_search(Y,L).

% colectarea se face în ordine inversa
collect_reverse(L,P):-
	retract(nod_vizitat(X)), !, 
	collect_reverse([X|L],P).
collect_reverse(L,L).