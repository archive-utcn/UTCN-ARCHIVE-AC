library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity xor_gate is
	port(a,b: in std_logic;
	c: out std_logic);
end entity xor_gate;

architecture arh of xor_gate is
begin
	c<=a xor b;
end architecture arh;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity reg is
	port( clock,load,sin: in std_logic;
	data: in std_logic_vector(3 downto 0);
	q: out std_logic_vector(3 downto 0));
end entity reg;

architecture arh of reg is
begin
	process(clock,load)
	variable temp: std_logic_Vector(3 downto 0):= (others=>'0');
	begin
		if clock'event and clock='1' then
			if load='1' then temp:=data;
			else temp(3 downto 1):=temp(2 downto 0);
				temp(0):=sin;
			end if;
			if temp="0000" then temp:="0001";
			end if;
		end if;
	q<=temp;
	end process;
end architecture arh;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity random is
	port( clock,load: in std_logic;
	data: in std_logic_vector(3 downto 0);
	q: inout std_logic_vector( 3 downto 0));
end entity random;

architecture arh of random is

component xor_gate is
	port(a,b: in std_logic;
	c: out std_logic);
end component xor_gate;

component reg is
	port( clock,load,sin: in std_logic;
	data: in std_logic_vector(3 downto 0);
	q: out std_logic_vector(3 downto 0));
end component reg; 

signal aux: std_logic;

begin
	t1: xor_gate port map(q(0),q(3),aux);
	t2: reg port map(clock,load,aux,data,q);
end architecture arh;