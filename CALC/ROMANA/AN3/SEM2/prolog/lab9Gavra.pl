%1. din cauza ca assert-ul nu isi sterge predicatul in caz de fail, devenind imprevizibila apelarea simpla.
%2. deoarece noi vrem sa reapelam collect_perm() cat timp avem predicate in baza de cunostinte. retract da fail cand nu poate sa stearga un predicat(deci nu mai avem p-uri in baza de cunostinte),asa ca putem sari direct pe ramura 2, cand initializam rezultatul cu []. Astfel initializarea se face o singura data( cand retract da fail), predicatul fiind determinist. 
%3. avand in vedere ca L1 se adauga in R doar dupa apelul recursiv pe collect_perms() (adica la revenirea din reapelare), putem spune ca avem recursivitate inapoi.
%4. da, predicatul collect_perms sterge toate asserturile realizate de all_perms deoarece acesta se reapeleaza pana cand da fail(nu mai are nimic de sters).


tree(t(8, t(5, t(3,nil,nil), t(6,nil,nil)), t(11,nil,nil))).

add2(X, LS, LE, RS, RE):- RS = LS, LE = [X|RE].

il_to_dl(IL, IL, DE):- var(IL),!,IL = DE.			%cand ajungem la variabila din lista incompleta, o punem in lista de start a listei diferenta si o unificam cu variabila de end.
il_to_dl([H|T], [H|DS], DE):- il_to_dl(T,DS,DE).		%tot luam head-uri din lista incompleta si le punem in lista diferenta

dl_to_il(LS,_,IL):- IL = LS.		%prima varianta: doar punem startul din lista diferenta in lista incompleta deoarece o lista diferenta este o lista incompleta la care doar cunoastem capatul. 


dl_to_il2(LS,_,_):-var(LS), !.	%sau varianta 2, cand nu vream sa avem pointer catre final: cand ajungem la variabila in lista Start, punem o variabila oarecare la sfarsitul listei incomplete.
dl_to_il2([H|T],_,[H|IL]):-dl_to_il2(T,_,IL). %parcurgere recursiva in care punem pe rand toate elementele din Start in lista incompleta



dl_to_cl(L,_):- var(L), !, L=[].	%cand ajungem la variabila, initializam acea variabila cu []
dl_to_cl([_|T],_):- dl_to_cl(T,_).	%parcurgem pe tail pana dam de o variabila


cl_to_dl([],E,E):- !.			%cand ajungem la [] cu prima lista, punem variabila _ in rezultat
cl_to_dl([H|T],E,[H|R]):- cl_to_dl(T,E,R).	%adaugam elementele din L1 in L2 pana ce ajungem la o variabila



			%-pentru ex3 am folosit efecte laterale daca tot le-am invatat.
			
pretty_all_desc(L,R):- all_desc(L,[]), collect_desc(R).		%pretty print care: genereaza si assert-eaza toate listele descompuse intr-un predicat p (alcatuit din 2 liste), apoi face retract si append in lista R.

all_desc([H|T],L2):-		 assertz(p([H|T],L2)), append(L2,[H], R), all_desc(T,R), !.		%assert-am cele doua liste descompuse, adaugam pe rand elemente din L1 in L2 si si apelam recursiv pe listele modificate.
all_desc(H,L2):- assertz(p([],[L2|H])).		%caz cand avem doar un element in lista L1 (nu se intra pe prima ramura).

collect_desc([R1|R]):- retract(p(L1,L2)), !, R1 = [L2|[L1]], collect_desc(R).	%colectam cele 2 liste (daca avem), le prelucram putin forma apoi adaugam rezultatul in lista R.
collect_desc([]).


flatten([],L,L).
flatten([H|T], [H|RS], RE):- atomic(H), !, flatten(T,RS,RE).
flatten([H|T], RS, RE):- flatten(H,RS1,RE1), flatten(T,RS2,RE2), RS = RS1, RE1 = RS2, RE = RE2.		%am inlocuit assert-ul din flatten-ul din laboratoarele trecute.


%pentru a selecta doar cheile(nu nodurile) inlocuim t(K,L,R) cu K in append.

even_keys(nil,L,L).	%cand avem nil, declaram lista vida prin declararea aceleiasi variabile
even_keys(t(K,L,R),RS,RE):- 0 is mod(K,2), !, even_keys(L,RSL,REL), even_keys(R,RSR,RER), RS = RSL, REL = [t(K,L,R)|RSR], RE = RER.	% caz cand avem cheie para, parcurgem recursiv pe left si right, obtinem 2 liste diferenta la care facem append incluzand si nodul curent.
even_keys(t(_,L,R),RS,RE):- even_keys(L,RSL,REL), even_keys(R,RSR,RER), RS = RSL, REL = RSR, RE = RER. %altfel daca nu e para, tot facem append pe liste doar ca nu includem si nodul curent.



%exact explicatia de mai sus doar ca modificam conditia de append a cheii, si ca facem append de cheie in loc de nod.

interval_keys(nil,_,_,L,L).	
interval_keys(t(K,L,R),K1,K2,RS,RE):- K > K1, K < K2, !, interval_keys(L,K1,K2,RSL,REL), interval_keys(R,K1,K2,RSR,RER), RS = RSL, REL = [K|RSR], RE = RER.
interval_keys(t(_,L,R),K1,K2,RS,RE):- interval_keys(L,K1,K2,RSL,REL), interval_keys(R,K1,K2,RSR,RER), RS = RSL, REL = RSR, RE = RER.


