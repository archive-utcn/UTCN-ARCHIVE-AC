/*
//----------------------------------------------------------------------------
// VHPI - (C) Copyright 2004 by Aldec, Inc.
// Project : VHPI Wizard  v.2.0
// File    : vhpiuser_aldec.cpp
// VHPI function registration
// 
// Date:  August 26, 2004
//----------------------------------------------------------------------------
*/

//This file is automatically maintained and may be overwritten


//==================================================================
#include "generator_vhpi.h"
#include <vhpi_user.h>
#include <aldecpli.h>
//==================================================================

#ifdef WIN32
__declspec ( dllexport )
#endif

PLI_VOID startup_1()
{
 unsigned int i;
 static vhpiForeignDataT foreignDataArray[] = {
			{vhpiArchFK,"modulator_vhpi.dll", "generator_model", generator_elab, generator_exec},
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
