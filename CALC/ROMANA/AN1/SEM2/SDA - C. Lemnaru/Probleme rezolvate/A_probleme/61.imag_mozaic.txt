/*Imaginea unui mozaic se afla intr-un fisier text, fiecare caracter desemnand culoarea unei placute
din mozaic. Pentru simplitate, toate placutele sunt de forma patrata, de aceeasi dimensiune, si nu
sunt decat 2 culori, reprezentate in fisier prin caracterele 0 si 1. Toate liniile fisierului au
aceeasi lungime si nu depasesc 250 caractere. Figurile din imaginea mozaicului sunt formate din grupe
de 1 sau mai multe patratele adiacente, de culoare 1. Placutele adiacente au cel putin o latura comuna
cu restul grupului. Scrieti un program care sa ceara, prin dialog de la consola, numele unui fisier
(dimensiunea fisierului poate fi oricat de mare - peste 100 linii), si sa afiseze numarul figurilor
gasite in acel fisier.*/




#include<stdio.h>
#include<stdlib.h>
#include<malloc.h>

#define nlin 500
void constr_matr(char f[],int a[nlin][250],int *n,int *m)
{int i=0,j=0;
 char c;
 FILE *pf;
  if((pf=fopen(f,"r"))==NULL)
	{printf("\nEroare!!! Fisierul nu a fost gasit.");
	 exit(1);
	}
  while((fscanf(pf,"%c",&c)!=EOF)&&(c=='0'||c=='1'))
      {j=0;
	while(c!='\n')
		{

		 a[i][j]=c-'0';
		 j++;
		 fscanf(pf,"%c",&c);
		}

	i++;
	}

 *n=i;*m=j;

 fclose(pf);
}

void mozaic(int a[nlin][250],int n,int m,int *cont)
{int i,j,p=0,t=0;  //p->nr de pasi efectuati in timpul cautarii in matrice
while(p<n*m)
 {p=0;
  for(i=0;i<n;i++)
	for(j=0;j<m;j++)
		{p++;
		 if(a[i][j]==1)
			{
			 a[i][j]=2;    //gaseste un element=1 si il transf in 2
			 *cont=*cont+1;
			 goto next;
			}
		}
  next:
  for(i=0;i<n;i++)
	for(j=0;j<m;j++)
		if(a[i][j]==2)
		//transforma toate elem vecine celui gasit anterior in 2
		   {if(a[i][j+1]==1) {a[i][j+1]=2;
				      t=1;
				     }
		    if(a[i+1][j]==1) {a[i+1][j]=2;  //t->primeste valoarea 1 daca s-a gasit un elemnt vecin
				      t=1;                  //a lui a[i][j] care este =1
				     }
		    if(a[i][j-1]==1) {a[i][j-1]=2;
				      t=1;
				     }
		    if(a[i-1][j]==1) {a[i-1][j]=2;
				      t=1;
				     }
		    if(t==1) {i=0;
			      j=0;
			     }
		    t=0;

		   }
  for(i=0;i<n;i++)
	for(j=0;j<m;j++)
		if(a[i][j]==2) a[i][j]=0;  //elimina gruparea gasita anterior
 }

}

int main()
{char nume_fis[50];
int a[nlin][250];
int i,j,n,m,cont=0;
 printf("\nIntroduceti numele fisierului: ");
 scanf("%s",&nume_fis);
 constr_matr(nume_fis,a,&n,&m) ; //construieste o matrice avand ca elemente continutul fisierului
 printf("\nFisierul %s contine:\n",nume_fis);
 for(i=0;i<n;i++)
      {	for(j=0;j<m;j++)
		printf("%d",a[i][j]);
	printf("\n");
      }
 mozaic(a,n,m,&cont);
 printf("\nnr figurilor din acest fisier este: %d",cont);
return 0;
}
