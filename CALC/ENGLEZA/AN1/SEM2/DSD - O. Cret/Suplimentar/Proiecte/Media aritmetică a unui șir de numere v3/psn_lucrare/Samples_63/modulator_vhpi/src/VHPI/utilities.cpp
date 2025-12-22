/*
//----------------------------------------------------------------------------
// VHPI Language Interface - (C) Copyright 2004 by Aldec, Inc.	 	 
// Project : VHPI Wizard  v.2.0											 	 
// File    : utilities.cpp
// Utility functions definitions
//									         							 
//----------------------------------------------------------------------------
*/

#include "utilities.h"
#include <stdio.h>
#include <math.h>
#include <memory.h>
#include <stdlib.h>	
#include <string>
	
// this function converts string to lowercase 
char* lowerCase( const char* _szInputStr )
{		
	char* szOutputStr;
	szOutputStr = (char*) malloc( sizeof( char ) * strlen( _szInputStr ) );
	for ( unsigned int i = 0; i <= strlen( _szInputStr ); i++ )
		szOutputStr[i] = tolower( _szInputStr[i] );
	return szOutputStr;
}

// this function adds new object to structure
TValObjPtrs* addValObj( vhpiHandleT _hNewHandle, TValObjPtrs* _pActualPointer, int _nActualSize )
{								

	TValObjPtrs hNewHandle;
	hNewHandle.hHdl = _hNewHandle;
	hNewHandle.vValue = getFieldValue( _hNewHandle );
	hNewHandle.nIndex = _nActualSize;
	hNewHandle.nType = 0;
	hNewHandle.szName = strdup( (char*)vhpi_get_str( vhpiNameP, _hNewHandle ) );
	hNewHandle.pBoolVar = (bool*) malloc( sizeof( bool ) );
	hNewHandle.pIntVar = (int*) malloc( sizeof( int ) );
	hNewHandle.pRealVar = (double*) malloc( sizeof( double ) );	
	hNewHandle.pUserVars = NULL;	
	if ( _hNewHandle )
	{
		if ( ( hNewHandle.vValue->format >= 14 ) && ( hNewHandle.vValue->format <= 16 ) )
		{																 
		//if array type ports, when numElems is defined
			hNewHandle.pBoolVecVar = (bool*) malloc( sizeof( bool ) * hNewHandle.vValue->numElems );
			hNewHandle.pIntVecVar = (int*) malloc( sizeof( int ) * hNewHandle.vValue->numElems );
			hNewHandle.pRealVecVar = (double*) malloc( sizeof( double ) * hNewHandle.vValue->numElems );
		}
		else
		{
			hNewHandle.pBoolVecVar = (bool*) malloc( sizeof( bool ) );
			hNewHandle.pIntVecVar = (int*) malloc( sizeof( int ) );
			hNewHandle.pRealVecVar = (double*) malloc( sizeof( double ) );
		}
		// set the type of port
		char* szType = (char*)vhpi_get_str( vhpiNameP, vhpi_handle( vhpiBaseType, _hNewHandle ) );
		szType = lowerCase( szType ); 
		//	vhpi_printf( " %s => %s ", vhpi_get_str( vhpiNameP, vhpi_handle( vhpiBaseType, _hNewHandle ) ), szPortType );
		if ( ( stricmp( szType, "std_logic" ) == 0 ) || ( strnicmp( szType, "std_logic_vector(", 17 ) == 0 ) ||
			( stricmp( szType, "std_ulogic" ) == 0 ) || ( strnicmp( szType, "std_ulogic_vector(", 18 ) == 0 ) ||
			( stricmp( szType, "X01" ) == 0 ) || ( strnicmp( szType, "X01(", 4 ) == 0 ) ||
			( stricmp( szType, "X01Z" ) == 0 ) || ( strnicmp( szType, "X01Z(", 5 ) == 0 ) ||
			( stricmp( szType, "UX01" ) == 0 ) || ( strnicmp( szType, "UX01(", 5 ) == 0 ) ||
			( stricmp( szType, "UX01Z" ) == 0 ) || ( strnicmp( szType, "UX01Z(", 6 ) == 0 ) ) 
			hNewHandle.nType = 1;
		else if ( ( stricmp( szType, "bit" ) == 0 ) || ( strnicmp( szType, "bit_vector(", 11  ) == 0 ) )
			hNewHandle.nType = 2;
		free( szType );
	}
	

	TValObjPtrs* hTempHandle;
	int index;	 
	// allocate memory for copy of actual handles array
	hTempHandle = (TValObjPtrs*) malloc( sizeof( TValObjPtrs )*( _nActualSize+1 ) );
	// copy array contents
	for ( index = 0; index < _nActualSize; index++ ) 
	{
		hTempHandle[index] = _pActualPointer[index];
	}
	// append array with new object handle
	hTempHandle[index++] = hNewHandle;
	// remove actual array from memory
	free( _pActualPointer );
	// allocate memory for new actual array
	_pActualPointer = (TValObjPtrs*) malloc( sizeof( TValObjPtrs )*(_nActualSize+1) );
	// copy array contents from temp array
	for ( index = 0; index < _nActualSize + 1; index++ )
	{
		_pActualPointer[index] = hTempHandle[index];
	}								  	  
	
	// remove temp array															  
	free( hTempHandle );
	return _pActualPointer;
}

