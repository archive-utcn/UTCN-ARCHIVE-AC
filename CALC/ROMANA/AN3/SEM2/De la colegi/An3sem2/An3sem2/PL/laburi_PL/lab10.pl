% A1B2: O colec?ie de predicate node ?i edge (edge-clause) 
% node(a). node(b). %etc 
% edge(a,b). edge(b,a). edge(b,c). edge(c,b). %etc 
 
% A2B2: O colec?ie de predicate neighbor (neighbor list-clause) 
% neighbor(a, [b, d]). neighbor(b, [a, c, d]). neighbor(c, [b, d]). neighbor(h, []). %etc 
 
% A1B1: O pereche formata dintr-o lista de noduri ?i o lista de muchii (graph-term) 
% ?- Graph = graph([a,b,c,d,e,f,g,h], [e(a,b), e(b,a), … ]). 
 
% A2B1: O lista de perechi: nod, lista asociata de vecini (neighbor list-list) 
% ?- Graph = [n(a, [b,d]), n(b, [a,c,d]), n(c, [b,d]), n(d, [a,b,c]), n(e, [f,g]), n(f, [e]), n(g, [e]), n(h, [])].

%Mai jos este dat un exemplu de conversie între A2B2 în A1B2. 
:-dynamic neighbor/2. % declaram predicatul dinamic pentru a putea folosi retract 
 
% neighbor(a, [b, d]).
% neighbor(b, [a, c, d]).
% neighbor(c, [b, d]). %etc. 
 
%neighb_to_edge:-retract(neighbor(Node,List)),!,   
% 		process(Node,List),    
%		neighb_to_edge. neighb_to_edge. 
%process(Node, [H|T]):- assertz(edge(Node, H)), process(Node, T). 
%process(Node, []):- assertz(node(Node)). 

% drumuri in grafuri. 
% 1. Simple:

% path(Source, Target, Path) 
 
%path(X,Y,Path):-path(X,Y,[X],Path). 
%path(X,Y,PPath, FPath):-  edge(X,Z), not(member(Z, PPath)), path(Z, Y, [Z|PPath], FPath).  
%path(X,X,PPath, PPath).  

% 2.Restructionate:

% restricted_path(Source, Target, RestrictionsList, Path) 
 
%restricted_path(X,Y,LR,P):- path(X,Y,P), check_restrictions(LR, P). 
 
%check_restrictions([],_):- !.
%check_restrictions([H|T], [H|R]):- !, check_restrictions(T,R). 
%check_restrictions(T, [H|L]):-check_restrictions(T,L).

% 3.Optimale:

% optimal_path(Source, Target, Path) 
 
%optimal_path(X,Y,Path):- asserta(sol_part([],100)), path(X,Y,[X],Path,1).
%optimal_path(_,_,Path):-  retract(sol_part(Path,_)). 
 
%path(X,X,Path,Path,LPath):-  retract(sol_part(_,_)),!, asserta(sol_part(Path,LPath)), fail.     
 
%path(X,Y,PPath,FPath,LPath):- edge(X,Z), not(member(Z,PPath)), 
%				LPath1 is LPath+1, 
%			  	 sol_part(_,Lopt),  
%				LPath1<Lopt,
%				 path(Z,Y,[Z|PPath],FPath,LPath1).  
% 4. Ciclu Hamiltonian: trece prin toate nodurile o singura data (cu excep?ia nodului de start care este începutul ?i sfâr?itul acestui ciclu). 

% hamilton(NumOfNodes, Source, Path) 
hamilton(NN, X, Path):- NN1 is NN-1, hamilton_path(NN1,X, X, [X],Path). 



% 1. Scrieți un predicat care convertește din A1B2 (edge-clause) în A2B2 (neighbor list-clause)
% Daca folosim varianta cu retract
%:-dynamic node/1.
%:-dynamic edge/2.

node(a).
node(b).
node(c).
node(d).
edge(a,b).
edge(a,d).
edge(b,a).
edge(b,c).
edge(b,d).
edge(c,b).
edge(c,d).
edge(d,a).
edge(d,b).
edge(d,c).

%edge_to_neighbour:-retract(node(X)),find_neighbours(X,List),assertz(neighbour(X,List)),fail.
edge_to_neighbour:-node(X),find_neighbours(X,List),assertz(neighbour(X,List)),fail.

%find_neighbours(X,_):-retract(edge(X,Y)),assertz(temp(Y)),fail.
find_neighbours(X,_):-edge(X,Y),assertz(temp(Y)),fail.
find_neighbours(_,List):-collect_neighbours(List).

collect_neighbours([X|T]):-retract(temp(X)),!,collect_neighbours(T).
collect_neighbours([]).

% 3. Rescrie optimal_path folosind ponderea de pe muchie (predicatul edge va avea 3 parametrii).

optimal_path(X,Y,Path):- asserta(sol_part([],100)), path(X,Y,Path).
optimal_path(_,_,Path):-  retract(sol_part(Path,_)). 

path(X,Y,Path):-path(X,Y,[X],Path).
path(X,Y,PPath,FPath):-edge(X,Z),not(member(Z,PPath)),path(Z,Y,[Z|PPath],FPath).
path(X,X,PPath,PPath).

restricted_path(X,Y,LR,P):-path(X,Y,P),check_restrictions(LR,P).

check_restrictions([],_):-!.
check_restrictions([H|T],[H|R]):-!,check_restrictions(T,R).
check_restrictions(T,[_|L]):-check_restrictions(T,L).

% 4. Scrie un predicat care găsește un ciclu ce pornește din nodul X și pune rezultatul în R.
% ?- cycle(a, R).
% R = [a,b,c,d,a] ;
% R = [a,b,d,a] ;
% false

cycle(X,[X|Res]):-edge(X,N),path(N,X,P),length(P,Len),Len>2,reverse(P,Res).

