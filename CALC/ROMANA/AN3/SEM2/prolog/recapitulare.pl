:- dynamic noNodes/1.
:- dynamic nodes/1.

nod(1).
nod(2).
nod(3).
arc(2,1).
arc(1,2).
arc(3,1).

grad_interior(N,R):- nod(N),assert(noNodes(0)),calc_grad_int(N,R).	%initializam nr de noduri cu 0. 

calc_grad_int(N,_) :- arc(_,N),retract(noNodes(R)), R1 is R+1, assert(noNodes(R1)), fail.	%prin recursivitate pe predicatul arc, scoatem toate nodurile care merg catre N si contorizam dinamic.
calc_grad_int(_,R) :- retract(noNodes(R)).	%returnam rezultatul


grad_exterior(N,R):- nod(N),assert(noNodes(0)),calc_grad_ext(N,R).	%ca mai sus doar ca contorizam nodurile care provin din N.

calc_grad_ext(N,_) :- arc(N,_),retract(noNodes(R)), R1 is R+1, assert(noNodes(R1)), fail.
calc_grad_ext(_,R) :- retract(noNodes(R)).



collect(R):- assert(nodes([])),collectNodes(R).	%initializam lista dinamica [].

collectNodes(_):-nod(N),retract(nodes(L)), L1 = [N|L], assert(nodes(L1)), fail.	%prin recursivitate pe predicatul nod, scoatem toate nodurile si le adaugam pe rand in lista dinamica L.
collectNodes(R):-retract(nodes(R1)), reverse(R1,R).	%inversam rezultatul(sa dea ca in laborator).