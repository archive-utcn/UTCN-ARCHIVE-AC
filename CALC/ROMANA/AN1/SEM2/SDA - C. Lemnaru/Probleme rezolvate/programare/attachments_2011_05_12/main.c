/*
Colorarea grafurilor.
 Fiind dat un graf neorientat G =(X, Γ) unde X este mulţimea formată din n noduri,
 iar Γ este mulţimea muchiilor şi un număr de m culori,
 se cere să se determine toate colorările posibile ale nodurilor grafului folosind cele m culori,
 astfel încât oricare două noduri adiacente să fie colorate în mod diferit.
*/

#include <stdio.h>
#include <stdlib.h>

int n,m,a[20][20],x[20],nr=0;
char c[20][20];
FILE *f;

void citire()

{
    FILE *g;
    int i,j;
    g=fopen("fis.txt","r");
    fscanf(g,"%d",&n);
    for(i=1;i<=n;i++)
      for(j=1;j<=n;j++)
        fscanf(g,"%d",&a[i][j]);
    fscanf(g,"%d",&m);
    for(i=1;i<=m;i++)
      fscanf(g,"%s",c[i]);
   // for(i=1;i<=m;i++)
     //   printf("%s",c[i]);
     fclose(g);
}

int valid(int k)
{
    int i;
    for(i=1;i<k;i++)
      if(a[i][k]==1 && x[i]==x[k])
        return 0;
     return 1;

}

void afisare()

{
  int i,j;

  fprintf(f,"\n\n solutia %d ",++nr);
  for(i=1;i<=n;i++)
  {
      fprintf(f,"\nnodul %d este colorat %s",i,c[x[i]]);
       fprintf(f,"\n vecinii:");
      for(j=1;j<=n;j++)
       if(a[i][j]==1)
         fprintf(f,"\nnodul %d este colorat %s ",j,c[x[j]]);
  }
printf("\ns-a afisat solutia nr. %d\ndati enter pt urmatoare solutie\n",nr);
getch();
}


void back(int k)
{
    int i;
     for(i=1;i<=m;i++)
        {
            x[k]=i;
        if(valid(k)==1)
          if(k==n)
            afisare();
            else
               back(k+1);
        }
}


int main()
{

f=fopen("rezultat.txt","w");
   citire();
   back(1);
   fclose(f);
    return 0;
}
