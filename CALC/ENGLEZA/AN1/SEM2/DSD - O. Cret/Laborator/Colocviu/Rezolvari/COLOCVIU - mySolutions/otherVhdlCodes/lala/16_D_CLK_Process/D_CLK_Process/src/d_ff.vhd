library ieee;
use ieee.std_logic_1164.all;

entity d is
	port(s, r, d: in bit;
	q, nq: out bit);
end d;

architecture a of d is
signal clk: bit:='0';
begin
	clock: process
	begin
		clk<=not clk;
		wait for 10 ns;
	end process;
	
	ff: process(r, s, clk)
	begin
		if s='1' then
			q<='1'; nq<='0';
		elsif r='1' then
			q<='0';	nq<='1';
		elsif (clk='1' and clk'event) then
			q<=d; nq<=not d;
		end if;
	end process;
end a;
		