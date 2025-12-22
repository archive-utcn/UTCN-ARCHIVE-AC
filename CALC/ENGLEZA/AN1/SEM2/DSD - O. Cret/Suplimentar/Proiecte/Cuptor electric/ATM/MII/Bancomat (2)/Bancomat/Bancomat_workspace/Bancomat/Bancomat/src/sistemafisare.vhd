library ieee;
use ieee.std_logic_1164.all;  
use work.mytypes.all;

entity sistemafisare is 
	port(
	clk:in std_logic; 
	reset:in std_logic;							   
	mesaj:in std_logic_vector(19 downto 0);--mesajul de afisat
	anod:out std_logic_vector(0 to 3);--afisorul activ - logica negativa
	catod:out std_logic_vector(0 to 6)--segmentele - logica negativa
	);
end sistemafisare;

architecture struct of sistemafisare is								  
component divizor is
	port(clk:in std_logic;
	reset:in std_logic;
	clk_out:out std_logic);
end component;

component selector is
	port(clk:in std_logic;	  
	reset:in std_logic;
	anod:out std_logic_vector(3 downto 0));
end component;

component mux is
	generic(nrselectii:integer := 4);
	port(				  							
	intrari:in arr;
	selectie:in std_logic_vector(3 downto 0);
	iesire:out std_logic_vector(4 downto 0)
	);
end component;

component decodificator is
	port (
	bcd:in std_logic_vector(4 downto 0);
	decoded:out std_logic_vector(6 downto 0));
end component;				   

signal clkdiv: std_logic;
signal bcd:std_logic_vector(4 downto 0);
signal sel:std_logic_vector(3 downto 0);
signal informux:arr;

begin
										  
informux(7) <= mesaj(19 downto 15);
informux(11) <= mesaj(14 downto 10);
informux(13) <= mesaj(9 downto 5);
informux(14) <= mesaj(4 downto 0);
	
divizor1:divizor port map(clk, reset, clkdiv);
selector1:selector port map(clkdiv, reset, sel);
mux1:mux port map(informux, sel, bcd);
decodificator1:decodificator port map(bcd, catod);

anod <= sel;

end struct;