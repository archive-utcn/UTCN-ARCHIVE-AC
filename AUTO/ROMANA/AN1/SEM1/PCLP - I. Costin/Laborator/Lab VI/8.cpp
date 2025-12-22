#include <stdio.h>
#include <conio.h>
#include <alloc.h>
#include <stdlib.h>
#include <math.h>

struct nod 
{ 
  int a; 
  nod *leg;
};

typedef nod *adr;

void create(adr &prim, int &n)//create the list
{  
   adr ultim,nou;
   prim=ultim=NULL;
   int i;
   printf("\n The number of elements in the list ");
   scanf("%i",&n);
   printf("\n Please input the elements of the list: \n");
   for(i=1;i<=n;i++)
    { 
       nou=(adr )malloc(1);
       scanf("%i",&(nou->a));
       nou->leg=NULL;
       if(!prim) 
           prim=ultim=nou;
       else 
           { 
              ultim->leg=nou; 
              ultim=nou;
           }
     }
}

void show( adr prim)//display the list
{
     adr i;
     for(i=prim;i!=NULL;i=i->leg)
     printf(" %i   ",i->a);
}

void insert(adr &prim,int n,int &p,int &val)//insert a node in the list
{ 
   printf("\n Please input the  position: \n ");
   scanf("%i",&p);
   printf("\n Please input the value: \n ");
   scanf("%i",&val);
   int i;  adr l,nou;
   nou=(adr) malloc(1);
   nou->a=val;
   nou->leg=NULL;
   if(!prim) 
      prim=nou;
   if(p>n+1) 
      printf("Append Error");
   else
      { 
         if(p==1)
            { 
               nou->leg=prim;
               prim=nou;
            }
         else
            { 
               l=prim;
               for(i=1;i<p;i++) 
                   l=l->leg;
               nou->leg=l->leg;
               l->leg=nou;
               l=nou;
            }
      }
}

void erase(adr &prim,int n,int &p)
{ 
   printf("\n Please input the position: \n ");
   scanf("%i",&p);
   if(!prim) 
     { 
        printf("\n Error \n");
     }
   else
     { 
        if(p>n) 
            printf("\n Error \n");
        else
            { 
              adr del,aux;
	          if(p==1)
	             {
	                aux=prim;
	                prim=aux->leg;
                    free(aux);
	             }
              else
                 { 
                     int i;  
                     aux=prim;
                     for(i=1;i<p-1;i++) 
                          aux=aux->leg;
                     del=aux->leg;
                     aux->leg=aux->leg->leg;
                     free(del);
                 }
            }
     }
}

int main()
{ 
   adr prim; 
   int n,p,val;
   create(prim,n);//we create the list
   printf("\n Insert \n");
   insert(prim,n,p,val);//we insert a node in the list
   printf("The list after the insertion of a new node is: ");
   show(prim);
   printf("\n Erase \n");
   erase(prim,n,p);//we erase a node from the list
   printf("\n The list after the erase is: \n");
   show(prim);
   getch();
}
