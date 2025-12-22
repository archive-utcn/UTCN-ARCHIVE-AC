//----------------------------------------------------------------------------
// VHPI Language Interface - (C) Copyright 2001 by Aldec, Inc.	 	 
// Project : VHPI Wizard  v.1.0											 	 
// File    : vhpiuser_aldec.c      					         	
// VHPI function declaration						 				
//									         							 
// Date:  Jun 18 2003 
// Piotr Luszczak peter@aldec.com, Aldec, Inc. (C) 2003
//----------------------------------------------------------------------------

//This file is automatically maintained and may be overwritten


//==================================================================
#include <vhpi_user.h>
#include <veriuser.h>
#include <aldecpli.h>

#include "oscil_c_vhpi.h"
//==================================================================

#ifdef WIN32
__declspec ( dllexport )
#endif

PLI_VOID startup_1()
{
 int i;
 static vhpiForeignDataT foreignDataArray[] = {
			{vhpiArchFK, "vhpiuser_aldec", "oscil_c_vhpi_model",0, oscil_c_vhpi_proc},
			{(vhpiForeignT) 0}
		};

		// tasks registration
		for (i = 0; i < ( sizeof(foreignDataArray) / sizeof(foreignDataArray[0]) ) - 1 ;  i++)
			vhpi_register_foreignf(&(foreignDataArray[i]));
}
#ifdef __cplusplus
extern "C" {
#endif

#ifdef WIN32
__declspec ( dllexport )
#endif

/*//////////////////////////////////////////////////////////////////
		VHPI_tfs
//////////////////////////////////////////////////////////////////*/
// table of functions to register vhpi tasks
PLI_VOID
(*vhpi_startup_routines[])() = { startup_1, 0};


#ifdef __cplusplus
}
#endif
//==================================================================
