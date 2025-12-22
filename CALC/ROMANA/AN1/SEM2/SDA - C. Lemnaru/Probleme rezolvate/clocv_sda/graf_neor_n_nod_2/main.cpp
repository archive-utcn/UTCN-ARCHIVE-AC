/*42. Se da un graf neorientat cu n noduri. Se cere sa se determine numarul minim de culori necesare pentru a
colora nodurile grafului dat, astfel încât doua vârfuri legate printr-o muchie sa fie colorate cu culori
diferite.*/
#include<conio.h>
#include<stdio.h>
int j,i,n,k,ev,as,s[100],a[100][100],nr;
int min,max,sol[100],solutie=5;


int succesor()  //se pun valori in stiva
{
if (s[k]<4)
      {
      	s[k]++;
      	return 1;
      }
    else
    	return 0;
}

int valid ()  //verificam daca nodurile adiacente deja puse in stiva nu au aceeasi culoare
{

for ( i=1; i<k ;i++)
    if ((s[k]==s[i]) && (a[k][i]==1))
    return 0;
return 1;
}



int calc_sol (int min,int *sol)  //dat fiind faptul ca un graf se poate colora cu maxim 4 culori(teorema
{                                //demonstrata cu ajutorul calculatorului)si cel ca metoda backtracking
max=s[1];                        //ne genereaza toate solutiile posibile de colorare a nodurilor,
for( i=2 ;i<=n; i++)          //in aceasta functie alegem colorarea optima(cu cele mai putine culori posibile)
        if(s[i]>max)
        max=s[i];                //dupa aflarea unei posibiliati de colorare se verfica daca in aceasta
if(min>max)                      //s-a folosit un nr de culori mai mic decat in posibilitatile anterioare
{
min=max;
		for(i=1;i<=n;i++)
       sol[i]=s[i];
}

return min;
}


int main()
{

FILE *f=fopen("noduri.txt","r");
fscanf(f,"%d",&n);                //citim din fisier numarul de noduri ale grafului
 for (i=1;i<=n;i++)
	    for (j=1;j<=n;j++)
       fscanf(f,"%d",&a[i][j]);   //citim graful dat prin matrice de adiacenta
	 fclose(f);

k=1;
nr=0;
s[k]=0;

while (k>0)
   {
    as=1;
    ev=0;
     while (as &&!ev)             //realizam posibilitatile de colorare
         {
          as=succesor();
          if (as) ev=valid();
          }
     if (as)                     //in cazul in care stiva s-a umplut se verifica daca solutia este optima
         if (k==n)
           solutie=calc_sol (solutie,sol);
                else
                     {
                        k++;        //altfel se creste nivelul in stiva
                        s[k]=0;
                       }
        else k--;
    }
    printf("Numarul minim de culori folosit este: %d \n",solutie);
    for(i=1;i<=n;i++)
     printf("nodul %d are culoarea %d\n",i,sol[i]);
    getch();
}
