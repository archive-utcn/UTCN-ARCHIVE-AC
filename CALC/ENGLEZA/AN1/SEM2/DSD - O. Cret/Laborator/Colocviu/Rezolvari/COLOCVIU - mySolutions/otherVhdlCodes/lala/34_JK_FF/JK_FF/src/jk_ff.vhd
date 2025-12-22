library ieee;
use ieee.std_logic_1164.all;

entity jk is
	port(j, k, clk, rst: in bit;
	q, nq: out bit);
end jk;

architecture a of jk is
begin
	process(clk, rst)
	variable aux, naux: bit;
	begin
		if rst='1' then aux:='0'; naux:='1';
		elsif (clk'event and clk='1') then
			if j /= k then aux:=j; naux:=not j;
			elsif j='1' then aux:=not aux; naux:=not aux;
			else null;
			end if;
		end if;
		q<=aux;
		nq<=naux;
	end process;
end a;	
		