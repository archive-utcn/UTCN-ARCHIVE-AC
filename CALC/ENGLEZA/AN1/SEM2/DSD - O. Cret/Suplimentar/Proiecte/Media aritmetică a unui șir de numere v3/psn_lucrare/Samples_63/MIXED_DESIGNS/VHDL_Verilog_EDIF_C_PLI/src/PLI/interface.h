//----------------------------------------------------------------------------
// PLI Programing Language Interface - (C) Copyright 2001 by Aldec, Inc.	  
// Project : PLI Wizard  v.1.0						                          
// File    : interface.h
// User PLI function header
//									                                          
// Date:  Jun 18 2003 
//----------------------------------------------------------------------------

typedef struct  {
	unsigned long	clock;
	unsigned long	clear; 
	unsigned long	clock_prev;
	unsigned long	clear_prev; 
} INVEC_DATA;

typedef struct {
	unsigned long	f0;
	unsigned long	f1;
} OUTVEC_DATA;


