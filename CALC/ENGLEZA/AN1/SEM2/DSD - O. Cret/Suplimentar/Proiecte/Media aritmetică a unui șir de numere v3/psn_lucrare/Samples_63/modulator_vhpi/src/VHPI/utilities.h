/*
//----------------------------------------------------------------------------
// VHPI Language Interface - (C) Copyright 2004 by Aldec, Inc.	 	 
// Project : VHPI Wizard  v.2.0											 	 
// File    : utilities.h      					         	
// Utility functions header file
//									         							 
// Date:  May 24 2002 													 
//----------------------------------------------------------------------------
*/

#ifndef __UTILITIES_H__ 
#define __UTILITIES_H__

#include <vhpi_user.h>

// structure for user variables to be passed through callbacks
// use it to store variables' values for whole simulation run
typedef struct SUserVars {	 
	double rDelta;
	double rValueX;
} TUserVars;

// structure for object (port, parameter) information storage
// ...Var pointers are dedicated to be used by user to set object values
// Those pointers are automatically updated by varUpdate() functions and
// used by default in portUpdate() functions
typedef struct SValObjPtrs 
{
	vhpiHandleT hHdl; // handle
	vhpiValueT* vValue; // pointer to value
	int nIndex; // index
	char* szName; // object name
	int nType; // object type (to distinguish enum types: bit and std_logic)
	int* pIntVar; // pointer to integer variable (for std_logic, std_logic_vector, bit, bit_vector port types)
	bool* pBoolVar;	// pointer to boolean variable (for std_logic, bit port types)
	double* pRealVar; // pointer to double variable (for real port types)
	bool* pBoolVecVar; // pointer to boolean[n] variable (for std_logic_vector, bit_vector port types)
	int* pIntVecVar; // pointer to integer[n] variable (for std_logic_vector, bit_vector, array of integer port types)
	double* pRealVecVar; // pointer to double[n] variable (for array of real port types)
	TUserVars* pUserVars; 
} TValObjPtrs;

#define typeDefaultVar 0
#define typeBoolVar 1
#define typeBoolVecVar 2
#define typeIntVar 3
#define typeIntVecVar 4
#define typeRealVar 5
#define typeRealVecVar 6

// this function adds new object to table information structures
TValObjPtrs* addValObj( vhpiHandleT _hNewHandle, TValObjPtrs* _pActualPointer, int _nActualSize );
TValObjPtrs* addValObj( TUserVars* _pUserVars, TValObjPtrs* _pActualPointer, int _nActualSize );

// this function adjusts clock delays and checks if they are valid
void adjustClock( signed int _nUnit, unsigned int _nPeriod, double _rDuty, vhpiTimeT* _tHighDelay, vhpiTimeT* _tLowDelay );

// this function converts C integer to VHDL std_logic_vector 
PLI_VOID int2stdlv( signed _nVal, vhpiValueT* _vValueP );

// this function converts C integer to VHDL bit_vector 
PLI_VOID int2bitv( signed _nVal, vhpiValueT* _vValueP );

// this function converts VHDL std_logic_vector to C integer
vhpiIntT stdlv2int( vhpiValueT* _vValueP );		  

// this function converts VHDL bit_vector to C integer
vhpiIntT bv2int( vhpiValueT* _vValueP );

// this function creates and allocates proper object for value of passed signal
vhpiValueT* getFieldValue( vhpiHandleT _hSigHdl );

//this function gets handle to signal of specified hierarchical name
vhpiHandleT getHandle( char* _szSigName );

//this function gets index of object in objects table
int getId( char* _szName, TValObjPtrs* _pValObjs );
int getId( vhpiHandleT _hHdl, TValObjPtrs* _pValObjs );
int getUserId( TValObjPtrs* _pValObjs );

// this function updates port value	   
bool objUpdate( vhpiHandleT _hPortHdl, TValObjPtrs* _pValObjs = 0, void* _pVar = 0, int _bVarType = 0 );
bool objUpdate( char* _szPortName, TValObjPtrs* _pValObjs = 0, void* _pVar = 0, int _bVarType = 0 );

// this function updates user's variable value
bool varUpdate( vhpiHandleT _hHdl, TValObjPtrs* _pValObjs = 0, void* _pVar = 0, int _bVarType = 0 );
bool varUpdate( char* _szParName, TValObjPtrs* _pValObjs = 0, void* _pVar = 0, int _bVarType = 0 );

// this function updates value returned by function
bool retUpdate( vhpiValueT* _vValue, int* _pVar, int _vhdlType = 0 );
bool retUpdate( vhpiValueT* _vValue, double* _pVar, int _vhdlType = 0 );
bool retUpdate( vhpiValueT* _vValue, char* _pVar, int _vhdlType = 0 );
								   
// this function registers callback for vhpiCbValueChange reason  
// arguments: callback routine name and handles to signal and to user data 
bool isRegisteredCbValueChange( PLI_VOID (*cb_rtn_name) (const struct vhpiCbDataS *), vhpiHandleT _hSigHdl, PLI_VOID* _hUserData );

// this function registers callback for vhpiCbEndOfSimulation reason  
// arguments: callback routine name 
bool isRegisteredCbEndOfSimulation( PLI_VOID (*cb_rtn_name) (const struct vhpiCbDataS *), PLI_VOID* _hUserData );

// this function registers callback for vhpiCbAfterDelay reason  
// arguments: callback routine name and vhpiTimeT structure with delay in simulation resolution units
bool isRegisteredCbAfterDelay( PLI_VOID (*cb_rtn_name) (const struct vhpiCbDataS *), vhpiTimeT _tTime, PLI_VOID* _hUserData );

#endif
