/*nu inteleg de ce nu merge si pentru numere mai mici ca 5*/
#include <stdio.h>
#include <stdlib.h>
#include<conio.h>
int a[100][100],n,dl[8]={1,2,2,1,-1,-2,-2,-1},dc[8]={2,1,-1,-2,-2,-1,1,2};

int cond(int l,int c,int pas){
    int ok=1;
    if((l<1)||(l>n)) ok=0;
    if((c<1)||(c>n)) ok=0;
    return ok;
}
void afisare(){
int i,j;
for(i=1;i<=n;i++)
for(j=1;j<=n;j++) printf(" %d ",a[i][j]);}
void back(int l,int c,int pas){
int lv,cv,i;
for(i=0;i<8;i++)
        {lv=l+dl[i];
        cv=c+dc[i];
        if(cond(lv,cv,pas+1)==1)
            if(a[lv][cv]==0){
                              a[lv][cv]=pas+1;
                              if(pas+1==n*n)
                                   { afisare();
                                   printf("\n");
                                   printf("\n");}
                                    else
                                back(lv,cv,pas+1);
                                a[lv][cv]=0;}}}
int main(){
scanf("%d",&n);
a[1][1]=1;
back(1,1,1);}
