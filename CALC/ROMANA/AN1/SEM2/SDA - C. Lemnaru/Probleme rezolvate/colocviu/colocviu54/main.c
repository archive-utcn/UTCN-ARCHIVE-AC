/*  Se considerã o suprafaþã caroiatã de dimensiuni nXn, in care fiecare patrat are una din culorile
GALBEN, ROSU, ALBASTRU, VERDE. Configuratia suprafetei se citeste de la tastatura (sau din fisier).
    Sa se determine ºi sã se tipãreascã dacã existã drumuri(minime) între colþurile opuse. Un drum
trebuie sa cuprinda doar patrate de aceeasi culoare. Deplasarea dintr-un pãtrat se face in toate
cele 8 direcþii.*/

#include <stdio.h>
#include <stdlib.h>
int b[20][20];
char a[20][20];
int dimensiune,i,j,l,k;
typedef struct {int i,j;}
RECORD;
RECORD v[400];

void drum_minim( char x,char a[20][20],int b[20][20],int i, int j,int k )
//transcrie matricea a
//intr-o matrice b ce va avea doar nre:in ordine crescatoare, daca se poate trece, si 1000 daca nu
{
    //se va porni din coltul dat de i si j


    if((i>1)&&(j>1)&&b[i][j]+1<b[i-1][j-1]){

    if (a[i-1][j-1]==x)
                        { b[i-1][j-1]=k+1; drum_minim(x,a,b,i-1,j-1,k+1);}
                        else b[i-1][j-1]=1000;}
    if(( i>1)&&(j>=1)&&b[i][j]+1<b[i-1][j]){
    if (a[i-1][j]==x) { b[i-1][j]=k+1; drum_minim(x,a,b,i-1,j,k+1);}
                        else  b[i-1][j]=1000;}
    if((i>1)&&(j<dimensiune)&&b[i][j]+1<b[i-1][j+1]){
    if (a[i-1][j+1]==x) { b[i-1][j+1]=k+1; drum_minim(x,a,b,i-1,j+1,k+1);}
                        else b[i-1][j+1]=1000;}
    if((j>1)&&b[i][j]+1<b[i][j-1]){
    if (a[i][j-1]==x) { b[i][j-1]=k+1;drum_minim(x,a,b,i,j-1,k+1); }
                        else b[i][j-1]=1000;}
    if((j<dimensiune)&&b[i][j]+1<b[i][j+1]){
    if (a[i][j+1]==x) { b[i][j+1]=k+1; drum_minim(x,a,b,i,j+1,k+1);}
                        else b[i][j+1]=1000;}
    if((i<dimensiune)&&(j>1)&&b[i][j]+1<b[i+1][j-1]){
    if (a[i+1][j-1]==x) { b[i+1][j-1]=k+1; drum_minim(x,a,b,i+1,j-1,k+1);}
                        else b[i+1][j-1]=1000;}
    if((i<dimensiune)&&b[i][j]+1<b[i+1][j]){
    if (a[i+1][j]==x) { b[i+1][j]=k+1;drum_minim(x,a,b,i+1,j,k+1);}
                        else b[i+1][j]=1000;}
    if((i<dimensiune)&&(j<dimensiune)&&b[i][j]+1<b[i+1][j+1]){
    if (a[i+1][j+1]==x) { b[i+1][j+1]=k+1; drum_minim(x,a,b,i+1,j+1,k+1);}
                        else  b[i+1][j+1]=1000;}

}


void afisare_drum(int b[20][20],RECORD v[400],int i, int j,int k)//cauta drumul minim intre colturi,
 //si afiseaza drumul
{   int l;

    if((i==1)&&(j==1)){
        printf("Cel mai scurt drum intre coltul(1,1) si (dimensiune,dimensiune) este:");for(l=k-1;l>=1;l--) printf("\na[%d][%d]",v[l].i,v[l].j);
        printf("\na[%d][%d]", dimensiune, dimensiune);}
           else
    {
    if((i>1)&&(j>1)&&b[i][j]-1==b[i-1][j-1]){
                        v[k].i=i-1;
                        v[k].j=j-1;
                         afisare_drum(b,v,i-1,j-1,k+1);}

    if(( i>1)&&(j>=1)&&b[i][j]-1==b[i-1][j]){
                        v[k].i=i-1;
                        v[k].j=j;
                        afisare_drum(b,v,i-1,j,k+1);}

   if((i>1)&&(j<dimensiune)&&b[i][j]-1==b[i-1][j+1])
      {                 v[k].i=i-1;
                        v[k].j=j+1;
                        afisare_drum(b,v,i-1,j+1,k+1);}

    if((j>1)&&b[i][j]-1==b[i][j-1])
    {                   v[k].i=i;
                        v[k].j=j-1;
                        afisare_drum(b,v,i,j-1,k+1);
   }
    if((j<dimensiune)&&b[i][j]-1==b[i][j+1]){
                        v[k].i=i;
                        v[k].j=j+1;
                        afisare_drum(b,v,i,j+1,k+1);}

    if((i<dimensiune)&&(j>1)&&b[i][j]-1==b[i+1][j-1]){
                        v[k].i=i+1;
                        v[k].j=j-1;
                        afisare_drum(b,v,i+1,j-1,k+1);}

    if((i<dimensiune)&&b[i][j]-1==b[i+1][j]){
                        v[k].i=i+1;
                        v[k].j=j;
                        afisare_drum(b,v,i+1,j,k+1);}

    if((i<dimensiune)&&(j<dimensiune)&&b[i][j]-1==b[i+1][j+1]){
                        v[k].i=i+1;
                        v[k].j=j+1;
                        afisare_drum(b,v,i+1,j+1,k+1);}

 //else printf("Nu exista drum");
}
}

