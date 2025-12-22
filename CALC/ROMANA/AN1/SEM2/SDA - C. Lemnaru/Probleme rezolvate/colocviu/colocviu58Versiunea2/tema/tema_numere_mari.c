/*Sa se implementeze un TDA "numere mari". Un "numar mare" este un intreg care poate avea pana la 200 de cifre. Pentru reprezentarea interna a numerelor
se vor folosi siruri. Asupra acestor numere se executa operatii aritmetice(adunare,scadere,inmultire).
Sa se scrie un program care citeste 2 numere si realizeaza operatiile aritmetice asupra lor. */


#include <stdio.h>
#include <stdlib.h>
#include <string.h>
 int a[200],b[200],c[200],d[200];



void init(int c[]) { memset(c,-1, 200*sizeof(int)); c[0]=0; }



 void maradek(int a[])
{
    int i=1;
    while(a[i]!=-1)
    {
		if (a[i] / 10 !=0) {
			if (a[i+1] == -1) a[i+1]=0;//cu aceasta functie ordonam numarul, daca un numar este mai mare decat 10 atunci este ordonat in asa fel ca
			//in fiecare element din vector sa contina un numar m-ai mic decat 10
			a[i+1] += a[i]/10;
		}

        a[i]= a[i] % 10;
        i++;
    }
}


void suma(int *a,int *b,int *c)
{
    int i=1;
    while ((a[i]!=-1)||(b[i]!=-1))
    {
        c[i]=0;
		if (a[i] != -1) c[i]+=a[i];
		if (b[i] != -1) c[i]+=b[i];
	                                  	//suma cifrelor numarului mare
        i++;

    }
    c[i+1]=-1; //conditie, pt ca numarul sa poata fi afisat
    maradek(c); //elementele vectorului sunt ordonate ca fiecare element
}


void schimbare(char s[],int a[])
{
    int i;
	init(a);
    for( i=strlen(s);i>=0;i--)   //schimbarea unui sir de caraceter intr-un numar, deoarece numarul introdus este un sir de caractere
        a[i+1]=s[strlen(s)-i-1]-'0';
    a[strlen(s)+1] = -1;
}
void comp(int *a,int *n)
{
    int i=1; //determina lungimea numarului
    while (a[i]!=-1)
    {*n=i;
    i++;
    }
}


void ehe(int *a)
{
    int n;int i;
    comp(a,&n);
    i=n;//sterge de la sfarsitul numarului elementele egale cu 0
      while((a[i]==0)&&(i>1))

      a[i]=-1;


}


void afisare(int a[], int i)
{
 ehe(a);
    if (a[i]!=-1)
    {  afisare(a,i+1);			//afosarea numarului, recursiv deoarece numarul este salvat intr-un sir
         printf("%d",a[i]);}
}



 void scadere(int *a, int *b, int *c)
{
    int i=1;int m=0;init(c);
    while ((a[i]!=-1)||(b[i]!=-1))
    {

      if(b[i]!=-1){ //daca al doilea numar nu are o lungime m-ai mica decat primul numar
        c[i]=a[i]-b[i]-m;
		if (c[i] <0) {
			c[i] = 10 + a[i] - b[i] -m;//daca numarul din care se scade este mai mic decat scazatorul, atunci se ordoneaza in
			//asa fel ca rezultatul sa nu fie o valoare negativa
			m=1;
	    }
		else m =0;
	  }
      else//daca primul numar este mai lung
         c[i]=a[i]-m;
     i++;}

}

void comparare(int a[],int b[], int c[])
{
    int n,m;
    comp(a, &n);
    comp(b, &m);
if (n<m)//compara numerele, si in functie care este este mai mare, le scade in asa fel ca rezultatul sa fie bun
{scadere(b,a,c);ehe(c);
printf("-");afisare(c,1);
}
 else if (n>m) {scadere(a,b,c);ehe(c);afisare(c,1);}
     else if (n==m)
     {
         int i=n;
         while (a[i]==b[i])
         i--;
         if (a[i]<b[i]) {scadere(b,a,c);
                         printf("-"); ehe(c);afisare(c,1);}
                    else if (a[i]>b[i]) {scadere(a,b,c);ehe(c);
                              afisare(c,1);}

}


}
void inmult(int a[],int b[], int c[])
 {
     int i=1; // inmultirea numarului
     int j=0;
     memset(c , 0, 200 * sizeof(int));
     while (a[i]!=-1)
    { j=1;
        while (b[j]!=-1)
        {
            c[i+j-1]=c[i+j-1]+(a[i]*b[j]);//plasarea rezultatului pe pozitia corespunzatoare
            j++;}
            i++;
    }
    c[i+j] =-1;
    maradek(c);//ordonarea numarului, pe fiecare pozitie este un numar m-ai mic decat 10
}





int main()
{
    char s[200],g[200];
printf("introduceti primul numar mare\n");
    gets(s);
printf("introduceti al doilea numar mare\n");
    gets(g);

   schimbare(s,a);
printf("\n");
   schimbare(g,b);
printf("suma celor doua numere: ");
            suma(a,b,c);

    afisare(c,1);
printf("\n");
    inmult(a,b,c);
printf("produsul celor doua numere: ");

    afisare(c,1);
printf("\n");
    printf("diferenta dintre cele doua numere: ");
comparare(a,b,c);




}
