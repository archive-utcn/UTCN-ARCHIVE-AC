/*Consider a nxm matrix, with elements decimal digits representing colors. A 
connected set associated to an element is the set of elements that may be reached
from this element, by successive moves on a same row or column preserving the same
color. It is to determine the size and the color of the biggest connected set. In
case of multiple solutions, display them all.*/
#include <stdio.h>
#include <conio.h>
int b[100][100],p,max=-1,x1[4]={-1,0,1,0},y1[4]={0,1,0,-1},a[100][100],n,m,cul[10],nr;
int apare(int v[10],int k)
{int i;
for (i=0;i<=p;i++)
if (v[i]==k)
return (1);
return (0);
}
void detsol(int c)
{if ((max==nr)&&(apare(cul,c)==0))
{p++;
cul[p]=c;
}
if (max<nr)
{max=nr;
cul[0]=c;
p=0;
}
}
void zero()
{int i,j;
for (i=0;i<m;i++)
for (j=0;j<n;j++)
b[i][j]=0;
}
void back(int i,int x,int y,int c)
{int j,dx,dy;
for (j=0;j<4;j++)
{dx=x+x1[j];
dy=y+y1[j];
if ((dx>=0)&&(dx<m)&&(dy>=0)&&(dy<n))
if ((a[dx][dy]==c)&&(b[dx][dy]==0))
{nr++;
b[dx][dy]=nr;
detsol(c);
back(i+1,dx,dy,c);
}
}
}
int main()
{int i,j;
printf("Input m and n:");
scanf("%d %d",&m,&n);
printf("Input the elements of matrix:");
for (i=0;i<m;i++)
for (j=0;j<n;j++)
scanf("%d",&a[i][j]);
for (i=0;i<m;i++)
for (j=0;j<n;j++)
{nr=0;
zero();
back(1,i,j,a[i][j]);
}
printf("The size is %d;\n",max);
printf("The color(s) is(are):");
for (i=0;i<=p;i++)
printf("%d ",cul[i]);
getch();
return (0);
}
