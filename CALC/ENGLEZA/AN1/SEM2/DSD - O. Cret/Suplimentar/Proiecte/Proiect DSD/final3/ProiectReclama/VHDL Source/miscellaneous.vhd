library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity mux_8 is
	port(A:in std_logic_vector(2 downto 0);
	B:in std_logic_vector(2 downto 0);
	C:in std_logic_vector(2 downto 0);
	D:in std_logic_vector(2 downto 0);
	E:in std_logic_vector(2 downto 0);
	F:in std_logic_vector(2 downto 0);
	G:in std_logic_vector(2 downto 0);
	H:in std_logic_vector(2 downto 0);
	sel:in std_logic_vector(7 downto 0);
	O:out std_logic_vector(2 downto 0));
end mux_8;

architecture mux_8_a of mux_8 is
begin
	process(sel,a,b,c,d,e,f,g,h)
	begin									
		case sel is
			when "00000000" => o<=A;
			when "00000010" => o<=B;
			when "00000100" => o<=C;
			when "00001000" => o<=D;
			when "00010000" => o<=E;
			when "00100000" => o<=F;
			when "01000000" => o<=G;
			when "10000000" => o<=H;
			when others=> o<=A;
		end case;
	end process;
end mux_8_a;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity dmux_8_enable is
	port(sel:in std_logic_vector(7 downto 0);
	A:out std_logic;
	B:out std_logic;
	C:out std_logic;
	D:out std_logic;
	E:out std_logic;
	F:out std_logic;
	G:out std_logic;
	H:out std_logic);
end dmux_8_enable;

architecture dmux_8_enable_a of dmux_8_enable is
begin
	process(sel)   
	variable q:std_logic_vector(7 downto 0);
	begin									
		case sel is
			when "00000001" =>q:="00000001";
			when "00000010" =>q:="00000010";
			when "00000100" =>q:="00000100";
			when "00001000" =>q:="00001000";			
			when "00010000" =>q:="00010000";
			when "00100000" =>q:="00100000";
			when "01000000" =>q:="01000000";
			when "10000000" =>q:="10000000";
			when others=>q:="00000001";
		end case;
		A<=q(0);
		B<=q(1);
		C<=q(2);
		D<=q(3);
		E<=q(4);
		F<=q(5);
		G<=q(6);
		H<=q(7);
	end process;
end dmux_8_enable_a;   
