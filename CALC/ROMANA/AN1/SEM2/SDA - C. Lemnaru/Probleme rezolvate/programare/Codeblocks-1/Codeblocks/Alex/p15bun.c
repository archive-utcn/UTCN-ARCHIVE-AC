/*3.4. Să se scrie un program pentru generarea tuturor numerelor prime
 mai mici sau egale cu un număr natural n.
*/
#include <stdio.h>
#include <stdlib.h>
#include<conio.h>

int main()
{int n,i,j,nr;
scanf("%d",&n);
for(i=2;i<=n;i++)
        {nr=0;
             for(j=2;j<=i;j++)
                    if(i%j==0)
                        nr++;
            if(nr==1)
                printf("%d ",i);
        }
    getch();
    return 0;
}
