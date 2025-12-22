library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity anim_zero_counter is	  	 --se afiseaza mesajul static
	port(CLK:in std_logic;
	RST:in std_logic;
	O:out std_logic_vector(2 downto 0));
end entity;

architecture anim_zero_counter of anim_zero_counter is
begin
	process(CLK,RST)
	variable c:std_logic_vector(2 downto 0);
	begin
		if (RST='1') then
			c:="000";
		elsif (CLK'EVENT and CLK='1') then
			if (c="111") then
				c:="000";
			else
				c:=c+1;
			end if;
			end if;
		O<=c;
	end process;
end architecture; 

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity anim_zero is
	port(CLK:in std_logic;
	RST:in std_logic;
	enable:in std_logic; 
	disp:in std_logic_vector(3 downto 0);
	anim_out_addr:out std_logic_vector(2 downto 0));	
end entity;	 

architecture anim_zero of anim_zero is 	 

component anim_zero_ROM
	port(A:in std_logic_vector(2 downto 0);
		O:out std_logic_vector(11 downto 0));
end component;

component anim_zero_counter
	port(CLK:in std_logic;
	RST:std_logic;
	O:out std_logic_vector(2 downto 0));
end component;
	

signal letter_data:std_logic_vector(11 downto 0);
signal state:std_logic_vector(2 downto 0);
begin
	MEM: anim_zero_ROM port map (state, letter_data);  
	COUNT: anim_zero_counter port map(CLK,RST,state);
	process(RST,enable,letter_data,disp)
	begin
	if RST='1' then 
		anim_out_addr<="000";
	else
		if enable='1' then
			case disp is
				when "1110" => anim_out_addr<=letter_data(2 downto 0);
				when "1101" => anim_out_addr<=letter_data(5 downto 3);
				when "1011" => anim_out_addr<=letter_data(8 downto 6);
				when "0111" => anim_out_addr<=letter_data(11 downto 9);
				when others => anim_out_addr<="000";
			end case;
		end if;
	end if;
	end process;
end architecture;
	
