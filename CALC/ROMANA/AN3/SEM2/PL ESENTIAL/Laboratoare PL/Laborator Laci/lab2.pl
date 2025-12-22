% laborator 2

% exemple
cmmdc1(X, X, X).
cmmdc1(X, Y, Z) :- X>Y, Diff is X - Y, cmmdc1(Diff, Y, Z).
cmmdc1(X, Y, Z) :- X<Y, Diff is Y - X, cmmdc1(X, Diff , Z).


cmmdc2(X, 0, X).
cmmdc2(X, Y, Z) :- Mod is X mod Y, cmmdc2(Y, Mod, Z).

fact1(0, 1).
fact1(N, F) :- N > 0, N1 is N - 1, fact1(N1, F1), F is N*F1.


% CMMMC intre doua numere naturale este raportul dintre produsul lor si cmmmdc
% exercitiu 1
cmmmc1(X, Y, Z) :- Produs is X * Y, cmmdc1(X, Y, W), Z is Produs / W.

% exercitiu 2
% exemplu de recursivitate inapoi
putere(_, 0, 1).
putere(X, P, Nr) :- P>0 , P1 is P - 1, putere(X, P1, Nr1), Nr is X*Nr1. 


% exemplu de recursivitate inainte
putere1(_, 0, Acc, Nr) :- Nr = Acc.
putere1(X, P, Acc, Nr) :- P > 0, P1 is P - 1, 
				           Acc1 is Acc*X, 		
					     putere1(X, P1, Acc1, Nr).
putere1(X, P, Nr) :- putere1(X, P, 1, Nr).


% exercitiu 3
fib(1, 1).
fib(2, 1).
fib(X, Y) :- X>1, X1 is X - 1,X2 is X1 -1, fib(X1, Y1), fib(X2, Y2), Y is Y1 + Y2. 


% exercitiu 4
fib2(1, 0, 1).
fib2(2, 1, 1).
fib2(X, Y, Nr) :- X1 is X - 1, X>2, fib2(X1, Y2, Y), Nr is Y2 + Y.
% exercitiu 5
triangle(X, Y, Z) :- X + Y > Z, X + Z > Y, Y + Z> X.

% exercitiu 6
delta(A, B, C, Y) :- Y is B*B - 4 * A * C.
radical(Delta, D) :- D is sqrt(Delta).
radical(Delta, D) :- Delta > 0, D is -sqrt(Delta).
solve(A, B, C, X) :- delta(A, B, C, Delta), Delta>=0, radical(Delta, Dd) , X is (-B + Dd)/(2*A).

%solve1(A,B,C,X):- A \= 0, Delta is B*B-4*A*C, Delta>=0, X is (-B+sqrt(Delta)) / ( 2*A) ; A \= 0, Delta is B*B-4*A*C, Delta>0, X is (-B-sqrt(Delta)) / ( 2*A).