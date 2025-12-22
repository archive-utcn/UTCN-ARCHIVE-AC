/*Scrieti un program care calculeaza greutatea ideala a unei persoane, utilizând formulele:
G_barbat=50 + 0.75*(înaltime-150) + (vârsta-20)/4;
G_femeie=G_barbat - 10;
Se citesc: sexul, înaltimea(în cm), vârsta (în ani).*/
#include <stdio.h>
#include <stdlib.h>

int main()
{
    char s;
    int i,v;
    float g;
    printf("sex(f/m)=");
    scanf("%s",&s);
    printf("inaltime=");
    scanf("%d",&i);
    printf("varsta=");
    scanf("%d",&v);
    g=50+0.75*(i-150)+(v-20)/4;
    if (s=='m')
    printf("%3f",g);
    else printf ("%f",g-10);
    return 0;

}
