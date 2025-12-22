/*34. Pe malul unui râu se afla 2n bastinasi din care n sunt canibali. Acestia doresc sa traverseze râul utilizând
o barca care poate transporta cel mult k persoane. Daca pe un mal sau în barca sunt mai multi canibali
decât ceilalti, atunci canibalii îi vor mânca. Cum vor reusi sa treaca toti pe malul opus fara sa se manânce
si fara a apela la alte persoane.*/
#include <conio.h>
#include <stdlib.h>
#include <stdio.h>
typedef struct{
               int c,m,t;
               }vector;
vector s[1000],d[1000];
int t,z;
int valid(int k)
{
          int i;
          for(i=1;i<=k-1;i++)
          if ((s[k].m==s[i].m)&&(s[k].c==s[i].c)&&(d[k].m==d[i].m)&&(d[k].c==d[i].c)&&(s[k].t==s[i].t)&&(d[k].t==d[i].t)) return 0;
          return 1;
};
void tipar(int k)
{
     int i;
     for(i=1;i<=k;i++)
     printf("%d %d  **  %d  **  %d %d\n",s[i].m,s[i].c,d[i].t,d[i].m,d[i].c);
};
void back(int k,int n,int t)
{
     int i,j;
     for(i=0;i<=n;i++)
     for(j=0;j<=n;j++)
      if (z==0)
      {
      if ((i+j<=n)&&(i+j>0))
      {
      if (t==1)
      {
      s[k].t=1;
      d[k].t=1;
      s[k].c=s[k-1].c-j;
      s[k].m=s[k-1].m-i;
      d[k].c=d[k-1].c+j;
      d[k].m=d[k-1].m+i;
      if (s[k].m>=0&&s[k].c>=0&&d[k].m>=0&&d[k].c>=0)
      if (((s[k].m>=s[k].c)&&(d[k].m>=d[k].c))||((s[k].m==0||d[k].m==0)))
                                                           if (valid(k)==1) {/*tipar(k)*/; if ((s[k].m==0)&&(s[k].c==0)) {z=1;printf("solutie\n");tipar(k);}
                                                          else back(k+1,n,-t);};}

      if (t==-1){
      s[k].t=-1;
      d[k].t=-1;
      d[k].c=d[k-1].c-j;
      d[k].m=d[k-1].m-i;
      s[k].c=s[k-1].c+j;
      s[k].m=s[k-1].m+i;
      if (s[k].m>=0&&s[k].c>=0&&d[k].m>=0&&d[k].c>=0)
       if (((s[k].m>=s[k].c)&&(d[k].m>=d[k].c))||((s[k].m==0||d[k].m==0)&&(s[k].c>=0&&d[k].c>=0))) if (valid(k)==1) {/*tipar(k)*/; back(k+1,n,-t);}}}}
};


int main()
{
    int n,k;
    printf("n este egal cu ");
    scanf("%d",&n);
    printf("numarul maxim de persoane din barca este ");
    scanf("%d",&k);
    t=1;z=0;
    s[1].c=n;
    s[1].m=n;
    s[1].t=-1;
    d[1].t=-1;
    back(2,k,t);
    if (z==0) printf("nu exista solutie");
    getch();
    return 1;
};

