/*
//----------------------------------------------------------------------------
// VHPI  - (C) Copyright 2001 by Aldec, Inc.	 	 
// Project : VHPI Wizard  v.1.0											 	 
// File    : oscil_c_vhpi_vhpi.h
// User VHPI function header
//									         							 
// Date:  May 24 2002 													 
//----------------------------------------------------------------------------
*/

#ifndef __OSCIL_C_VHPI_VHPI_H__
#define __OSCIL_C_VHPI_VHPI_H__

#include <vhpi_user.h>
#include <veriuser.h>
#include <aldecpli.h> 

typedef struct  {
	int clock;
	int clear; 
	int clock_prev;
	int clear_prev; 
} INVECTOR;

typedef struct {
	int f0;
	int f1;
} OUTVECTOR;

PLI_VOID oscil_c_vhpi_proc(const struct vhpiCbDataS *cb_data_p);

#endif

