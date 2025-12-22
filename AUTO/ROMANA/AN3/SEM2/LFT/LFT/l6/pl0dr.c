#include <conio.h>
#include <bios.h>
#include <string.h>
#include <stdio.h>
#include <process.h>

#define		Case	break ; case

#define		nrcr	11		// numar cuvint cheie
#define		ltid	100		// lungime cuvint identificatori
#define		maxcn	7		// max.nr.cifre in numar
#define		lid	10		// lungime identificator
#define		amax	2047		// adresa maxima
#define		nivmax 3		// nivel maxim de incuibare
#define		llin	100		// lungime linie sursa
#define		lcod	200		// lungime tablou cod

		/*tip simbol*/
#define		SIMBOL		long
#define		NUL		1L
#define		IDENT		2L
#define		NUMAR		4L
#define		PLUS		8L
#define		MINUS		16L
#define		STEA		32L
#define		SLASH		64L
#define		ODD		128L
#define		EQL		256L
#define		NEQ		512L
#define		LSS		1024L
#define		LEQ		2048L
#define		GTR		4096L
#define		GEQ		8192L
#define		PARST		16384L
#define		PARDR		32768L
#define		VIRG		65536L
#define		PVIRG		131072L
#define		PUNCT		262144L
#define		DEVINE	524288L
#define		BEGIN		1048576L
#define		END	      2097152L
#define		IF		4194304L
#define		THEN		8388608L
#define		WHILE		16777216L
#define		DO		33554432L
#define		CALL		67108864L
#define		CONST		134217728L
#define		VAR		268435456L
#define		PROC		536870912L

		/*tip obiect*/

#define		CNST		 0
#define		VRB		 1
#define		PRC		 2
#define		SETSIMB	long

		/*operatii procesor*/

#define		LIT		0
#define		OPR		1
#define		LOD		2
#define		STO		3
#define		CAL		4
#define		INT		5
#define		JMP		6
#define		JPC		7
#define		SIDECL		(CONST | VAR | PROC)
#define		SINSTR		(BEGIN | CALL | IF | WHILE)
#define		SIFACT		(IDENT | NUMAR | PARST)

#define		DSTV	500	        // dimensiune stiva

typedef struct{
	int o;  			// cod operatie
	int n;  			// nivel
	int a;  			// adresa
	} instr;

SIMBOL simbol;
char   id[lid];
int    numar;
int    semer;
int    nivel=0;
int    nrlin;


typedef struct {
		char nume[lid+1];
		int fel;
		union{
		      int val;			// fel=const
		      struct{
			     int nivel,adr;	// fel=vrb | prc
			     }s;
		      }u;
		    }simb;
simb  tabel[ltid+1];			// tabel identificatori
int   xt=1;				// index pozitie ultima in tabel

char	*cuvcheie[]=
		{"begin","call","const","do","end","if",
		  "odd","procedure","then","var","while"};

SIMBOL	simbcheie[]=
		{ BEGIN,CALL,CONST,DO,END,IF,
		  ODD,PROC,THEN,VAR,WHILE};
SIMBOL  simbcar[]=
		{ PARST,PARDR,STEA,PLUS,VIRG,MINUS,PUNCT,SLASH,
		  NUL,NUL,NUL,NUL,NUL,NUL,NUL,NUL,
		  NUL,NUL,NUL,PVIRG,LSS,EQL,GTR,NUL };

char	linie[llin];			// linie sursa
int	cc=0;				// index caracter curent in linie
int	ll=0;				// index sfirsit linie
char	car=' ';			// ultimul caracter

instr	cod[lcod+1];			// memorie cod procesor pl0
int	xc=0;				// index alocare cod
int	xd;				// index alocare date
int	p,b,t;				// registri program,baza,virf stiva
int	s[DSTV];			// stiva procesor pl0
instr	*i;				// registru instructiuni procesor pl0
char	*mnem[]=
		{ "LIT","OPR","LOD","STO","CAL","INT","JMP","JPC"};

char	*cmd;