TValObjPtrs* addValObj( TUserVars* _pUserVars, TValObjPtrs* _pActualPointer, int _nActualSize )
{								

	TValObjPtrs hNewHandle;
	hNewHandle.hHdl = NULL;
	hNewHandle.vValue = NULL;
	hNewHandle.nIndex = _nActualSize;
	hNewHandle.nType = 0;
	hNewHandle.szName = "UserVars";
	hNewHandle.pBoolVar = NULL;
	hNewHandle.pIntVar = NULL;
	hNewHandle.pRealVar = NULL;	
	hNewHandle.pBoolVecVar = NULL;	
	hNewHandle.pIntVecVar = NULL;	
	hNewHandle.pRealVecVar = NULL;	
	hNewHandle.pUserVars = _pUserVars;	
	
	TValObjPtrs* hTempHandle;
	int index;	 
	// allocate memory for copy of actual handles array
	hTempHandle = (TValObjPtrs*) malloc( sizeof( TValObjPtrs )*( _nActualSize+1 ) );
	// copy array contents
	for ( index = 0; index < _nActualSize; index++ ) 
	{
		hTempHandle[index] = _pActualPointer[index];
	}
	// append array with new object handle
	hTempHandle[index++] = hNewHandle;
	// remove actual array from memory
	free( _pActualPointer );
	// allocate memory for new actual array
	_pActualPointer = (TValObjPtrs*) malloc( sizeof( TValObjPtrs )*(_nActualSize+1) );
	// copy array contents from temp array
	for ( index = 0; index < _nActualSize + 1; index++ )
	{
		_pActualPointer[index] = hTempHandle[index];
	}								  	  
	
	// remove temp array															  
	free( hTempHandle );
	return _pActualPointer;
}

void cleanValObj( TValObjPtrs* _pValObjs )
{	
	int j = -1;
	while ( _pValObjs[++j].hHdl != NULL )
	{
		vhpi_release_handle( _pValObjs[j].hHdl );
		free( _pValObjs[j].vValue );
		free( _pValObjs[j].szName );
		free( _pValObjs[j].pBoolVar );
		free( _pValObjs[j].pIntVar );
		free( _pValObjs[j].pRealVar );
		free( _pValObjs[j].pBoolVecVar );
		free( _pValObjs[j].pIntVecVar );
		free( _pValObjs[j].pRealVecVar );	  
		free( _pValObjs+j );
	}								  
	if ( _pValObjs[j].hHdl == NULL )
		if ( _pValObjs[j].pUserVars != NULL )
		{
			free( _pValObjs[j].szName );
			free( _pValObjs+j );
		}			 
}
// this function adjusts clock delays and checks if they are valid
void adjustClock( signed int _nUnit, unsigned int _nPeriod, double _rDuty, vhpiTimeT* _tHighDelay, vhpiTimeT* _tLowDelay )
{
	vhpiPhysT tTimeUnit;
	tTimeUnit = vhpi_get_phys( vhpiSimTimeUnitP, NULL );
	if ( ( _nUnit != -15 ) && ( _nUnit != -12 ) && ( _nUnit != -9 ) && ( _nUnit != -6 ) && ( _nUnit != -3 ) && ( _nUnit != 0 ) )
	{
		vhpi_printf( "Selected clock unit is illegal. Setting unit to ns." );
		_nUnit = -9;
	}

	if ( ( _rDuty < 0.01 ) || ( _rDuty > 0.99 ) )
	{
		vhpi_printf( "Selected clock duty cycle is out of legal range. Setting duty cycle to 50%" );
		_rDuty = 0.50;
	}

	double rPeriod = _nPeriod * pow( 10, abs( tTimeUnit.low ) + _nUnit ); // clock period in simulation units
	unsigned int nLowTime = (unsigned int)( rPeriod * ( 1 - _rDuty ) ); // clock low time in simulation units
	unsigned int nHighTime = (unsigned int)( rPeriod * _rDuty ); // clock high time in simulation units
	
	if ( rPeriod < 100 )
	{
		vhpi_assert( "Selected clock period requires greater simulation resolution.", (vhpiSeverityT)vhpiFailure );
		vhpi_sim_control( vhpiFinish );
	}																  
	
	_tHighDelay->low = nHighTime;
	_tLowDelay->low = nLowTime;
}

// this function converts C integer to VHDL std_logic_vector 
PLI_VOID int2stdlv( signed _nVal, vhpiValueT* _vValueP ) 
{			
	for ( int i = _vValueP->numElems; i > 0; i-- )
	{
		_vValueP->value.enumvs[i-1] = ( _nVal%2 == 1 ) ? vhpi1 : vhpi0 ;
		( _nVal > 0 ) ? _nVal >>= 1 : ( _nVal-- ) >> 1;
	}
}

// this function converts C integer to VHDL bit_vector 
PLI_VOID int2bitv( signed _nVal, vhpiValueT* _vValueP ) 
{			
	for ( int i = _vValueP->numElems; i > 0; i-- )
	{
		_vValueP->value.enumvs[i-1] = ( _nVal%2 == 1 ) ? vhpibit1 : vhpibit0;
		( _nVal > 0 ) ? _nVal >>= 1 : ( _nVal-- ) >> 1;
	}
}

// this function converts VHDL std_logic_vector to C integer
vhpiIntT stdlv2int( vhpiValueT* _vValueP ) 
{			
	signed nVal = 0;
	int nSize;				
	
 	nSize = _vValueP->numElems;
	for ( int i = 0; i < nSize; i++ ) 
	{							  
		nVal <<= 1;
		if ( ( _vValueP->value.enumvs[i] == vhpi1 ) || ( _vValueP->value.enumvs[i] == vhpiH ) )
			nVal++;
		else if ( ( _vValueP->value.enumvs[i] == vhpiU ) || ( _vValueP->value.enumvs[i] == vhpiX ) || ( _vValueP->value.enumvs[i] == vhpiW ) || ( _vValueP->value.enumvs[i] == vhpiZ ) || ( _vValueP->value.enumvs[i] == vhpiDontCare ) )
			vhpi_printf( "stdlv2int(): STD_LOGIC metavalue (UXWZ-) detected, converted to integer as 0" );
	}
	return nVal;
}
 
