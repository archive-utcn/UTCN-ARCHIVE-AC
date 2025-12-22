/* program care determina de cate ori apare fiecare cifra intr-un sir citit */
//frecventa de aparitie a unui numar
#include<stdio.h>

int main ()
{
    int n , a[200], b[200]={0},i;
    printf("n=");
    scanf("%d",&n);
    printf("sirul este: ");
    for(i=0 ; i<n; i++ )
        {
            scanf("%d",&a[i]);
            b[a[i]]=b[a[i]]+1;
        }
    for(i=0 ; i<n; i++ )
        {
            if(b[a[i]] !=0 )
                {
                    printf("numarul %d apare de %d ori \n",a[i],b[a[i]]);
                    b[a[i]]=0;
                }
        }
    return 0;
}
