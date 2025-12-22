%stergerea ultimului element dintro lista incompleta
delete_last([H|V],V):-var(V),!.

delete_last([H|T],[H|R]):-
	delete_last(T,R).
	
	
%transformare lista diferenta intr-o lista completa
tr_list(LF,LF,[]):-!.

tr_list([H|LS],LF,[H|R]):-
	tr_list(LS,LF,R).
	
	
%inserare in arbore binar de cautare
arb(t(3,t(2,nil,nil),t(4,nil,t(5,nil,nil)))).

insert(K,nil,t(K,nil,nil)):-!.

insert(K,t(K,L,R),t(K,L,R)):-!.

insert(Key,t(K,L,R),t(K,LN,R)):-
	Key < K,!,
	insert(Key,L,LN).
	
insert(Key,t(K,L,R),t(K,L,RN)):-
	insert(Key,R,RN).
	
	
%stiva cu liste diferenta
push_stiva(K,LS,LE,[K|LS],LE):-!.

pop_stiva(K,[K|LS],LE,LS,LE):-!.


%coada cu lista diferenta
in_coada(K,LS,[K|RF],LS,RF).

out_coada(K,[K|LS],LF,LS,RF).


%parcurgere arbore binar terminat in variabila
arbore(t(3,t(2,A,A),t(4,A,A))).


parcurg(A):-var(A),!.

parcurg(t(K,L,R)):-
	parcurg(L),
	write(K),
	parcurg(R).





%%%%%%LISE SIMPLE
	
%adauga la inceputul unei liste
add_first(X,L,[X|L]).

%adauga la sfarsitul unei liste
add_last(X,[],[X]).

add_last(X,[H|L],[H|R]):-
	add_last(X,L,R).
	
%adauga in lista un element, unde ii este locul
add_ordonata(X,[],[X]):-!.

add_ordonata(X,[H|L],[H|R]):-
	X > H,!,
	add_ordonata(X,L,R).

add_ordonata(X,[X|L],[X|L]):-!.

add_ordonata(X,L,[X|L]).

%
add(_,[],[]).

add(E,[H1,H2|L],[H1,E|R]):-
	E>H1,
	E<H2,!,
	add(E,[H2|L],R).
	
add(E,[H1|L],[H1|R]):-
	add(E,L,R).


	
	
%Sterge primul element
del_first([H|L],L).



%Sterge ultumul element
del_last([H|[]],[]).

del_last([H|L],[H|R]):-
	del_last(L,R).


%Sterge prima aparitie
del_una(_,[],[]):-!.

del_una(X,[X|L],L):-!.

del_una(X,[H|L],[H|R]):-
	del_una(X,L,R).
	
	
%Sterge toate aparitiile
del_toate(_,[],[]).

del_toate(X,[X|L],R):-!,
	del_toate(X,L,R).
	
del_toate(X,[H|L],[H|R]):-
	del_toate(X,L,R).
	
	
%Sterge ultima aparitie
del_ultima(_,[],[]).

del_ultima(X,[H|L],Rez,Acc):-
	del_ultima(X,L,R,Acc),
	X \= H,!,
	Rez = [H|R].
	
del_ultima(X,[X|L],L,Acc):-
	X \= Acc,!.
	
del_ultima(X,[X|L],[X|R],X).
	

%Sterge duplicatele
del_duplicate([],R,R).

del_duplicate([H|L],R,Rez):-
	\+member(H,R),!,
	append(R,[H],R1),
	del_duplicate(L,R1,Rez).
	
del_duplicate([H|L],R,Rez):-
	del_duplicate(L,R,Rez).
	
del_duplicate(L,R):-
	del_duplicate(L,[],R).
	
	
	
%Sterge elem mai mari ca X
del_x(_,[],[]).

del_x(X,[H|L],[H|R]):-
	X >= H,!,
	del_x(X,L,R).
	
del_x(X,[H|L],R):-
	del_x(X,L,R).
	
	

%Reverse
rev([],R,R).

rev([H|L],R,R1):-
	rev(L,[H|R],R1).
	
rev(L,R):-
	rev(L,[],R).
	
	
%Pune in lista, elementul si nr de aparitii consecutive
aparitii([H|[]],R,R1,C):-
	append(R,[[H,C]],R1).

