/*
//----------------------------------------------------------------------------
// PLI Programing Language Interface - (C) Copyright 2001 by Aldec, Inc.	  
// Project : PLI Wizard  v.1.0						                          
// File    : oscil_c_pli.c
// oscil_c_pli module description				              
//									                                          
// Date:  Jun 18 2003 
// Piotr Luszczak peter@aldec.com, Aldec, Inc. (C) 2003
//----------------------------------------------------------------------------
*/
#include <stdio.h>
#include <stdlib.h>

#include "interface.h"
	
#include "veriuser.h"         /* IEEE 1364 PLI TF  routine library */   
#include "acc_user.h"         /* IEEE 1364 PLI ACC routine library */  

INVEC_DATA  invec_data;
OUTVEC_DATA	outvec_data;	  

unsigned long Q;

/**********************************************************************
 * User function	
 *********************************************************************/
 
int oscil_interface_misctf ( void  )
{  													  

 if ((invec_data.clock_prev == 0 && invec_data.clock == 1) || (invec_data.clock_prev == 1 && invec_data.clock == 0))
 {
  io_printf("***********************************\n");
  io_printf("Simulation time :  %d\n",tf_gettime());
  io_printf("Module : OSCIL : Read inputs\n"); 
  io_printf("Port CLK=%d Port CLR=%d\n", invec_data.clock, invec_data.clear);
 
  //CLK'event and CLK = '1'
  if (invec_data.clock_prev == 0 && invec_data.clock == 1)
  {	
    io_printf("CLK - Rising edge occured _|¯\n");
    if (!invec_data.clear)
	 Q = Q + 1;
  }
  else
  //CLK'event and CLK = '0'
  if (invec_data.clock_prev == 1 && invec_data.clock == 0)
  {	 
     io_printf("CLK - Falling edge occured ¯|_\n");
     if (!invec_data.clear)
	  Q = Q + 1;
  }
  switch (Q) 
  {
   case 3 :  outvec_data.f0 = 1;
    break; 
   case 4 :  outvec_data.f0 = 0;
    break; 				 
   case 7 :	 outvec_data.f1 = 1;
    break; 
   case 8 :	 outvec_data.f1 = 0; Q = 0;
    break; 
   default :
    break; 
  }	
 
  invec_data.clock_prev = invec_data.clock;
  invec_data.clear_prev = invec_data.clear;									 
  
  io_printf("Module : OSCIL : Update outputs\n"); 
  io_printf("Port F0=%d Port F1=%d\n", outvec_data.f0, outvec_data.f1);
  io_printf("***********************************\n");
 } 

}

/**********************************************************************
 * Misctf routine	
 *********************************************************************/
int oscil_c_pli_misctf ( int user_data, int reason, int paramvc  )
{
// -- Enter your statements here -- //	 

 if (reason == REASON_ENDOFCOMPILE)
 {
    io_printf("**********************************************************************\n");
    io_printf("* Active-HDL - SystemC/VHDL/Verilog/EDIF/C/C++ interface initialized *\n");
	io_printf("* ------------------------PLI VERSION------------------------------- *\n");
    io_printf("**********************************************************************\n");

    invec_data.clock = tf_getp(1);
    invec_data.clear = tf_getp(2);
	invec_data.clock_prev = invec_data.clock;
    invec_data.clear_prev = invec_data.clear;
	Q = 0;
  }
   
  if (reason != REASON_PARAMVC)
    return(0);

  invec_data.clock = tf_getp(1);
  invec_data.clear = tf_getp(2);
  
  oscil_interface_misctf();	 
    
  tf_putp(3, outvec_data.f0);
  tf_putp(4, outvec_data.f1);

  return (0);
}

/**********************************************************************
 * Calltf routine	
 *********************************************************************/
int oscil_c_pli_calltf ( int user_data, int reason  )
{
 tf_asynchon();	
}

/*********************************************************************/