// this function converts VHDL std_logic_vector to C integer
vhpiIntT bv2int( vhpiValueT* _vValueP ) 
{			
	signed nVal = 0;
	int nSize;				
	
 	nSize = _vValueP->numElems;
	for ( int i = 0; i < nSize; i++ ) 
	{							  
		nVal <<= 1;
		if ( ( _vValueP->value.enumvs[i] == vhpibit1 ) )
			nVal++;
	}
	return nVal;
}

// this function updates object's value of index in in information table
bool objUpdateMain( int i , TValObjPtrs* _pValObjs, void* _pVar, int _bVarType)
{
	if ( ( (_pValObjs[i].vValue)->format == vhpiEnumVal ) && ( _pValObjs[i].nType == 0 ) && ( ( _bVarType == typeIntVar ) || ( _bVarType == typeDefaultVar ) ) )
	{
	//if enum object and int variable (default for scalar objects of enum type)
		if (( _pVar )) //if user variable specified, copies it to port structure
			*(_pValObjs[i].pIntVar) = *(int*)_pVar;
		(_pValObjs[i].vValue)->value.enumv = *(_pValObjs[i].pIntVar);	

	}
	if ( ( (_pValObjs[i].vValue)->format == vhpiEnumVecVal ) && ( _pValObjs[i].nType == 0 ) && ( ( _bVarType == typeIntVecVar ) || ( _bVarType == typeDefaultVar ) ) )
	{
	//if vector of enum object and int[n] variable (default for vector objects of enum type)
		if (( _pVar )) //if user variable specified, copies it to port structure
			memcpy( _pValObjs[i].pIntVecVar, _pVar, _pValObjs[i].vValue->bufSize );
		for ( int i = 0; i < _pValObjs[i].vValue->numElems; i++ )
			(_pValObjs[i].vValue)->value.enumvs[i] = _pValObjs[i].pIntVecVar[i];
	}
	if ( ( (_pValObjs[i].vValue)->format == vhpiEnumVal ) && ( _pValObjs[i].nType != 0 ) && ( ( _bVarType == typeBoolVar ) || ( _bVarType == typeDefaultVar ) ) )
	{	
	//if scalar port and bool variable (default for scalar logic signals)
		if (( _pVar )) //if user variable specified, copies it to port structure
			*(_pValObjs[i].pBoolVar) = *(bool*)_pVar;
		//updates value structure with variable value
		if (( *(_pValObjs[i].pBoolVar) ))
			if ( _pValObjs[i].nType == 2 )//if bit
				(_pValObjs[i].vValue)->value.enumv = vhpibit1;
			else if ( _pValObjs[i].nType == 1 )//if std_logic
				(_pValObjs[i].vValue)->value.enumv = vhpi1;
			else 
				vhpi_printf( "objUpdate(): Incorrect _pValObjs.nType value for object '%s'.", _pValObjs[i].szName );		
		else
			if ( _pValObjs[i].nType == 2 )//if bit
				(_pValObjs[i].vValue)->value.enumv = vhpibit0;
			else if ( _pValObjs[i].nType == 1 )//if std_logic
				(_pValObjs[i].vValue)->value.enumv = vhpi0;
			else 
				vhpi_printf( "objUpdate(): Incorrect _pValObjs.nType value for object '%s'.", _pValObjs[i].szName );
	}		
	else if ( ( (_pValObjs[i].vValue)->format == vhpiEnumVal ) && ( _pValObjs[i].nType != 0 ) && ( _bVarType == typeIntVar ) ) 
	{
	//if scalar port and int variable
		if (( _pVar )) //if user variable specified, copies it to port structure
			*(_pValObjs[i].pIntVar) = *(int*)_pVar;
		//updates value structure with variable value
		if ( _pValObjs[i].nType == 1 ) //if std_logic
		{
			if ( ( *(_pValObjs[i].pIntVar) >= vhpiU ) && ( *(_pValObjs[i].pIntVar) <= vhpiDontCare ) )
				(_pValObjs[i].vValue)->value.enumv = *(_pValObjs[i].pIntVar);
			else 
			{
				(_pValObjs[i].vValue)->value.enumv = 1;
				vhpi_printf( "objUpdate(): Variable value exceeds std_logic type's range 0..8 (vhpiU..vhpiDontCare) and object's value is set to 'X'." );
				return false;
			}
		}
		else if ( _pValObjs[i].nType == 2 ) //if bit
		{
			if ( ( *(_pValObjs[i].pIntVar) >= vhpibit0 ) && ( *(_pValObjs[i].pIntVar) <= vhpibit1 ) )
				(_pValObjs[i].vValue)->value.enumv = *(_pValObjs[i].pIntVar);
			else 
			{
				(_pValObjs[i].vValue)->value.enumv = 1;
				vhpi_printf( "objUpdate(): Variable value exceeds bit type's range 0..1 (vhpibit0..vhpibit1) and object's value is set to '1'." );
				return false;
			}
		}	
		else 
				vhpi_printf( "objUpdate(): Incorrect _pValObjs.nType value for object '%s'.", _pValObjs[i].szName );	
	}
	else if ( ( (_pValObjs[i].vValue)->format == vhpiEnumVecVal ) && ( _pValObjs[i].nType != 0 ) && ( ( _bVarType == typeIntVar ) || ( _bVarType == typeDefaultVar ) ) ) 
	{
	//if vector port and int variable (default for vector ports)
		if (( _pVar )) //if user variable specified, copies it to port structure
			*(_pValObjs[i].pIntVar) = *(int*)_pVar;
		//updates value structure with variable value	
		if ( _pValObjs[i].nType == 2 ) //if bit_vector
			int2bitv( *(signed*)(_pValObjs[i].pIntVar), _pValObjs[i].vValue );
		else if ( _pValObjs[i].nType == 1 ) //if std_logic_vector
			int2stdlv( *(signed*)(_pValObjs[i].pIntVar), _pValObjs[i].vValue );
	}										
	else if ( ( (_pValObjs[i].vValue)->format == vhpiEnumVecVal ) && ( _pValObjs[i].nType != 0 ) && ( _bVarType == typeIntVecVar ) ) 
	{
	//if vector port and int[n] variable
		if (( _pVar )) //if user variable specified, copies it to port structure
			memcpy( _pValObjs[i].pIntVecVar, _pVar, _pValObjs[i].vValue->bufSize );
		//updates value structure with variable value
		if ( _pValObjs[i].nType == 1 ) //if std_logic
		{
			for ( int j = 0; j < _pValObjs[i].vValue->numElems ; j++ )
			{
				if ( ( _pValObjs[i].pIntVecVar[j] >= vhpiU ) && ( _pValObjs[i].pIntVecVar[j] <= vhpiDontCare ) )
					(_pValObjs[i].vValue)->value.enumvs[j] = _pValObjs[i].pIntVecVar[j];
				else 
				{
					(_pValObjs[i].vValue)->value.enumvs[j] = 1;
					vhpi_printf( "objUpdate(): Variable value exceeds std_logic type's range 0..8 (vhpiU..vhpiDontCare) and object's value is set to 'X'." );
					return false;
				}
			}	
		}
		else if ( _pValObjs[i].nType == 2 ) //if bit
		{
			for ( int j = 0; j < _pValObjs[i].vValue->numElems ; j++ )
				if ( ( _pValObjs[i].pIntVecVar[j] >= vhpibit0 ) && ( _pValObjs[i].pIntVecVar[j] <= vhpibit1 ) )
					(_pValObjs[i].vValue)->value.enumvs[j] = _pValObjs[i].pIntVecVar[j];
				else 
				{
					(_pValObjs[i].vValue)->value.enumvs[j] = 1;
					vhpi_printf( "objUpdate(): Variable value exceeds bit type's range 0..1 (vhpibit0..vhpibit1) and object's value is set to '1'." );
					return false;
				}
		}	
		else 
				vhpi_printf( "objUpdate(): Incorrect _pValObjs.nType value for object '%s'.", _pValObjs[i].szName );	
	}										
	else if ( ( (_pValObjs[i].vValue)->format == vhpiEnumVecVal ) && ( _pValObjs[i].nType != 0 ) && ( _bVarType == typeBoolVecVar ) )
	{	
	//if vector port and bool[n] variable
		if (( _pVar )) //if user variable specified, copies it to port structure
			memcpy( _pValObjs[i].pBoolVecVar, _pVar, _pValObjs[i].vValue->bufSize );
		//updates value structure with variable value
		if (( *(_pValObjs[i].pBoolVecVar) ))
			for ( int j = 0; j < _pValObjs[i].vValue->numElems ; i++ )
				//vhpi_printf(" na %s dajemy %d", _pValObjs[i].szName, _pValObjs[i].pIntVecVar[i] );
				if ( _pValObjs[i].nType == 2 )//if bit
					(_pValObjs[i].vValue)->value.enumvs[j] = vhpibit1;
				else if ( _pValObjs[i].nType == 1 )//if std_logic
					(_pValObjs[i].vValue)->value.enumvs[j] = vhpi1;
				else 
				vhpi_printf( "objUpdate(): Incorrect _pValObjs.nType value for object '%s'.", _pValObjs[i].szName  );		
		else
			for ( int j = 0; j < _pValObjs[i].vValue->numElems ; i++ )
				if ( _pValObjs[i].nType == 2 )//if bit
					(_pValObjs[i].vValue)->value.enumvs[j] = vhpibit0;
				else if ( _pValObjs[i].nType == 1 )//if std_logic
					(_pValObjs[i].vValue)->value.enumvs[j] = vhpi0;
				else 
				vhpi_printf( "objUpdate(): Incorrect _pValObjs.nType value for object '%s'.", _pValObjs[i].szName  );									
	}		
	else if ( ( (_pValObjs[i].vValue)->format == vhpiIntVal ) && ( ( _bVarType == typeIntVar ) || ( _bVarType == typeDefaultVar ) ) ) 
	{
	//if integer port and int variable (default for integer ports)
		if (( _pVar )) //if user variable specified, copies it to port structure
			*(_pValObjs[i].pIntVar) = *(int*)_pVar;
		//updates value structure with variable value
		(_pValObjs[i].vValue)->value.intg = *(_pValObjs[i].pIntVar);
	}										
	else if ( ( (_pValObjs[i].vValue)->format == vhpiIntVecVal ) && ( ( _bVarType == typeIntVecVar ) || ( _bVarType == typeDefaultVar ) ) ) 
	{
	//if array of integer port and int[n] variable (default for array of integer port)
		if (( _pVar )) //if user variable specified, copies it to port structure
			memcpy( _pValObjs[i].pIntVecVar, _pVar, _pValObjs[i].vValue->bufSize );
		//updates value structure with variable value
		for ( int i = 0; i < _pValObjs[i].vValue->numElems; i++ )
			(_pValObjs[i].vValue)->value.intgs[i] = _pValObjs[i].pIntVecVar[i];
	}										
	else if ( ( (_pValObjs[i].vValue)->format == vhpiRealVal ) && ( ( _bVarType == typeRealVar ) || ( _bVarType == typeDefaultVar ) ) ) 
	{
	//if real port and double variable (default for real port)
		if (( _pVar )) //if user variable specified, copies it to port structure
			*(_pValObjs[i].pRealVar) = *(double*)_pVar;
		//updates value structure with variable value
		(_pValObjs[i].vValue)->value.real = *(_pValObjs[i].pRealVar);
	}
	else if ( ( (_pValObjs[i].vValue)->format == vhpiRealVecVal ) && ( ( _bVarType == typeRealVecVar ) || ( _bVarType == typeDefaultVar ) ) ) 
	{
	//if array of real port and double[n] variable (default for array of real port)
		if (( _pVar )) //if user variable specified, copies it to port structure
			memcpy( _pValObjs[i].pRealVecVar, _pVar, _pValObjs[i].vValue->bufSize );
		//updates value structure with variable value
		for ( int i = 0; i < _pValObjs[i].vValue->numElems; i++ )
			(_pValObjs[i].vValue)->value.reals[i] = _pValObjs[i].pRealVecVar[i];
	}
	else
	{
		vhpi_printf( "objUpdate(): Object %s type is not supported", _pValObjs[i].szName  );
		return false;	
	}
	
	if ( ( vhpi_put_value( _pValObjs[i].hHdl, _pValObjs[i].vValue, vhpiDepositPropagate ) ) == 0 )
	{
		//vhpi_printf("Signal value update succeeded");
		return true;
	}	
	else
	{
		vhpi_printf( "objUpdate(): Object %s value update failed", _pValObjs[i].szName );
		return false;	
	}
}

