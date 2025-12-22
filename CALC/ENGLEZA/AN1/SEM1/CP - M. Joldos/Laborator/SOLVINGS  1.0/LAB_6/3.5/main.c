#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define MAX_DIM 1024

void sortCharAsc(char *m,int n)
{
    int i,ok;
    char aux[MAX_DIM];
    do
    {
        ok=1;
        for(i=0; i<=n-2; i++)
        {
            if(strcmp(m+i,m+i+1)<0)
            {
                strcpy(aux,(m+i));
                strcpy((m+i),(m+i+1));
                strcpy((m+i+1),aux);
                ok=0;
            }
        }
    }while(ok==0);
}
int main()
{
    char m[MAX_DIM][MAX_DIM];
    int i,n;
    scanf("%d",&n);
    getchar();
    for(i=0; i<n; i++)
    {
        fgets(m[i],sizeof(m),stdin);
    }
   //fprintf(m[0],sizeof(m),stdout);
    sortCharAsc(m,n);
    for(i=0; i<n; i++)
    {
        fputs(m[i],stdout);
    }

    return 0;
}
