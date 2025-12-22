#include <stdio.h>
#include <stdlib.h>
#include <math.h>

typedef struct nod
{
    struct nod *st,*dr;
    int inf;
}NOD;

NOD* construire(NOD **rad)
{
    NOD *p;
    int a;

    scanf("%d",&a);
    if(a==0) p=NULL;
    else
    {
        p=(NOD *)malloc(sizeof(NOD));
        p->inf=a;
        p->st=construire(rad);
        p->dr=construire(rad);
    }
    return p;
}

int max=0;

void pre_ordine(NOD *rad,int *n)
{
    if(rad!=NULL)
    {
        (*n)++;
        pre_ordine(rad->st,n);
        pre_ordine(rad->dr,n);
        (*n)--;
        if(max<(*n)) max=*n;
    }

}

int putere(int n)
{
    int p=1,i;
    for(i=1;i<=n;i++)
        p=p*2;
    return p-1;
}

void af2(int i,NOD *c[120])
{
    int j,k,x;
    if(i%2==0)
       for(k=0;k<=putere(max-i)-putere((max-i)/2)-2;k++)
            printf(" ");
    else
        for(k=0;k<=putere(max-i)-putere((max-i)/2)-1;k++)
            printf(" ");
    for(j=0;j<=putere(i);j++)
    {
        if(c[j]!=NULL)
        {
            if(c[j]->st!=NULL)
                printf("/");
            else printf(" ");
            for(x=0;x<=putere((max-i+1)/2)-1;x++)
                printf(" ");
            if(c[j]->dr!=NULL)
                printf("%c",92);
            else printf(" ");
            for(k=1;k<=putere(max-i+1)-2;k++)
                printf(" ");
        }
    }
    printf("\n");
}


void af(int i,NOD *c[120])
{
    int j,k;
    for(k=1;k<=putere(max-i);k++)
      printf(" ");
    for(j=0;j<=putere(i);j++)
    {
        if(c[j]!=NULL)
            printf("%d",c[j]->inf);
        else printf(" ");
        for(k=1;k<=putere(max-i+1);k++)
          printf(" ");
    }
    printf("\n");
}

void coada(int i,NOD *c[120])
{
    int j,p,k;
    p=putere(i);
    for(j=0;j<=p;j++)
    {
        for(k=p+1;k>=j+1;k--)
           c[k]=c[k-1];
        p=p+1;
        if(c[j]!=NULL)
        {
            c[j+1]=c[j]->dr;
            c[j]=c[j]->st;
        }
        j++;
    }
}

int main()
{
    NOD *rad,*c[120];
    int n=0,i;
    rad=construire(&rad);
    pre_ordine(rad,&n);
    c[0]=rad;
    for(i=0;i<=max;i++)
    {
        af(i,c);
        af2(i,c);
        coada(i,c);
    }
    return 0;
}
