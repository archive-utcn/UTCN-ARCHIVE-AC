% lab 10


:-dynamic neighbor/2. % declarăm predicatul dinamic pentru a putea folosi retract
neighbor(a, [b, d]).
neighbor(b, [a, c, d]).
neighbor(c, [b, d]).
neighbor(d, [c, a, b]).
neighbor(e, []).
%etc.
neighb_to_edge:-retract(neighbor(Node,List)),!, %extrage un predicat neighbor și apoi îl procesează
process(Node,List),
neighb_to_edge.
neighb_to_edge. % daca nu mai sunt predicate neighbor înseamnă că am terminat

:-dynamic edge/2.
:-dynamic node/1.
% procesarea presupune adăugare de predicate edge și node pentru un predicat neighbor
process(Node, [H|T]):- assertz(edge(Node, H)), process(Node, T).
process(Node, []):- assertz(node(Node)).



/*:-dynamic node/1.
node(a). node(b). node(c). node(d).
edge(a,b). edge(b,a).
edge(b,c). edge(c,b).
edge(c,d). edge(d,c).
edge(a, d). edge(d, a).

*/
path(X,Y,Path):-path(X,Y,[X],Path). % drumul parțial începe cu punctul de pornire
path(X,Y,PPath, FPath):- edge(X,Z), not(member(Z, PPath)), path(Z, Y, [Z|PPath], FPath). 
path(X,X,PPath, PPath).


% restricted_path(Source, Target, RestrictionsList, Path)
restricted_path(X,Y,LR,P1):- path(X,Y,P), reverse(P,P1), check_restrictions(LR, P1).
% verificăm dacă se respectă restricția
check_restrictions([],_):- !.
check_restrictions([H|T], [H|R]):- !, check_restrictions(T,R).
check_restrictions(T, [_|L]):-check_restrictions(T,L).


:-dynamic sol_part/2.
% optimal_path(Source, Target, Path)
optimal_path(X,Y,Path):- asserta(sol_part([],100)), path(X,Y,[X],Path,1). 
optimal_path(_,_,Path):- retract(sol_part(Path,_)).

path(X,X,Path,Path,LPath):- retract(sol_part(_,_)),!, asserta(sol_part(Path,LPath)), fail. 
path(X,Y,PPath,FPath,LPath):- edge(X,Z), not(member(Z,PPath)), LPath1 is LPath+1,  sol_part(_,Lopt), LPath1<Lopt, path(Z,Y,[Z|PPath],FPath,LPath1).



% ex 1
% pentru inceput adaugam doar nod-urile in baza de cunostiinta (ca sa nu omitem nodurile izolate).
edge_to_node :- retract(node(X)), !, assert(neighbor(X, [])), edge_to_node.
edge_to_node :- edge_to_neighb, !.

edge_to_neighb :- retract(edge(X, Y)), !,  procesare(X, Y), edge_to_neighb.
edge_to_neighb.

procesare(X, Y) :- retract(neighbor(X, Lis)), !, assert(neighbor(X, [Y|Lis])).
procesare(X, Y) :- assert(neighbor(X, [Y])).

% ex 2

hamilton(NN, X, Path):- NN1 is NN-1, hamilton_path(NN1,X, X, [X],Path).

hamilton_path(0, X, X, Path, Path) :- !.
hamilton_path(NN, X, Y, PPath, FPath) :- NN1 is NN-1, edge(X, Z), (Z=Y, NN1 = 0;\+member(Z, PPath)), hamilton_path(NN1, Z, Y, [Z|PPath], FPath). 

% ex 3
edge(a, b, 3). edge(b, a, 3).
edge(b, c, 4). edge(c, b, 4).
edge(c, d, 2). edge(d, c, 2).
edge(a, d, 10). edge(d, a, 10).


optimal_path_pondere(X, Y, Path) :- asserta(sol_part([], 100)), path_pondere(X, Y, [X], Path, 1).
optimal_path_pondere(_, _, Path) :- retract(sol_part(Path, _)).

path_pondere(X, X, Path, Path, LPath) :- retract(sol_part(_, _)), !, asserta(sol_part(Path, LPath)),fail.
path_pondere(X, Y, PPath, FPath, LPath) :- edge(X, Z, Cost), \+member(Z, PPath), LPath1 is LPath + Cost, sol_part(_, Lopt), LPath1 < Lopt, path_pondere(Z, Y, [Z|PPath], FPath, LPath1).

% ex 4
myLength([_|T], R) :- length(T, R1), R is R1 +1.
myLength([], 0).

cycle(X, [X|R]) :- edge(X, Y), path(Y, X, R1), myLength(R1, MyLength), MyLength>2, reverse(R1, R).


% ex 5 ne functional... problema este ca se blocheaza pe un path infinit... am incercat sa evit asta cu conditia : starea generata daca este egala cu starea de dinainte de starea curenta, atunci sa se opreasca...
pericol([Fermier, Lup, Capra, Varza]) :- Lup= Capra, Fermier\= Lup ; Capra = Varza, Fermier \= Capra.
not_(n, s).
not_(s, n).

make_change([s, s, Z, W], S):- S= [n, n, Z, W].
make_change([s, Y, s, W], S):- S= [n, Y, n, W].
make_change([s, Y, Z, s], S):- S= [n, Y, Z, n].
make_change([n, n, Z, W], S):- S= [s, s, Z, W].
make_change([n, Y, n, W], S):- S= [s, Y, s, W].
make_change([n, Y, Z, n], S):- S= [s, Y, Z, s].

head([], []).
head([H|_], H).

find_solution(S, R) :- find_solution(S, [n, n, n, n], [S], R).
find_solution([n, n, n, n], [n, n, n, n], Acc, Acc).
find_solution(S, [n, n, n, n], [H|Acc], R) :- \+pericol(S), make_change(S, S1), head(Acc, Aux), Aux \= S1,  append([H|Acc], [S1], Acc1), find_solution(S1, [n,n,n,n], Acc1, R).
 