// this function updates object's value
bool objUpdate( vhpiHandleT _hPortHdl, TValObjPtrs* _pValObjs, void* _pVar, int _bVarType )
{
	int i = getId( _hPortHdl, _pValObjs );
	if ( i == -1 )
	{
		vhpi_printf( "objUpdate(): Object %s not found.", _pValObjs[i].szName );
		return false;
	}
	return objUpdateMain( i , _pValObjs, _pVar, _bVarType );
}

// this function updates object's value
bool objUpdate( char* _szPortName, TValObjPtrs* _pValObjs, void* _pVar, int _bVarType )
{
	int i = getId( _szPortName, _pValObjs );
	if ( i == -1 )
	{
		vhpi_printf( "objUpdate(): Object %s name not found.", _pValObjs[i].szName  );
		return false;
	}
	return objUpdateMain( i , _pValObjs, _pVar, _bVarType );
}

// this function updates user's variable value											 
bool varUpdateMain( int i, TValObjPtrs* _pValObjs, void* _pVar, int _bVarType )
{
	if ( vhpi_get_value( _pValObjs[i].hHdl, _pValObjs[i].vValue ) == 0 )
		switch ( _pValObjs[i].vValue->format ) //port type checking
		{
		case vhpiEnumVal: //scalar port of enum type
			//copies port value to boolean variable in port map
			if ( _pValObjs[i].nType == 1 )
			//if std_logic
				if ( ( (_pValObjs[i].vValue)->value.enumv == vhpi1 ) || ( (_pValObjs[i].vValue)->value.enumv == vhpiH ) )
					*(_pValObjs[i].pBoolVar) = true;
				else 
					*(_pValObjs[i].pBoolVar) = false;	 
			else if ( _pValObjs[i].nType == 2 )
			//if bit
				if ( ( (_pValObjs[i].vValue)->value.enumv == vhpibit1 ) )
					*(_pValObjs[i].pBoolVar) = true;
				else 
					*(_pValObjs[i].pBoolVar) = false;	 
			else if ( _pValObjs[i].nType == 0 )
			//if generic enum
				if ( ( (_pValObjs[i].vValue)->value.enumv != 0 ) )
					*(_pValObjs[i].pBoolVar) = true;
				else 
					*(_pValObjs[i].pBoolVar) = false;	 
			else
			{
				vhpi_printf( "varUpdate(): Port type is not supported" );			
				return false;
			}
			//copies port value to integer variable in port map	
			*(_pValObjs[i].pIntVar) = (_pValObjs[i].vValue)->value.enumv ;
			if ( _pVar ) //if user variable specified, copies value from port structure
				if ( ( _bVarType == typeBoolVar ) || ( ( _bVarType == typeDefaultVar ) && ( _pValObjs[i].nType != 0 ) ) ) //boolean variable
					*(bool*)_pVar = *(_pValObjs[i].pBoolVar);
				else if ( ( _bVarType == typeIntVar ) || ( ( _bVarType == typeDefaultVar ) && ( _pValObjs[i].nType == 0 ) ) )  //integer variable
					*(int*)_pVar = *(_pValObjs[i].pIntVar);
				else 
					vhpi_printf( "varUpdate(): Variable type not supported" );
			return true;
			break;
		case vhpiEnumVecVal: //vector port 
			//copies port value to integer variable in port map	
			if ( ( _bVarType == typeIntVar ) || ( _bVarType == typeDefaultVar ) ) //integer variable
				if ( _pValObjs[i].nType == 1 )
					*(_pValObjs[i].pIntVar) = stdlv2int( _pValObjs[i].vValue );
				else if ( _pValObjs[i].nType == 2 )
					*(_pValObjs[i].pIntVar) = bv2int( _pValObjs[i].vValue );
				else
				{
					vhpi_printf( "varUpdate(): Port %s type cannot be converted to integer variable", _pValObjs[i].szName );
					return false;
				}
			//copies port value to integer[n] variable in port map
			if ( _bVarType == typeIntVecVar ) //integer[n] variable
				for ( int j = 0; j < (_pValObjs[i].vValue)->numElems; j++ )
				   	_pValObjs[i].pIntVecVar[j] = (_pValObjs[i].vValue)->value.enumvs[j];
			//copies port value to boolean[n] variable in port map
			if ( _bVarType == typeBoolVecVar ) //boolean[n] variable
				for ( int j = 0; j < (_pValObjs[i].vValue)->numElems; j++ ) 
				{
					if ( _pValObjs[i].nType == 1 )
					//if std_logic
					   	_pValObjs[i].pBoolVecVar[j] = ( (_pValObjs[i].vValue)->value.enumvs[j] == vhpi1 ) || ( (_pValObjs[i].vValue)->value.enumvs[j] == vhpiH ) ? true : false ;
					if ( _pValObjs[i].nType == 2 )
					//if bit
					   	_pValObjs[i].pBoolVecVar[j] = ( (_pValObjs[i].vValue)->value.enumvs[j] == vhpibit1 ) ? true : false ;
					if ( _pValObjs[i].nType == 0 )
					//if nothing
					   	_pValObjs[i].pBoolVecVar[j] = ( (_pValObjs[i].vValue)->value.enumvs[j] == 0 ) ? false : true ;
				}
			if ( _pVar )//if user variable specified, copies value from port structure
				if ( ( _bVarType == typeIntVar ) || ( ( _bVarType == typeDefaultVar ) && ( _pValObjs[i].nType != 0 ) ) ) //integer variable
					*(int*)_pVar = *(_pValObjs[i].pIntVar);
				else if ( _bVarType == typeBoolVecVar )  //boolean[n] variable
					memcpy( _pVar, _pValObjs[i].pBoolVecVar, _pValObjs[i].vValue->bufSize );
				else if ( ( _bVarType == typeIntVecVar ) || ( ( _bVarType == typeDefaultVar ) && ( _pValObjs[i].nType == 0 ) ) ) //integer[n] variable
					memcpy( _pVar, _pValObjs[i].pIntVecVar, _pValObjs[i].vValue->bufSize );
				else
					vhpi_printf( "varUpdate(): Variable type not supported" );
			return true;
			break;
		case vhpiRealVal: //real port
			//copies port value to real variable in port map	
			*(_pValObjs[i].pRealVar) = (_pValObjs[i].vValue)->value.real;
			if ( _pVar ) //if user variable specified, copies value from port structure
				*(double*)_pVar = *(_pValObjs[i].pRealVar);
			return true;
			break;
		case vhpiRealVecVal: //real port
			//copies port value to real[n] variable in port map	
			for ( int j = 0; j < (_pValObjs[i].vValue)->numElems; j++ )
				_pValObjs[i].pRealVecVar[j] = (_pValObjs[i].vValue)->value.reals[j];
			if ( _pVar ) //if user variable specified, copies value from port structure
				memcpy( _pVar, _pValObjs[i].pRealVecVar, _pValObjs[i].vValue->bufSize );
			return true;
			break;
		case vhpiIntVal: //integer port
			//copies port value to integer variable in port map	
			*(_pValObjs[i].pIntVar) = (_pValObjs[i].vValue)->value.intg;
			if ( _pVar ) //if user variable specified, copies value from port structure
				*(int*)_pVar = *(_pValObjs[i].pIntVar);
			return true;
			break;
		case vhpiIntVecVal: //integer[n] port
			//copies port value to integer[n] variable in port map	
			for ( int j = 0; j < (_pValObjs[i].vValue)->numElems; j++ )
				_pValObjs[i].pIntVecVar[j] = (_pValObjs[i].vValue)->value.intgs[j];
			if ( _pVar ) //if user variable specified, copies value from port structure
				memcpy( _pVar, _pValObjs[i].pIntVecVar, _pValObjs[i].vValue->bufSize );
			return true;
			break;
		default:
			vhpi_printf( "varUpdate(): Port type is not supported yet" );
			return false;
			break;
		}			   
	else
	{
		vhpi_printf( "varUpdate(): Call to vhpi_get_value() failed" );
		return false;
	}		
}

