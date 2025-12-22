:-dynamic node/1. 
:-dynamic edge/2. 
:-dynamic sol_part/2. 
:-dynamic result/1. 
:-dynamic finalResult/1.

node(a).
node(b).
node(c).
node(d).
node(e).
node(f).
node(g).
node(h).

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

edge(e,g).
edge(e,f).
edge(f,e).
edge(g,e).

%implementarea mea pt Ex1, asemanatoare cu cea discutata la lab, doar ca in loc de assert si retract pe lista, am trimis-o ca parametru la apelul lui process

edge_to_neighb:- retract(node(Node)),!, process(Node,[]), edge_to_neighb.
edge_to_neighb.

process(Node,NodeList):- retract(edge(Node,Node2)),!,NodeList2 = [Node2|NodeList],process(Node,NodeList2).
process(Node,NodeList):-assert(neighbor(Node,NodeList)).


%am pus conditia de stop daca ajungem sa trecem prin toate nodurile (NN = 0) si exista edge de la ultimul nod la primul (edge(X,Y)), atunci adaugam inca o data primul nod si setam path-ul respectiv.
%altfel, e parcurgere simpla in care decrementez NN pt fiecare nod adaugat in path.

hamilton(NN, X, Path):- NN1 is NN-1, hamilton_path(NN1,X, X,[X],Path).

hamilton_path(0,X,Y,Path,[Y|Path]):- edge(X,Y).
hamilton_path(NN,X,Y,Path,RPath):-edge(X,Z),not(member(Z,Path)),NN1 is NN-1, hamilton_path(NN1,Z,Y,[Z|Path],RPath).


%cateva edge-uri si costul corespunzator.

edge1(a,b,2).
edge1(a,d,5).
edge1(b,a,2).
edge1(b,c,1).
edge1(b,d,9).
edge1(c,b,1).
edge1(c,d,3).
edge1(d,a,5).
edge1(d,b,9).
edge1(d,c,3).

%nu prea e mult de zis, am schimbat doar din lungime in cost in mare(cost-ul fiind suma dintre valoarea precedenta si costul edge-ului). 

optimal_path(X,Y,Path,_):- asserta(sol_part([],100)), path2(X,Y,[X],Path,0).
optimal_path(_,_,Path,Val):- retract(sol_part(Path,Val)).

path2(Y,Y,Path,Path,LPath):- retract(sol_part(_,_)),!,asserta(sol_part(Path,LPath)),fail. 

path2(X,Y,PPath,FPath,LPath):-edge1(X,Z,LEdge),not(member(Z,PPath)),LPath1 is LPath+LEdge,sol_part(_,Lopt),LPath1<Lopt, path2(Z,Y,[Z|PPath],FPath,LPath1).


%pare putin overkill metoda asta.. pentru ca asa este:D. Mai mult am vrut sa exersez putin assert-ul si retract-ul.
%predicatul initial era unul simplu doar ca returna si path-urile inverse (ex (a,b,d,a) si (a,d,b,a)).  

cycle(X,Path):- retractall(result(_)), retractall(finalResult(_)), assert(result([])), my_cycle(X, _), delete_not_unique, finalResult(Path).	%curatam baza de predicate, 
%initializam cu assert lista initiala de path-uri ca fiind [], apelam my_cycle,
% stergem duplicatele din lista result si punem cate un element in predicatul finalResult. La sfarsit scoatem cate un element din predicatul finalResult() si il returnam. 

my_cycle(X, Path):- cycle_path(1,X, X,[X],Path), retract(result(L)), assert(result([Path|L])), fail.	%aici tot generam cate un path si il punem in lista din predicatul result.
my_cycle(_,_).

cycle_path(NN,X,Y,Path,[Y|Path]):- NN >2, edge(X,Y).	%predicat asemanator cu cel de la hamilton_path() doar ca nu punem conditia sa se treaca prin toate nodurile.
cycle_path(NN,X,Y,Path,RPath):-edge(X,Z),not(member(Z,Path)),NN1 is NN+1, cycle_path(NN1,Z,Y,[Z|Path],RPath).


delete_not_unique:-retract(result([H|L])),assert(result(L)), reverse_l(H,RH), not(member(RH,L)),!, assert(finalResult(RH)), delete_not_unique.	%scoatem cate un element pe rand din lista predicatului result si verificam daca inversul lui nu e membru in restul listei. Daca e unic, il punem in predicatul finalResult.
delete_not_unique:-retract(result([H|L])),!,assert(result([H|L])), delete_not_unique.	%conditie de recursivitate daca nu s-au procesat inca toate valorile din lista (retract nu da fail).
delete_not_unique.	%returneaza true la final.

reverse_l(L,R):-reverse_l(L,[],R).	%reverse pentru o lista
reverse_l([H|T],R,Rl):- reverse_l(T,[H|R],Rl).	
reverse_l([],R,R).


%am modelat toate trecerile posibile sub forma de edge-uri, atat cand fermierul trece singur cat si pentru cand e insotit de cineva (sau ceva..)

edge2([n,n,A,B],[s,s,A,B]).
edge2([n,A,n,B],[s,A,s,B]).
edge2([n,A,B,n],[s,A,B,s]).

edge2([s,s,A,B],[n,n,A,B]).
edge2([s,A,s,B],[n,A,n,B]).
edge2([s,A,B,s],[n,A,B,n]).

edge2([n,A,B,C],[s,A,B,C]).

edge2([s,A,B,C],[n,A,B,C]).

%aici e o banala cautare de path-uri, fiind excluse conditiile precizate in problema.
%mod de apel predicat: path([n,n,n,n],[s,s,s,s],R).
path(X,Y,Path):- path(X,Y,[X],Path). 
path(Y,Y,PPath, PPath). 
path(X,Y,PPath, FPath):- edge2(X,Z), not(member(Z,[[s,n,n,_],[n,s,s,_],[n,_,s,s],[s,_,n,n]])), not(member(Z, PPath)), path(Z, Y, [Z|PPath], FPath). 

