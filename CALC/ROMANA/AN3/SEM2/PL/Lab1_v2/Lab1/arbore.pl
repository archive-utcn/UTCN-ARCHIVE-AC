%Predicatul woman 
woman(dorina).
woman(maria).
woman(ana).
woman(irina).
woman(carmen).
woman(sara).
woman(ema).

%Predicatul man
man(sergiu).
man(marius).
man(mihai).
man(george).
man(andrei).
man(alex).

%Predicatul parent
parent(dorina, maria).   % dorina este parintele mariei
parent(marius, maria).
parent(mihai, george).
parent(irina, george).
parent(mihai, carmen).
parent(irina, carmen).
parent(maria, ana).
parent(george, ana).
parent(maria, andrei).
parent(george, andrei).
parent(carmen, sara).
parent(alex, sara).
parent(carmen, ema).
parent(alex, ema).

%Predicatul mother
mother(X, Y):- woman(X), parent(X, Y).   %X este mama lui Y, daca X este femeie si este parintele lui Y

%Predicatul father
father(X, Y):- man(X), parent(X, Y).   %X este tata lui Y, daca X este man si este parintele lui Y

%Predicatul sibling 
sibling(X,Y):- parent(Z,X), parent(Z,Y), X\=Y.

%Predicatul sister
sister(X,Y):- sibling(X,Y), woman(X).

%Predicatul brother
brother(X,Y):- sibling(X,Y), man(X).

%Predicatul aunt 
aunt(X,Y):- sister(X,Z), parent(Z,Y).

%Predicatul uncle
uncle(X,Y):- parent(Z,Y), sibling(X,Z).

%Predicatul grandmother
grandmother(X,Y):- parent(Z,Y), parent(X,Z), woman(X).

%Predicatul grandfather
grandfather(X,Y):- parent(Z,Y), parent(X,Z), man(X).

%Predicatul ancestor
ancestor(X,Y):- parent(X,Y).
ancestor(X,Y):- parent(X,A), ancestor(A,Y).

	