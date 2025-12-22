#include <math.h>
#include <errno.h>
extern int errno;
double errcheck();
double Log(x)
	double x;
{
	return errcheck(log(x),"log");
}
double Log10(x)
	double x;
{
	return errcheck(log10(x),"log10");
}
double Exp(x)
	double x;
{
	return errcheck(exp(x),"exp");
}
double Sqrt(x)
	double x;
{
	return errcheck(sqrt(x),"sqrt");
}
double Pow(x,y)
	double x,y;
{
	return errcheck(pow(x,y),"exponentiere");
}
double integer(x)
	double x;
{
	return (double)(long) x;
}
double errcheck(d,s)   /* testeaza rezultatele */
	double d;
	char *s;
{
	void execerror();
	if(errno==EDOM){
		errno=0;
		execerror(s,"argument incorect");
	}else if (errno==ERANGE){
		errno=0;
		execerror(s,"rezultat cu depasire");
	}
	return d;
}
