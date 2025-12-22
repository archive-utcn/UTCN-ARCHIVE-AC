#include <stdio.h>
#include <stdlib.h>

int verifica_triunghi(int a, int b, int c)
{
    if (a+b>c && a+c>b && b+c>a )
        return 1;
    return 0;
}

int main(int argc, char* argv[] )
{
    FILE *pf= fopen(argv[1],"r");
    int n;
    int lb[100];

    fscanf(pf,"%d",&n);
    for (int i=0; i<n;i++)
        fscanf(pf,"%d",&lb[i]);

    int nrt=0;
    for (int i=0; i<n-2; i++)
        for (int j=i+1; j<n-1; j++)
            for (int k=j+1; k<n; k++)
                if (verifica_triunghi(lb[i],lb[j],lb[k]))
    {
        printf("%d(%d) %d(%d) %d(%d)\n",lb[i],i+1,lb[j],j+1,lb[k],k+1);
        nrt++;
    }

    printf("Nr triunghiuri: %d",nrt);

    return 0;
}
