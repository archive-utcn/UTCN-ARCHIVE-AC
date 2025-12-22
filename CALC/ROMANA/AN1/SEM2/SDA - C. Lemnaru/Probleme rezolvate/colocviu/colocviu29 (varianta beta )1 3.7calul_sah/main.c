#include <stdio.h>
#include <stdlib.h>
int a[100][100];
int n=6;

exista_mutare(int index, int k, int x[n][3], int *i, int *j)
{
    int i1=*i,j1=*j;

        switch (index)
        {// 0, 1 ,2 ./.. indexii
            case 0 : i1=(*i)-2; j1= (*j)-1;
                    break;
            case 1 : i1=(*i)-1; j1= (*j)-2;
                    break;
            case 2 : i1=(*i)+1; j1= (*j)-2;
                    break;
            case 3 : i1=(*i)+2; j1= (*j)-1;
                    break;
            case 4 : i1=(*i)+2; j1= (*j)+1;
                    break;
            case 5 : i1=(*i)+1; j1= (*j)+2;
                    break;
            case 6 : i1=(*i)-1; j1= (*j)+2;
                    break;
            case 7 : i1=(*i)-2; j1= (*j)+1;
                    break;
        }
    if (i1 >= 0 && i1<n && j1>=0 && j1<n && index<8)
        {
            int h=0;
            while ( h<=k )
            {
                if (x[h][0]== i1  && x[h][1] == j1)
                    {
                        return 0;// ocupata
                    }
                h++;
            }
            // pozitia libera
            *i=i1;
            *j=j1;
            return 1;
        }
    return 0;
}

void playsah()
{
    int k=1,v, index=0, i=0,j=0;
    int x[n*n][3];
    x[0][0]=0;x[0][1]=0;
    while (k>0)
    {
            v=0;

            //i= x[k][0];
            //j= x[k][1];
            while (v == 0 && index < 8)
            {
                    if (exista_mutare(index,k,x,&i,&j))
                    {
                        x[k][0]=i;
                        x[k][1]=j;
                        x[k][2]=index;
                        v=1;
                    }
                    index++;// urmatorul care trebuie calculat
            }
        if (v == 0)
        {
            k--;
            printf(" \n   ");
            index=x[k][2]+1;
            if (k>=1)
            {   i= x[k-1][0];
                j= x[k-1][1];    //la pasul inapoi! imi trebuie pozitia din care am ajuns aici. pt a schimba pozitia de aici
            }
        }else
        {
                        if (k+1==n*n)
                    {
                        printf("\n solutie");
                        int g=0;
                        for (g;g<n*n;g++)
                            printf ("\n%d   %d",x[g][0],x[g][1]);
                        k=0;
                    }
                    else
                    {
                        printf("\n%d   %d",x[k][0],x[k][1]);
                        k++;
                        x[k][0]=0;
                        x[k][1]=0;
                        x[k][2]=0;

                        index=0;
                    }
        }
    }

}

int main()
{
    //citire_tabla();
    //afisare_tabla(a,n);
    playsah();
    return 0;
}
