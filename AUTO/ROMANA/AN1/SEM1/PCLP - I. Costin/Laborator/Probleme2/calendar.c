#include<stdio.h>
#include<string.h>
void main()
{
    int l,zi,zile,i=1,k;
    char luna[50];
    printf("dati numarul lunii\n");
    scanf("%d",&l);
    printf("in ce zi incepe luna ?\n");
    scanf("%d",&zi);
    switch(l)
    {
    case 1:
    {
        strcpy(luna,"ianuarie");
        zile=31;
    }
    break;
    case 2:
    {
        strcpy(luna,"februarie");
        zile=28;
    }
    break;
    case 3:
    {
        strcpy(luna,"martie");
        zile=31;
    }
    break;
    case 4:
    {
        strcpy(luna,"aprilie");
        zile=30;
    }
    break;
    case 5:
    {
        strcpy(luna,"mai");
        zile=31;
    }
    break;
    case 6:
    {
        strcpy(luna,"iunie");
        zile=30;
    }
    break;
    case 7:
    {
        strcpy(luna,"iulie");
        zile=31;
    }
    break;
    case 8:
    {
        strcpy(luna,"august");
        zile=31;
    }
    break;
    case 9:
    {
        strcpy(luna,"septembrie");
        zile=30;
    }
    break;
    case 10:
    {
        strcpy(luna,"octombrie");
        zile=31;
    }
    break;
    case 11:
    {
        strcpy(luna,"noiembrie");
        zile=30;
    }
    break;
    case 12:
    {
        strcpy(luna,"decembrie");
        zile=31;
    }
    break;
    default:
        printf("\nnr lunii este incorect\n");
    }
    printf("%s\n",luna);
printf("L\tM\tMi\tJ\tV\tS\tD\n");
k=zi-1;
while(zi>1)
        {  zi--;
            printf("\t");

        }

    while(i<=zile )
    {printf("%d\t",i);
    i++;
    k++;
    if(k%7==0)printf("\n");


    }
}

