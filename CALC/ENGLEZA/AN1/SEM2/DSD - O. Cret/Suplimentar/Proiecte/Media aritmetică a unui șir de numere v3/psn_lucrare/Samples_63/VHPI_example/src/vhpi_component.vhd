
entity call_vhpi_tutorial_from_vhdl is 

end entity call_vhpi_tutorial_from_vhdl;


architecture call_vhpi_tutorial_from_vhdlArch of call_vhpi_tutorial_from_vhdl is

	attribute FOREIGN of call_vhpi_tutorial_from_vhdlArch: architecture is 
	"VHPI $dsn\src\vhpi_for_ahdl\vhpi_for_ahdl.dll;Count_signals";
	
begin

	
end architecture call_vhpi_tutorial_from_vhdlArch;