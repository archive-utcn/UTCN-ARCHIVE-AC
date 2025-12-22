-- actually 4x8 bits

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

package my_type is
	type f is array	(3 downto 0) of std_logic_vector(7 downto 0);
end my_type;

library ieee;
library work;
use work.my_type.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity fifo is
	port(push, pop, clk: in std_logic;
	inp: in std_logic_vector(7 downto 0);
	content: out f;
	outp: out std_logic_vector(7 downto 0));
end fifo;

architecture a of fifo is
begin			  
	process(clk)
	variable aux: f;
	begin
		if clk='1' and clk'event then
			if (push='1' and aux(3)="UUUUUUUU") then
				aux(3 downto 1) := aux(2 downto 0);
				aux(0) := inp;
			elsif pop='1' then
				aux(3 downto 1) := aux(2 downto 0);
				aux(0) := "UUUUUUUU";
			end if;
		end if;
		content<=aux;
		outp<=aux(3);
	end process;
end a;