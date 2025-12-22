#include <stdio.h>
#include <stdlib.h>

void readArray(float *a,int *n)
{
    int i,l;
    scanf("%d",n);

    for(i=0; i<*n; i++)
    {
        scanf("%f",(a+i));
    }
}

void showArray(float *a,int n)
{
    int i;

    for(i=0; i<n; i++)
    {
        printf("%.2f ",*(a+i));
    }
}


void bubbleSortPointers(float *a,int n)
{
    int i,ok;
    float aux;
    do
    {
        ok=1;
        for(i=0;i<=n-2;i++)
        {
            if(*(a+i)>*(a+i+1))
            {
                aux=*(a+i);
                *(a+i)=*(a+i+1);
                *(a+i+1)=aux;
                ok=0;
            }

        }
    }while(ok==0);
}
int main()
{
    float a[100];
    int n;
    printf("Input the dimension of the array: ");
    //scanf("")
    readArray(a,&n);
    bubbleSortPointers(a,n);
    showArray(a,n);
    return 0;
}
