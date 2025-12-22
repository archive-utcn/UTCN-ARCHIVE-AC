/ª                EVOL²       MATH.CPÐ           */

#include "evol.h"
#include <math.h>
#include <errno.h>

extern int errno;

double testarg(double,char *);

double Log(double x) { return testarg(log(x),"log"); }
double Log10(double x) { return testarg(log10(x),"log10"); }
double Exp(double x) { return testarg(exp(x), "exp"); }
double Sqrt(double x) { return testarg(sqrt(x), "sqrt"); }
double Pow(double x,double y) { return testarg(pow(x,y),"pow"); }
double integer(double x) {return (double)(long)x; }

double testarg(double d,char *s)
{
  if(errno == EDOM){
	errno=0;
	erexec(s,"argument eronat");
	}
  else if(errno == ERANGE){
	errno=0;
	erexec(s," depasire");
	}
  return d;
}

