NOD *search(NOD *r,int i,int j,int n) //cauta un nod in functie de pozitia data (i,j)
 { if(r==0)  return 0;
    if(j==0)  return 0;
    if(j>i) return 0;
    int rate;
     NOD *p;
     p=r;
      do
       {rate=n-i+2*(j-1)+1;
           if(p->rating==rate&&(p->st==0 || p->dr==0)) return p;
         if(rate>p->rating) p=p->dr;
          else p=p->st;
       } while(p);
     return 0;
 }

int read(NOD **r,char s[20])   //citeste din fisierul s in arborele de radacina r si returneaza inaltimea arborelui
{int n,i,j;
    FILE *pf;
    NOD *p,*q,*t;
    pf=fopen(s,"r");
    if(pf==NULL)  {fprintf(stderr,"\nEroare la deshiderea fisierului \"%s\" ",s);getchar();exit(1);}
    fscanf(pf,"%d",&n);
    for (i=1;i<=n;i++)
     for(j=1;j<=i;j++)
       { p=search(*r,i-1,j-1,n);
          q=search(*r,i-1,j,n);
          if (p==NULL && q==NULL)
            {
               create_NOD(&(*r),i,j,n);
               fscanf(pf,"%d",&((*r)->nr));
            }
           else
               {create_NOD(&t,i,j,n);
                   if(p)     p->dr=t;
                   if(q)     q->st=t;
                  fscanf(pf,"%d",&(t->nr));
                }
       }
    return n;
 }

