<?xml version="1.0" encoding="UTF-8"?>
<CONFIG>
 <Compilation>
  <folder name="$ALDEC\mingw\include"/>
  <folder name="$ALDEC\SYSTEMC-2.0.1\src"/>
  <file name="$dsn\src\transactor.cpp"/>
  <file name="$dsn\src\testwrapper.cpp"/>
  <file name="$dsn\src\test.cpp"/>
  <options name="-shared"/>
  <options name="-Wall"/>
  <options name="-Ualdecpli_NULL_THUNK_DATA"/>
  <options name="-D_ALDEC"/>
  <options name="-D__int64=&quot;long"/>
  <options name="long"/>
  <options name="int&quot;"/>
  <options name="-O2"/>
  <options name="-fno-strict-aliasing"/>
  <options name="-fno-gcse-lm"/>
 </Compilation>
 <Linker>
  <target name="$DSN\src\testwrapper.dll"/>
  <library name="$ALDEC\SYSTEMC-2.0.1\src\systemc.def"/>
  <library name="$ALDEC\SYSTEMC-2.0.1\src\Systemc.a"/>
  <library name="$aldec\mingw\lib\libstdc++.a"/>
  <options name="-shared"/>
  <folder name="$ALDEC\mingw\lib"/>
 </Linker>
 <Type>
  <DesignType name="SYSTEMC"/>
 </Type>
 <Additional>
  <AddLibraryToDesign name="true"/>
  <AddModulesToLibrary name="true"/>
 </Additional>
</CONFIG>
