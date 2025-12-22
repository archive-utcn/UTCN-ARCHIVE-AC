

/*Un labirint este codificat printr-o matrice de m*n elemente , ale carui culoare sunt reprezentate
prin elemente egale cu 1, situate în pozitii consecutive, pe o aceeasi linie sau o aceeasi coloana.
Se cere afisarea tuturor traseelor de iesire din labirint, începând cu punctul initial (i,j), cu conditia
ca traseele sa nu treaca de mai multe ori prin acelasi loc.*/
#include <stdio.h>
#include <stdlib.h>
struct element
{int x,y;};
int valid(struct element *s,int k,int **v)
{int i;
if(v[s[k].x][s[k].y]==0) return 0;
for (i=0;i<k;i++)
if(s[i].x==s[k].x&&s[i].y==s[k].y) return 0;
return 1;
}
int solutie(struct element *s,int k,int n,int m)
{if (s[k].y==0||s[k].y==m||s[k].x==0||s[k].x==n) return 1;
return 0;
}
void print(int **a,int n,int m)
{int i,j;
for (i=0;i<n;i++)
{printf("\n");
for(j=0;j<m;j++)
if(a[i][j]=='x') printf("%c ",a[i][j]);
else printf("%d ",a[i][j]);
}
}
void afisare(struct element *s,int k,int n,int m)
{printf("\n");
int i,**b;
b=calloc(n,sizeof(int *));
if(b==NULL) {fprintf(stderr,"\nEroare la alocare de memorie");exit(1);}
for(i=0;i<n;i++)
{b[i]=calloc(m,sizeof(int));
if(b[i]==NULL) {fprintf(stderr,"\nEroare la alocare de memorie");exit(1);}
}
for(i=0;i<=k;i++)
if(i==0) b[s[i].x][s[i].y]='x';
else b[s[i].x][s[i].y]=i;
print(b,n,m);
for(i=0;i<n;i++)
free(b[i]);
free(b);
}
void labirint(int k,struct element *s,int **v,int n,int m,struct element *p)
{int i;
for (i=0;i<4;i++)
{s[k].x=s[k-1].x+p[i].x;
s[k].y=s[k-1].y+p[i].y;
if (valid(s,k,v)) {if(solutie(s,k,n,m)) afisare(s,k,n,m);
else labirint(k+1,s,v,n,m,p);
}
}
}
void citire(int **v,int *n,int *m)
{int i,j;
FILE *in;
in=fopen("matrice.txt","r");
if(in==NULL) {fprintf(stderr,"\nEroare la deschiderea fisierului");exit(1);}
for(i=0;i<*n;i++)
{v[i]=calloc(*m,sizeof(int));
if(v[i]==NULL) {fprintf(stderr,"\nEroare la alocare de memorie");exit(1);}
}
fscanf(in,"%d %d",&i,&j);
for(i=0;i<*n;i++)
for(j=0;j<*m;j++)
fscanf(in,"%d",&v[i][j]);
fclose(in);
print(v,*n,*m);
}
int main()
{int *n,*m,**v;
struct element *s,p[]={{-1,0},{0,1},{1,0},{0,-1}};
n=malloc(sizeof(int));
if(n==NULL) {fprintf(stderr,"\nEroare la alocare de memorie");exit(1);}
m=malloc(sizeof(int));
if(m==NULL) {fprintf(stderr,"\nEroare la alocare de memorie");exit(1);}
FILE *in;
in=fopen("matrice.txt","r");
if(in==NULL) {fprintf(stderr,"\nEroare la deschiderea fisierului");exit(1);}
fscanf(in,"%d %d",n,m);
v=calloc(*n,sizeof(int *));
if(v==NULL) {fprintf(stderr,"\nEroare la alocare de memorie");exit(1);}
s=calloc(*n**m,sizeof(struct element));
if(s==NULL) {fprintf(stderr,"\nEroare la alocare de memorie");exit(1);}
fclose(in);
citire(v,n,m);
citi:
{
printf("pozitia initiala:\nx=");
scanf("%d",&s[0].x);
printf("y=");
scanf("%d",&s[0].y);
}

if(v[s[0].x][s[0].y]==0) {printf("\n Pozitia introdusa este zid\n");goto citi;}
labirint(1,s,v,*n,*m,p);
getchar();
return 0;
}
