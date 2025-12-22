library	ieee;
use ieee.std_logic_1164.all;	
use ieee.std_logic_unsigned.all;

entity memorie_ram is
	port(
	cs:in std_logic;--enable
	we:in std_logic;--write enable
	addr:in std_logic_vector(3 downto 0);--adresa
	cuvant_in:in std_logic_vector(19 downto 0);--cuvant in cazul we = 1
	cuvant_out:out std_logic_vector(19 downto 0)--cuvant in cazul we = 0
	);
end memorie_ram;

architecture memorie of memorie_ram is	
type mem is array(0 to 15) of std_logic_vector (19 downto 0);
begin
	process(addr,cs,we)
	variable mem1:mem:=(
	"00000000010001000011",--123
	"00000001000000000000",--400
	"00000000000000000010",--2
	"00000000110000000011",--303
	"00000000000001000111",--27
	"00000001110000000001",--701
	"00000000010001000010",--122
	"00011000000000000000",--3000
	"00010000010000000000",--2100
	"00000000000000100000",--10
	"00000000110000001001",--309
	"00000000000001001000",--28
	"00000001110000000000",--700
	"00000000010001000110",--126
	"00011000000000000001",--3001
	"00010000010000000101" --2105
	);	
	begin
		if cs='1' then	   	
			if we='0' then	   
				cuvant_out <= mem1(conv_integer(addr));	
			else mem1(conv_integer(addr)):=cuvant_in;
			end if;
		else cuvant_out<="00000000000000000000";
		end if;
	end process;
end memorie;
			
		
				
				
					
				
			
		
	