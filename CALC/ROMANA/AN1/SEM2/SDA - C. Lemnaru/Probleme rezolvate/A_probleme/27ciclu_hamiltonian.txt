#include <stdio.h>
#include <stdlib.h>

int a[100][100],n;

void citire ()
{
    FILE *f;
    int i,j;
    f= fopen ("C:\\Users\\ady\\Desktop\\documente cu de toate pt scoala\\an 1 sem 2 2009\\SDA Ignat\\backtr_hamiltonian_3.5\\graf.txt","r");
    if (f== 0) printf("\n NULLLL ");
    else
    {
        fscanf(f,"%d",&n);
        for (i=0;i<n;i++)
            for (j=0;j<n;j++)
                fscanf(f,"%d", &a[i][j]);
    }
}

int exista_varf (int k, int*x, int * alfa, int * luat)
{
    int i;
    // caut legatura la nod x[k-1]

    for (i=x[k]+1;i<n;i++)
        //if (k!=n)
            if (a[x[k-1]][i]!=0 && luat [i]==0)
            {
                luat[x[k]]=0;
                *alfa=i;
                return 1;
            }
        //else if (a[x[k-1]][0]!=0)
          //  {
            //    *alfa=0;
              //  return 1;
            //}
    return 0;
}
void back ()
{
    int x[n+1],luat[n],v,k,alfa,i, min_cost=0x7fff;
    for (i=0;i<n;i++) {luat [i]=0; x[i]=0;}
    x[0] = 0;
    luat[0] = 1;
    k = 1;
    while (k>0)
    {
        v=0;
        while (v==0 && exista_varf(k,x,&alfa, luat))
        {
            x[k] = alfa;// vf care a fost ales;
            luat[alfa] = 1;
            v=1;
            int h;
                    for(h=0;h<n; h++)
                        printf("%d",luat[h]);
        }
        if (v == 0)
        {
            luat[ x[k] ] = 0;
            k--;
        }
        else if (k == n-1)
                {
                    printf("\n solution!!");
                    int h,cost=0;
                    if (a[x[k]][0]!=0)
                        {
                        printf("\n\ncilcu hamiltonian! se adauga si nodul 0 la sfarditul solutiei");
                        x[n]=0;
                        for(h=0;h<n; h++)
                                cost = cost + a[x[h]][x[h+1]];

                        if (cost<min_cost)
                            {
                            min_cost=cost;
                            printf("\nun nou minim de cost %d\n", min_cost);
                            }
                        }
                    for(h=0;h<n; h++)
                    {
                        printf("%d",x[h]);
                    }

                    printf("\n");

                }
             else {
                k++;
                x[k] = 0;

             }
    }

}

int main()
{
    citire();
    printf("citit");
    back();
    printf("\n");
    return 0;
}
