// Folosind numai pointeri şi expresii cu pointeri se vor scrie funcţii de sortare a unui vector cu elemente reale.
#include <stdio.h>
#include <stdlib.h>
int sortare(int **v,int *n)
{
    int i, ok, aux;
    printf("Introduceti lungimea vectorului:\n");
    scanf("%d",n);
    *v=(int*)malloc(*n*sizeof(int));
    printf("Introduceti elementele vectorului:\n");
    for(i=0;i<*n;i++)
        {
            printf("v[%d]=",i);
            scanf("%d",*v+i);
        }
    do
    {
        ok=0;
        for(i=0;i<*n-1;i++)
            if(*(*v+i)>*(*v+i+1))
            {
                aux=*(*v+i);
                *(*v+i)=*(*v+i+1);
                *(*v+i+1)=aux;
                ok=1;
            }
    }while(ok!=0);
    for(i=0;i<*n;i++)
        printf("%d",*(*v+i));
}

int main()
{
    int *a,nr;
   sortare(&a,&nr);
    return 0;
}
