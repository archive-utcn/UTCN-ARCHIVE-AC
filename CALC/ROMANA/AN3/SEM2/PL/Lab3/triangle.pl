%%
triangle(A,B,C):- X is A+B, Y is A+C, Z is B+C, X > C, Y > B, Z > A, A>0,B>0,C>0.