aparitii([H1,H2|L],R,Rez,C):-
	H1 \= H2,!,
	append(R,[[H1,C]],R1),
	aparitii([H2|L],R1,Rez,1).
	
aparitii([H|L],R,Rez,C):-
	C1 is C+1,
	aparitii(L,R,Rez,C1).
	
aparitii(L,R):-
	aparitii(L,[],R,1).
	
	
	
	
	
%GH
nr_aparitii([],C,[]).

nr_aparitii([H1,H2|L],C,[[H1|C]|R]):-
	H1\=H2,!,
	nr_aparitii([H2|L],1,R).
	
nr_aparitii([H1,H2|L],C,R):-
	C1 is C+1,
	nr_aparitii([H2|L],C1,R).
	
aparitie(L,R):-
	nr_aparitii(L,1,R).
	
	%gh primul element dintr-o lista incompleta 
	c([H|L],L).
	
	
	
%lista incompleta -> lista normala
inc_norm(A,[]):-var(A),!.

inc_norm([H|L],[H|R]):-
	inc_norm(L,R).
	
%lista normala -> incompleta

norm_inc([],A).

norm_inc([H|L],[H|R]):-
	norm_inc(L,R).
	
	
%lista adanca -> normala
ad_norm([],[]).

ad_norm([H|T],[H|R]):-
	atomic(H),!,
	ad_norm(T,R).
	
ad_norm([H|T],R):-
	ad_norm(H,R1),
	ad_norm(T,R2),
	append(R1,R2,R).
	
	
%adauga la inceputul listei diferenta
add_difF(X,LS,LF,[X|LS],LF).


%adauga la sfarsit lista diferenta
add_difL(X,LS,LF,RS,RF):-
	RS = LS,
	LF = [X|RF].
	
add_diff(X,LS,[X|RF],LS,RF).


%append liste diferenta
app(LS1,LF1,LS2,LF2,RS,RF):-
	RS=LS1,
	LF1=LS2,
	LF2=RF.
	

	
%Ia chei din arbore mai mari decat X
arbo(t(7,t(4,t(3,t(2,nil,nil),nil),t(6,t(5,nil,nil),nil)),t(9,t(8,nil,nil),t(10,nil,nil)))).

get(_,nil,[]).

get(X,t(K,L,R),Rez):-
	get(X,L,RL),
	get(X,R,RR),
	((K>X,
	append(RL,[K|RR],Rez)) | 
	(K=<X,
	append(RL,RR,Rez))).
	
	

gett(X,nil,[]).

gett(X,t(K,L,R),[K|Rez]):-
	K>X,!,
	gett(X,L,Rez),
	gett(X,R,Rez).
	
gett(X,t(K,L,R),Rez):-
	gett(X,R,Rez).
	
	
	
%Arbore in lista
transf(nil,[]).

transf(t(K,L,R),Rez):-
	transf(L,Rez1),
	transf(R,Rez2),
	append(Rez2,[K|Rez1],Rez).
	

%reverse
intorc([],R,R).

intorc([H|L],R,Rez):-
	intorc(L,[H|R],Rez).
	
intorc(L,R):-
	intorc(L,[],R).
	
%reverse incompleta
reversei(L,R,R):-var(L),!.
reversei([H|L],R1,R):-reversei(L,[H|R1],R).
reversei(L,R):-reversei(L,P,R).



%Sublista dintr-o lista
%[1,2,3]  [4,5,1,2,3,6,7]

sublist([],_,_).

sublist([H|T],[H|L],R):-
	sublist(T,L,R).
	
sublist([X|T],[H|L],R):-
	sublist(R,L,R).
	
sublist(L,R):-
	sublist(L,R,L).
	
	
%interclasare 2 liste ordonate
%[1,4,5] [1,2,3,6] => [1,2,3,4,5,6]

inter([],T,T):-!.
inter(T,[],T):-!.

inter([H|L],[H|T],[H|R]):-!,
	inter(L,T,R).
	
inter([H|L],[X|T],[H|R]):-
	H<X,!,
	inter(L,[X|T],R).

inter(L,[X|T],[X|R]):-
	inter(L,T,R).
	
	
%Inserare element in lista ordonata	
inserare(X,[],[X]):-!.

inserare(X,[H|T],[H|R]):-
	X>=H,!,
	inserare(X,T,R).
	
inserare(X,L,[X|L]).
	
