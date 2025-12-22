//pb 26. Se dau 2 siruri de n si respectiv m elemente de tip întreg. Sa se gaseasca:
//a) sirul ce contine elementele comune ale celor doua siruri;
//b) sirul ce contine toate elementele celor doua siruri luate o singura data;
//c) sirul ce contine elementele primului sir din care au fost eliminate elementele comune.
#include <stdio.h>
#include <stdlib.h>

int x[20],y[20],c[20],n,m,dimc=0;

void a(int x[],int y[])
 {
     int i,j,k,l,dimz=1,z[20];
     z[1]=x[1];
     for(i=2;i<=n;i++)
      {
         int ok=0;
         for(j=1;j<=dimz;j++)
          if(z[j]==x[i])
           ok=1;
          if(ok==0)
            {
                dimz++;
                z[dimz]=x[i];
            }
      }
      for(j=1;j<=dimz;j++)
       for(k=1;k<=m;k++)
        if(z[j]==y[k])
         {
             dimc++;
             c[dimc]=z[j];
         }
       for(i=1;i<=dimc;i++)
        printf("%d ",c[i]);

 }

/*void b(int x[],int y[])
 {
    int i,j,dimz=0,z[40],m[40],dimm=1,k;
    for(i=1;i<=n;i++)
     {
         dimz++;
         z[dimz]=x[i];
     }
    for(j=1;j<=m;j++)
      {
          dimz++;
          z[dimz]=y[j];
      }
   m[1]=z[1];
     for(i=2;i<=dimz;i++)
      {
         int ok=0;
         for(j=1;j<=dimm;j++)
          if(m[j]==z[i])
           ok=1;
          if(ok==0)
            {
                dimm++;
                m[dimm]=z[i];
            }
      }
    for(k=1;k<=dimm;k++)
     printf("%d ",m[k]);
 }*/

/*void pctc(int x[])
 {
     int i,j;


 }

*/

int main()
{ int i,j;
    printf("dati n:");
    scanf("%d",&n);
  printf("dati m:");
    scanf("%d",&m);
  printf("dati elementele primului sir:");
  for(i=1;i<=n;i++)
    scanf("%d",&x[i]);
  printf("dati elementele celui de-al doilea sir:");
  for(j=1;j<=m;j++)
    scanf("%d",&y[j]);
  printf("punctul a ");
  a(x,y);
  printf("punctul b ");
  b(x,y);
  printf("punctul c ");
 // pctc(x);
    return 0;
}
