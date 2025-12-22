cmmdc2(X,0,X). % parametrul 3 îi rezultatul la cmmdc
cmmdc2(X,Y,Z) :- Rest is X mod Y, cmmdc2(Y,Rest,Z).

cmmmc1(X,Y,R) :- cmmdc2(X,Y,Rez), R is X*Y/Rez.

myPow1(_,0,1).
myPow1(N,M,R) :- M>0, M1 is M-1, myPow1(N, M1, R1), R is R1*N.
myPow1(N,M,R) :- M<0, N1 is 1/N, M1 is -M, myPow1(N1, M1, R).

myPow2(_,0,Acc,R) :- R = Acc.
myPow2(N,M,Acc,R) :- M1 is M-1, Acc1 is Acc*N, myPow2(N,M1,Acc1,R).
myPow2(N,M,R) :- M>=0, myPow2(N,M,1,R).
myPow2(N,M,R) :- M<0, N1 is 1/N, M1 is -M, myPow2(N1, M1, 1, R).

myFib1(0,0).
myFib1(1,1).
myFib1(N,R) :- N>0, N1 is N-1, N2 is N-2, myFib1(N1,R1), myFib1(N2,R2), R is R1+R2.

%F1  F2   Fib
%1   0    1
%1   1    2
%2   1    3
%3   2    5
%5   3    8

myFib2(0, 0, 0).
myFib2(1, 0, 1).
myFib2(N, F1, Fib) :- N1 is N-1, myFib2(N1, F11, Fib1), Fib is F11+ Fib1, F1 is Fib1.
myFib2(N,R) :- myFib2(N, _, R).


triangle(A,B,C) :- AB is A+B, AC is A+C, BC is B+C, BC>A, AB>C, AC>B.

solve(A,B,C,X) :- Delta is (B*B - (4*A*C)), Delta > 0,X is (-B + sqrt(Delta))/(2*A).
solve(A,B,C,X) :- Delta is (B*B - (4*A*C)), Delta >= 0, X is (-B - sqrt(Delta))/(2*A).