// declaratii functii
void eroare(char *);
SIMBOL exsimb(void);
void bloc(SETSIMB);
void instructiune(SETSIMB);
void conditie(SETSIMB);
void expresie(SETSIMB);
void termen(SETSIMB);
void factor(SETSIMB);
void decl_const(void);
void decl_var(void);
void introdu(int);
int pozitie(char *);
int baza(int);
void interpret(void);
void gen(int,int,int);
void test(SETSIMB,SETSIMB,char *);
void prcod(int);
void executa(void);
void prtab(void);

void main(int argc, char *argv[])
{
  if( freopen(argv[1],"r",stdin) == NULL){
	printf("nu se poate deschide %s\n",argv[1]);
	exit(0);
	}
  cmd=argv[1];
  exsimb();
  bloc( PUNCT | SIDECL | SINSTR );
  if(simbol != PUNCT)
	eroare("lipsa punct terminal");
  printf("\nTabela de simboluri este : \n");
  prtab();
  bioskey(0);
  printf("\n Codul intermediar generat este : \n");
  prcod(0);
  bioskey(0);
  if(semer)
	printf("erori,abandon\n");
  else
	interpret();
}

void eroare(char *s)
{
 printf("%s,%d : %s\n",cmd,nrlin,s);
 semer++;
}

void prtab(void)
{
 int i;
 for( i=1 ; i <= xt + 1 ; i++ ){
	printf("%s %d ",tabel[i].nume,tabel[i].fel);
	switch(tabel[i].fel){
		case CNST : printf("%d \n",tabel[i].u.val);
		Case VRB  :
		case PRC  : printf("%d %d \n",tabel[i].u.s.nivel,tabel[i].u.s.adr);
		}
	}
}

int excar(void)
{ if(cc == ll){
	if(gets(linie) == NULL){
		printf("program incomplet\n");
		exit(0);
		}
	cc=0; ll=strlen(linie); linie[ll++]='\n';
	nrlin++;
	}
  return ( car = linie[cc++] );
}

SIMBOL exsimb(void)
{int i,j,k,kk;
 while( car == ' ' || car == '\t' || car =='\n')  excar();
 if(car >= 'a' && car <= 'z' || car >= 'a' && car <= 'z'){
	// extragere identificator
	k=0;
	do{
	   if( k < lid )
		id[k++]=car;
	   excar();
	   }while( car >= 'a' && car <= 'z' || car >= 'a' && car <= 'z'  || car >= '0' && car <= '9');
	id[k]='\0';
	i=0; j=nrcr-1;
	do{
	   k=(i+j)/2;
	   //* printf("se compara %s cu %s\n",id,cuvcheie[k]);
	   if( (kk=strcmp(id,cuvcheie[k])) <= 0 )
		j=k-1;
	   if(kk >= 0) i=k+1;
	   } while(i <= j);
	 //* printf("s-a recunoscut simbolul %s\n",id);
	 return(simbol= (i-1 > j) ? simbcheie[k] : IDENT);
  }
  else if(car >= '0' && car <= '9'){
	// extragere numar
	k=numar=0;
	do{
	   numar=10*numar+car-'0';
	   ++k;
	   excar();
	} while(car >= '0' && car <= '9');
	if(k > maxcn) eroare("numar prea mare\n");
	//* printf("s-a citit numarul %d\n",numar);
	return( simbol = NUMAR);
   }
   else if(car == ':'){
	 if( excar() == '=' ){
		// extragere operator asignare
		excar();
		//* printf("s-a recunoscut simbolul devine\n");
		return(simbol=DEVINE);
		}
	 else
		// nimic nu este corect
		return(simbol=NUL);
	 }
   else if(car == '<' || car == '>' || car == '/'){
	// extrage operator relational
	i=car;
	if(excar()=='='){
		//* printf("s-a recunoscut un operator relational\n");
		excar();
		switch(i){
		     case '<' : return(simbol=LEQ);
		     case '>' : return(simbol=GEQ);
		     case '/' : return(simbol=NEQ);
	}     }
	else return ( simbol = simbcar[i-'('] );
    }
    else {
	simbol=simbcar[car-'('];
	excar();//* printf("s-a recunoscut simbolul %ld\n",simbol);
	return(simbol);
	}
    return -1;
}

