//pb 28. Se da un numar natural n.
//a) Sa se gaseasca numarul obtinut prin eliminarea cifrelor care apar de mai multe ori în numar.
//b) Sa se gaseasca numarul obtinut prin interschimbarea între ele a primei cifre cu ultima , a celei
//de a doua cu penultima s.a.m.d.
//c) Sa se gaseasca cel mai mare numar ce se poate obtine din cifrele sale.
#include <stdio.h>
#include <stdlib.h>

int i,j,k=0,x[20],l=0,aux,nr[10];
 long n,ni,nu,copie,nx,na;

void a(long n)
 {int y[20],ok,dimz=0,z[20],ni=0;
     na=n;
 while(na!=0)
  {
      k++;
      x[k]=na%10;
      nr[na%10]++;
      na=na/10;
  }
 for(i=k;i>=1;i--)
   if(nr[x[i]]==1)
    ni=ni*10+x[i];
    printf("%d ", ni);
 }

void b(int n)
 {
      nu=n;
    copie=0;
     while(nu!=0)
      {
          copie=copie*10+nu%10;
          nu=nu/10;
      }
      printf("%d",copie);
 }

void c(int n)
{
   while(n!=0)
     {
         l++;
         x[l]=n%10;
         n=n/10;
     }
     for(i=1;i<=l;i++)
      for(j=i+1;j<=l;j++)
            if(x[i]<x[j])
             {
                 aux=x[i];
                 x[i]=x[j];
                 x[j]=aux;
             }
         nx=0;
          for(i=1;i<=l;i++)
           nx=nx*10+x[i];
     printf("%d",nx);
}

int main()
{
 printf("numarul este:");
  scanf("%d", &n);
  printf("punctul a\n");
   a(n);
   printf("punctul b\n");
    b(n);
   printf("punctul c\n");
    c(n);

    return 0;
}
