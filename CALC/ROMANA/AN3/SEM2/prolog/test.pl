min([],ACC, MIN):- MIN = ACC.
min([H|T],ACC,MIN):- ACC > H, !, ACC1 is H, min(T,ACC1,MIN).
min([H|T],ACC,MIN):- min(T,ACC,MIN).