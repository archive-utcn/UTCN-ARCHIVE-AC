/*De pe mediul de intrare sunt citite elementele reale ale unui sir de dimensiunea n. Sa se gaseasca
pozitia elementelor de valoare minima si valoare maxima din sir.*/
#include <stdio.h>
#include <conio.h>
#include <math.h>

int main()
{
  int i,j,min,max,pozmin,pozmax,n;
  int s[20];
  printf("\n numarul de elemente=");
  scanf("%5d",&n);
  for (i=1;i<=n;i++)
      scanf("%5d",&s[i]);
  max=s[1];
  pozmax=1;
  for (i=2;i<=n;i++)
      if (s[i]>max)
        {
        max=s[i];
        pozmax=i;
      }

  min=s[1];
  pozmin=1;
  for (j=2;j<=n;j++)
       if (s[j]<min)
        {
        min=s[j];
        pozmin=j;
         }

  printf("\n nr maxim e:%d",max);
  printf("\n pozitia lui e:%d ",pozmax);
  printf("\n nr minim e:%d ",min);
  printf("\n pozitia lui e:%d ",pozmin);
  return 0;
}

