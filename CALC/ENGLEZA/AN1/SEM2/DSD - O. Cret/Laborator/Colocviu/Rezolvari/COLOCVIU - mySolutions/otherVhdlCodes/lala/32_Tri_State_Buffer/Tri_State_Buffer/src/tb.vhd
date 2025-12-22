library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity tb is
end tb;

architecture a of tb is
component buf is
	port(x: in std_logic_vector(7 downto 0);
	t: in std_logic;
	y: out std_logic_vector(7 downto 0));
end component;

signal x, y: std_logic_vector(7 downto 0);
signal t: std_logic;

begin
	UUT: buf port map (x, t, y);
	process
	variable aux: std_logic_vector(7 downto 0):="00000000";
	begin
		t<='0';
		while (x /=  "11111111") loop
			x<=aux;
			aux:=aux+1;
			wait for 20 ns;
		end loop;
		aux:=(others=>'0');
		x<=(others=>'0');
		t<='1';
		while (y /=  "11111111") loop
			x<=aux;
			aux:=aux+1;
			wait for 20 ns;
		end loop;
		wait;
	end process;
end a;
		