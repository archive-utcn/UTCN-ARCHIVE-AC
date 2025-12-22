#include <stdio.h>
#include <stdlib.h>
#include<conio.h>
float n,m;
int ack(int m,int n){
if((n==(int)n)&&(n>=0)&&(m==0)) return n+1;
    else
        if((m==(int)m)&&(m>0)&&(n==0)) return ack(m-1,1);
            else
                if((m==(int)m)&&(n==(int)n)&&(m>0)&&(n>0)) return ack(m-1,ack(m,n-1));
}

int main()
{int t;
scanf("%f %f",&n,&m);
t=ack(m,n);
printf("%d",t);
getch();
return 0;
}
