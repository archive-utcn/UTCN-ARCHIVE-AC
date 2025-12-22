library	ieee;
use ieee.std_logic_1164.all; 
use ieee.std_logic_arith.all;

--registru pe 20 biti cu incarcare seriala a cate 4 biti
entity sistem_introducere is
	port(
	enable:in std_logic;				  
	reset:in std_logic;
	clk:in std_logic;
	cifra:in std_logic_vector(3 downto 0);
	suma:out std_logic_vector(19 downto 0)
	);
end sistem_introducere;

architecture intdr of sistem_introducere is
begin
	process(clk,reset)	
	variable tmp: std_logic_vector(19 downto 0):=(others => '1'); 
	variable nr: integer:=0;
	begin
		if enable='1' then
			if reset='1' then
				tmp:=(others => '1');
			else
				if clk='1' and clk'event then
				  if cifra<"1010" then
					nr:=nr+1; 
					if nr=5 then
						nr:=0;	 
						tmp:=(others => '1');
					end if;
					tmp := tmp(14 downto 0) &'0' & cifra;
				end if;
			end if;	
		 end if;
		else NULL;		
		end if;
	suma<=tmp;
	
	end process;
end intdr;

		     
		