// this function updates user's variable value											 
bool varUpdate( char* _szName, TValObjPtrs* _pValObjs, void* _pVar, int _bVarType )
{
	int i = getId( _szName, _pValObjs );	
	if ( i == -1 )
	{
		vhpi_printf( "varUpdate(): Port %s not found.", _szName );
		return false;
	}
	return varUpdateMain( i, _pValObjs, _pVar, _bVarType );
}

// this function updates user's variable value											 
bool varUpdate( vhpiHandleT _hHdl, TValObjPtrs* _pValObjs, void* _pVar, int _bVarType )
{
	int i = getId( _hHdl, _pValObjs );
	if ( i == -1 )
	{
		vhpi_printf( "varUpdate(): Port not found" );
		return false;
	}
	return varUpdateMain( i, _pValObjs, _pVar, _bVarType );
}	

// this function updates value returned by function/procedure
bool retUpdate( vhpiValueT* _vValue, int* _pVar, int _vhdlType )
{													
	
	switch ( _vValue->format )
	{
	case vhpiEnumVal:
		if ( ( _vhdlType == 0 ) && ( *_pVar >= vhpiU ) && ( *_pVar <= vhpiDontCare ) )
			_vValue->value.enumv = *_pVar;
		else if ( ( _vhdlType == 1 ) && ( *_pVar >= vhpibit0 ) && ( *_pVar <= vhpibit1 ) )
			_vValue->value.enumv = *_pVar;
		else
		{
			vhpi_printf( "retUpdate(): Int value exceeds logic type range" );
			_vValue->value.enumv = 0;
			return false;
		}
		break;
	case vhpiIntVal:
		_vValue->value.intg = *_pVar;
		break;
	case vhpiIntVecVal:
		_vValue->value.intgs = (vhpiIntT*) malloc( _vValue->bufSize );
		for ( int j = 0; j < _vValue->numElems; j++ )
			_vValue->value.intgs[j] = _pVar[j];
		break;
	case vhpiEnumVecVal:
		_vValue->value.enumvs = (vhpiEnumT*) malloc( _vValue->bufSize );
		if ( _vhdlType == 0 )
			int2stdlv( *_pVar, _vValue );
		else if ( _vhdlType == 1 )
			int2bitv( *_pVar, _vValue );
		else
		{
			vhpi_printf( "retUpdate(): Type mismatch" );
			*_pVar = 0;
			return false;
		}
		break;
	default:
		vhpi_printf( "retUpdate(): Type mismatch" );
		*_pVar = 0;
		return false;
	}
	return true;
}

