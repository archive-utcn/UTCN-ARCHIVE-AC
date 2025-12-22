/*52. Se considera un set de N întrebari, fiecare având un punctaj Pi. Sa se genereze toate chestionarele
continând un numar de întrebari între A si B si având un punctaj total între C si D.*/
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
int a,b,c,d;
int x[100],v[100],n,nr,z;
char t[100][240];
void citire()
{
	printf("Cate intrebari doresti sa introduci? ( numar strict pozitiv )\n");
	scanf("%d",&n);
	while(n<1)
	{
        printf("Numarul de intrebari trebuie sa fie strict pozitiv. Mai incearca.\n");
        scanf("%d",&n);
	}
	printf("Introdu punctajul celor %d intrebari. (numere pozitive)\n",n);
	int i;
	for(i=1;i<=n;i++)
	{
		scanf("%d",&v[i]);
		while(v[i]<0)
        {
                printf("Punctajul intrebarii %d este negativ. Introdu un numar corect.\n",i);
                scanf("%d",&v[i]);
        }
	}
}
void citire2()
{
    FILE *f;
    int m;
    f = fopen("intrebari.txt","r");
    char s[240];
    while(fgets(s,240,f))
    {
        n++;
        strcpy(t[n],s);
        m=strlen(s)+1;
        while(t[n][m]>'9' || t[n][m]<'0')
            m--;
        v[n]=0;
        while(t[n][m]<='9' && t[n][m]>='0')
        {
            v[n]=v[n]*10+(t[n][m]-'0');
            t[n][m]=' ';
            m--;
        }
    }
}
void afisare(int k)
{
	int i;
	z++;
	if(z==1)
        printf("Chestionarele cu numar de intrebari intre %d si %d si cu punctaje intre %d si %d sunt urmatoarele:\n",a,b,c,d);
	printf("%d.) %d",nr,v[x[1]]);
	for(i=2;i<=k;i++)
		printf(", %d",v[x[i]]);
	printf(".\n");
	nr++;
}
void afisare2(int k)
{
	int i;
	z++;
	if(z==1)
        printf("Chestionarele cu numar de intrebari intre %d si %d si cu punctaje intre %d si %d sunt urmatoarele:\n",a,b,c,d);
	printf("%d.) %s",nr,t[x[1]]);
	for(i=2;i<=k;i++)
		printf("\n%s",t[x[i]]);
	printf("\n\n");
	nr++;
}
int cond(int k)
{
	if(k < a || k > b)
		return 0;
	int i,j,s=0;
	for(i=1;i<=k;i++)
		s=s+v[x[i]];
	if(s < c || s > d)
		return 0;
	for(i=1;i<k;i++)
		for(j=i+1;j<=k;j++)
			if(x[i] == x[j])
				return 0;
	for(i=1;i<k;i++)
			if(x[i]>x[i+1])
				return 0;
	return 1;
}
void back(int k)
{
    int i;
    for(i=1;i<=n;i++)
    {
		x[k] = i;
		if(cond(k) == 1)
		{
			afisare2(k);
			printf("\n");
			back(k + 1);
		}
		else
			if(k<b)
				back(k + 1);
    }
}
void rezolvare()
{
	printf("Introdu a si b ca fiind intervalul pentru numarul de intrebari din chestionar.( a < b <= %d)\n",n);
	scanf("%d %d",&a,&b);
	while(!(a>=0 && b>0 && a<b && b<=n))
	{
            if(a<0 || b<0)
                printf("a si b trebuie sa fie pozitive. Incearca din nou.\n");
            if(a>=b)
                printf("a trebuie sa fie mai mic decat b. Incearca din nou.\n");
            if(b>n)
                printf("b trebuie sa fie mai mic decat %d. Incearca din nou.\n",n);
            scanf("%d %d",&a,&b);
    }
	printf("Introdu c si d ca fiind intervalul pentru punctajul intrebarilor din chestionar. ( c < d )\n");
	scanf("%d %d",&c,&d);
	while(!(c>=0 && d>0 && c<d))
	{
            if(c<0 || d<0)
                printf("c si d trebuie sa fie pozitive. Incearca din nou.\n");
            if(c>=d)
                printf("c trebuie sa fie mai mic decat d. Incearca din nou.\n");
            scanf("%d %d",&c,&d);
    }
	nr=1;
	back(1);
	if(z==0)
        printf("Nu exista chestionare cu numar de intrebari intre %d si %d si cu punctaje intre %d si %d.\n",a,b,c,d);
}
int main()
{
	citire2();
	rezolvare();
	return 0;
}
