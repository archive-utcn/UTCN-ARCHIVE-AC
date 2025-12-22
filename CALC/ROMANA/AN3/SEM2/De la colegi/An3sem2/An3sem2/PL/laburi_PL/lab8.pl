%liste incomplete

%member

% trebuie testat explicit faptul ca am ajuns la sfârșitul listei
% și nu am găsit elementul căutat
member_il(_, L):-var(L), !, fail.			% celelalte 2 clauze sunt la fel ca în trecut
member_il(X, [X|_]):-!.
member_il(X, [_|T]):-member_il(X, T).

%insert

% am ajuns la finalul listei atunci putem adăuga elementul
insert_il(X, L):-var(L), !, L=[X|_].
insert_il(X, [X|_]):-!. % elementul există deja
insert_il(X, [_|T]):- insert_il(X, T).

%delete

delete_il(_, L, L):-var(L), !. % am ajuns la finalul listei
delete_il(X, [X|T], T):-!. % ștergem prima apariție și ne oprim
delete_il(X, [H|T], [H|R]):-delete_il(X, T, R).

%arbori incompleti

%search

search_it(_, T):-var(T),!,fail.
search_it(Key, t(Key, _, _)):-!.
search_it(Key, t(K, L, _)):-Key<K, !, search_it(Key, L).
search_it(Key, t(_, _, R)):-search_it(Key, R).

%insert

% inserează sau verifică dacă elementul există deja în arbore
insert_it(Key, t(Key, _, _)):-!.
insert_it(Key, t(K, L, R)):-Key<K, !, insert_it(Key, L).
insert_it(Key, t(_, _, R)):-insert_it(Key, R).

%delete

delete_it(Key, T, T):-var(T),!.
delete_it(Key, t(Key, L, R), L):-var(R),!.
delete_it(Key, t(Key, L, R), R):-var(L),!.
delete_it(Key, t(Key, L, R), t(Pred,NL,R)):-!,get_pred(L,Pred,NL).
delete_it(Key, t(K,L,R), t(K,NL,R)):-Key<K,!,delete_it(Key,L,NL).
delete_it(Key, t(K,L,R), t(K,L,NR)):-delete_it(Key,R,NR).

% caută nodul predecesor
get_pred(t(Pred, L, R), Pred, L):-var(R),!.
get_pred(t(Key, L, R), Pred, t(Key, L, NR)):-get_pred(R, Pred, NR).

% 1. Concatenează 2 liste incomplete (rezultatul este tot o listă incompletă).

myappend(L1, L2, L2):- var(L1), ! .
myappend([H|T], L, [H|R]):- myappend(T,L,R).

% 2. Inversează o listă incompletă (rezultatul este tot o listă incompletă).

append1([], L2, L2).
append1([H|T], L2, [H|R1]) :- append1(T, L2, R1).

% rezultatul este o lista incompleta
reverse1(L, L):- var(L),!.
reverse1([H|T], R) :- reverse1(T, Rcoada), append1(Rcoada, [H|_], R).

% 3. Convertește o listă incompletă într-o listă completă și viceversa.

convert_ic(L,[]):- var(L), !.
convert_ic([H|T],[H|R]):- convert_ic(T,R).

convert_ci([H|T],[H|R]):- convert_ci(T,R),!.
convert_ci([H|_],[H|_]).

tree1(t(7, t(5, t(3,_,_), t(6,_,_)), t(11,_,_))).
tree2(t(8, t(5, nil, t(7, nil, nil)), t(9, nil, t(11, nil, nil)))).

% 4. Traversează un arbore incomplet în pre-ordine (cheile se adaugă într-o listă incompletă).

preorder2(T, _):- var(T), !.
preorder2(t(K,L,R), List):-preorder2(L,LL), preorder2(R, LR), myappend([K|LL], LR, List).

% 5. Calculează înălțimea unui arbore incomplet.

max(R3,R2,R3):- R3>R2,!.
max(_,R2,R2).

height(T, 0):- var(T), !.
height(t(_, L, R), H):-height(L, H1),
					   height(R, H2),
					   max(H1, H2, H3),
					   H is H3+1.

% 6. Convertește un arbore incomplet într-un arbore complet și viceversa.

convert_ai_ac(T, nil):- var(T), !. 
convert_ai_ac(t(K,L,R), t(K,LL,LR)):-convert_ai_ac(L,LL), convert_ai_ac(R, LR).

convert_ac_ai(nil, _) .
convert_ac_ai(t(K,L,R), t(K,LL,LR)):-convert_ac_ai(L,LL), convert_ac_ai(R, LR).

% 7. Aplatizează o listă adâncă incompletă (rezultatul este o listă simplă incompletă).
% ?- flat_il([[1|_], 2, [3, [4, 5|_]|_]|_], R).
% R = [1, 2, 3, 4, 5|_] ? ;
% false

flatten(L,_):- var(L),!.
flatten([H|T], [H|R]):- atomic(H), !, flatten(T,R).
flatten([H|T], R):- flatten(H,R1), flatten(T,R2), myappend(R1,R2,R).

% 8. Calculează diametrul unui arbore incomplet.
% 𝑑𝑖𝑎𝑚(𝑇) = max{𝑑𝑖𝑎𝑚(𝑇. 𝑙𝑒𝑓𝑡), 𝑑𝑖𝑎𝑚(𝑇. 𝑟𝑖𝑔ℎ𝑡), ℎ𝑒𝑖𝑔ℎ𝑡(𝑇. 𝑙𝑒𝑓𝑡) + ℎ𝑒𝑖𝑔ℎ𝑡(𝑇. 𝑟𝑖𝑔ℎ𝑡) + 1}

diametru(T,0):- var(T),!.
diametru(t(K,L,R),D):-  diametru(L,D1),
						diametru(R,D2),
						height(L,H1),
						height(R,H2),
						H is H1+H2+1,
						max(D1,D2,DD),
						max(DD,H,D).

%9. (*) Determină dacă o listă incompletă este o sub-listă într-o altă listă incompletă.
%?- subl_il([1, 1, 2|_], [1, 2, 3, 1, 1, 3, 1, 1, 1, 2|_]).
%true
%?- subl_il([1, 1, 2|_], [1, 2, 3, 1, 1, 3, 1, 1, 1, 3, 2|_]).
%false

reverse_il_acc(L,Acc,Acc):-var(L),!.
reverse_il_acc([H|T],Acc,R):-reverse_il_acc(T,[H|Acc],R).

subl(H,_):-var(H),!.
subl([H1|_],[H2|_]):- H1\=H2,!,fail.
subl([H|T],[H|T2]):-subl(T,T2).
subl_il(L1,L2):-reverse_il_acc(L1,_,R1),reverse_il_acc(L2,_,R2),subl(R1,R2).