bool retUpdate( vhpiValueT* _vValue, double* _pVar, int _vhdlType )
{													
	
	switch ( _vValue->format )
	{
	case vhpiRealVal:
		_vValue->value.real = *_pVar;
		break;
	case vhpiRealVecVal:
		_vValue->value.reals = (vhpiRealT*) malloc( _vValue->bufSize );
		for ( int j = 0; j < _vValue->numElems; j++ )
			_vValue->value.reals[j] = _pVar[j];			
		break;
	default:
		vhpi_printf( "retUpdate(): Type mismatch" );
		*_pVar = 0;
		return false;
	}
	return true;
}


//this function gets index of object in objects table for given object name
int getId( char* _szName, TValObjPtrs* _pValObjs )
{
	int i = -1;
	while ( stricmp( _szName, _pValObjs[++i].szName ) != 0 );
			if ( _pValObjs[i].hHdl == NULL && _pValObjs[i].pUserVars == NULL )
			{								 
				vhpi_assert( "getId(): Port not found", (vhpiSeverityT)vhpiFailure );
				return -1;
			}	
	return i;
}

//this function gets index of object in objects table for given object handle
int getId( vhpiHandleT _hHdl, TValObjPtrs* _pValObjs )
{
	int i = -1;
	while ( vhpi_compare_handles( _pValObjs[++i].hHdl, _hHdl ) != 1 );
		if ( _pValObjs[i].hHdl == NULL )
		{
			vhpi_assert( "getId(): Port not found", (vhpiSeverityT)vhpiFailure );
			return -1;
		}	
	return i;
}

