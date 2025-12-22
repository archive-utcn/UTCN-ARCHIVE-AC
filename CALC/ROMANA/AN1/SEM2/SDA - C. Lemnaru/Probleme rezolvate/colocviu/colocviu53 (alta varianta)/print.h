void print(FILE *pf,int *x,NOD *r,int n)
  {NOD *p;

    int i;
    fprintf(pf,"\n%d",r->nr);
    if(x[1]) p=r->dr;
     else p=r->st;
      for(i=2;i<=n;i++)
       {
           fprintf(pf," -> %d",p->nr);
           if(x[i]) p=p->dr;
           else p=p->st;
       }
       fprintf(pf,"\n");
  }

void space(FILE *pf,int n)
 {int k;
   for (k=0;k<=n;k++)
    fprintf(pf,"  ");
 }

void print_tree(FILE *pf,int **z,int *x,int n,NOD *r,int K)
 {
     int i,k,l;
     l=n+2;
     fprintf(pf,"\n");
     for(i=0;i<n;i++)
       {
           space(pf,n-i+1);
          for(k=0;k<=i;k++)
             fprintf(pf,"   %d",z[i][k]);
            fprintf(pf,"\n");
        if(K)
         {space(pf,l);
           if(x[i+1]==1) {if(r->dr)fprintf(pf,"  \\");r=r->dr;l++;}
           if(x[i+1]==0){if(r->st)fprintf(pf,"/");r=r->st;l--;}
             fprintf(pf,"\n");
         }
       }
 }

    void add(int *z,int nr)
    {int i=0;
        while(z[i]!=-1) i++;
        z[i]=nr;
    }

  void get_tree(int **z,NOD *r,int k)
  {   r->vazut=1;
       add(z[k],r->nr);
     if(r->st!=0&&r->st->vazut==0) get_tree(z,r->st,k+1);
     if(r->dr!=0&&r->dr->vazut==0) get_tree(z,r->dr,k+1);
  }

void afisare(char *s,int **z,int *x,int n,NOD *r)
  {  FILE *pf;
     pf=fopen(s,"w");
     if(pf==NULL) {fprintf(stderr,"Eroare la deschiderea fisierului \"%s\"",s);getchar();exit(1);}
     fprintf(pf,"Date intrare:\n");
     print_tree(pf,z,x,n,r,0);
     fprintf(pf,"\nDate iesire:\nDrumul cu suma numerelor maxima:");
     print(pf,x,r,n);
     print_tree(pf,z,x,n,r,1);
     fclose(pf);
  }
