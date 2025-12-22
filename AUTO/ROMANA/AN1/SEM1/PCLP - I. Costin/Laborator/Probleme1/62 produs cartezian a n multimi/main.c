/*62. Sa se scrie un program recursiv de generare a produsului cartezian a n multimi.*/
#include <stdio.h>
#include <conio.h>

#define NMAX 10

int nrctr,p[NMAX],nr_elem[NMAX];
/*nrctr=nr curent al unei generari de produs cartezian
p=vecto ce contine elementele produsului cartzian
nr_elem=vector ce contine nr de elemente ale fiecarei multimi*/
void afisare(int n)
{
    //afiseaza vectorul p
    int i;
    printf("\n%3d    ",nrctr);
    for(i=1;i<=n;i++)
       printf(" %2d",p[i]);
    if(nrctr % 20==0) getch();

}
void produs_cartezian(int n,int i)
{
    //n=nr multimilor
    int j;
    for(j=1;j<=nr_elem[i];j++) {
                    p[i]=j;
                    if(i<n) produs_cartezian(n,i+1);
                       else{
                             nrctr++;
                             afisare(n);}
           }
}
int main()
{
    int i,n;
    printf("\nnr multimilor n=");
    scanf("%d",&n);
    for(i=1;i<=n;i++)
       {
           printf("\nnr de elementelor multimii %d =",i);
           scanf("%d",&nr_elem[i]);
       };
    printf("\nelementele produsului cartezian");
    printf("\nnr ctr elementele produsului");
    nrctr=0;
    produs_cartezian(n,1);
    getch();
       }





