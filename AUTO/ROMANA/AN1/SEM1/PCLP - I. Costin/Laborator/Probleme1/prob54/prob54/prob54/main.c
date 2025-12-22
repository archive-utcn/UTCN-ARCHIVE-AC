/*54. ceva interclasare cu poanteri a doi vectori sortati*/
#include <stdio.h>
#include <stdlib.h>
#define NM 50
float *init(int a)
{float *p;
p=calloc(a*NM,sizeof(float));
if(p==NULL) exit (1);
return p;
}
void citire(float *p,int *n)
{ printf("\nn=");
scanf("%d",n);
int i=0;
citire:
{printf("a[%d]=",i+1);
scanf("%f",p+i);
if (i>0&&*(p+i)<=*(p+i-1)) {printf("\n\tValoare gresita!\r\n");i--;}
i++;
}
if (i<*n)goto citire;
}
void afisare(float *p, int n)
{int i;printf("\n");
for (i=0;i<n;i++)
printf("%5.2f ",*(p+i));
}
void merge(float *a,int n, float *b,int m)
{int i,j,k;
i=j=k=0;
float *c;
c=init(2);
verificare:
{if (a[i]<b[j]) {c[k]=a[i];k++;i++;}
else if (b[j]<a[i]) {c[k]=b[j];k++;j++;}
else {c[k]=a[i];k++;i++;j++;}
}
if (i<n&&j<m) goto verificare;
while (n-i>0) {c[k]=a[i];k++;i++;}
while (m-j>0) {c[k]=b[j];j++;k++;}
printf("\n Interclasare: ");
afisare(c,k);
}
int main()
{float *a,*b;
int n,m;
a=init(1);
b=init(1);
citire(a,&n);
citire(b,&m);
merge(a,n,b,m);
getchar();
return 0;
}
