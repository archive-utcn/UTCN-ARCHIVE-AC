#include <stdio.h>
int ziua;

int numarzile(int luna)
{
    int zile;
    switch(luna)
    {
        case 1: {zile=31; break;}
        case 2: {zile=29; break;}
        case 3: {zile=31; break;}
        case 4: {zile=30; break;}
        case 5: {zile=31; break;}
        case 6: {zile=30; break;}
        case 7: {zile=31; break;}
        case 8: {zile=31; break;}
        case 9: {zile=30; break;}
        case 10: {zile=31; break;}
        case 11: {zile=30; break;}
        case 12: {zile=31; break;}
        default: break;
    }
    return zile;
}

void afisare(int luna)
{
    int i;
    printf("\nL  M  M  J  V  S  D\n");
    for(i=1; i<ziua; i++)
    printf("   ");
    int numar,k=9-ziua;
    numar=luna;
    numar=numarzile(numar);
    for(i=1; i<=numar; i++)
    {
        if(i==k)
        {
            printf("\n");
            k=k+7;
        }
        if(i<10) printf("%d  ",i);
        else printf("%d ",i);
        if(ziua<7) ziua++;
        else ziua=1;
    }
    printf("\n");
}

int main()
{
    int luna,i;
    scanf("%d%d",&luna,&ziua);
    afisare(luna);
    return 0;
}

