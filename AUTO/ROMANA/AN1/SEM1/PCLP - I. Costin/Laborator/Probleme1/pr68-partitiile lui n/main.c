#include<stdio.h>
#include<conio.h>

int s[20],n,k;

int chk()
{ int sum=0,i;
for((int) i=1;i<=n;i++) sum=sum+s[i];
return(sum==n);
}

void tipar()
{int i;
for((int) i=1;i<=n;i++) printf("%d",s[i]);
printf("\n");
}

void part(int k,int n)
{
int i;
s[k]=n;
if(chk()) tipar();
for(i=1;i<=s[k]-1;i++)
{ s[k]=s[k]-i;
  part(k-1,i);
  s[k]=s[k]+i;
  }
}

main()
{
scanf("%d",&n);
part(n,n);
getch();
return 0;
}
