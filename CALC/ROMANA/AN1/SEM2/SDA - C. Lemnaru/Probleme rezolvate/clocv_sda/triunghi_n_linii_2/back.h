 void check(int *x,int *y,int*suma,int k,NOD *r)
   {NOD *p;
      p=r;
       int suma1=r->nr,i;
       for (i=1;i<k;i++)
          {
              if(y[i]==0) p=p->st;
               else p=p->dr;
              suma1+=p->nr;
          }
       if(suma1>*suma)
         {for(i=1;i<=k;i++)
           x[i]=y[i];
         *suma=suma1;
         }
   }

void back(NOD *rad,NOD *r,int *x,int *y,int *suma,int n,int k)
{
    int i;
    for (i=0;i<=1;i++)
     {y[k]=i;
       if(k==n) check(x,y,suma,k,rad);
       if(k<n)
       {if(i==0) back(rad,r->st,x,y,suma,n,k+1);
          else back(rad,r->dr,x,y,suma,n,k+1);
       }
     }

 }
