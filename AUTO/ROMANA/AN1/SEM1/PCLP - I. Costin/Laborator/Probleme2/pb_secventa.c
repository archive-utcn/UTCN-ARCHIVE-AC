
main ()
 {
 int n,k,i,j,l,s;
 printf("n= ");
 scanf ("%d",&n);
 k= n/2+1;
 for (i=1;i<k;i++)
 {
   s=i;
   for (j=i+1;j<=k; j++)
   {
	 s=s+j;
	 if (s>=n)
	   break;
   }
   if (s==n)
   {
	 for (l=i;l<=j;l++)
	   printf ("%d ",l);
	 printf ("\n");
   }
  }
 }


