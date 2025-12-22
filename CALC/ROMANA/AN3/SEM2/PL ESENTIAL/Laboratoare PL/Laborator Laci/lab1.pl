% Laborator 1

/*
1.
	a) variabila
	b) atom
	c) variabila
	d) atom
	e) variabila
	f) atom
	g) lista
	h) lista
	i) lista

2. */




% 4.3

% Predicatul woman/1
woman(ana).
woman(sara).
woman(ema).
woman(maria). 
woman(carmen).
woman(dorina).
woman(irina).
% Predicatul man/1
man(andrei).
man(george).
man(alex). 
man(marius).
man(mihai).
man(sergiu).
% Predicatul parent/2
parent(maria, ana). % maria este părintele anei
parent(george, ana). % george este părintele anei
parent(maria, andrei).
parent(george, andrei). 
parent(carmen, sara).
parent(alex, sara).
parent(carmen, ema).
parent(alex, ema).
parent(irina, carmen).
parent(mihai, carmen).
parent(irina, george).
parent(mihai, george).
parent(dorina, maria).
parent(marius, maria).
% Predicatul mother/2
mother(X,Y) :- woman(X), parent(X,Y).
% X este mama lui Y, daca X este femeie și X este părintele lui Y

%4.2
%Predicatul father/2
father(X, Y) :- man(X), parent(X, Y).

%4.5
% Predicatul sibling/2
% X și Y sunt frați/surori dacă au același parinte și X diferit de Y
sibling(X,Y) :- parent(Z,X), parent(Z,Y), X\=Y.

% Predicatul sister/2
% X este sora lui Y dacă X este femeie și X și Y sunt frați/surori
sister(X,Y) :- sibling(X,Y), woman(X).

% Predicatul aunt/2
% X este mătușa lui Y daca este sora lui Z și Z este părintele lui Y
aunt(X,Y) :- sister(X,Z), parent(Z,Y).


% 4.6
% Predicatul brother/2
% X este fratele lui Y daca X este barbat si X si Y sunt frati/surori
brother(X, Y) :- sibling(X, Y), man(X).

% Predicatul uncle/2
% X este unchiul lui Y daca este fratele lui Z și Z este părintele lui Y
uncle(X, Y) :- brother(X, Z), parent(Z, Y).

% predicatul grandmother/2
% X este bunica lui Y daca este mama unuia dintre parintii lui Y
grandmother(X, Y) :- parent(Z, Y), mother(X, Z).

% predicatul grandfather/2
% X este bunica lui Y daca este tatal unuia dintre parintii lui Y
grandfather(X, Y) :- parent(Z, Y), father(X, Z).


% 4.8

% ancesto
ancestor(X, Y) :-parent(X,Y).
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).