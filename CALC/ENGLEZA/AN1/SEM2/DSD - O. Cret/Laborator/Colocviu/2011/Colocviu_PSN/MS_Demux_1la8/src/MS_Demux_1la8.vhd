library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity DEMUX_8la1 is
	port (X:in bit;
	S:in std_logic_vector(3 downto 0):="0000";
	Q:out bit_vector(0 to 7));
end entity;

architecture ARH_demux of DEMUX_8la1 is
begin  
	process(S) 
	begin
	case S is
	when	"0000" => Q(0)<=X;
	when	"0001" => Q(1)<=X;
	when	"0010" => Q(2)<=X;
	when	"0011" => Q(3)<=X;
	when	"0100" => Q(4)<=X;
	when	"0101" => Q(5)<=X;
	when	"0110" => Q(6)<=X;
	when	"0111" => Q(7)<=X; 
	when    others => Q<="00000000";
	end case;		  
	end process;
end architecture;  

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all; 
use IEEE.std_logic_unsigned.all;

entity MS_DEMUX is
end entity;

architecture ARH_MS_DEMUX of MS_DEMUX is
component DEMUX_8la1 
	port(X:in bit;
	S:in std_logic_vector(3 downto 0);
	Q:out bit_vector(0 to 7));
end component;
signal CLK: bit;
signal iesire: bit_vector(0 to 7);
signal Sel: std_logic_vector(3 downto 0):="0000";
begin  
	P1:DEMUX_8la1 port map('1',Sel,iesire);
	process(CLK)
	begin
		CLK<=not CLK after 10ns;
	end process;
	process(CLK)
	begin		   
		if(CLK'event and CLK='1') then
		Sel<=conv_std_logic_vector((conv_integer(Sel)+1),4);				  
		end if;
	end process;
	end architecture;
	
		
