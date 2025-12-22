library ieee;
use ieee.std_logic_1164.all;

entity t_ff is
	port(t, clk, rst: in bit;
	q, nq: out bit);
end t_ff;

architecture a of t_ff is
begin
	process(clk, rst)
	variable aux, naux: bit;
	begin
		if rst='1' then
			aux:='0'; naux:='1';
		else
			if (clk'event and clk='1') then
				if t='0' then
					null;
				else
					aux:=not aux; naux:=not aux;
				end if;
			end if;
		end if;
		q<=aux;
		nq<=naux;
	end process;
end a;