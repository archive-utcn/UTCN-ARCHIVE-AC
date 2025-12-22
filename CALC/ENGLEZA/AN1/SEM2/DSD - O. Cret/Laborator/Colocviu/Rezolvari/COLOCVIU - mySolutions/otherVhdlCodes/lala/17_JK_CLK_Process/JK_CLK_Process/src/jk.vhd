library ieee;
use ieee.std_logic_1164.all;

entity jk is
	port(r, s, j, k: in bit;
	q, nq: out bit);
end jk;

architecture a of jk is
signal clk: bit:='0';
 
begin
	clock: process
	begin
		clk<=not clk;
		wait for 10 ns;
	end process clock;
	ff: process(clk, r, s)
	variable aux: bit;
	begin
		if s='1' then
			aux:='1';
		elsif r='1'	then
			aux:='0';
		elsif (clk'event and clk='1') then
			if j='0' then
				if k='0' then null;
				else aux:='0';
				end if;
			else
				if k='0' then aux:='1';
				else aux:=not aux;
				end if;
			end if;
		end if;
		q<=aux;
		nq<=not aux;
		end process ff;
end a;
