#---------------------------------------------------------------------------- 
#  VHPI Language Interface - (C) Copyright 2001 by Aldec, Inc.		
#  Project : VHPI Wizard  v.1.0											
#  File    : build_vhpi.mak 												
#  NMAKE makefile to make vhpiuser_aldec.dll for Active-HDL,			
#  using MS Visual C++ on Windows										
#																				
#  Date:  May 24 2002															
#----------------------------------------------------------------------------


#This file is automatically maintained and may be overwritten


INCLUDE_PATH = C:\Cads\Aldec\Active-HDL 6.1
INCLUDES="%VSIMSACFG%\pli\interface"
LIBS="%VSIMSACFG%\pli\lib"


vhpiuser_aldec.dll: vhpiuser_aldec.obj oscil_c_vhpi.obj
		link -DLL -OUT:vhpiuser_aldec.dll -EXPORT:vhpi_startup_routines		/SUBSYSTEM:WINDOWS /debug -LIBPATH:"$(LIBS)" aldecpli.lib vhpiuser_aldec.obj oscil_c_vhpi.obj
		del *.obj
		del *.exp
		del *.lib


oscil_c_vhpi.obj : oscil_c_vhpi.c
		cl -c -Zi -D_ALDEC -DWIN32 -I"$(INCLUDES)" -I. oscil_c_vhpi.c

vhpiuser_aldec.obj: vhpiuser_aldec.c
		cl -c -Zi -D_ALDEC -DWIN32 -I"$(INCLUDES)" -I. vhpiuser_aldec.c

