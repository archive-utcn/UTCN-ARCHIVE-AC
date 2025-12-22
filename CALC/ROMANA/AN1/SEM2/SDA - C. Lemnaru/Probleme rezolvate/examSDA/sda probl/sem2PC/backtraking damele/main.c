#include <stdio.h>
#include <math.h>
#include <conio.h>
#include <stdlib.h>
int stiva[100]; //solutia se construieste in stiva
int nrsolutii;
int n;
int valid(int k)
{
int i;
int cod=1;
for(i=1;i<=k-1;i++)
	if ((stiva[k]==stiva[i]) || (abs(k-i)==abs(stiva[k]-stiva[i])))
		cod=0;
return cod;
}

int final(int k)
{
if (k==n)
return 1;
else
return 0;
}

void tipareste()
{
int i;
printf("\n");
for(i=1;i<=n;i++)
	printf("%d ",stiva[i]);
}

void dame(int k)
{
    int i;
for(i=1;i<=n;i++)
	{
	stiva[k]=i;
	if (valid(k)==1)
	  {
		if (final(k)==1)
			tipareste();
		else
                	dame(k+1);
	  }
	}
}

int main()
{
printf("\n dati n:");scanf("%d",&n);
dame(1);
return 0;
}
