library IEEE;
use IEEE.std_logic_1164.all;

entity num4 is
	port(Clk : in std_logic;
	Rst : in std_logic;
	En : in std_logic;
	Num : out std_logic_vector(3 downto 0));
end num4;

architecture simul of num4 is 
function INC_BV (A : std_logic_vector) return std_logic_vector is
variable Rez : std_logic_vector(A'range);
variable C 	 : std_logic;
begin
	C := '1';
	for i in A'low to A'high loop
		Rez(i) := A(i) xor C;
		C := A(i) and C;
	end loop;
	return Rez;
end INC_BV;	 

signal Num_int : std_logic_vector(3 downto 0);
begin 
	process(Clk)
	begin
		if(Clk'event and Clk = '1') then
			if(Rst = '1') then
				Num_int <= (others => '0');
			elsif( En = '1') then
				Num_int <= INC_BV ( Num_int); 
			end if;
			end if;
		end process;
		Num <= Num_int;
	end simul;
	


	
