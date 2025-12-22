#include<stdio.h>
#include<conio.h>
#include<math.h>
#include<string.h>

void summing(char n1[100],char n2[100], char summ[200])
{
int res=0,over_10=0;
int i,k;


k = strlen(n1)-strlen(n2);
while(k!=0)
{
if(k>0)
  {
  k--;
  for(i=strlen(n2);i>=0;i--)
  n2[i+1]=n2[i];
  n2[0]=48;
  }
if(k<0)
  {
  k++;
  for(i=strlen(n1);i>=0;i--)
  n1[i+1]=n1[i];
  n1[0]=48;
  }
}

for(i=0;i<=strlen(n1)-1;i++)
summ[i]=48;
summ[strlen(n1)]='\0';

for(i=strlen(n1)-1;i>=0;i--)
{
res = n1[i]+n2[i]-96+over_10;
if(res<10)        
	{
	summ[i]=res+48;
	over_10 = 0;
	}
else
	{
	over_10 = 1;
	summ[i]=res+38;
	}
res=0;
}


if(over_10==1)
{
for(i=strlen(summ);i>=0;i--)
	summ[i+1]=summ[i];
summ[0]=49;
}

printf("%s",summ);
}

void difference(char n1[100],char n2[100], char diff[200])                  
{
int res=0,over_10=0;
int i,k;


k = strlen(n1)-strlen(n2);
while(k!=0)
{
if(k>0)
  {
  k--;
  for(i=strlen(n2);i>=0;i--)
  n2[i+1]=n2[i];
  n2[0]=48;
  }
if(k<0)
  {
  k++;
  for(i=strlen(n1);i>=0;i--)
  n1[i+1]=n1[i];
  n1[0]=48;
  }
}

for(i=0;i<=strlen(n1)-1;i++)
diff[i]=48;
diff[strlen(n1)]='\0';

for(i=strlen(n1)-1;i>=0;i--)
{
res = n1[i]-n2[i]-over_10;
if(res>=0)
	{
	diff[i]=res+48;
	over_10 = 0;
	}
else
	{
	over_10 = 1;
	diff[i]=res+58;
	}
res=0;
}

if(over_10 == 1)
{
for(i=strlen(diff);i>=0;i--)
diff[i+1]=diff[i];
diff[0]='-';
diff[strlen(diff)-1]='\0';
}

printf("%s",diff);
}

int main()
{

char n1[100],n2[100];
char summ[200],diff[200],prod[200];

scanf("%s",&n1);
scanf("%s",&n2);
printf("\nsumm=");summing(n1,n2,summ);
printf("\ndifference=");difference(n1,n2,diff);

getche();
return 0;    
}
