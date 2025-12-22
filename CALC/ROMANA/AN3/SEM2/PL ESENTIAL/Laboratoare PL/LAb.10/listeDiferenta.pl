%niste arbori
tree1(t(t(t(nil,2,nil),3,t(t(nil,4,nil),5,t(nil,6,nil))),7,t(nil,11,nil))).

%parcurgere arbore INORDINE
%generated_ordered_list(arbore, inceput lista diferenta, sfarsit lista diferenta)

generated_ordered_list(nil, L, L).
generated_ordered_list(t(Left,Key,Right),First,Last) :-
	generated_ordered_list(Left,FirstListLeft,LastListLeft),
	generated_ordered_list(Right,FirstListRight,LastListRight),
	First=FirstListLeft,
	LastListLeft=[Key|FirstListRight],
	Last=LastListRight.

%exemplu1 de rulare INORDINE pe tree1
run1(List) :- 
	Tree = t(t(t(nil,2,nil),3,t(t(nil,4,nil),5,t(nil,6,nil))),7,t(nil,11,nil)),
	generated_ordered_list(Tree,List,[]).

%exemplul2 de rulare INORDINE
run2(List) :-
	Tree= t(t(t(nil,2,nil), 3, t(nil,4,nil)),6,t(nil,11,nil)),
	generated_ordered_list(Tree,List,[]).

%parcurgere PREORDINE
%varianta liste diferenta cu unififcare explicita

generated_preordered_list(nil, L,L).
generated_preordered_list(t(Left,Key,Right),First,Last) :-
	generated_preordered_list(Left, FirstListLeft, LastListLeft),
	generated_preordered_list(Right, FirstListRight, LastListRight),
	First=[Key|FirstListLeft],
	LastListLeft=FirstListRight,
	Last=LastListRight.

%exemplu1 de rulare PREORDINE pe tree1
runp1(List) :- 
	Tree = t(t(t(nil,2,nil),3,t(t(nil,4,nil),5,t(nil,6,nil))),7,t(nil,11,nil)),
	generated_preordered_list(Tree,List,[]).


%parcurgere POSTORDINE
%varianta cu liste diferenta cu unififcare explicita

generated_postordered_list(nil,L,L).
generated_postordered_list(t(Left,Key,Right),First, Last) :-
	generated_postordered_list(Left, FirstListLeft, LastListLeft),
	generated_postordered_list(Right, FirstListRight, LastListRight),
	First=FirstListLeft,
	LastListLeft=FirstListRight,
	LastListRight=[Key|Last].

%exemplu1 POSTORDINE
runpost(List) :- 
	Tree = t(t(t(nil,2,nil),3,t(t(nil,4,nil),5,t(nil,6,nil))),7,t(nil,11,nil)),
	generated_postordered_list(Tree,List,[]).








