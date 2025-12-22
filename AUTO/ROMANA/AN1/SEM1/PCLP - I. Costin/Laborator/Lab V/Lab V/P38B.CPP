#include <math.h>
#define MAXN 100

struct POINT
{
    int x,y;
    int ind;    
};

struct MUCHIE
{
    int a,b;
    float c;
    int sel;   
};

float distanta(int x1,int y1,int x2,int y2)
{
    return sqrt((x1-x2)*(x1-x2)+(y1-y2)*(y1-y2));   
}

void cost_muchie(POINT a[MAXN],int n,MUCHIE c[MAXN],int& dimc)
{
    for(int i=1;i<n;i++)
    for(int j=i+1;j<=n;j++)
    {
        dimc++;
        c[dimc].a=i;
        c[dimc].b=j;
        c[dimc].sel=0;
        c[dimc].c=distanta(a[i].x,a[i].y,a[j].x,a[j].y);
    }
}

void sorteaza(MUCHIE c[MAXN],int dimc)
{
    for(int i=1;i<dimc;i++) 
    for(int j=i+1;j<=dimc;j++)
    if(c[i].c > c[j].c)
    {
        MUCHIE aux=c[i];
        c[i]=c[j];
        c[j]=aux;   
    }
}
