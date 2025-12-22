/*
//----------------------------------------------------------------------------
// PLI Programing Language Interface - (C) Copyright 2001 by Aldec, Inc.	 	 
// Project : PLI Wizard  v.1.0											 	 
// File    : veriuser_aldec.c      					         	
// veriusertfs table declaration						 				
//									         							 
// Date:  Jun 18 2003 
// Piotr Luszczak peter@aldec.com, Aldec, Inc. (C) 2003
//----------------------------------------------------------------------------
*/

//This file is automatically maintained and may be overwritten


#include "veriuser.h"          	 /*IEEE 1364 PLI TF routine library*/	 
#include "acc_user.h"          	 /*IEEE 1364 PLI ACC routine library*/	 
#include "aldecpli.h"


#ifdef _cplusplus
extern "C" {             /*//only need to export C interface if 
			               //used by C++ source code*/ 
#endif 


/* prototypes of the PLI application routines */ 

extern int oscil_c_pli_misctf ( int user_data, int reason, int paramvc  );
extern int oscil_c_pli_calltf ( int user_data, int reason  );

///*the veriusertfs table */

s_tfcell veriusertfs[] = {
	{usertask, 
	 0, 
	 0,		
	 0, 
	 oscil_c_pli_calltf,		
	 oscil_c_pli_misctf,		
	 "$oscil_c_pli"},
	{0}
};


#ifdef __cplusplus
}
#endif

