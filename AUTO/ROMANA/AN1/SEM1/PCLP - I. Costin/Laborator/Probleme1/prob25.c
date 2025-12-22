/* 25. Pentru elaborarea unui test de aptitudini se dispune de un set de
n întrebări, fiecare întrebare i fiind cotată cu un număr de pi puncte.
Să se elaboreze toate chestionarele având q întrebări, fiecare chestionar totalizând între a şi b puncte.
Întrebările sunt date prin număr şi punctaj.
*/
#include <stdio.h>
#include <stdlib.h>
int x[100],p[100],a,b,n,q;
int solutie (int k)
{int i,cont=0;
if (k!=q) return 0;
for (i=1;i<=k;i++)
cont+=p[x[i]-1];
if(cont>a&& cont<b) return 1;
return 0;
}
void afisare (int k)
{int i;
printf("\n\nChestionar:");
for (i=1;i<=k;i++)
printf("\nintrebarea %d cu %d puncte",x[i],p[x[i]-1]);
}
int valid(int k)
{register int i,j;
for (i=1;i<k;i++)
for (j=i+1;j<=k;j++)
{if(x[i]==x[j]) return 0;if(x[i]>x[j]) return 0;}
return 1;
}
void back(int k)
{int i;
for (i=1;i<=n;i++)
{x[k]=i;
if(valid(k)) if(solutie(k)) afisare(k);
else if(k<q)back(k+1);
}
}
int main()
{ int i;
printf("n=");
scanf("%d",&n);
for(i=0;i<n;i++)
{printf("\n p[%d]=",i+1);
scanf("%d",&p[i]);
}
printf("\nnumar de intrebari:");
scanf("%d",&q);
printf("\nval minima acceptata pentru punctaj:");
scanf("%d",&a);
printf("\n val maxima acceptata pentru punctaj:");
scanf("%d",&b);
back(1);
getchar();
return 0;
}
