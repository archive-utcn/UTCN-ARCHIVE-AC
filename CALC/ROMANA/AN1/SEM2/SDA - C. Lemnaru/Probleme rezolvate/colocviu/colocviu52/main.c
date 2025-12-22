/*52. Se considera un set de N întrebari, fiecare având un punctaj Pi. Sa se genereze toate chestionarele
continând un numar de întrebari între A si B si având un punctaj total între C si D.*/
#include <stdio.h>
#include <stdlib.h>

int n;
int a,b,c,d;
int mem[100];
int P[100];

void citireDate()
{
    ///citeste punctajele intrebarilor si nr de intrebari
    FILE *f=fopen("ade.txt","r");
    int i;
    if(!f)
    {
        printf("\nError!!");
        return;
    }
    fscanf(f,"%d",&n);
    for(i=1;i<=n;i++)
    {
        fscanf(f,"%d",&P[i]);
    }
    fscanf(f,"%d %d",&a,&b);
    fscanf(f,"%d  %d",&c,&d);
    fclose(f);
}

void afisareSolutie(int nr)
{
    int i;
    printf("\nSolutie: ");
    for(i=0;i<=nr;i++)
    printf("\n%d",mem[i]);
}

void back(int pct,int nr, int pos)
{
    int aux;
    if(pos<=n)
    {
    if((pct+P[pos]<=d)&&(nr+1<=b))
    {
        mem[nr]=pos;
        if((pct+P[pos]>=c)&&(nr+1>=a))
        afisareSolutie(nr);
        else
        if(pct+P[pos]<c)
        {
            if(nr+2>b)
            {
                mem[nr]=0;
                back(pct,nr,pos+1);
                return;
            }
            else
            {
                back(pct+P[pos],nr+1,pos+1);
                return;
            }
        }
        else
        {
            back(pct+P[pos],nr+1,pos+1);
            return;
        }

        back(pct+P[pos],nr+1,pos+1);
        return;
    }
    else
    if(pct+P[pos]>d)
    {
        back(pct,nr,pos+1);
        return;
    }
    else
    {
        aux=mem[nr];
        mem[nr]=0;
        back(pct-P[aux],nr-1,aux+1);
        return;
    }
    }
}


int main()
{

    citireDate();
    back(0,0,1);
    return 0;
}