void afisare_drumb(int b[20][20],RECORD v[400],int i, int j,int k)//afiseaza
//cauta drumul minim intre celelalte 2 colturi
{   int l;

    if((i==1)&&(j==dimensiune)){//daca se afla pe pozitia a[1][dimensiune], atunci afiseaza drumul minim
        printf("Cel mai scurt drum intre coltul (1,%d) si (%d,1)este:",dimensiune,dimensiune);for(l=k-1;l>=1;l--) printf("\na[%d][%d]",v[l].i,v[l].j);
        printf("\na[%d][%d]", dimensiune, 1);}
    else
    {
    if((i>1)&&(j>1)&&b[i][j]-1==b[i-1][j-1]){
                        v[k].i=i-1;
                        v[k].j=j-1;
                         afisare_drumb(b,v,i-1,j-1,k+1);}

    if(( i>1)&&(j>=1)&&b[i][j]-1==b[i-1][j]){
                        v[k].i=i-1;
                        v[k].j=j;
                        afisare_drumb(b,v,i-1,j,k+1);}

   if((i>1)&&(j<dimensiune)&&b[i][j]-1==b[i-1][j+1])
      {                 v[k].i=i-1;
                        v[k].j=j+1;
                        afisare_drumb(b,v,i-1,j+1,k+1);}

    if((j>1)&&b[i][j]-1==b[i][j-1])
    {                   v[k].i=i;
                        v[k].j=j-1;
                        afisare_drumb(b,v,i,j-1,k+1);
   }
    if((j<dimensiune)&&b[i][j]-1==b[i][j+1]){
                        v[k].i=i;
                        v[k].j=j+1;
                        afisare_drumb(b,v,i,j+1,k+1);}

    if((i<dimensiune)&&(j>1)&&b[i][j]-1==b[i+1][j-1]){
                        v[k].i=i+1;
                        v[k].j=j-1;
                        afisare_drumb(b,v,i+1,j-1,k+1);}

    if((i<dimensiune)&&b[i][j]-1==b[i+1][j]){
                        v[k].i=i+1;
                        v[k].j=j;
                        afisare_drumb(b,v,i+1,j,k+1);}

    if((i<dimensiune)&&(j<dimensiune)&&b[i][j]-1==b[i+1][j+1]){
                        v[k].i=i+1;
                        v[k].j=j+1;
                        afisare_drumb(b,v,i+1,j+1,k+1);}

 //else printf("Nu exista drum");
}
}


void citire_suprafata(char a[20][20],int dimensiune)//citirea culorilor suprafetei de pe tastatura
{
 int i,j;

printf("\nCulorile patratelor:");
i=0;j=0;
for(i=1;i<=dimensiune;i++){
for(j=1;j<=dimensiune;j++){
    printf("\nPatratul %d,%d va avea culoarea:(Introduceti doar initiala culorilor:a,v,r,g)",i,j);
    scanf("\n%c",&a[i][j]);
}
    }}
void afisarea()//afiseaza matricea a
{ int i,j;
for(i=1;i<=dimensiune;i++)
{ printf("\n");
for(j=1;j<=dimensiune;j++)
printf("%c",a[i][j]);

}}
void afisareb()//afiseaza matricea b
{int i,j;
for(i=1;i<=dimensiune;i++)
{ printf("\n");
for(j=1;j<=dimensiune;j++)
printf("%5d",b[i][j]);
}}



int main()

{

char a[20][20];
printf("\nCare este dimensiunea suprafetei caroiate?(nxn) n=");
scanf("%d",&dimensiune);

citire_suprafata(a,dimensiune);
for(i=1;i<=dimensiune;i++){
for(j=1;j<=dimensiune;j++)
b[i][j]=1000;}
b[1][1]=0;

drum_minim(a[1][1],a,b,1,1,0);
printf("\n");
k=1;
//verifica daca exista drum. Daca exista apeleaza proc afisare_drum, daca nu afiseaza msj
if(b[dimensiune][dimensiune]==1000) printf("Nu exista drum");
else
afisare_drum(b,v,dimensiune,dimensiune,k);
afisareb();

getch();

for(i=1;i<=dimensiune;i++){
for(j=1;j<=dimensiune;j++)
b[i][j]=1000;}
b[1][dimensiune]=0;
drum_minim(a[1][dimensiune],a,b,1,dimensiune,0);
printf("\n");
k=1;
//verifica daca exista drum. Daca exista apeleaza proc afisare_drum, daca nu afiseaza msj
if(b[dimensiune][1]==1000) printf("Nu exista drum");
else
afisare_drumb(b,v,dimensiune,1,k);
afisareb();

return 0;

}
