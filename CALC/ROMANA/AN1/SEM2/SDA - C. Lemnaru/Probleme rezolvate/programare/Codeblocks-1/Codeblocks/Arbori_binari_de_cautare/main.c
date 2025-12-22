#include <stdio.h>
#include <conio.h>
#include <malloc.h>
typedef struct tip_nod{
			       int cheie;/*informatie */
		   	       struct tip_nod *stg,*dr;
			     } TIP_NOD;
TIP_NOD *rad;

void inordine(TIP_NOD *p, int nivel)
{
  int i;
  if (p!=0){
		 inordine(p->stg,nivel+1);
		 for(i=0;i<=nivel;i++) printf("  ");
		 printf("%2d\n",p->cheie);
		 inordine(p->dr,nivel+1);
	       }
}




TIP_NOD *inserare_rec(TIP_NOD *rad,int key)
{
  TIP_NOD *p;
  int n;
  if (rad==0){
		  n=sizeof(TIP_NOD);
		  p=(TIP_NOD *)malloc(n);
		  p->cheie=key;p->stg=0;p->dr=0;
		  return p;
	            }
  else {
             if(key < rad->cheie) rad->stg=inserare_rec(rad->stg,key);
	    else {
                       if(key > rad->cheie) rad->dr=inserare_rec(rad->dr,key);
		  else { /* cheie dubla */
			 printf("\n Exista un nod de cheie=%d\n",key);
		          }
	            }
	 };
    return rad;
}

TIP_NOD * cautare(TIP_NOD *rad, int key)
{
	TIP_NOD *p;

	if(rad==0) return 0;/*arborele este vid */
	p=rad;
	while(p != 0)
		{
		  if(p->cheie == key) return p;/* s-a gasit nodul */
		  else if(key < p->cheie) p=p->stg;
		         else p=p->dr;
		 }
	return 0; /* nu exista nod de cheie key */
   }



void main(void)
{
  TIP_NOD *p;
  int i, n,key;
  char ch;
  printf("\nNumarul total de noduri=");
  scanf("%d",&n);
  rad=0;
  for(i=1;i<=n;i++)
        {
	            printf("\nCheia nodului=");
	            scanf("%d",&key);
                rad=inserare_rec(rad,key);

         }
  printf("\nVIZITAREA IN INORDINE\n");
  inordine(rad,0);
 getch();
}

