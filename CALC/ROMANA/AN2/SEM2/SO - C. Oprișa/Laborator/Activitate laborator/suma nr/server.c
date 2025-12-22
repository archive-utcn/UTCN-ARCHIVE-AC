
#include <unistd.h>
#include <sys/types.h>
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <string.h>

int main(int argc, char **argv) 
{
	int op1;
	int op2;
	int rez;
	char operator;
	sscanf(argv[1],"%d",&op1);
	sscanf(argv[2],"%d",&op2);
	operator = argv[3][0];
	//printf("Operandul este %d %c %d\n",op1,operator,op2);
	if (operator == '+')
	{
		rez = op1 + op2;
	}
	else if (operator == '-')
	{
		rez = op1 - op2;
	}
	//printf("Rezultatul ete %d\n", rez);
	exit(rez);
		
}
