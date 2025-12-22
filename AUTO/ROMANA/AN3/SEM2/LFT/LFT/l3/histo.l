	int lung[99];
%%
[a-z]+	lung[yyleng]++;
.	|
\n	;
%%
yywrap()
{  
	int i ;
	printf("LUNGIME NR. CUVINTE\n");
	for(i=0;i<99;i++) if(lung[i]>0) printf(" %6d %7d\n",i,lung[i]);
	return(1);
}

