
The FREQ_METER design shows a simple frequency meter.
This design is a simple modification of the existing Freq_meter design with a VHPI example.

Please, run simulation with the runme_vhpi.do macro attached to the design.

The VHPI function will list all objects from the initialized hierachy in the Console window.

For debugging with C Code Debug, use macro comp_dll.do to compile vhpi_for_ahdl.dll library.
This will create new version of this library, containing debugging information.
Before starting CDebug session, use macro compile.do to compile whole design.

C Debug capabilities
 C-Debug folder contain files whit can be used for C debug tests
 Initialize_c_code_debug.do -scrip for initialization C debug session
 Gdb_command_usage.do  -script with C debug session using gdb commands
