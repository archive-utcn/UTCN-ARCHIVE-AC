/*63. Sa se scrie un program de generare recursiva a submultimilor de m elemente apartinând multimii
A cu n elemente (combinatiile de n elemente luate câte m).*/

#include <stdio.h>
#include <conio.h>
#define NMAX 10

int nrctr,p[NMAX];
//NRCTR-NR CURENT AL UNEI GENERARI DE COMBINARI
//p=vector ce contine elementele submultimii(combinatiei)

void afisare(int m)
{
    int i;
    printf("\n%3d      ",nrctr);
    for(i=1;i<=m;i++)
       printf("  %2d",p[i]);
       if(nrctr % 20 ==0) getch();

}
void combinari(int n,int m,int i)
{
    int j;
    for(j=p[i-1]+1;j<=n-m+i;j++)
    {
        p[i]=j;
        if(i<=m) combinari(n,m,i+1);
        else
        {
            nrctr++;
            afisare(m);
        }
    }
}
int main()
{
int i,n,m;
printf("\n nr elementelor multimii n=");
scanf("%d",&n);
printf("\nnr elementelor submultimii m=");
scanf("%d",&m);
printf("\nCOMBINARILE DE n ELEMENTE LUATE CATE m");
printf("\nnr ctr Elementele combinatiei");
nrctr=0;
p[0]=0;
combinari(n,m,1);
getch();
}
