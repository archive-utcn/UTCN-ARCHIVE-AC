CPP  = g++.exe
CC   = "C:\Cads\Aldec\Active-HDL 6.1\mingw\bin\gcc.exe"
WINDRES = windres.exe
RES  = 

LIBS = "C:\Cads\Aldec\Active-HDL 6.1\mingw\lib\libstdc++.a" "C:\Cads\Aldec\Active-HDL 6.1\pli\lib\aldecpli.lib" 
INCS =  -I"C:\Cads\Aldec\Active-HDL 6.1\mingw\include" -I"C:\Cads\Aldec\Active-HDL 6.1\mingw\include\c++\3.2" -I"C:\Cads\Aldec\Active-HDL 6.1\pli\include"
CFLAGS = $(INCS) -ggdb -shared -Wall -Ualdecpli_NULL_THUNK_DATA -D_ALDEC -D__int64="long long int"    
LOPT =-shared,--noinhibit-exec

all:
	${CC} ${CFLAGS} c:\My_Designs\Mixed_Designs\VHDL_Verilog_EDIF_C_PLI\src\PLI\veriuser_aldec.c c:\My_Designs\Mixed_Designs\VHDL_Verilog_EDIF_C_PLI\src\PLI\oscil_c_pli.c  -Wl,${LOPT} ${LIBS} -o c:\My_Designs\Mixed_Designs\VHDL_Verilog_EDIF_C_PLI\src\PLI\oscil_c_pli.dll
