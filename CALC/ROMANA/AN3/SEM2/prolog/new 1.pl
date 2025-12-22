
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




p(X,Y,M,P):- p(X,Y,M,[X],P).
p(X,X,M,PP,PP):-
		length(PP,L),
		L>M.

p(X,Y,M,PP,FP):-
	edge(X,Z),
	\+(member(Z,PP)),
	p(Z,Y,M,[Z|PP],FP).