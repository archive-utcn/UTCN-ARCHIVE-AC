%formam o lista din cifrele numarului fara sa existe duplicate in lista unic(77133,L) -> L=[7,1,3] sau orice permutare

unic(0,[]):- !.
unic(N, [C|R]) :- N>0, C is N mod 10,  \+ member(C,R), !, NNOU  is N div 10, unic(NNOU, R).
unic(N,R) :- N>0, NNOU is N div 10, unic(NNOU, R).

unique(0,L,L).
unique(N, L, R) :- C is N mod 10, \+ member(C,R), !, NNOU is N div 10, append([C], L, L1), unique(NNOU, L1, R).
unique(N,L,R) :- NNOU is N div 10, unique(NNOU, L, R).
uni(N, R) :- unique(N, [], R).