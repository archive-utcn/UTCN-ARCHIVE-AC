library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity div_anim is
	port(Main_CLK:in std_logic; RST:in std_logic;
	New_CLK:out std_logic);
end div_anim;

architecture div_anim_A of div_anim is	  
begin
	process(Main_CLK,RST)					   
	variable cont:std_logic_vector(24 downto 0);
	variable k:std_logic;
	begin
			if (RST='1') then
				cont:=(others=>'0');
				New_CLK<='0';
				k:='0';
			else			 
				if (Main_CLK'EVENT and Main_CLK='1') then 
					if cont=25000000 then
						k:=not(k);
						New_CLK<=k;
						cont:=(others=>'0');
					else
						cont:=cont+1;
				end if;
			end if;
		end if;
	end process;
end div_anim_A; 



library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity div_anod is
	port(Main_CLK:in std_logic; RST:in std_logic;
	New_CLK:out std_logic);
end div_anod;

architecture div_anod_A of div_anod is	   
begin
	process(Main_CLK,RST)					   
	variable cont:std_logic_vector(11 downto 0);
	
	begin
			if (RST='1') then
				cont:=(others=>'0');
				New_CLK<='0';
			
			else			 
				if (Main_CLK'EVENT and Main_CLK='1') then 
					if cont=2500 then
					
						New_CLK<='1';
						cont:=(others=>'0');
					else
						cont:=cont+1;
						New_CLK <= '0';
				end if;
			end if;
		end if;
	end process;
end div_anod_A; 