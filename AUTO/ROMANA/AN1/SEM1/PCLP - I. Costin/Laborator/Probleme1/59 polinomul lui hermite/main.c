/*59. Sa se scrie o functie recursiva si una nerecursiva pentru calculul valorii polinoamelor Hermite
H(x) definite astfel:
H0(x)=1; H1(x)=2x;
Hn(x)=2nHn-1(x)-2(n-1)Hn-2(x), pentru n³2. */

#include<stdio.h>
#include<stdlib.h>
#include<conio.h>
 //varianta nerecursiva

 int hermite1(int x,int n)
 {long int i,h[100];
 h[0]=1;
 h[1]=2*x;
for(i=2;i<=n;i++) h[i]=2*i*h[i-1]-2*(i-1)*h[i-2];
 return h[n];
 }

 //varianta recursiva
 int hermite2(int x,int n)
 { long int h[100];
  h[0]=1;
  h[1]=2*x;
  if (n==0) return 1;
  else if (n==1) return 2*x;
  else return h[n]=2*n*hermite2(x,n-1)-2*(n-1)*hermite2(x,n-2);
 }


 int main()
 {
     int n,x,p=0,c=0;
     scanf("%d %d",&n,&x);
     p=hermite1(x,n);
     c=hermite2(x,n);
     printf("%d %d",p,c);
     return 0;
 }

