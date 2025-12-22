
unique_digits(N,R):- uniques(N,[],R).

uniques(N,R,R) :- N = 0,!.
uniques(N,L,R) :- Cifra is mod(N,10), not(member(Cifra,L)),!, Rest is div(N,10), uniques(Rest,[Cifra|L],R).
uniques(N, L,R) :- Rest is N/10, uniques(Rest,L,R).
