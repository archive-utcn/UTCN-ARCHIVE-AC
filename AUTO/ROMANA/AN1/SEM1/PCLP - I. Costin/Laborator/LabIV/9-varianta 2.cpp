#include <stdio.h>
#include <conio.h>
void funct(int n,char x[100])
{
  int arab[8]={1000,500,100,50,10,5,1},i,j=-1;
char roman[8]="MDCLXVI";
while (n>=1000)
{j++;
x[j]='M';
x[j+1]='\0';
n=n-1000;
}
for (i=2;i<7;i=i+2)
{if (n>=9*arab[i])
{n=n-9*arab[i];
j++;
x[j]=roman[i];
j++;
x[j]=roman[i-2];
x[j+1]='\0';
}
if (n>=5*arab[i])
{n=n-5*arab[i];
j++;
x[j]=roman[i-1];
x[j+1]='\0';
}
if (n>=4*arab[i])
{n=n-4*arab[i];
j++;
x[j]=roman[i];
j++;
x[j]=roman[i-1];
x[j+1]='\0';
}
while (n>=arab[i])
{j++;
x[j]=roman[i];
x[j+1]='\0';
n=n-arab[i];
}
}
}
int main()
{int n;
char x[100];
printf("Input an Arabian number:");
scanf("%d",&n);
funct(n,x);
printf("The Roman numeral is %s",x);
getch();
return (0);
}
