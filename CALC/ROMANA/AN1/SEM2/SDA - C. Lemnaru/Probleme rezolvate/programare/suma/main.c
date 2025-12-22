// 3.9.Se consideră o mulţime formată din n elemente numere întregi. Să se
//genereze toate submulţimile acestei mulţimi având proprietatea că suma
// elementelor lor este egală cu S.
#include <stdio.h>
#include <stdlib.h>
int s[100],a[100],n,nr,sum;
FILE *f;

void af(int m)
{
    int i;
    nr++;
    fprintf(f,"\nsolutia nr %d: ",nr);
    for(i=1;i<=m;i++)
        fprintf(f,"%d ",a[s[i]]);
    fprintf(f,"\n");
}

int suma(int k)
{
    int i,x=0;;
    for(i=1;i<=k;i++)
        x=x+a[s[i]];
    return x;
}

int validare(int k)
{
    int i;
    for(i=1;i<k;i++)
        if(a[s[k]]>a[s[i]]||s[k]==s[i]) return 0;
    return 1;
}

void back(int k)
{
    int i;
    for(i=1;i<=n;i++)
    {
        s[k]=i;
        if(validare(k)==1)
        {
            if(suma(k)==sum) af(k);
                else back(k+1);
        }
    }
}

void citire()
{
    FILE *f;
    int i;
    f=fopen("fis.txt","r");
    fscanf(f,"%d",&n);
    for(i=1;i<=n;i++)
        fscanf(f,"%d",&a[i]);
    fscanf(f,"%d",&sum);
    fclose(f);
}

int main()
{
    citire();
    f=fopen("sol.txt","w");
    back(1);
    fclose(f);
    return 0;
}
