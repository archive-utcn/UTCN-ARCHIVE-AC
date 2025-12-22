#include<stdio.h>
struct data{
    int zi,luna,an;
};
int zi[]={31,28,31,30,31,30,31,31,30,31,30,31};
struct data azi,maine;
void degdataazi(void);
void getdataazi(void)
{
    int valid=0;
    while (valid==0){
        printf("introduceti anul(2000-->2010)");scanf("%d",&azi.an);
        if ((azi.an<1990) || (azi.an>2010))
        printf("invalid an \n");
        else valid=1;
    }
    valid=0;
    while(valid==0){
        printf("introd luna (1-12)-->");
        scanf("%d",&azi.luna);
        if((azi.luna<1) || (azi.luna>12)) printf("invalid luna\n");
        else valid=1;}
        valid=0;
    while(valid==0)
    {printf("introd ziua (1-%d)-->",zi[azi.luna-1]);
    scanf("%d",&azi.zi);
    if ((azi.zi<1) || (azi.zi>zi[azi.luna-1])) printf("invalid zi\n");
    else valid=1;}
}
main()
{
    getdataazi();
    maine=azi;maine.zi++;
    if(maine.zi>zi[maine.luna-1])
    {
        maine.zi=1;maine.luna++;
        if(maine.luna>12)
        { maine.an++;maine.luna=1;
        }
    }
printf("data de maine:%02d:%02d:%02d\n",maine.zi,maine.luna,maine.an);
}
