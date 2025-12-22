library ieee;
use ieee.std_logic_1164.all;

entity sum8bantgen is
	port(
	X 	: in std_logic_vector(7 downto 0); 
	Y 	: in std_logic_vector(7 downto 0);
	Tin	: in std_logic;
	S	: out std_logic_vector(7 downto 0);
	Tout: out std_logic);
end sum8bantgen;

architecture sum8bantgen of sum8bantgen is   

signal P : std_logic_vector(3 downto 0);
signal G : std_logic_vector(3 downto 0);
signal T : std_logic_vector(4 downto 0);


begin	
	T(0) <= Tin;
	trans_gen: for i in 1 to 4 generate
			T(i) <= G(i-1) or (P(i-1) and T(i-1));
		end generate;
	gen: for i in 0 to 3 generate
		sum: entity WORK.sum2bant port map(
				X => X(2 * i + 1 downto 2 * i),
				Y => Y(2 * i + 1 downto 2 * i),
				Tin => T(i),
				S => S(2 * i + 1 downto 2 * i),
				P => P(i),
				G => G(i)	
			);
		end generate;
	Tout <= T(4);
	--transport generator	
	--T2 <= G01 or (P01 and Tin);
	--T4 <= G23 or (P23 and T2); -- G23 or (P23 and G01) or (P23 and P01 and Tin);  
	--T6 <= G45 or (P45 and T4) ;--G45 or (P45 and G23) or (P45 and P23 and G01) or (P45 and P23 and P01 and Tin);
	--Tout <= G67 or (P67 and T6); --G67 or (P67 and G45) or (P67 and P45 and G23) or (P67 and P45 and P23 and G01) or (P67 and P45 and P23 and P01 and Tin);
	
end sum8bantgen;