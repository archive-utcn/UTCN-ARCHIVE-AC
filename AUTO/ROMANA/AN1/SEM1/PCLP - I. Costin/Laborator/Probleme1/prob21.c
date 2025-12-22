/* 21. O matrice patrata cu elemente reale este împartita de diagonalele sale în patru zone. Se considera
ca elementele situate pe diagonale nu apartin nici unei zone. Sa se scrie un program care
calculeaza media aritmetica a elementelor fiecarei zone.*/
   #include<stdio.h>

   int main()
   {
       int n,i,j,x;
       float a[20][20],s;

    printf("dati dimensiunea matricei \n");
    scanf("%d",&n);
    for(i=0;i<n;i++)
        for(j=0;j<n;j++)
        {
            printf("a[%d][%d]=",i+1,j+1);
            scanf("%f",&a[i][j]);
        }
    x=0;s=0;
    for(i=0;i<=n/2;i++)
        for(j=i+1;j<n-i-1;j++)
        {
            s=s+a[i][j];
            x++;
        }

    printf("media aritmetica a elementelor de deasupra celor doua diagonale este %4.2f",s/x);
    x=0;s=0;
    for(i=n/2+1;i<n;i++)
        for(j=n-i;j<=i-1;j++)
        {
            s=s+a[i][j];
            x++;
        }
    printf("\nmedia aritmetica a elementelor de sub cele doua diagonale este %4.2f",s/x);
    s=0;x=0;
    for(i=0;i<=n/2;i++)
        for(j=i+1;j<n-i-1;j++)
        {
            s=s+a[j][i];
            x++;
        }
    printf("\nmedia aritmetica a elementelor din stanga diagonalelor este %4.2f",s/x);
    x=0;s=0;
    for(i=n/2+1;i<n;i++)
        for(j=n-i;j<=i-1;j++)
        {
            s=s+a[j][i];
            x++;
        }
    printf("\nmedia aritmetica a elementelor din dreapta diagonalelor este %4.2f",s/x);
    return(0);
   }
