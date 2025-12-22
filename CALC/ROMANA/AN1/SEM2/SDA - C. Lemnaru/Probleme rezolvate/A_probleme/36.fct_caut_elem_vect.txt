/*36. Fiind dat un vector ce contine elemente de tip întreg ordonate crescator, sa se scrie o functie de cautare a
unui element dat în vector, returnându-se pozitia sa.*/
///DIVIDE  ET  IMPERA
#include <stdio.h>
#include <stdlib.h>

int *vector;
int nrElem;
int nrCautat;

void cautareDEI(int i,int j)
{
    int m=(i+j)/2;
    if(vector[m]==nrCautat)
    printf("\nNr %d a fost gasit pe pozitia %d",vector[m],m+1);
    else
    {
        if(i<j)
        {
            if(vector[m]<nrCautat)
            cautareDEI(m+1,j);
            else
            cautareDEI(i,m-1);
        }
        else
        printf("\nNr %d nu se afla in vector!",nrCautat);
    }
}


void citireDate()
{
    int i;
    printf("Nr elemente vector: ");
    fflush(stdin);
    scanf("%d",&nrElem);
    vector=(int*)malloc(nrElem*sizeof(int));
    for(i=0;i<nrElem;i++)
    {
        printf("V[%d]=",i+1);
        fflush(stdin);
        scanf("%d",&vector[i]);
    }
    printf("\nNr cautat= ");
    fflush(stdin);
    scanf("%d",&nrCautat);
}

int main()
{
    citireDate();
    cautareDEI(0,nrElem);
    return 0;
}
