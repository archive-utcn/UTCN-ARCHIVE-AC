#include<stdio.h>
#define LIMIT 100001

int n,a[LIMIT],b[LIMIT],maxi;
FILE * out;
void read();
void write();
void scmax();
int recurs(int maxi,int q);

int main()
{
    read();
    maxi = 1;
    b[1] = 1;
    scmax();
    write();

return 0;

}
void read()
{
    FILE * pFile;
    int i;

    pFile = fopen ("CALEA CATRE FISIERUL VOSTRU IN","r+");
    fscanf (pFile, "%d", &n);
    for( i = 1; i <= n; i++)
     fscanf (pFile, "%d", &a[i]);

    fclose (pFile);
}

void write()
{
    out = fopen ("CALEA CATRE FISIERUL VOSTRU OUT","w+");
    fprintf(out,"%d",maxi);
    //TO Do
    //decomentati linia de mai jos pentru a afisa recursiv sirul
   // recurs(maxi,n);
    fclose(out);
}
void scmax()
{
    //TO DO...
    //YOUR CODE GOES HERE
}

int recurs(int maxi,int q){
     if(q == 0)return 0;
     else
     if(b[q] == maxi)
     {
             recurs(maxi-1,q-1);
             fprintf (out, "%d",a[q]);
     }
     else recurs(maxi,q-1);
}
