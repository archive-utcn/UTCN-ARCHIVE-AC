/*Folosind numai pointeri si expresii cu pointeri, se vor scrie functii de citire, afisare si înmultire a
doua matrice.*/
#include <stdio.h>
#include <stdlib.h>
#define NM 50
int **init()
{int **p,i;
p=calloc(NM,sizeof(int));
if(p==NULL) exit(1);
else for (i=0;i<NM;i++)
{p[i]=calloc(NM,sizeof(int));
if(p[i]==NULL) exit(1);
}
return p;
}
void citire(int **p,int *n)
{printf("n=");
scanf("%d",n);
int i,j;
for (i=0;i<*n;i++)
for (j=0;j<*n;j++)
{printf("a[%d][%d]=",i+1,j+1);
scanf("%d",&p[i][j]);
}
}
void afisare(int **p,int n)
{
printf("\n");
int i,j;
for (i=0;i<n;i++)
{printf("\n");
for(j=0;j<n;j++)
printf("%d ",p[i][j]);
}
}
int **inmultire(int **p,int n,int**q,int m)
{if (n!=m) {printf("\nMatrici diferite ca rang!"); return NULL;}
else{ int i=0;
int **c;
c=init();
while (i<n) { int j,k,s=0;
for (j=0;j<n;j++)
{s=0;
for (k=0;k<n;k++)
s+=p[i][k]*q[k][j];
c[i][j]=s;
}
i++;
}
afisare(c,n);
return c;
}
}
void del (int **p)
{int i;
for (i=0;i<NM;i++)
free(p[i]);
free(p);
}
int main()
{ int **p,**q,**r,n,m;
p=init();
q=init();
citire(p,&n);
citire(q,&m);
afisare(p,n);
afisare(q,m);
inmultire(p,n,q,m);
//del(p);
//del(q);
//del(r);
// din motive necunoscute se blocheaza la dealocare de momorie. din fericire nu se cere sa se faca asta :p
getchar();
return 0;
}