void bloc(SETSIMB urma)
{
 int auxt,auxd;
 int xt0=xt-1;	// index initial in tabel
 int xc0=xc;	// index initial in cod
 xd=3;
 tabel[xt].u.s.adr=xc;
 gen(JMP,0,0);
 if( nivel > nivmax )
	eroare("depasire nivel max.incuibarire bloc");
 do{
    if ( simbol == CONST ){
	// actiuni aferente recunoasterii declaratiilor de constanta
	exsimb();
	do{
	   decl_const();
	   while( simbol == VIRG){
		exsimb();
		decl_const();
		}
	   if(simbol == PVIRG)
		exsimb();
	   else
		eroare("lipsa , sau ;");
	   } while( simbol == IDENT);
       }
    if( simbol == VAR){
	// actiuni aferente recunoasterii declaratiilor de variabila
	exsimb();
	do{
	   decl_var();
	   while( simbol == VIRG){
		exsimb();
		decl_var();
		}
	   if(simbol == PVIRG)
		exsimb();
	   else
		eroare("lipsa , sau ;");
	   } while( simbol == IDENT );
    }
    auxd=xd;
    while( simbol == PROC){
	// actiuni aferente recunoasterii declaratiilor de proceduri
	if(exsimb()==IDENT){
		introdu(PRC);
		exsimb();
		}
	else
		eroare("lipsa identificator dupa const,var,procedure");

	if(simbol == PVIRG)
		exsimb();
	else
		eroare("lipsa , sau ;");
	++nivel;
	auxt=xt;
	bloc( urma | PVIRG );
	--nivel;
	xt=auxt;

	if(simbol == PVIRG){
		exsimb();
		test(SINSTR|IDENT|PROC, urma , "simbol incorect dupa declarare procedura");
		}
	else
		eroare("lipsa , sau ;");
	}
	test(SINSTR|IDENT,SIDECL,"se asteapta instructiune");
    } while( simbol & SIDECL );
    //* printf("s-a terminat cu declararile\n");
    cod[tabel[xt0].u.s.adr].a=xc;
    tabel[xt].u.s.adr=xc;	/*adresa start cod*/
    gen(INT,0,auxd);
    //* printf("se asteapta instructiune\n");
    instructiune( urma|PVIRG|END );
    gen(OPR,0,0);	/*return*/
    test( urma, 0 ,"simbol incorect dupa instructiune din bloc");
}

void instructiune(SETSIMB urma)
{
 int i,xc1,xc2;
 //* printf("instructiune\n");
 if(simbol == IDENT){
	// atribuire
	if( ! (i = pozitie(id)) )
		eroare("identificator nedeclarat");
	else if( tabel[i].fel != VRB ){
		eroare("atribuire ilegalala const sau proc");
		i=0;
		}
	if( exsimb() == DEVINE)
		exsimb();
	else  eroare("se asteapta :=");
	expresie(urma);
	if(i != 0)
		gen(STO,nivel-tabel[i].u.s.nivel,tabel[i].u.s.adr);
	}
 else if(simbol == CALL){
	// apel de procedura
	if( exsimb() != IDENT)
		eroare("lipsa ident dupa call");
	else { if( ! ( i = pozitie(id)) )
			eroare("identificator nedeclarat");
	       else if( tabel[i].fel == PRC)
			gen(CAL,nivel-tabel[i].u.s.nivel,tabel[i].u.s.adr);
	       else
			eroare("identificator nedeclarat");
	       exsimb();
	       }
	}
 else if(simbol == IF){
	// ramificare
	exsimb();
	conditie(THEN|DO|urma);
	if(simbol == THEN)
		 exsimb();
	else
		eroare("se asteapta then");
	xc1=xc;
	gen(JPC,0,0);
	instructiune(urma);
	cod[xc1].a=xc;
	}
 else if(simbol == BEGIN){
	// bloc
	exsimb();
	instructiune(PVIRG|END|urma);
	while(simbol & (PVIRG|SINSTR)){
		if(simbol == PVIRG)
			exsimb();
		else
			eroare("lipsa ; intre instructiuni");
		instructiune(PVIRG|END|urma);
		}
	if(simbol == END)
		exsimb();
	else
		eroare("se asteapta ; sau end\n");
	}
 else if(simbol == WHILE){
	// bucla
	xc1=xc;
	exsimb();
	conditie(DO|urma);
	xc2=xc;
	gen(JPC,0,0);
	if(simbol == DO)
		exsimb();
	else
		eroare("se asteapta do\n");
	instructiune(urma);
	gen(JMP,0,xc1);
	cod[xc2].a=xc;
	}
 test(urma,0,"simbol incorect dupa instructiune");
}

