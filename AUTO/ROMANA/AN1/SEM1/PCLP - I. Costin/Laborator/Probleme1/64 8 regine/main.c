/* 64. Sa se scrie un program de rezolvare a problemei celor 8 regine (determinarea tuturor asezarilor pe
tabla de sah a celor 8 regine astfel încât sa nu se atace).*/

# include<conio.h>
# include<math.h>
#include<stdio.h>


int st[100],n;
void tipar(){
    int i;
for(i=1;i<=n;i++ )
printf("linia %d coloana %d\n",i,st[i]);
printf('\n');
}
void dame(int k){
int i,j,corect;
if(k==n+1)
tipar();
else{
for(i=st[k]+1;i<=n;i++){
st[k]=i;
corect=1;
for(j=1;j<=k-1;j++)
if((st[j]==st[k])||(abs(st[k]-st[j])==k-j))
corect=0;
if(corect)
dame(k+1);
     }
     }
st[k]=0;
}
void main(){
/*printf("Dati n = ");
scanf("%d",&n); n=nr de regine respectiv latrura tablei de sah */
n=8;
dame(1);
getch();
}
