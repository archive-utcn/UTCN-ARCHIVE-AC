/* 20. Sa se scrie un program pentru efectuarea operatiilor de adunare, scadere, înmultire si împartire
între doua polinoame:
A(x)=a0 +a1x1+......+ anxn
B(x)=b0 +b1x1+......+ bmxm
Gradele si coeficientii reali ai polinoamelor se citesc de pe mediul de intrare.*/
   #include <conio.h>
   #include <stdio.h>
   #define GRADMAX 20
      void impartire(int n, float a[],int m,float b[],
     int *grad_cat,float cat[], int *grad_rest, float rest[])
   {
      int i,j,k;
      if (n<m) {
                         *grad_cat=0;cat[0]=0.0;
	             *grad_rest=m;rest=cat;
	          }
    else {
               *grad_cat=n-m;*grad_rest=m-1;
	   for(i=n-m,j=n;i>=0;i--,j--)
	     {
                     cat[i]=a[j]/b[m];
	         for (k=m;k>=0;k--)
		a[i+k]=a[i+k]-cat[i]*b[k];
	         a[j]=0;
	      };
	    for(i=0;i<=m-1;i++)
	      rest[i]=a[i];
	  }
   }

   void produs(int n,float a[], int m,float b[],int *p,float c[])
   {
       int i,j;
     *p=n+m;
      for(i=0;i<=n+m;i++) c[i]=0.0;
      for(i=0;i<=n;i++)
       for(j=0;j<=m;j++)
	 c[i+j]+=a[i]*b[j];
   }

   void afis_polinom(int n,float a[],char c)
   {
     int i;
     printf("\n%c[x]=%g",c,a[0]);
     for(i=1;i<=n;i++)
       printf("+%g*x^%d",a[i],i);
     printf("\n");
   }

   int main()

   {
       int n,m,p,i;
       float a[GRADMAX+1],b[GRADMAX+1],s[GRADMAX+1],d[GRADMAX+1];


    printf("gradul primului polinom este ");
    scanf("%d",&n);
    printf("dati coeficientii primului polinom ");
    for(i=0;i<=n;i++)
    {
        printf("\n");
        scanf("%f",&a[i]);
    }
    printf("\n gradul celui de-al 2-lea polinom este ");
    scanf("%d",&m);
    for(i=0;i<=m;i++)
    {
        printf("\n");
        scanf("%f",&b[i]);
    }
    if(m<n)
    {
        p=n;
        for(i=0;i<=n;i++)
        s[i]=a[i];
        for(i=0;i<=m;i++)
        {
            d[i]=s[i]-b[i];  // calcularea diferentei
            s[i]=s[i]+b[i];  // calcularea sumei
        }
    }
    else
    {
        p=m;
        for(i=0;i<=m;i++)
        s[i]=b[i];
        for(i=0;i<=n;i++)
        {
            d[i]=s[i]-a[i];
            s[i]=s[i]+a[i];
        }
   }
    printf("Suma celor doua polinoame este \n");
    afis_polinom(p,s,'S');
    printf("\nDiferenta celor doua polinoame este ");
    afis_polinom(p,d,'D');
    produs(n,a,m,b,&p,s);
    printf("\n Produsul celor doua polinoame este ");
    afis_polinom(p,s,'P');
    impartire(n,a,m,b,&p,s,&i,d);
    printf("\n Catul si restul impartirii celor 2 polinoame este ");
    afis_polinom(p,s,'C');
    afis_polinom(i,d,'R');
    return(0);
   }
