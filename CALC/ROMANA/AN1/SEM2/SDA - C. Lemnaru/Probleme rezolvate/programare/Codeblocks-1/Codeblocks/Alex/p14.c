#include <stdio.h>
#include <conio.h>

double main()
{
    int n,i,c,b;
    double a[99],min,max;
    printf("Sirul are dimensiunea: ");
    scanf("%d",&n);
    for(i=0;i<n;i++)
    {printf("a[%d]=",i);
    scanf("%lf",&a[i]);}
    min=a[0];
    max=a[0];
    for(i=0;i<n;i++)
    {
      if(a[i]<min)
      {min=a[i];
      c=i;}
    }
    for(i=0;i<n;i++)
    {
      if(a[i]>max)
      {max=a[i];
      b=i;}
    }
printf("Pozitia el. minim: %d\n",c);
printf("Pozitia el. maxim: %d",b);
}

