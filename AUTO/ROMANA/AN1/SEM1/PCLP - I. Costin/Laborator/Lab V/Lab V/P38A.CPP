#include <stdio.h>
#include <conio.h>
#define MAXN 100

struct MUCHIE
{
    int a,b;
    float c;
    int sel;   
};

struct POINT
{
    int x,y;
    int ind;    
};

void citeste(POINT a[MAXN],int& n)
{
    printf("Numarul de orase=");
    scanf("%i",&n);
    for(int i=1;i<=n;i++)
    {
        printf("Orasul %i (x,y)",i);
        scanf("%i%i",&a[i].x,&a[i].y);
        a[i].ind=i;   
    }
}

void afisare(POINT a[MAXN],int n,MUCHIE c[MAXN],int dimc,float ct)
{
    printf("\ncostul total=%f\n",ct);
    for(int i=1;i<=dimc;i++)
    if(c[i].sel==1)
    {
        for(int j=1;j<=n;j++)
        {
            if(a[j].ind==c[i].a)
                printf("(%i,%i) ",a[j].x,a[j].y);    
            if(a[j].ind==c[i].b)
                printf("(%i,%i) ",a[j].x,a[j].y);
        }
        printf("\n");
    }  
}


