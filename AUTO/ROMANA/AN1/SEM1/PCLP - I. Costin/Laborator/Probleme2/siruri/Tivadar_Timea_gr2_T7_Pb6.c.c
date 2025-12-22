/*Scrieþi un program care aloca dinamic spatiu pentru o matrice nxn,
intr-o functie citeste elementele si apoi afiseaza folosind
doar pointeri si aritmetica cu pointeri:
1.sumele elmentelor pe linii
2.sumele elmentelor pe coloane
3.suma elementelor de pe diagonala principala*/
#include <stdio.h>
#include <stdlib.h>
int citire(int ***v,int n)
{
 int i,j;

 *v = (int**) malloc(n*sizeof(int*));
  for (i=0; i <n; i++)
 *(*v+i) = (int*) calloc(n, sizeof(int));

for (i=0;i<n;i++)
for (j=0;j<n;j++){
printf("[%d][%d]= ",i,j);
scanf("%d",(*(*v+i)+j));
}
return 0;
}
int afisarea(int **v,int n)
{
int i,j;
for (i=0;i<n;i++){
for (j=0;j<n;j++)
printf("%d ",*(*(v+i)+j));
printf("\n");
}
return 0;
}
int sumele(int **v,int n,int **sl,int **sc,int *sd)
{
int i,j,k;

*sl=(int*)malloc(n*sizeof(int));
*sc=(int*)malloc(n*sizeof(int));
for(k=0;k<n;k++)
{
    *(*sl+k)=0;
    for(j=0;j<n;j++){
    for(i=0;i<n;i++){
        if (k==i){*(*sl+k)+=*(*(v+i)+j);}}}}
for(k=0;k<n;k++){*(*sc+k)=0;
    for(i=0;i<n;i++){
    for(j=0;j<n;j++){
        if(k==j){*(*sc+k)+=*(*(v+i)+j);}}}}
  *sd=0;
  for(i=0;i<n;i++)
    *sd+=*(*(v+i)+i);
}



int main()
{int **a,*sl,*sc,sd,n;
int i;
printf("dati dimensiunea matricei \n");
scanf("%d",&n);
 citire(&a,n);
 afisarea(a,n);
 sumele(a,n,&sl,&sc,&sd);
 for(i=0;i<n;i++)printf("suma elementelor pe linia %d=%d\n",i+1,*(sl+i));
 for(i=0;i<n;i++)printf("suma elementelor pe coloana %d=%d\n",i+1,*(sc+i));
 printf("suma diagonalei principale=%d",sd);

return 0;}

