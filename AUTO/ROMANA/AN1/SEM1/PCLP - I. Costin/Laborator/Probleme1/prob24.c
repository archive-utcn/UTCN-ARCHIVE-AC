/* 24. Se da un sir de n numere întregi. Sa se extraga subsirul ordonat
crescator de dimensiune maxima. */

#include <stdio.h>
#include <stdlib.h>
void subsir(int n,int v[])
{
int i,l,c,max,i1,i2;
l=i1=0;c=i2=0;
  max=1;
for (i=1;i<n;i++)
  { if (v[i]<v[i-1])
    if ((i-i2)>max) { max=i-i2;
  i1=i2;
  i2=i;
  }
           else i2=i;
     }
     for (i=i1;i<=i1+max-1;i++)
     printf("%d ",v[i]);
     }
int main()
{
    int i,n,v[20];
    printf("\n Introduceti valoarea lui n ");
    scanf("%d",&n);
    printf("\n Introduceti sirul de numere \n");
    for (i=0;i<n;i++)
    { printf("\n v[%d]=",i);
          scanf("%d",&v[i]);
    }
    subsir(n,v);
}
