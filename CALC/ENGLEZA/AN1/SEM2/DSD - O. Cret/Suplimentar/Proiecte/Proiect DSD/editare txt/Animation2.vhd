library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity anim2_cont is		   
	port(CLK:in std_logic;
	RST:std_logic;
	q:out std_logic_vector(1 downto 0));
end anim2_cont;

architecture anim2_cont_a of anim2_cont is	
begin
	process(CLK,RST)
	variable c:std_logic_vector(1 downto 0);
	begin	
		if(RST='1') then 
			c:="00";					   
		else if(CLK'EVENT and CLK='1') then
			if (c="01") then c:="00";	
			else 
				c:=c+1;
			end if;
			end if;
		end if;
		q<=c;
		end process;
end anim2_cont_a;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity anim2 is
	port(CLK:in std_logic;
	RST:in std_logic;
	enable:in std_logic; 
	disp:in std_logic_vector(3 downto 0);
	address_out:out std_logic_vector(1 downto 0));	
end anim2;

architecture anim2_a of anim2 is	 
component anim2_ROM is
	port(A:in std_logic_vector(1 downto 0);
		O:out std_logic_vector(7 downto 0));
end component;	
component anim2_cont
	port(CLK:in std_logic;
	RST:std_logic;
	q:out std_logic_vector(1 downto 0));
end component;
signal datanr:std_logic_vector(7 downto 0);
signal state:std_logic_vector(1 downto 0);
begin
	MEM: anim2_ROM port map (state, datanr);  
	COUNT: anim2_cont port map(CLK,RST,state);
	process(RST,enable,datanr,disp)
	begin
	if RST='1' then 
		address_out<="00";
	else
		if enable='1' then
			case disp is
				when "1110" => address_out<=datanr(1 downto 0);
				when "1101" => address_out<=datanr(3 downto 2);
				when "1011" => address_out<=datanr(5 downto 4);
				when "0111" => address_out<=datanr(7 downto 6);
				when others => address_out<="00";
			end case;
		end if;
	end if;
	end process;
end anim2_a;