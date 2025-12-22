% Varianta 1
cmmdc1(X,X,X). % parametrul 3 îi rezultatul la cmmdc
cmmdc1(X,Y,Z) :- X>Y, Diff is X-Y, cmmdc1(Diff,Y,Z).
cmmdc1(X,Y,Z) :- X<Y, Diff is Y-X, cmmdc1(X,Diff,Z).

% Varianta 2
cmmdc2(X,0,X). % parametrul 3 îi rezultatul la cmmdc
cmmdc2(X,Y,Z) :- Rest is X mod Y, cmmdc2(Y,Rest,Z).

fact(0,1).
fact(N, F) :- N1 is N-1, fact(N1, F1), F is F1*N.

fact1(0, FF, FF).
fact1(N, FP, FF) :- N>0, N1 is N-1, FP1 is FP*N, fact1(N1, FP1, FF).

lcm(X,Y,Z) :- cmmdc2(X,Y,D), Z is (X*Y)//D.

fb(0,1).
fb(1,1).
fb(X,REZ) :- X1 is X-1, fb(X1,REZ1), REZ is REZ1 + X. 

triangle(A, B, C):- A+B>=C, A+C>=B, B+C>=A. 

ecuation(A, B, C, X) :- D is (B*B)-(4*A*C),
						(D>0 -> X is ((0 - B)+sqrt(D)/2*A);
						X is ((0 - B)/2*A)).
ecuation(A, B, C, X) :- D is (B*B)-(4*A*C), D>0, X is ((0 - B)-sqrt(D)/2*A).