%din lista adanca in arbore
adanca([1,[2,[4,[],[]],[5,[],[]]],[3,[6,[],[]],[7,[],[]]]]).

l_arb([],nil).

l_arb([H1,H2,H3|T],t(H1,L,R)):-
	l_arb(H2,L),
	l_arb(H3,R).
	
	
%arbore cu key liste
arbo(t([4,5,6],t([1,2,3],nil,nil),t([7,8,9],nil,nil))).

%toate keyle intr-o lista
arbo_list(nil,[]).

arbo_list(t(K,L,R),Rez):-
	arbo_list(L,RL),
	arbo_list(R,RR),
	append(RL,K,R1),
	append(R1,RR,Rez).
	
%cauta o cheie, si sa returneze lista in care exista

get_key_list(_,nil,_).

get_key_list(X,t(K,L,R),K):-
		member(X,K),!.
		
get_key_list(X,t(K,L,R),Rez):-!,
	get_key_list(X,L,Rez),
	get_key_list(X,R,Rez).

	
	
get_key(_,nil).

get_key(X,t(K,L,R)):-
		member(X,K),!,fail.
		
get_key(X,t(K,L,R)):-!,
	get_key(X,L),
	get_key(X,R).
	
get_keys(X,T):-
	\+get_key(X,T).
	
	

%Inaltimea unui arbore
height(nil,0).

height(t(K,L,R),H):-
	height(L,HL),
	height(R,HR),
	max(HL,HR,Hi),
	H is Hi+1.

max(A,B,A):-
	A>=B,!.
	
max(A,B,B).


%Diametru arbore


diam(nil,0,0).

diam(t(K,L,R),H,D):-
	diam(L,HL,DL),
	diam(R,HR,DR),
	S is HL+HR+1,
	max3(DL,DR,S,D),
	max(HL,HR,Hi),
	H is Hi+1.
	
max3(A,B,C,D):-
	max(A,B,B1),
	max(B1,C,D).
	
	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%PL Engleza

%Ultimul elem dintr-o lista diferenta
getlast(H,[H|LF],LF,RF,RF):-!.

getlast(X,[H|LS],LF,[H|RS],RF):-
	getlast(X,LS,LF,RS,RF).
	


%Lista incompleta in diferenta
inc_dif(A,LF,LF):-var(A),!.

inc_dif([H|L],[H|RS],RF):-
	inc_dif(L,RS,RF).
	

%Coada cu lista diferenta
push_queue(K,LS,[K|RF],LS,RF).
	
pop_queue(K,[K|LS],LF,LS,LF).



%Ultimele elemente din lista adanca incompleta
lista([a,[d,c,r|A],[f,e|B],g|C]).

last_el([H|A],[H]):-var(A),!.

last_el([H|L],R):-
	atomic(H),!,
	last_el(L,R).
	
last_el([H|L],R):-
	\+var(L),!,
	last_el(H,R1),
	last_el(L,R2),
	append(R1,R2,R).

	
%Primele elemente din lista adanca incompleta
lista1([a,[d,c,r|_],[f,e|_],g|_]).

f_el(OK,A,[]):-var(A),!.

f_el(OK,[H|T],[H|R]):-
	atomic(H),OK=0,!,
	f_el(1,T,R).
	
f_el(OK,[H|T],R):-
	atomic(H),OK=1,!,
	f_el(1,T,R).
	
f_el(OK,[H|T],R):-
	f_el(0,H,R1),
	f_el(1,T,R2),
	append(R1,R2,R).

f_el(T,R):-
	f_el(0,T,R).
	
	
%Concatenare 2 arbori binari de cautare
c_arbore1(t(4,t(2,nil,t(3,nil,nil)),t(5,nil,nil))).
c_arbore2(t(7,t(6,nil,nil),t(10,t(8,nil,t(9,nil,nil)),nil))).

c_a1(t(6,t(2,nil,nil),t(8,t(7,nil,nil),nil))).
c_a2(t(12,t(10,t(4,nil,nil),nil),t(13,nil,nil))).

concat(T,nil,T):-!.

concat(t(K1,L1,R1),t(K2,L2,R2),t(K2,L,R2)):-
	K1=<K2,!,
	concat(t(K1,L1,R1),L2,L).
	
concat(t(K1,L1,R1),t(K2,L2,R2),t(K2,L2,R)):-
	concat(t(K1,L1,R1),R2,R).