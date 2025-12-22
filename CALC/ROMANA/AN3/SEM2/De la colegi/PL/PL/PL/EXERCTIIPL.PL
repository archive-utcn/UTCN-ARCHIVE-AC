cmmdc(A,A,A).
cmmdc(A,B,C) :- A>B, Dif  is A-B , cmmdc(Dif, B,C).
cmmdc(A,B,C) :- A<B, Dif is B-A, cmmdc(A, Dif,C).

produs(A,B,C) :- C is A*B.

cmmmc(X,Y,Z) :- cmmdc(X,Y,R), produs(X,Y,P), Z is P/R.


pow1(1,Y,1).
pow1(0,Y,0).
pow1(X,Y,Z) :- Y>0, Y1 is Y-1, pow1(X,Y1,Z1), Z1 is X*X.


fib(0,0).
fib(1,1).
fib(N, REZ) :- N>0, N1 is N-1, N2 is N-2, fib(N1, REZ1), fib(N2, REZ2), REZ is REZ1+REZ2.

triangle(A,B,C) :- S1 is A+B, S2 is B+C, S3 is A+C, S1+S2>S3, S1+S3>S2, S2+S3>S1.


solve(X, Y, Z, Rez) :- Delta is Y * Y - 4 * X * Z, Delta >= 0, Rez is ((0 - Y) + sqrt(Delta)) / (2 * X). 
solve(X, Y, Z, Rez) :- Delta is Y * Y - 4 * X * Z, Delta >= 0, Rez is ((0 - Y) - sqrt(Delta)) / (2 * X).


%laborator operatii liste

member1(X, [H|T]) :- H=X.
member1(X, [H|T]) :- member1(X,T).

member2(X, [H|_]) :- H=X.
member2(X, [_|T]) :- member2(X,T).

append([], L2, L2).
append([H|T], L2, [H|CoadaR]) :- append(T, L2, CoadaR).

append3(L1,L2,L3,RES) :- append(L2,L3,RES1), append(L1,RES1, RES).

add_first(X,L,R) :- append([X], L, R).

sum([],0).
sum([H|T], S) :- sum(T, AUX), S is AUX + H.

sep_par([],[],[]).
sep_par([H|T], [H|E], O) :- 0 is H mod 2, sep_par(T, E, O).
sep_par([H|T], E, [H|O]) :- 1 is H mod 2, sep_par(T, E, O).
  

remove_duplicates([],[]).
remove_duplicates([H|T], [H|R]) :- \+ member(H,T), remove_duplicates(T,R).
remove_duplicates([H|T], R) :- member(H,T), remove_duplicates(T,R).

remove_duplicates2([],[]).
remove_duplicates2([H|T], [H|R]) :- \+ member(H,T),  remove_duplicates2(T,R).
remove_duplicates2([H|T], R) :- member(H,T), remove_duplicates2(T,R).

replace_all(X,Y,[],[]).
replace_all(X,Y,[X|T],[Y|R]) :- replace_all(X,Y,T,R).
replace_all(X,Y,[H|T],[H|R]) :- X\=H, replace_all(X,Y,T,R).

delete2(X,[X|T], R) :- !.
delete2(X,[H|T], [H|R]) :- delete2(X,T,R).
delete2(_,[],[]).

length2([],0).
length2([H|T], LEN) :- length2(T, LC), LEN is 1+LC.

length3([], ACC, LEN) :- LEN=ACC.
length3([H|T], ACC, LEN) :- ACC1 is ACC+1, length3(T,ACC1, LEN).
%length3_pretty(L, R) :- length3(L, 0, R).

reverse([],[]).
reverse([H|T], R) :- reverse(T, RCOADA), append(RCOADA, [H], R).

union([], L, L).
union([H|T], L2, R) :- member(H,L2), !,  union(T, L2, R).
union([H|T], L2, [H|R]) :- union(T,L2,R). 

intersect([],_,[]).
intersect(_,[],[]).
intersect(L,L,L).
intersect([H|T], L2, [H|R]) :- member(H,L2), !, intersect(T,L2,R).
intersect([H|T], L2, R) :- intersect(T,L2,R).

diff([],_,[]).
diff(L,L,[]).
diff([H|T], L2, R) :- member(H, L2), !, diff(T,L2,R).
diff([H|T], L2, [H|R]) :- diff(T,L2,R). 



transf([],[]).
transf([H|T], [NR|R]) :- number(H), !, NR is H mod 10, transf(T,R).
transf([H|T], [0|R]) :- transf(T,R).

transf2([],[]) :- !.
transf2([H|T], R) :- number(H), !, NR is H mod 10, transf2(T,AUX), append([NR],AUX,R).
transf2([H|T], R) :- transf2(T,AUX), append([0], AUX, R). 


a(0,[]):-!.
a(N, [C|R]) :- N>0, C is N mod 10, NNOU is N div 10, a(NNOU,R).


u(0,[]):-!.
u(N,R):- NNOU is N div 10, C is N mod 10, u(NNOU, R), member(C,R), !.
u(N, [C|R]):- NNOU is N div 10, C is N mod 10, u(NNOU, R).



