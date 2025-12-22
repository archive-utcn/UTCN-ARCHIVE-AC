#include <conio.h>
#include <stdio.h>
main()
{
	int a,b,a1,b1,cmmdc,cmmmc,rest;
	printf("Introduceti a=");
	scanf("%d",&a);
	printf("Introduceti b=");
	scanf("%d",&b);

	a1=a;b1=b;
	while ((rest=a1%b1)!=0)
	 {	  a1=b1;
		  b1=rest;
	 }
	 cmmdc=b1;
	 cmmmc=a*b/cmmdc;
	 printf("a=%d  b=%d  cmmdc(a,b)=%d  cmmmc=%d", a, b,cmmdc, cmmmc);
	 getch();
   }
