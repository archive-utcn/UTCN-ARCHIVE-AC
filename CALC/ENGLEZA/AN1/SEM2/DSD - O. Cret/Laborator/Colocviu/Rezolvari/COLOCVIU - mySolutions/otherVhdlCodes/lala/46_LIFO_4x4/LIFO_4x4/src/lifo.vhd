library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity lifo is
	port(clk, push, pop, rst: in bit;
	full, empty: out bit;
	inp: in std_logic_vector(3 downto 0);
	outp: out std_logic_vector(3 downto 0));
end lifo;

architecture a of lifo is

shared variable iFull: bit;
shared variable iEmpty: bit := '1';
shared variable pos: integer range -1 to 4 := 0;
type l is array(3 downto 0) of std_logic_vector(3 downto 0);
shared variable content: l := (others=>"UUUU");

begin
	
	process(clk)
	begin
		if (clk'event and clk='1') then
			if rst='1' then
				iEmpty := '1';
				iFull := '0';
				pos := 0;
				content := (others => "UUUU");
			elsif push='1' then
				if iFull='1' then
					report "LIFO full" severity error;
				else
					content(pos) := inp;
					pos := pos+1;
					iEmpty := '0';
					if pos=4 then
						iFull := '1';
					end if;
				end if;
			elsif pop='1' then
				if iEmpty='1' then
					report "LIFO empty" severity error;
				else
					outp <= content(pos-1);
					content(pos-1) := "UUUU";
					pos := pos-1;
					iFull := '0';
					if pos=-1 then
						iEmpty := '1';
						pos := 0;
					end if;
				end if;
			end if;
		empty <= iEmpty;
		full <= iFull;
		end if;
	end process;
end a;
					