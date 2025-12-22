library ieee;
use ieee.std_logic_1164.all;

entity d_ff is
	port(clk, rst, d: in bit;
	q, nq: out bit);
end d_ff;

architecture a of d_ff is
begin
	process(clk, rst)
	begin
		if rst='1' then q<='0'; nq<='1';
		elsif (clk'event and clk='1') then q<=d; nq<=not d;
		end if;
	end process;
end a;