//3.10.Se dau două mulţimi de numere întregi A şi B. Să se genereze toate funcţiile .

#include <stdio.h>
#include <stdlib.h>
int s[100],a[100],b[100],n,m,nr;
FILE *f;

void af()
{
    int i;
    nr++;
    fprintf(f,"\nsolutia nr %d\n",nr);
    for(i=1;i<=n;i++)
        fprintf(f,"f(%d)=%d\n",a[i],b[s[i]]);
    fprintf(f,"\n");
}

void back(int k)
{
    int i;
    for(i=1;i<=m;i++)
    {
        s[k]=i;
        if(k==n) af();
        else back(k+1);
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
    fscanf(f,"%d",&m);
    for(i=1;i<=m;i++)
        fscanf(f,"%d",&b[i]);
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
