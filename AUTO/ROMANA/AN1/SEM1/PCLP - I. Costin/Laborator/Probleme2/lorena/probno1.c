#include<stdio.h>
# define NR_MAX 20
void ordoneaza(float a[],int n){
    int modificat=1,i;
    while(modificat){
        modificat =0;
        for (i=0;i<n;i++)
        if (a[i-1]>a[i]){
            float aux=a[i-1];
            a[i-1]=a[i];
            a[i]=aux;
        }modificat=1;
    }
    n--;
}
int main(){
    int n,i;float a[NR_MAX];
    for(n=0;n<=0 || n>NR_MAX;scanf("%d",&n));
    printf("nr de elem: [<=%2d]:",NR_MAX);
    printf("sirul de valori \n");
    for (i=0;i<n;i++){
        printf("a[%2d]=",i);
        scanf("%f",&a[i]);
    }
    ordoneaza(a,n);
    printf("sirul ordonat:");
    for (i=0;i<n;i++)
    printf("%g",a[i]);
    return 0;
}
























