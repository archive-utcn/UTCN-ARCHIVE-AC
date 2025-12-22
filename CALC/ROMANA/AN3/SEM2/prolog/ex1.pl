% Predicatul woman/1
woman(ana).
woman(sara).
woman(ema).
woman(maria).
woman(dorina).
woman(irina).
woman(carmen).% …

% Predicatul man/1
man(andrei).
man(george).
man(alex).
man(mihai).
man(marius).% …

% Predicatul parent/2
parent(maria, ana). % maria este părintele anei
parent(george, ana). % george este părintele anei
parent(maria, andrei).
parent(george, andrei).
parent(mihai, george).
parent(irina, george).
parent(mihai, carmen).
parent(irina, carmen).
parent(dorina, maria).
parent(marius, maria).
parent(carmen, sara).
parent(carmen, ema).
parent(alex, sara).
parent(alex, ema).% …

% Predicatul mother/2
mother(X,Y) :- woman(X), parent(X,Y).
father(X,Y) :- man(X), parent(X,Y).
% X este mama lui Y, daca X este femeie și X este părintele lui Y

% Predicatul sibling/2
% X și Y sunt frați/surori dacă au același parinte și X diferit de Y
sibling(X,Y) :- parent(Z,X), parent(Z,Y), woman(Z), X\=Y.

% Predicatul sister/2
% X este sora lui Y dacă X este femeie și X și Y sunt frați/surori
sister(X,Y) :- sibling(X,Y), woman(X).

brother(X,Y) :- sibling(X,Y), man(X).

% Predicatul aunt/2
% X este mătușa lui Y daca este sora lui Z și Z este părintele lui Y
aunt(X,Y) :- sister(X,Z), parent(Z,Y).

uncle(X,Y) :- brother(X,Z), parent(Z,Y).

grandmother(X,Y) :- mother(X,Z), parent(Z,Y).

grandfather(X,Y) :- father(X,Z), parent(Z,Y).

% aunt(carmen, _27278) ?  -- se cauta o persoana careia carmen sa ii fie matusa
% sister(carmen, _27848) ? -- se cauta o persoana careia carmen sa ii fie sora
% sibling(carmen, _27892) ? -- se cauta un frate pentru carmen
% parent(_27934, carmen) ? -- se cauta parintele lui carmen
% E: parent(mihai, carmen) ? -- l-a gasit pe mihai ca parinte
% parent(mihai, _28024) ? -- se cauta un alt copil al lui mihai
% E:parent(mihai, george) ? -- l-a gasit pe george
% carmen\=george ? -- se verifica daca george nu e carmen
% E:carmen\=george ? -- este diferit de carmen
% E:sibling(carmen, george) ? -- rezulta ca george si carmen sunt frati
% woman(carmen) ? -- se verifica daca , carmen este femeie
% E: woman(carmen) ? -- este
% E: sister(carmen, george) ? -- deci carmen este sora lui george
% parent(george, _27278) ? -- al cui parinte este george
% E:parent(george, ana) ? -- george este parintele anei.
% E:aunt(carmen, ana) ? -- deci carmen este matusa anei.


ancestor(X,Y) :- parent(X, _some_number), ancestor(Z,_some_number).

%mai trebuie lucrat pe asta 


%apare de 2 ori pentru ca se verifica pentru ambii parinti
%am mai adaugat ca parintele sa fie strict femeie, pentru a nu verifica pentru ambii parinti

