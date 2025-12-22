#include<stdio.h>
#include<conio.h>
#include<math.h>

float functie(float x)
{
	float y,z;
	y=sin(x);
	z=4*y-x+1;
	return z;
}

float solutie(float a,float b,float *functie(float))
{
	float x,fa,fx;
	double e;
	e=0.000000001;
	fa=functie(a);
	fx=functie(x);
	while(abs(a-b)>e)
	{
		x=((float)a+b)/2;
		if (fx==0){}
		else{
			if (fx*fa>0) a=x;
			else b=x;
		}
	}
	return x;
}

void main()
{
	float a,b;
	float sol;
	scanf("%d %d",&a,&b);
	sol=solutie(a,b,*functie(float));
	printf("\n %f",sol);
}
