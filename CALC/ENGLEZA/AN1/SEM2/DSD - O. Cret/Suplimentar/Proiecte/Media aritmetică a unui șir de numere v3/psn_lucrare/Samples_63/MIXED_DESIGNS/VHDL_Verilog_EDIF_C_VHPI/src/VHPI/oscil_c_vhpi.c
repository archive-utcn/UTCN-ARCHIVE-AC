//----------------------------------------------------------------------------
// VHPI Language Interface - (C) Copyright 2001 by Aldec, Inc.	 	 
// Project : VHPI Wizard  v.1.0											 	 
// File    : oscil_c_vhpi.c      					         	
// oscil_c_vhpi model description
//									         							 
// Date:  Jun 18 2003 
// Piotr Luszczak peter@aldec.com, Aldec, Inc. (C) 2003
//----------------------------------------------------------------------------

#include "oscil_c_vhpi.h" 

INVEC_DATA  invec_data;
OUTVEC_DATA outvec_data;	  

unsigned long Q;
unsigned long registration;

//----------------------------------------------------------------------------
// Callback for signal value changing event									  
//---------------------------------------------------------------------------- 
PLI_VOID SignalChangedEvent (const struct vhpiCbDataS * cbDatap)
{ 
 int signalValue = 0;	
 
 vhpiHandleT SigHdl; 
 vhpiValueT  *value;
 
 value = (vhpiValueT*) malloc(sizeof(vhpiValueT));
 value->format = vhpiEnumVal; 
 
  
 if (cbDatap->obj){
		// display information about current signal
		vhpi_printf("E V E N T : signal %s has value %c at time : %u",
				vhpi_get_str(vhpiNameP,cbDatap->obj), 
				cbDatap->value->value.ch,
				cbDatap->time->low);
				
 if(cbDatap->value->value.ch == '1')
  signalValue = 0;
 else	
  signalValue = 1;
				
 if(!strcmp(vhpi_get_str(vhpiNameP,cbDatap->obj),"CLK"))
 {
  invec_data.clock = signalValue;
   vhpi_printf("invec_data.clock = %d\n", signalValue);
 }
 else 
 {
 signalValue = !signalValue;
  vhpi_printf("invec_data.clear = %d\n", signalValue);
  invec_data.clear = signalValue;
 }
 				
 //-------------------------------------------------------------------------
 if ((invec_data.clock_prev == 0 && invec_data.clock == 1) || (invec_data.clock_prev == 1 && invec_data.clock == 0))
 {
  vhpi_printf("***********************************");
  vhpi_printf("Simulation time :  %u",cbDatap->time->low);
  vhpi_printf("Module : OSCIL : Read inputs"); 
  vhpi_printf("Port CLK=%d Port CLR=%d", invec_data.clock, invec_data.clear);
 vhpi_printf("Current Q %d\n", Q);
  //CLK'event and CLK = '1'
  if (invec_data.clock_prev == 0 && invec_data.clock == 1)
  {	
    vhpi_printf("CLK - Rising edge occured _|¯");
    if (!invec_data.clear)
	 Q = Q + 1;
  }
  else
  //CLK'event and CLK = '0'
  if (invec_data.clock_prev == 1 && invec_data.clock == 0)
  {	 
     vhpi_printf("CLK - Falling edge occured ¯|_");
     if (!invec_data.clear)
	  Q = Q + 1;
  }
  vhpi_printf("Current Q %d\n", Q);
  switch (Q) 
  {
   case 3 :  outvec_data.f0 = 1; 
             value->value.enumv = 3;
			 if(SigHdl = vhpi_handle_by_name(":UUT:U1:F0",0))
			 {
  		      if(vhpi_put_value(SigHdl,value,vhpiForcePropagate))
			   vhpi_printf("E R R O R : Cannot update F0 port");
			 } 
			 else
			  vhpi_printf("E R R O R : Cannot get handler for F0 port");
    		 break; 
   case 4 :  outvec_data.f0 = 0;
             value->value.enumv = 2;
			 if(SigHdl = vhpi_handle_by_name(":UUT:U1:F0",0))
			 {
  		      if(vhpi_put_value(SigHdl,value,vhpiForcePropagate))
			   vhpi_printf("E R R O R : Cannot update F0 port");
			 } 
			 else
			  vhpi_printf("E R R O R : Cannot get handler for F0 port");
    	     break; 				 
   case 7 :	 outvec_data.f1 = 1;
             value->value.enumv = 3;
			 if(SigHdl = vhpi_handle_by_name(":UUT:U1:F1",0))
			 {
  		      if(vhpi_put_value(SigHdl,value,vhpiForcePropagate))
			   vhpi_printf("E R R O R : Cannot update F1 port");
			 } 
			 else
			  vhpi_printf("E R R O R : Cannot get handler for F1 port");
    	     break; 
   case 8 :	 outvec_data.f1 = 0;
             value->value.enumv = 2;   
			 if(SigHdl = vhpi_handle_by_name(":UUT:U1:F1",0))
			 {
  		      if(vhpi_put_value(SigHdl,value,vhpiForcePropagate))
			   vhpi_printf("E R R O R : Cannot update F1 port");
			 } 
			 else
			  vhpi_printf("E R R O R : Cannot get handler for F1 port");
			 Q = 0;
    	     break; 
   default :
    	     break; 
  }	
 
  invec_data.clock_prev = invec_data.clock;
  invec_data.clear_prev = invec_data.clear;									 
    
  vhpi_printf("Module : OSCIL : Update outputs"); 
  vhpi_printf("Port F0=%d Port F1=%d", outvec_data.f0, outvec_data.f1);
  vhpi_printf("***********************************");
 } 
 //-------------------------------------------------------------------
 }
}

