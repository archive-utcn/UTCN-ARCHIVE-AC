//pb 27. Se da un numar real a în baza 10. Sa se scrie programul de conversie a lui în baza B,
// unde B <=16.
#include <stdio.h>
#include <conio.h>
#include <math.h>

main()
{
int p,a,k=0;
long x=0;
printf("Dati nr in baza 10: ");
scanf("%d",&a);
printf("Dati baza: ");
scanf("%d",&p);
while(a!=0)
{
x=x+(a%p)*pow(10,k);
k++;
a=a/p;
}
printf("%ld",x);
getch();
return 0;
}
