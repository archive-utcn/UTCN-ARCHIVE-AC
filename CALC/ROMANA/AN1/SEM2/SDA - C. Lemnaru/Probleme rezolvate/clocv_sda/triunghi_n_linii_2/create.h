void create_NOD(NOD **p,int i,int j,int n) //creaza un nod de pointer p dat si calculeaza ratingu in functie de pozitia (i,j)
 {

     *p=(NOD *)malloc(sizeof(NOD));
     if(*p==NULL)  {fprintf(stderr,"\nEroare la alocare de memorie");getchar();exit(1);}
     (*p)->st=0;
     (*p)->dr=0;
     (*p)->rating= n-i+2*(j-1)+1;
     (*p)->vazut=0; //0->nevazut, 1->vazut

 }

 void create_int(int **a,int n)
  {
      *a=(int*)calloc(n,sizeof(int));
       if(*a==NULL) {fprintf(stderr,"\nEroare la alocare de memorie");getchar();exit(1);}
  }
  void initialize(int *z,int k)
    {int i;
        for(i=0;i<k;i++)
          z[i]=-1;
    }