//this function gets index of user variables structure pointer in objects table
int getUserId( TValObjPtrs* _pValObjs )
{
	int i = -1;
	while ( _pValObjs[++i].hHdl != NULL );
		if ( _pValObjs[i].pUserVars != NULL )
			return i;
		else 
		{
			return -1;																	
			vhpi_assert( "getUserId(): Pointer to user variables structure not found", (vhpiSeverityT)vhpiFailure );
		}
}

// this function creates and allocates proper object for value of passed signal
vhpiValueT* getFieldValue( vhpiHandleT _hSigHdl )
{
	vhpiValueT* vValue = NULL;
	if ( _hSigHdl )
	{														
		//allocates memory for vhpiValueT structure
		vValue = (vhpiValueT*) malloc( sizeof( vhpiValueT ) );	
		memset( vValue, '\x0', sizeof(vhpiValueT) ); 
		//reads format from object (e.g. enum or int etc.)
		vValue->format = vhpiObjTypeVal;
		//if object size is greater than allocated value structure
		//i.e. object has more than one element e.g. is a vector
		//then allocate additional memory according to number of elements
		if ( vhpi_get_value( _hSigHdl, vValue ) > 0)
		{													
			switch ( vValue->format )
			{
			case vhpiEnumVecVal:
				//read number of elements read by vhpi_get_value
				vValue->bufSize = vValue->numElems * sizeof( vhpiEnumT );
				//allocate memory
				vValue->value.enumvs = (vhpiEnumT*) malloc( vValue->bufSize );
				break;
			case vhpiIntVecVal:
				vValue->bufSize = vValue->numElems * sizeof( vhpiIntT );
				vValue->value.intgs = (vhpiIntT*) malloc( vValue->bufSize );
				break;
			case vhpiRealVecVal:
				vValue->bufSize = vValue->numElems * sizeof( vhpiRealT );
				vValue->value.reals = (vhpiRealT*) malloc( vValue->bufSize );
				break;
			}	
		}					 
//		vhpi_printf(" Format: %d", vValue->format);
//		vhpi_printf(" numElems: %d", vValue->numElems);
//		vhpi_printf(" bufSize: %d", vValue->bufSize);
	}
	return vValue;
}

// this function converts integer vhpiModeP property values to strings
// its only purpose is to display the mode on console during getting handles
char* conv_mode( int mode )
{
	switch ( mode )
	{
	case 1001: 
		return "vhpiInMode"; 
		break;
	case 1002: 
		return "vhpiOutMode"; 
		break;
	case 1003: 
		return "vhpiInoutMode"; 
		break;
	case 1004: 
		return "vhpiBufferMode"; 
		break;
	case 1005: 
		return "vhpiLinkageMode"; 
		break;
	default: 
		return "Illegal Mode Value"; 
		break;
	}
}
   
