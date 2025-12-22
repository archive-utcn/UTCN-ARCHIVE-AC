library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity Hz1_Div is
	port(Main_CLK:in std_logic; RST:in std_logic;
	New_CLK:out std_logic);
end Hz1_Div;

architecture Hz1_Div_A of Hz1_Div is	   --CLOCK DVIDER 1HZ (50%/50%)
begin
	process(Main_CLK,RST)					   
	variable count:std_logic_vector(24 downto 0);
	variable k:std_logic;
	begin
			if (RST='1') then
				count:=(others=>'0');
				New_CLK<='0';
				k:='0';
			else			 
				if (Main_CLK'EVENT and Main_CLK='1') then 
					if count=25000000 then
						k:=not(k);
						New_CLK<=k;
						count:=(others=>'0');
					else
						count:=count+1;
				end if;
			end if;
		end if;
	end process;
end Hz1_Div_A; 

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity kHz20_Div is
	port(Main_CLK:in std_logic; RST:in std_logic;
	New_CLK:out std_logic);
end kHz20_Div;

architecture kHz20_Div_A of kHz20_Div is	   --CLOCK DIVIDER 20kHz (50%/50%)
begin
	process(Main_CLK,RST)					   
	variable count:std_logic_vector(11 downto 0);
	variable k:std_logic;
	begin
			if (RST='1') then
				count:=(others=>'0');
				New_CLK<='0';
				k:='0';
			else			 
				if (Main_CLK'EVENT and Main_CLK='1') then 
					if count=2500 then
						k:=not(k);
						New_CLK<=k;
						count:=(others=>'0');
					else
						count:=count+1;
				end if;
			end if;
		end if;
	end process;
end kHz20_Div_A;

--library ieee;
--use ieee.std_logic_1164.all;
--use ieee.std_logic_arith.all;
--use ieee.std_logic_unsigned.all;
--
--entity Hz10_Div is
--	port(Main_CLK:in std_logic; RST:in std_logic;
--	New_CLK:out std_logic);
--end Hz10_Div;
--
--architecture Hz10_Div of Hz10_Div is	   
--begin
--	process(Main_CLK,RST)					   
--	variable count:std_logic_vector(28 downto 0);
--	variable k:std_logic;
--	begin
--			if (RST='1') then
--				count:=(others=>'0');
--				New_CLK<='0';
--				k:='0';
--			else			 
--				if (Main_CLK'EVENT and Main_CLK='1') then 
--					if count=800000 then
--						k:=not(k);
--						New_CLK<=k;
--						count:=(others=>'0');
--					else
--						count:=count+1;
--				end if;
--			end if;
--		end if;
--	end process;
--end Hz10_Div;