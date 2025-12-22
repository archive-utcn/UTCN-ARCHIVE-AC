<?xml version="1.0" encoding="UTF-8"?>
<CONFIG>
 <Compilation>
  <folder name="$ALDEC\mingw\include"/>
  <folder name="$ALDEC\mingw\include\c++\3.2.3"/>
  <folder name="$ALDEC\pli\include"/>
  <file name="$dsn\src\PLI\veriuser_aldec.c"/>
  <file name="$dsn\src\PLI\oscil_c_pli.c"/>
  <options name="-ggdb"/>
  <options name="-shared"/>
  <options name="-Wall"/>
  <options name="-Ualdecpli_NULL_THUNK_DATA"/>
  <options name="-D_ALDEC"/>
  <options name="-D__int64=&quot;long"/>
  <options name="long"/>
  <options name="int&quot;"/>
 </Compilation>
 <Linker>
  <target name="$DSN\src\PLI\oscil_c_pli.dll"/>
  <library name="$ALDEC\mingw\lib\libstdc++.a"/>
  <library name="$ALDEC\pli\lib\aldecpli.lib"/>
  <options name="-shared"/>
  <folder name="$ALDEC\mingw\lib"/>
  <folder name="$ALDEC\mingw\lib\gcc-lib\mingw32\3.2.3"/>
 </Linker>
 <Type>
  <DesignType name="PLI"/>
 </Type>
</CONFIG>