void conditie(SETSIMB urma)
{
 SIMBOL oprel;
 if(simbol == ODD){
	exsimb();
	expresie(urma);
	gen(OPR,0,6);
 }
 else{
	expresie(EQL | NEQ | LSS | GTR | LEQ | GEQ | urma);
	if( ! ( simbol & (EQL | NEQ | LSS | GTR | LEQ | GEQ )) )
		eroare("se asteapta operator relational\n");
	else{	oprel=simbol;
		exsimb();
		expresie(urma);
		if(oprel == EQL)
			gen(OPR,0,8);
		else if(oprel == NEQ)
			gen(OPR,0,9);
		else if(oprel == LSS)
			gen(OPR,0,10);
		else if(oprel == GEQ)
			gen(OPR,0,11);
		else if(oprel == GTR)
			gen(OPR,0,12);
		else if(oprel == LEQ)
			gen(OPR,0,13);
		}
	}
}

void expresie(SETSIMB urma)
{SIMBOL opad;
 if(simbol & (PLUS|MINUS)){
	opad=simbol;
	exsimb();
	termen(urma|PLUS|MINUS);
	if(opad == MINUS)
		gen(OPR,0,1);
	}
 else termen(urma|PLUS|MINUS);
 while(simbol & (PLUS|MINUS)){
	opad=simbol;
	exsimb();
	termen(urma|PLUS|MINUS);
	gen(OPR,0,opad == PLUS ? 2 : 3);
	}
}

void termen(SETSIMB urma)
{SIMBOL opmul;
 factor(urma|STEA|SLASH);
 while(simbol & (STEA|SLASH) ){
	opmul=simbol;
	exsimb();
	factor(urma|STEA|SLASH);
	gen(OPR,0,opmul == STEA ? 4 : 5 );
	}
}

void factor(SETSIMB urma)
{int i;
 test(SIFACT,urma,"o expresie nu poate incepe cu ac. simbol");
 while(simbol & SIFACT){
	if(simbol == IDENT){
		if( ! (i=pozitie(id)) )
			eroare("identificator nedeclarat\n");
		else
		    switch(tabel[i].fel){
			case CNST : gen(LIT,0,tabel[i].u.val);
			Case VRB  : gen(LOD,nivel-tabel[i].u.s.nivel,tabel[i].u.s.adr);
			Case PRC  : eroare("expresia nu poate contine un identificaror de procedura");
			}
		exsimb();
		}
	else if(simbol == NUMAR){
		if(numar > amax){
			eroare("numar prea mare\n");
			numar=0;
			}
		gen(LIT,0,numar); exsimb();
		}
	else if(simbol == PARST){
		exsimb();
		expresie(PARDR|urma);
		if(simbol == PARDR)
			exsimb();
		else
			eroare("lipsa ( \n");
		}
	test(urma, PARST, "factorul precedent nu poate fi urmat de ac. simbol");
	}
}

void decl_const(void)
{
  if(simbol == IDENT){
	exsimb();
	if(simbol == DEVINE || simbol == EQL ){
		if(simbol == DEVINE)
			eroare("se utilizeaza = nu :=");
		exsimb();
		if(simbol == NUMAR){
			introdu(CNST);
			exsimb();
			}
		else
			eroare("= trebuie urmat de un numar");
		}
	else
		eroare("identificatorul trebuie urmat de =");
	}
  else
	eroare("const,var,procedure trebuie sa fie urmate de un identificator");
}

