#include <stdio.h>
#include <stdlib.h>

int main()
{
    int x, v[50],b, j, i;
    printf("n=");
    scanf("%d",&x);
    printf("baza in care se face transformarea este");
    scanf("%d",&b);
    i=0;
    while(x!=0)
    {
        v[i]=x%b;
        x=x/b;
        i++;
    }
    printf("numarul in baza %d este",b);
        for(j=i-1;j>=0;j--)
            if (v[j]>=0 && v[j]<=9)
                printf("%d",v[j]);
                else if(v[j]==10)
                        printf("A");
                        else if(v[j]==11)
                                printf("B");
                                else if(v[j]==12)
                                        printf("C");
                                        else if(v[j]==13)
                                                printf("D");
                                                else if(v[j]==14)
                                                        printf("E");
                                                        else if(v[j]==15)
                                                            printf("F");
    return 0;
}
