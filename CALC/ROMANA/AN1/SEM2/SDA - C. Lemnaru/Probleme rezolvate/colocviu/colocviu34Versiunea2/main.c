/*34. Pe malul unui râu se afla 2n bastinasi din care n sunt canibali. Acestia doresc sa traverseze râul utilizând
o barca care poate transporta cel mult k persoane. Daca pe un mal sau în barca sunt mai multi canibali
decât ceilalti, atunci canibalii îi vor mânca. Cum vor reusi sa treaca toti pe malul opus fara sa se manânce
si fara a apela la alte persoane.*/
#include <stdlib.h>
#include <stdio.h>

struct nod{
               int c,m,t;
          }s[1000],d[1000];//vectorul s este folosit pentru malul stang
                           //vectorul d este folosit pentru malul drept
int t,z;
int valid(int k)
{
          int i;
          for(i=1;i<=k-1;i++)
          if ((s[k].m==s[i].m)&&(s[k].c==s[i].c)&&(d[k].m==d[i].m)&&(d[k].c==d[i].c)&&(s[k].t==s[i].t)&&(d[k].t==d[i].t)) return 0;
          //verific daca o stare intermediara este egala cu starea finala
          return 1;
}

void afis(int k)
{
     int i;
     printf("   Malul stang                 Malul drept\n");
     printf("Misionari Canibali   sens   Misionari Canibali\n");

     for(i=1;i<=k;i++)
     printf("   %2d       %2d        %2d       %2d       %2d\n",s[i].m,s[i].c,d[i].t,d[i].m,d[i].c);
     printf("\n");
}

void back(int k,int n,int t)
{
     int i,j;
     for(i=0;i<=n;i++)
     for(j=0;j<=n;j++)
      if (z==0)
      {
      if ((i+j<=k)&&(i+j>0))//numarul de persoane din barca este mai mic decat k si barca nu este goala
      {
      if (t==1)//barca pleaca spre malul drept
      {
      s[k].t=1;
      d[k].t=1;
      s[k].c=s[k-1].c-j; //pleaca j canibali cu barca de pe malul stang
      s[k].m=s[k-1].m-i; //pleaca i misionari cu barca de pe malul stang
      d[k].c=d[k-1].c+j; //ajung j canibali pe malul drept
      d[k].m=d[k-1].m+i; //ajung i misionari pe malul drept
      if (s[k].m>=0&&s[k].c>=0&&d[k].m>=0&&d[k].c>=0)
      if (((s[k].m>=s[k].c)&&(d[k].m>=d[k].c))||((s[k].m==0||d[k].m==0)))//verific daca numarul de misionari de pe fiecare mal este mai mare decat numarul de canibali
                if (valid(k)==1)
                  {
                     if ((s[k].m==0)&&(s[k].c==0)) //verific daca s-a ajuns la final si nu mai sunt bastinasi pe malul stang
                        {z=1;//daca s-a gasit solutia z devine 1
                        printf("solutie\n");
                        printf("sens=1 => barca se deplaseaza de la malul stang la malul drept \n");
                        printf("sens=-1 => barca se deplaseaza de la malul drept la malul stang \n \n");
                        afis(k);
                  }
                        else back(k+1,n,-t);};}

      if (t==-1)//barca pleaca spre malul stang
        {
            s[k].t=-1;
            d[k].t=-1;//barca pleaca spre malul stang
            d[k].c=d[k-1].c-j;//j canibali pleaca de pe malul drept
            d[k].m=d[k-1].m-i;//i misionari pleaca de pe malul drept
            s[k].c=s[k-1].c+j;//j canibali ajung pe malul stang
            s[k].m=s[k-1].m+i;//i misionari ajung pe malul stang
            if (s[k].m>=0&&s[k].c>=0&&d[k].m>=0&&d[k].c>=0)//verific daca nr misionarilor este mai mare decat numarul canibalilor
            if (((s[k].m>=s[k].c)&&(d[k].m>=d[k].c))||((s[k].m==0||d[k].m==0)&&(s[k].c>=0&&d[k].c>=0)))
            if (valid(k)==1)  back(k+1,n,-t);
        }
    }
    }
}

int main()
{
    int n,k;
    do
    {
    printf("Introduceti cei 2n bastinasi de pe malul stang: ");
    scanf("%d",&n);
    }
    while(n%2!=0);
    n=n/2;
    printf("Introduceti numarul de persoane din barca: ");
    scanf("%d",&k);
    t=1;z=0;
    s[1].c=n;
    s[1].m=n;//starea initiala a problemei
    s[1].t=-1;
    d[1].t=-1;
    back(2,k,t);//apelul procedurii recursive back
    if (z==0) printf("nu exista solutie");
    return 0;
};