void decl_var(void)
{
 if(simbol == IDENT){
	//* printf("s-a recunoscut o declarare de var. \n");
	introdu(VRB);
	exsimb();
	}
 else
	eroare("const,var,procedure trebuie sa fie urmate de un identificator");
}


void introdu(int k)
{
  strcpy(tabel[xt].nume,id);
  tabel[xt].fel=k;
  switch(k){
	case CNST : if(numar > amax){
			eroare("numar prea mare");
			numar=0;
			}
			tabel[xt].u.val=numar;
			//* printf("s-a introdus cnst=%d\n",id);

	Case VRB  : tabel[xt].u.s.nivel=nivel;
		    tabel[xt].u.s.adr= xd++;
		    //* printf("s-a introdus vrb %s\n",id);

	Case PRC  : tabel[xt].u.s.nivel=nivel;
		    tabel[xt].u.s.adr = xc;
		    //* printf("s-a introdus prc %s\n",id);
	}
  xt++;
}

int pozitie(char *id)
{
 int i=xt;
 strcpy(tabel[0].nume,id);
 while(strcmp(tabel[i].nume,id))
	--i;
 return(i);
}

int baza(int nivelul)
{
 int bb=b;
 while(nivelul > 0){
	bb=s[bb];
	--nivelul;
	}
 return bb;
}

void interpret(void)
{
  printf(" \nprocesor pl0:\n");
  b=p=0; t= -1;
  s[0]=s[1]=s[2]=0;
  do{
	int k;
	for( k=0 ; k<=t; k++)
		printf("%d ", s[k]);
	putchar('\n');
 //*	printf("top = %d,bloc = %d, adr = %d \n execut:",t,b,p);
	i = &cod[p++];
	switch(i->o){
		case LIT : s[++t]=i->a;
		Case OPR : switch(i->a){
			case 0 : t=b-1;p=s[t+2]; b=s[t+1];
				 if(t > 0)
					printf("%d ",s[t-3]);
			Case 1 : s[t] = -s[t];
			Case 2 : --t; s[t] += s[t+1];
			Case 3 : --t; s[t] -= s[t+1];
			Case 4 : --t; s[t] *= s[t+1];
			Case 5 : --t; s[t] /= s[t+1];
			Case 6 : s[t] &= 01;
			Case 8 : --t; s[t]= s[t]==s[t+1];
			Case 9 : --t; s[t]= s[t]!=s[t+1];
			Case 10 : --t; s[t]= s[t]<s[t+1];
			Case 11 : --t; s[t]= s[t]>=s[t+1];
			Case 12 : --t; s[t]= s[t]>s[t+1];
			Case 13 : --t; s[t]= s[t]<=s[t+1];
			}
		Case LOD : ++t; s[t]=s[baza(i->n)+i->a];
		Case STO : s[baza(i->n)+i->a]=s[t];
			   //*   printf("%d\n",s[t]);
			   t--;
		Case CAL :   // generare marcaj de bloc nou
			   s[t+1]=baza(i->n);
			   s[t+2]=b; s[t+3]=p;
			   b=t+2; p=i->a;
			   t++;
		Case INT : t+=i->a;
		Case JMP : p=i->a;
		Case JPC : if(s[t--] == 0 )
				p=i->a;
		}
	} while(p != 0);
  printf("\n  bye,pl0\n");
}


void gen(int x,int y,int z)
{
 if(xc >= lcod){
		printf(" program prea mare\n");
		exit(0);
		}
 cod[xc].o=x;
 cod[xc].n=y;
 cod[xc++].a=z;
}

void test(SETSIMB s,SETSIMB r,char *p)
{ // consuma din intrare pina gaseste o instructiune
  if( ! (simbol & s) ){
	eroare(p);
	s|=r;
	while( ! ( simbol & s ) )
		exsimb();
	}
}

void prcod(int xc0)
{
 int i;
 for(i=xc0;i<xc;i++)
	printf("%d  %s  %d  %d\n",i,mnem[cod[i].o],cod[i].n,cod[i].a);
}





