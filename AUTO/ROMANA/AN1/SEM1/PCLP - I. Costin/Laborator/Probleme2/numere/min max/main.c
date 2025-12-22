// program care determina minimul, respectiv maximul dintr-un sir citit

#include <stdio.h>
#include <stdlib.h>

int main()
{
    float v[50],max, min;
    int n,i;
    printf("n=");
    scanf("%d",&n);
    for(i=0;i<n;i++)
        {
            printf("v[%d]=",i);
            scanf("%f",&v[i]);
        }
    min=v[0];
    max=v[0];
    for(i=1;i<n;i++)
    {
        if(max<v[i])
               max=v[i];
        if(min>v[i])
            min=v[i];
    }
    printf("max=%f si se gaseste pe pozitia",max);
    for(i=0;i<n;i++)
        if(max==v[i])
            printf("%d ",i+1);
    printf("\nmin=%f si se gaseste pe pozitia",min);
    for(i=0;i<n;i++)
        if(min==v[i])
            printf("%d ",i+1);
    return 0;
}
