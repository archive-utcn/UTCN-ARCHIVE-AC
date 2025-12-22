/*////////////////////////////////////////////////////////////////////////////

	File name			: vhpi_get_info.c
	Last Modification	: 28-March-2002
	Author				: Mikolaj Skalski MIS
	Copyright			: (C) 2002 Aldec 
	Description			: VHPI Interface tutorial
						  
/////////////////////////////////////////////////////////////////////////////*/


/*////////////////////////////////////////////////////////////////////////////
	VHPI Interface header file
/////////////////////////////////////////////////////////////////////////////*/

#include <vhpi_user.h>
#include <veriuser.h>
#include <aldecpli.h>

#include <stdio.h>


/*/////////////////////////////////////////////////////////////////////////////
  call_Count_signals_exec
  
	Description : Design unit structure.
				  How to find declared signals in entire design. 

	to do :
				1. get root instance handler
				2. get iterator for :
					- signals
					- internal regions
				3. scan these iterators in order to receive names of :
					- signals
					- internal regions

/////////////////////////////////////////////////////////////////////////////*/
PLI_VOID traverse_hierarchy(vhpiHandleT ScopeHdl, int *numObjs){

	vhpiHandleT iteratorSigHdl	= NULL; // iterator for SigDecls
	vhpiHandleT iteratorRegHdl	= NULL; // iterator for InternalRegions
	vhpiHandleT Hdl				= NULL; // handler 
	vhpiHandleT SigHdl			= NULL; // handler 

	if (ScopeHdl==NULL) return;
	if ( iteratorRegHdl = vhpi_iterator(vhpiInternalRegions, ScopeHdl) )
			//1.
			while ( Hdl = vhpi_scan(iteratorRegHdl) ){
				//2.
				vhpi_printf( "%s [%d]: %s ",vhpi_get_str(vhpiKindStrP, Hdl),
										vhpi_get(vhpiKindP, Hdl),
										vhpi_get_str(vhpiNameP, Hdl) );
				
				// signal declarations
				if ( iteratorSigHdl= vhpi_iterator(vhpiSigDecls, Hdl) )
					//3.
					while ( SigHdl = vhpi_scan(iteratorSigHdl) ){

						// handler points to object of type vhpiSignalDeclK (signal)
						
						vhpi_printf("found signal: %s ",	// signal name 
														vhpi_get_str(vhpiNameP, SigHdl));
						(*numObjs)++;
					}

			traverse_hierarchy(Hdl, numObjs);
			}
	
}

PLI_VOID call_Count_signals_exec (const struct vhpiCbDataS *cb_data_p)
{

	vhpiHandleT rootInstHdl		= NULL; // handler to rootInst component	
	vhpiHandleT iteratorSigHdl	= NULL; // iterator for SigDecls
	vhpiHandleT Hdl				= NULL; // handler 
	vhpiHandleT archBodyHdl		= NULL; // handler to archBody
	vhpiHandleT entityDeclHdl	= NULL; // handler to entityDecl
	
	int numObjs = 0;				  // initialize objects counter

	vhpi_printf("\nUsing VHPI application as Foreign Architecture to count declared signals...");

	//1.
 	if ( rootInstHdl = vhpi_handle(vhpiRootInst, NULL) ){
		//2
		// signal declarations
		if ( iteratorSigHdl= vhpi_iterator(vhpiSigDecls, rootInstHdl) )
			//3.
			while ( Hdl = vhpi_scan(iteratorSigHdl) ){

				// handler points to object of type vhpiSignalDeclK (signal)
				
				vhpi_printf("found signal: %s ",	// signal name 
												vhpi_get_str(vhpiNameP, Hdl));
				numObjs++;
			}
		
		traverse_hierarchy(rootInstHdl, &numObjs);

		//  fetching some information about analyzed design:
		//  name of architecture of top level design 
		if ( archBodyHdl = vhpi_handle(vhpiDesignUnit, rootInstHdl) ){
			
			// name of entity of top level design
			if ( entityDeclHdl = vhpi_handle(vhpiPrimaryUnit, archBodyHdl) ){
				vhpi_printf("==============================================================");
				vhpi_printf("SUMMARY:");
				vhpi_printf("Analyzed entire design '%s' contains %d signal(s)", vhpi_get_str(vhpiNameP, entityDeclHdl), numObjs);

			}
		}

	}
	 
	vhpi_printf("\nEnd of Your VHPI application.......");

}

/*/////////////////////////////////////////////////////////////////////////////
	Export DLL
/////////////////////////////////////////////////////////////////////////////*/
PLI_VOID startup_1()
{
 int i;
 static vhpiForeignDataT foreignDataArray[] = {
		{vhpiArchFK, "vhpi_for_ahdl", "Count_signals",0, call_Count_signals_exec},
		0
	};

	// tasks registration 
	for (i= 0; i <  ( sizeof(foreignDataArray) / sizeof(foreignDataArray[0]) ) - 1 ;  i++)
		vhpi_register_foreignf(&(foreignDataArray[i]));
}

#ifdef WIN32
__declspec ( dllexport )
#endif

/*/////////////////////////////////////////////////////////////////////////////
	VHPI_tfs
/////////////////////////////////////////////////////////////////////////////*/
// table of functions to register vhpi tasks
PLI_VOID 
(*vhpi_startup_routines[])() = { startup_1, NULL};




/*/////////////////////////////////////////////////////////////////////////////
	End.
/////////////////////////////////////////////////////////////////////////////*/
