package aritmetic is
	function log (N: in integer) return integer;
	function value (s: in bit_vector) return integer;
end package;

package body aritmetic is
	
	function log (N: in integer) return integer is
		variable x: integer := 1;
		variable i: integer := 0;
	begin
		while (x<N) loop
			x := x * 2;
			i := i + 1;
		end loop;
		return i;
	end;
	
	function value (s: in bit_vector) return integer is
		variable x: integer := 0;
		variable inter: integer := 1;
	begin
		x := 0;
		for i in s'high downto 0 loop
			inter := 1;
			for j in 1 to i loop
				inter := inter*2;
			end loop;
			if (s(i)='0') then 
				next;
			else
				x := x + inter;
			end if;
		end loop;
		return x;
	end;
	
end;

use aritmetic.all;

entity mux is
	generic (N: integer := 8);
	port (x: in bit_vector(0 to N-1);
		s: in bit_vector(log(N)-1 downto 0);
		y: out bit);
end;

architecture mux of mux is
	
begin
	process	(x,s)
	variable temp: integer;
	begin
		y <= '0';
		if N=1 then y <= x(0);
		else 
			temp := value(s);
			if (temp<N) then y <= x(temp);
			end if;
		end if;
	end process;
end; 