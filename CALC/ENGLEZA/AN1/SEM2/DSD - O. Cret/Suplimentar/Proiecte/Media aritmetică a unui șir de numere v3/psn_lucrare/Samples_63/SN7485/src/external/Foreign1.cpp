//--------------------------------------------------------
// Foreign1.cpp : Defines the export functions.
// Piotr Luszczak, Aldec, Inc, (C) 2002
//--------------------------------------------------------

#include <stdio.h>

#ifdef __cplusplus
extern "C" {
#endif

FILE *filePtr= NULL; // pointer to the test vector file
int return_value, ch;

//--------------------------------------------------------
// int FileOpen(void)
//--------------------------------------------------------

#ifdef WIN32
__declspec ( dllexport )
#endif

int FileOpen(void)
{
  filePtr= fopen("external\\stim.txt","r");
  if(!filePtr)
   return false;
  else
   return true;
}

//--------------------------------------------------------
// int FileClose(void)
//--------------------------------------------------------

#ifdef WIN32
__declspec ( dllexport )
#endif

int FileClose(void)
{
  if(fclose(filePtr))
   return false;
  else
   return true;
}

//--------------------------------------------------------
// int FileEnd(void)
//--------------------------------------------------------

#ifdef WIN32
__declspec ( dllexport )
#endif

int FileEnd(void)
{
      if (feof(filePtr) == 0)
		return false;
	  else
  	   return true;
}

//--------------------------------------------------------
// int Stimulator(void)
//--------------------------------------------------------

#ifdef WIN32
__declspec ( dllexport )
#endif

int Stimulator(void)
{

//    -------------------------------------------------------------------    
//    -- logic state system  (unresolved)
//    -------------------------------------------------------------------    
//    TYPE std_ulogic IS ( 'U',  -- Uninitialized			- integer value 0
//                         'X',  -- Forcing  Unknown		- integer value 1
//                         '0',  -- Forcing  0				- integer value 2
//                         '1',  -- Forcing  1				- integer value 3
//                         'Z',  -- High Impedance			- integer value 4 
//                         'W',  -- Weak     Unknown		- integer value 5
//                         'L',  -- Weak     0				- integer value 6
//                         'H',  -- Weak     1				- integer value 7
//                         '-'   -- Don't care				- integer value 8
//                       );
//    -------------------------------------------------------------------    

   ch = fgetc(filePtr);

   while ((ch == 32) || (ch == 10))
	   ch = fgetc(filePtr);

   char character = (char)ch;
   
   switch(character) 
   {
   case 'U':{ return_value = 0; break;}
   case 'X':{ return_value = 1; break;}
   case '0':{ return_value = 2;	break;}
   case '1':{ return_value = 3;	break;}
   case 'Z':{ return_value = 4;	break;}
   case 'W':{ return_value = 5;	break;}
   case 'L':{ return_value = 6;	break;}
   case 'H':{ return_value = 7;	break;}
   case '-':{ return_value = 8;	break;}
    default : break;
   }

  return return_value;
}

#ifdef __cplusplus
}
#endif
