
woman(ana).
woman(sara).
woman(ema).
woman(maria).
woman(carmen).
woman(dorina).
woman(irina).

man(andrei).
man(george).
man(alex).
man(marius).
man(mihai).
man(sergiu).

parent(maria, ana). 
parent(george, ana).
parent(maria, andrei).
parent(george, andrei).

parent(carmen, sara). 
parent(alex, sara).
parent(carmen, ema).
parent(alex, ema).

parent(dorina, maria). 
parent(marius, maria).
parent(irina, george).
parent(mihai, george).

parent(irina, carmen). 
parent(mihai, carmen).


mother(X,Y) :- woman(X), parent(X,Y).
father(X,Y) :- man(X), parent(X,Y).

sibling(X,Y) :- parent(Z,X), parent(Z,Y), X\=Y.
sister(X,Y) :- sibling(X,Y), woman(X).
aunt(X,Y) :- sister(X,Z), parent(Z,Y).

brother(X,Y) :- sibling(X,Y), man(X).
uncle(X,Y) :- brother(X,Z), parent(Z,Y).

grandmother(X,Y) :- parent(Z,Y), parent(X,Z), woman(X).
grandfather(X,Y) :- parent(Z,Y), parent(X,Z), man(X).




