%A1B2 to A2B2

:-dynamic node/1.
node(a). node(b).
node(c). node(d).
node(e). node(f).
node(g). node(h).

:-dynamic edge/2.
edge(a,b). edge(b,a).
edge(a,d). edge(d,a).
edge(b,c). edge(c,b).
edge(b,d). edge(d,b).
edge(c,d). edge(d,c).
edge(e,g). edge(g,e).
edge(e,f). edge(f,e).

:-dynamic neighbor/2.
edge_to_neighbor:-retract(node(X)),
    			  build_list(X, []), !,
    			  edge_to_neighbor.
edge_to_neighbor.


build_list(X, List):-retract(edge(X, Y)),NewList = [Y|List],build_list(X, NewList), !.
build_list(X, List):-assertz(neighbor(X, List)), !.



hamilton(NN, X, Path):- NN1 is NN-1, hamilton_path(NN1,X, X,[X],Path), !.

hamilton_path(0, X, X, Path, Path):-!.
hamilton_path(NN, X, X, [X], Path):- edge(X, Y),edge(Y, X),hamilton_path(NN, X, Y, [Y], Path).
hamilton_path(NN, X, Y, PPath, Path) :- edge(Y, Z),
                                     edge(Z, Y),
    				     not(member(Z, PPath)),
    				     NN1 is NN - 1,
    				     hamilton_path(NN1, X, Z, [Z|PPath], Path).