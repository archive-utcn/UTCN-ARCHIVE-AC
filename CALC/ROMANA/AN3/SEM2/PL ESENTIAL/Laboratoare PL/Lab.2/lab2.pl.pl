gcd(X,X,X).
gcd(X,Y,Z):-X>Y, R is X-Y, gcd(R,Y,Z).
gcd(X,Y,Z):-X<Y, R is Y-X, gcd(X,R,Z).

fact(0,F,F).
fact(N,FP,F) :- N>0, N1 is N-1, FP1 is FP*N, fact(N1,FP1,F).

suma(A, B, S) :- S is A+B.
forloop(In, In, 0).
forloop(In, Sum, I) :- I>0,
						NewI is I-1,
						suma(I, NewI, PSum),
						suma(Sum, PSum, Sum),
						forloop(In, Sum, NewI).