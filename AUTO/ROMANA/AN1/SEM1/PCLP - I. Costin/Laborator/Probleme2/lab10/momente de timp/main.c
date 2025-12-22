#include<stdio.h>
#include<stdlib.h>

typedef struct time
{
	int ora;
	int minutul;
	int secunda;
}time;

void citire( time *t1, time *t2 )
{
	printf("primul timp: ");
	scanf("%d %d %d",&t1->ora,&t1->minutul,&t1->secunda);

	printf("al doilea timp: ");
	scanf("%d %d %d",&t2->ora,&t2->minutul,&t2->secunda);

}

void afisare( time t1, time t2 )
{
	printf("\nprimul timp: %d %d %d",t1.ora,t1.minutul,t1.secunda);
	printf("\nal doilea timp: %d %d %d",t2.ora,t2.minutul,t2.secunda);
}

void comparare( time t1, time t2 )
{
	if( t1.ora > t2.ora )
		printf("\nprimul moment de timp este mai mare");
	else
		if( t1.ora < t2.ora )
			printf("\nal doilea moment de timp este mai mare");
		else
			if( t1.ora == t2.ora )
				if( t1.minutul > t2.minutul)
					printf("\nprimul moment de timp este mai mare");
				else
					if( t1.minutul < t2.minutul )
						printf("\nal doilea moment de timp este mai mare");
					else
						if( t1.minutul == t2.minutul )
							if( t1.secunda > t2.secunda )
								printf("\nprimul moment de timp este mai mare");
							else
								if(t1.secunda < t2.secunda )
									printf("\nal doilea moment de timp este mai mare");
								else
									printf("\ncele doua momente de timp sunt egale");
}

int main ()
{
    time t1,t2;
	citire(&t1,&t2);
	afisare(t1,t2);
	comparare(t1,t2);
	return 0;
}
