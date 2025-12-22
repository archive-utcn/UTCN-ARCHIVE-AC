/*42. Se da un graf neorientat cu n noduri. Se cere sa se determine numarul minim de culori necesare pentru a
colora nodurile grafului dat, astfel încât doua vârfuri legate printr-o muchie sa fie colorate cu culori
diferite.*/
/**GREEDY**/
#include<stdio.h>
#include<conio.h>

int a[100][100],i,j,n,colorat[100],nrculori=0,nr=0;

void citire()
{
FILE *f=fopen("D:\\noduri.txt","r");
fscanf(f,"%d",&n);                  //citim numarul de noduri din fisierul noduri.txt
 for (i=1;i<=n;i++)
	    for (j=1;j<=n;j++)
       fscanf(f,"%d",&a[i][j]);     //citim graful dat prim matrice de aiacenta
	 fclose(f);
	}

	void initializare()
	{
	for(i=1;i<=n;i++)
   colorat[i]=0;                    //initializam vectorul culorilor folosite cu 0
	}

	void colorare()
	{
	int minim;
	colorat[1]=1; nr++;              //pornim cu primul nod pe care il coloram cu o prima culoare
	for(i=2;i<=n;i++)
	  {
	  minim=1;
	   for(j=1;j<=n;j++)
	    if((a[i][j]==1)&&(colorat[j]!=0))    //verificam daca exista muchie intre oricare doua noduri
       	if(colorat[j]==minim)              //si daca pentru un anume nod j s-a folosit deja o anume
         	minim++;                        //culoare vom creste nr culorii
  		colorat[i]=minim;                     //cu care va fi colorat nodul i
  		if(minim>nr) nr++;                    //nr reprezinta numarul de culori folosite
	  }
	}

	void afis()
	{
   printf("Numarul de culori folosite este egal cu: %d",nr);
	for(i=1;i<=n;i++)
	  printf("\nNod %d culoare %d ",i,colorat[i]);
	}

	int main()
	{
	 citire();
	 initializare();
	 colorare();
    afis();
    getch();
    return 0;
	}
