% 1. Stergerea ultimului elem. dintr-o lista incompleta
sterg_ultim_il([X|T],T):-var(T),!.
sterg_ultim_il([X|T],[X|R]):- sterg_ultim_il(T,R).
		 % Apel: sterg_ultim_il([1,2,3|_],R).	

% 2. Stergerea ultimului elem. dintr-o lista completa
sterg_ultim([X|[]],[]):-!.
sterg_ultim([X|T],[X|R]):- sterg_ultim(T,R).

sterg_ultim1([X],[]):-!.
sterg_ultim1([X|T],[X|R]):- sterg_ultim1(T,R).
         % Apel: sterg_ultim1([1,2,3],R).

% 3.Stergerea ultimului element dintr-o lista diferenta
sterg_ultim_dl([F],L,RL,RL):-!.
sterg_ultim_dl([X|T],L,[X|RF],RL):- sterg_ultim_dl(T,L,RF,RL).
         % Apel: sterg_ultim_dl([1,2,3|LE],LE,RF,RL).
		 
% 4. Concatenarea a doua liste diferenta
append_dl([],L1,F2,L2,F2,L2):-!.
append_dl([H|L],L1,F2,L2,[H|RF],RL):-append_dl(L,L1,F2,L2,RF,RL).
		 % Apel: append_dl([1,2,3|L1],L1,[4,5|L2],L2,RF,RL).

% 5. Concatenare liste incomplete
append_il(L1,L2,L2):-var(L1),!.
append_il([H|T],L2,[H|R]):-append_il(T,L2,R).
		 % Apel: append_il([1,2,3|_],[4,5|_],R).
		 






% 6. Lista completa in lista diferenta
cl_dl([],Last,Last):-!.
cl_dl([H|T],[H|First],Last):-cl_dl(T,First,Last).
		 % Apel: cl_dl([1,2,3,4],F,L).
	
% 8. Lista diferenta in lista completa
dl_cl([],L,[]):-!.
dl_cl([X|T],L,[X|R]):- dl_cl(T,L,R).
		 % Apel: dl_cl([1,2,3|L],L,R).

===============================================
	
% 7. Lista completa in lista incompleta
cl_il([],_):-!.
cl_il([H|T],[H|R]):-cl_il(T,R).
		 % Apel: cl_il([1,2,3],R).
		 

% 9. Lista incompleta in lista completa
il_cl(T,[]):-var(T),!.
il_cl([X|T],[X|R]):- il_cl(T,R).
		 % Apel: il_cl([1,2,3|_],R).

=============================================

		 
% 10. Lista incompleta in lista diferenta
il_dl(T,L,L):-var(T),!.
il_dl([X|T],[X|F],L):- il_dl(T,F,L).
		 % Apel: il_dl([1,2,3|_],F,L).

% 11. Lista diferenta in lista incompleta
dl_il([],L,_):-!.
dl_il([X|T],L,[X|R]):- dl_il(T,L,R).
		 % Apel: dl_il([1,2,3|L],L,R).
		 





% 12. Inversarea unei liste incomplete.
invers_il(T,_):-var(T),!.
invers_il([H|T],R):-invers_il(T,R1),append_il(R1,[H|_],R).

% 13. Inversarea unei liste diferenta.
invers_dl([],L,RL,RL):-!.
invers_dl([H|T],L,RF,RL):-invers_dl(T,L,F1,L1),append_dl(F1,L1,[H|PL],PL,RF,RL).
		 % Apel: invers_dl([1,2,3|L],L,RF,RL).

% 14. Inversarea unei liste complete.
invers([],[]).
invers([H|T],R):-invers(T,R1),append(R1,[H],R).

% 15. Concatenarea a doua liste complete
append_cl([],L2,L2):-!.
append_cl([H|T],L2,[H|R]):-append_cl(T,L2,R).

% 16. Gasirea elementului max dintr-o lista cu recursivitate inapoi
max_bw([H],H).
max_bw([H|T],H):-max_bw(T,M),H>M,!.
max_bw([H|T],M):-max_bw(T,M).

% 17. Gasirea elementului max dintr-o lista cu recursivitate inainte
max_fw([],A,A).
max_fw([H|T],A,R):-H>A,!,max_fw(T,H,R).
max_fw([H|T],A,R):-max_fw(T,A,R).

max_fw([H|T],R):-max_fw(T,H,R).

% 18. Se da o lista. Sa se descomp in 2 liste dupa un pivot P dat.
pivot([],_,[],[]).
pivot([H|T],P,[H|Mic],Mare):-H<P,!, pivot(T,P,Mic,Mare).
pivot([H|T],P,Mic,[H|Mare]):-pivot(T,P,Mic,Mare).

% 19. Folosind for cu decrementare sa se genereze o lista de genul [N,...,1] cu N dat
for_dec(0,[]).
for_dec(Index,[Index|Out]):-Index>0, NewIndex is Index -1, for_dec(NewIndex,Out).

% 20. append3 - versiune eficienta
append3(L1,L2,L3,R):-append(L2,L3,I), append(L1,I,R).

% 21. Inlocuirea primei aparitii a unui elelemnt U cu un alt element N dintr-o lista completa
replace_first(U,N,[U|T],[N|T]).
replace_first(U,N,[H|T],[H|R]):-replace_first(U,N,T,R).

% 22. Inlocuirea primei aparitii a unui elelemnt U cu un alt element N dintr-o lista termina in variabila
replace_first_il(_,_,T,T):-var(T),!.
replace_first_il(U,N,[U|T],[N|T]).
replace_first_il(U,N,[H|T],[H|R]):-replace_first_il(U,N,T,R).

% 23. Inlocuirea aparitiilor a unui elelemnt U cu un alt element N dintr-o lista completa
replace_all(_,_,[],[]).
replace_all(U,N,[U|T],[N|R]):-replace_all(U,N,T,R).
replace_all(U,N,[H|T],[H|R]):-replace_all(U,N,T,R).

% 24. Inlocuirea aparitiilor a unui elelemnt U cu un alt element N dintr-o lista incompleta
replace_all_il(_,_,T,T):-var(T),!.
replace_all_il(U,N,[U|T],[N|R]):-replace_all_il(U,N,T,R).
replace_all_il(U,N,[H|T],[H|R]):-replace_all_il(U,N,T,R).
