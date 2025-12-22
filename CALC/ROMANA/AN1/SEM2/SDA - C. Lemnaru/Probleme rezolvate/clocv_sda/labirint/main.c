/*30. Un labirint este codificat printr-o matrice de n ×m elemente ale carui culoare sunt reprezentate prin
elemente egale cu 1, situate în pozitii consecutive pe o aceeasi linie sau coloana, celelalte elemente fiind
0. O persoana se gaseste în pozitia (i, j) din interiorul labirintului. Se cere afisarea tuturor traseelor de
iesire din labirint care nu trec de mai multe ori prin acelasi loc.*/
#include <stdio.h>
#include <stdlib.h>

int a[100][100], n,m;
void citire ()
{
    FILE *f;
    int i,j;
    f= fopen ("labirint.txt","r");
    if (f== 0)
    printf("\n NULLLL ");
    else
    {
        fscanf (f,"%d %d",&n,&m);
        for (i=0;i<n;i++)
         {
                for (j=0;j<n;j++)
              {
                    fscanf (f,"%d",&a[i][j]);
                    printf("%d ",a[i][j]);
              }
              printf("\n");
         }
    }
}

void nerec (int pos1, int pos2)
{
    int index[n*n],x[n*n][2],i,k,v, nr_sol=0;
    for(i=0;i<n*n;i++) index[i]=-1;
    x[0][0]=pos1;
    x[0][1]=pos2;
    a[pos1][pos2]=2;
    k=1;
    x[1][0]=n;
    x[1][1]=n;
    while (k>0)
    {
        v=0;
        int exista=1;
        while (v==0 && exista==1)
        {
                // exista val neselectata
                index[k]++;
                a[x[k][0]][x[k][1]]=1;
                int c1,c2;
                switch (index[k])
                {
                    case 0 : c1= x[k-1][0];
                             c2= x[k-1][1]-1;
                             if (c1>=0 && c2>=0)
                                if (a[c1][c2]==1)
                                    {
                                        x[k][0]=c1;
                                        x[k][1]=c2;
                                        a[c1][c2]=2;// luat
                                        v=1;
                                    }
                            break;
                    case 1 : c1= x[k-1][0]+1;
                             c2= x[k-1][1];
                             if (c1>=0 && c2>=0)
                                if (a[c1][c2]==1)
                                    {
                                        x[k][0]=c1;
                                        x[k][1]=c2;
                                        a[c1][c2]=2;// luat
                                        v=1;
                                    }
                            break;

                    case 2 : c1= x[k-1][0];
                             c2= x[k-1][1]+1;
                             if (c1>=0 && c2>=0)
                                if (a[c1][c2]==1)
                                    {
                                        x[k][0]=c1;
                                        x[k][1]=c2;
                                        a[c1][c2]=2;// luat
                                        v=1;
                                    }
                            break;
                    case 3 : c1= x[k-1][0]-1;
                             c2= x[k-1][1];
                             if (c1>=0 && c2>=0)
                                if (a[c1][c2]==1)
                                    {
                                        x[k][0]=c1;
                                        x[k][1]=c2;
                                        a[c1][c2]=2;// luat
                                        v=1;
                                    }
                            break;
                    default : exista=0;
                              break;
                }
        }
        if  (v==0)
            {
                a[x[k][0]][x[k][1]]=1;
                k--;

            }
        else if (x[k][0]== 0 || x[k][0]== n-1 ||x[k][1]== 0 ||x[k][1]== n-1)
                {
                    nr_sol++;
                    printf("\nSolutie %d\n",nr_sol);
                    int h;
                    for (h=0;h<=k; h++)
                        printf (" (%d, %d)  ",x[h][0],x[h][1] );
                }
            else {
                k++;
                index[k]=-1;
                x[k][0]=n; // coord din afara matricii
                x[k][1]=n; //
                }
    }
    if (nr_sol==0) printf("\nEsti blocat");

}

int main()
{
    int pos1,pos2;
    citire();
    printf("\nPozitia din care vrei sa scapi (x,y): ");
    scanf("%d %d",&pos1,&pos2);
    nerec(pos1,pos2);
    return 0;
}
