/* 31. Se spune ca un numar natural este "frumos" daca are ca factori primi
doar pe 2,3 si 5. Sa se scrie un program care afiseaza pe ecran primele n numere
"frumoase", câte 10 pe o linie (1<=n<=1000).*/

#include <stdio.h>
#include <stdlib.h>
int verificare(long x)
{
while(x%2==0) x/=2;
while(x%3==0) x/=3;
while(x%5==0) x/=5;
return (x==1);
}
int main()
{
int n,nr=0,k=2;
printf("\nDati n=");
scanf("%d", &n);
while(nr<n)
{ if(verificare(k))
{ printf(" %d ", k);
nr++;
if(nr%10==0) printf("\n");
}
k++;
}
return 0;
}

