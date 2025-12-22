/*#include <stdio.h>
#include <conio.h>
main()
{
    int n,m,i,j,k,a[100][100],c;
    printf("Numarul de linii= ");
    scanf("%d",&n);
    printf("\nNumarul de coloane= ");
    scanf("%d",&m);
    for(i=0; i<n; i++)
        for(j=0; j<m; j++)
        {
            printf("a[%d] [%d]= ",i,j);
            scanf("%d",&a[i][j]);
        }
    for(i=0; i<n; i++)
    {
        for(j=0; j<m; j++)
            printf("%d ",a[i][j]);
        printf("\n");
    }
    k=0;
    while((k<m)||(k<n))
    {
        for(j=k; j<m; j++)

            printf("%d ",a[k][j]);

        for(i=k+1; i<n; i++)
            printf("%d ",a[i][m-1]);

        for(j=m-2; j>=k; j--)
            printf("%d ",a[n-1][j]);

        for(i=n-2; i>k; i--)
            printf("%d ",a[i][k]);

        k++;
        n--;
        m--;
    }
    getch();
}*/
