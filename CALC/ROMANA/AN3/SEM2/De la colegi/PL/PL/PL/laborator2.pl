cmmdc1(X,X,X). 
cmmdc1(X,Y,Z) :- X>Y, Diff is X-Y, cmmdc1(Diff,Y,Z).
cmmdc1(X,Y,Z) :- X<Y, Diff is Y-X, cmmdc1(X,Diff,Z).

cmmdc2(X,0,X). % parametrul 3 îi rezultatul la cmmdc
cmmdc2(X,Y,Z) :- Rest is X mod Y, cmmdc2(Y,Rest,Z).

cmmmc(X,Y,Z) :- cmmdc1(X,Y,R), Prod is X * Y, Z is Prod / R.

fact1(1,1).
fact1(N,R):- N>1, N_1 is N-1, fact1(N_1,R1), R is R1*N.

fact2(1,PR,PR).
fact2(N,PR,R):- N>1, N_1 is N-1, PRI is PR*N, fact2(N_1,PRI,R).

triangle(A,B,C):- A+B > C, B+C > A, A+C > B.

solve(X, Y, Z, Rez) :- Delta is Y * Y - 4 * X * Z, Delta >= 0, Rez is ((0 - Y) + sqrt(Delta)) / (2 * X). 
solve(X, Y, Z, Rez) :- Delta is Y * Y - 4 * X * Z, Delta >= 0, Rez is ((0 - Y) - sqrt(Delta)) / (2 * X).

pow1(X,Y,Y,X).
pow1(X,Y,PR,Z):- PR<Y, PR_1 is PR+1, pow1(X,Y,PR_1,Z1), Z is X * Z1.

pow2(_,0,PR,PR).
pow2(X,Y,PR,Z):- Y>0, Y_1 is Y-1, PR_1 is PR * X, pow1(X,Y_1,PR_1,Z).

sum([],0):- !.
sum([H|T], R) :- sum(T,Sum1), R is H + Sum1.

sum2([], Acc, Acc) :- !.
sum2([H|T], Acc, R) :- Acc_N is H + Acc, sum2(T, Acc_N, R).

fib(0,0).
fib(1,1).
fib(N,R):- N>0, N_1 is N-1, N_2 is N-2, fib(N_1,R1), fib(N_2,R2), R is R1+R2.