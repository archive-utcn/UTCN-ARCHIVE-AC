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


void calendar()
{
    int luna,i;
    printf("Introduceti numarul lunii:");
    scanf("%d",&luna);
    printf("Din a cata zi a saptamanii incepe luna?");
    scanf("%d",&ziua);
    afisare(luna);
}

float n;

void nrcons(int nrelserie)
{
    float k,m,j;
    int i,rezultat;
    m=nrelserie*(nrelserie-1.0);
    m=m/2;
    j=n-m;
    k=j/nrelserie;
    if(k==(unsigned int)k)
    {
        rezultat=k;
        for(i=1; i<=nrelserie; i++)
        {
            printf("%d ",rezultat);
            rezultat=rezultat+1;
        }
        printf("\n");
    }
}

void consecutive()
{
    int nrelserie;
    scanf("%f",&n);
    for(nrelserie=2; nrelserie<=n; nrelserie++)
    nrcons(nrelserie);
}

void meniu(int optiune)
{
    if(optiune==1)
    {
        consecutive();
        printf("\n");
    }
    if(optiune==2)
    {
        calendar();
        printf("\n");
    }
    if(optiune<0||optiune>2) printf("\n Nu ati ales corect optiunea\n");
}

int main()
{
    int opt;
    do
    {
        printf("\n Alegeti problema dorita! ");
        printf("\n 0 - Iesire");
        printf("\n 1 - Serii numere consecutive a caror suma este n");
        printf("\n 2 - Calendar");
        printf("\n");
        scanf("%d",&opt);
        meniu(opt);
    }while(opt!=0);
    return 0;
}