//this function gets handle to signal of specified hierarchical name
vhpiHandleT getHandle( char* _szSigName )
{
	vhpiHandleT	 hSigHdl,hHdl,hSubItr,hSubHdl;		  
	//get handle to root instance
	if ( ( hHdl = vhpi_handle( vhpiRootInst, NULL ) ) )
	{							 
		//get handle to signal - try root instance first 
		if ( !( hSigHdl = vhpi_handle_by_name( _szSigName, hHdl ) ) )
		{
			//if failed, iterate internal regions
			if (( hSubItr = vhpi_iterator( vhpiInternalRegions, hHdl ) )) 
				while (( hSubHdl = vhpi_scan( hSubItr ) )) 
					if ( !( hSigHdl = vhpi_handle_by_name( _szSigName, hSubHdl ) ) ) 
					{						 
						//if failed, print info
						vhpi_printf( "getHandle(): No signals found searching root and internal regions or ambiguous signal name" );
						return NULL;
					}
			else									  
			{					
				vhpi_printf( "getHandle(): No internal regions found" );
				return NULL;
			}
		}		
		//if getting handle succeded, print information on console
		if ( strcmp( vhpi_get_str( vhpiKindStrP, hSigHdl ), "vhpiPortDeclK" ) == 0 )				
			//with mode in case of port
			vhpi_printf( "getHandle(): %s found: kind %s, mode %s",vhpi_get_str( vhpiFullNameP, hSigHdl ), vhpi_get_str( vhpiKindStrP, hSigHdl ), conv_mode( vhpi_get( vhpiModeP, hSigHdl ) ) );
		else						   
			//without mode in case of signal
			vhpi_printf( "getHandle(): %s found: kind %s", vhpi_get_str( vhpiFullNameP, hSigHdl ), vhpi_get_str( vhpiKindStrP, hSigHdl ) );
		return hSigHdl;
	}
	else	
	{
		vhpi_printf( "getHandle(): No root instance found" );
		return NULL;						  
	}
}

// this function registers callback for vhpiCbValueChange reason  
// arguments: handles to signal and to user data 
bool isRegisteredCbValueChange( PLI_VOID( *cb_rtn_name ) (const struct vhpiCbDataS *), vhpiHandleT _hSigHdl, PLI_VOID*  _hUserData )
{
	vhpiCbDataT	cbData;
	vhpiHandleT	cbData_Hdl;
	vhpiErrorInfoT err_inf;
	
	cbData.cb_rtn = cb_rtn_name;
	cbData.reason = vhpiCbValueChange;
	cbData.obj = _hSigHdl;
	cbData.value = getFieldValue( cbData.obj );
	cbData.time = NULL;				
	cbData.user_data = _hUserData;	 //pass user data handle to callback 
 	
	vhpi_register_cb( &cbData, vhpiReturnCb );
	if ( ( cbData_Hdl = vhpi_register_cb( &cbData, vhpiReturnCb ) ) )
	{
		//vhpi_printf( "Callback on vhpiCbValueChange event for signal: %s registered \n", vhpi_get_str( vhpiFullNameP, _hSigHdl ) );
		return true;
	}												  
	else 
	{
		vhpi_printf( "Callback on vhpiCbValueChange event for signal: %s NOT registered \n", vhpi_get_str( vhpiFullNameP, _hSigHdl ) );
		if ( vhpi_check_error( &err_inf ) )
			vhpi_printf( err_inf.message );
		else
			vhpi_printf( "No vhpi_check_error() message..." ); 
		return false;
	}
}	

// this function registers callback for vhpiCbEndOfSimulation reason  
// arguments: callback routine name 
bool isRegisteredCbEndOfSimulation( PLI_VOID(*cb_rtn_name) (const struct vhpiCbDataS *), PLI_VOID* _hUserData )
{	
	vhpiCbDataT	cbData;
	vhpiHandleT	cbData_Hdl;
	vhpiErrorInfoT err_inf;

	cbData.reason = vhpiCbEndOfSimulation ;
	cbData.cb_rtn = cb_rtn_name;
	cbData.obj = NULL;
	cbData.time = NULL;
	cbData.value = NULL;
	cbData.user_data = _hUserData;
	
	if ( ( cbData_Hdl = vhpi_register_cb( &cbData, vhpiReturnCb ) ) )
	{
		//vhpi_printf( "Callback on vhpiCbEndOfSimulation event registered \n" );
		return true;
	}	
	else	//check error message and print failure info
	{
		vhpi_printf( "Callback on vhpiCbEndOfSimulation event NOT registered \n" );	
		if ( vhpi_check_error( &err_inf ) )
			vhpi_printf( err_inf.message );
		else
			vhpi_printf( "No vhpi_check_error() message..." ); 
		return false;	
	}	  
}

// this function registers callback for vhpiCbAfterDelay reason  
// arguments: callback routine name, delay in simulation resolution units
bool isRegisteredCbAfterDelay( PLI_VOID(*cb_rtn_name) (const struct vhpiCbDataS *), vhpiTimeT _tTime, PLI_VOID* _hUserData )
{
	vhpiCbDataT	cbData;
	vhpiHandleT cbData_Hdl;
	vhpiErrorInfoT err_inf;	
	
	cbData.reason = vhpiCbAfterDelay;
	cbData.cb_rtn = cb_rtn_name;
	cbData.obj = NULL;
	cbData.time = &_tTime;
	cbData.value = NULL;
	cbData.user_data = _hUserData;
	
	//vhpi_register_cb(&cbData, vhpiReturnCb);
	if ( ( cbData_Hdl = vhpi_register_cb( &cbData, vhpiReturnCb ) ) )
	{
		//vhpi_printf(  "Callback on vhpiCbAfterDelay event registered \n" );
		return true;
	}
	else	//check error message and print failure info
	{
		vhpi_printf( "Callback on vhpiCbAfterDelay event NOT registered \n" );	
		if ( vhpi_check_error( &err_inf ) )
			vhpi_printf( err_inf.message );
		else
			vhpi_printf( "No vhpi_check_error() message..." ); 
		return false;
	}	  
}
