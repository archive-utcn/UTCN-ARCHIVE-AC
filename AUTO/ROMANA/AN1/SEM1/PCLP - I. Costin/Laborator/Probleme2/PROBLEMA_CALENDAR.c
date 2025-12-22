//
#include <stdio.h>

int main()
{
    int luna,ziua,i,j,k,nr_zile;
    int a[10][10];
    printf("dati luna: ");
    scanf("%d",&luna);
    printf("dati ziua: ");
    scanf("%d",&ziua);
    switch (luna)
    {
    case 1:
    case 3:
    case 5:
    case 7:
    case 8:
    case 10:
    case 12: nr_zile=31;
    break;
    case 4:
    case 6:
    case 9:
    case 11: nr_zile=30;
    break;
    case 2: nr_zile=29;
    break;
}
    k=1;
    for(i=0;i<6;i++)
    for(j=0;j<7;j++)
    {
        if (ziua>1) {
            a[i][j]=0;
            ziua=ziua-1;
        }
        else
        {
        a[i][j]=k;
        k++;
        }
    }
    printf("\n");
    printf("  L  M  M  J  V  S  D\n");
    for(i=0;i<6;i++)
    {
    for(j=0;j<7;j++)
    if ((a[i][j]==0)||(a[i][j]>nr_zile)) printf("   ");
        else printf("%3d",a[i][j]);
    printf("\n");
    }

}
