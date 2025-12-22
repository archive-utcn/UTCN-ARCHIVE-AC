/* 23. Se da un sir de n elemente reale ordonate crescator. Sa se verifice daca o valoare citita x se
gaseste în sir si sa se indice pozitia sa.*/
   #include<stdio.h>

   int main()
   {
       int n,i,y=0;
       float a[50],x;
       printf("nr de elemente ale sirului este ");
       scanf("%d",&n);
       for(i=1;i<=n;i++)
       {
           printf("a[%d]=",i);
           scanf("%f",&a[i]);
       }
       printf("numarul cautat este ");
       scanf("%f",&x);
       for(i=1;i<=n;i++)
       {
           if(a[i]==x)
           printf("\nvaloarea %4.2f este gasita pe pozitia %d",x,i);
           y=1;
       }
       if(y==0)
    printf("valoarea %4.2f nu a fost gasita in sir ",x);
    return(0);
   }
