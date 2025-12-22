library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sumbooth is
	generic (n: integer:= 4);
	port(
	X: in std_logic_vector(n-1 downto 0);
	Y: in std_logic_vector(n-1 downto 0);
	Tin: in std_logic;
	S: out std_logic_vector(n-1 downto 0);
	Tout: out std_logic;
	OVF: out std_logic
	);
end sumbooth;

architecture sumbooth of sumbooth is
signal Xtmps: signed(n downto 0);
signal Ytmps: signed(n downto 0); 
signal Stmps: signed(n downto 0);
signal Xtmpu: unsigned(n downto 0);
signal Ytmpu: unsigned(n downto 0);
signal Stmpu: unsigned(n downto 0);

begin
	Xtmps <= resize(signed(X),n+1);
	Ytmps <= resize(signed(Y),n+1);
	Stmps <= Xtmps + Ytmps;
	Xtmpu <= resize(unsigned(X),n+1);
	Ytmpu <= resize(unsigned(Y),n+1);
	Stmpu <= Xtmpu + Ytmpu;
	OVF <= Stmps(n) xor Stmps(n-1);
	Tout <= Stmpu(n);
	S <= std_logic_vector(Stmpu(n-1 downto 0));
end sumbooth;
