#include "simprims.h"


void DFF::Register()
{
	if(sc_logic(CLR) == '0')
	{
		#ifdef DEBUG
		printf("CLK rising edge for DFF\n");		
		#endif
		if(sc_logic(CE) == '1')
		{
			#ifdef DEBUG
			printf("CE active\n");
			#endif
			Q = D;
		}
		else {
			#ifdef DEBUG
			printf("CE inactive\n");
			#endif
		}
	}
	else {
		#ifdef DEBUG
		printf("CLR active - reseting\n");
		#endif
		Q = sc_logic('0');
	}
}

void INV::Assign()
{
	Y = ~sc_logic(A);
}

void AND2::Assign()
{
	Y = sc_logic(A) & sc_logic(B);
}

void NAND2::Assign()
{
	Y = ~(sc_logic(A) & sc_logic(B));
}

void NAND3::Assign()
{
	Y = ~(sc_logic(A) & sc_logic(B) & sc_logic(C));
}

void OR2::Assign()
{
	Y = sc_logic(A) | sc_logic(B);
}

void NOR2::Assign()
{
	Y = ~(sc_logic(A) | sc_logic(B));
}

void BUFT::Assign()
{
	if(sc_logic(T) =='1')	
		Y = A;
	else
		Y = sc_logic('Z');
}
