reverse([],L,L).
reverse([H|T],Rs,Re):-reverse(T,Rs,[H|Re]).

arc(a,b).
arc(a,c).
arc(a,d).
arc(b,c).
arc(b,d).
arc(c,d).

e_arc(X,Y):-arc(X,Y); arc(Y,X).
nb(Node,List):-nb(Node,[],List).
nb(Node, ListP, List):- e_arc(Node,Z),\+(member(Z,ListP)),nb(Node,[Z|ListP],List).
nb(Node,List,List).