PLI_VOID oscil_c_vhpi_proc(const struct vhpiCbDataS *cb_data_p)
{
	vhpiCbDataT		cbDataAction;
	vhpiHandleT		SigHdl; 
	vhpiHandleT		CallbackHdl;
	vhpiValueT		value;
	vhpiTimeT		time;
	
	vhpiValueT  *initValue;
	
	vhpi_printf( "Registering signals CLK & CLR for event changes");
	vhpi_printf( "invec_data.clear = %d\n", invec_data.clear);
	vhpi_printf( "invec_data.clock = %d\n", invec_data.clock);
	//Entity: oscil_c_vhpi
	//port CLK	: in STD_LOGIC;
	//port CLR	: in STD_LOGIC;
	//port F0	: out STD_LOGIC;
	//port F1	: out STD_LOGIC;
		
	value.format			= vhpiCharVal;		 //signals are BIT
	cbDataAction.value		= &value;
	cbDataAction.reason		= vhpiCbValueChange; //on signal value change event
	cbDataAction.time		= &time;				
	cbDataAction.cb_rtn		= SignalChangedEvent;
	
	//get signal by name
	if ( SigHdl = vhpi_handle_by_name(":UUT:U1:CLK",0) )
	{
		cbDataAction.obj = SigHdl; //connect callback to the signal

		//register 
		if (CallbackHdl = vhpi_register_cb(&cbDataAction, vhpiReturnCb))
		{
			vhpi_printf("callback on signal %s registered ",vhpi_get_str(vhpiNameP,SigHdl));
			registration = 1;
		}
		else
		{
			vhpi_printf("callback on signal %s NOT registered ",vhpi_get_str(vhpiNameP,SigHdl));
			registration = 0;
		}
	}			

	//get signal by name 
	if ( SigHdl = vhpi_handle_by_name(":UUT:U1:CLR",0) )
	{
		cbDataAction.obj = SigHdl; //connect callback to the signal

		//register 
		if (CallbackHdl = vhpi_register_cb(&cbDataAction, vhpiReturnCb))
		{
			vhpi_printf("callback on signal %s registered ",vhpi_get_str(vhpiNameP,SigHdl));
			registration = 1;
		}
		else
		{
			vhpi_printf("callback on signal %s NOT registered ",vhpi_get_str(vhpiNameP,SigHdl));
			registration = 0;
		}
	}
	
	if(registration)
	{
     vhpi_printf("**********************************************************************");
     vhpi_printf("* Active-HDL - SystemC/VHDL/Verilog/EDIF/C/C++ interface initialized *");
	 vhpi_printf("* -----------------------VHPI VERSION------------------------------- *");
     vhpi_printf("**********************************************************************");

     invec_data.clock = 0;
     invec_data.clear = 0;
	 invec_data.clock_prev = invec_data.clock;
     invec_data.clear_prev = invec_data.clear;
	 Q = 0;	
	 
	 initValue = (vhpiValueT*) malloc(sizeof(vhpiValueT));
     initValue->format = vhpiEnumVal; 
     initValue->value.enumv = 2;
	 
	 //Initialize out port F0
	 if(SigHdl = vhpi_handle_by_name(":UUT:U1:F0",0))
	 {
  	  if(vhpi_put_value(SigHdl,initValue,vhpiForcePropagate))
	   vhpi_printf("E R R O R : Cannot update F0 port");
	 } 
	 else
	  vhpi_printf("E R R O R : Cannot get handler for F0 port");

	 //Initialize out port F1
     if(SigHdl = vhpi_handle_by_name(":UUT:U1:F1",0))
	 {
  	  if(vhpi_put_value(SigHdl,initValue,vhpiForcePropagate))
	   vhpi_printf("E R R O R : Cannot update F1 port");
	 } 
	 else
	  vhpi_printf("E R R O R : Cannot get handler for F1 port");
	 
	}
	else
	{
     vhpi_printf("**************************************************************************");
     vhpi_printf("* Active-HDL - SystemC/VHDL/Verilog/EDIF/C/C++ interface not initialized *");
	 vhpi_printf("* -----------------------VHPI VERSION----------------------------------- *");
     vhpi_printf("**************************************************************************");
	}
}
