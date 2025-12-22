library ieee;
use ieee.std_logic_1164.all;

entity sum8bant is
	port(
	X 	: in std_logic_vector(7 downto 0); 
	Y 	: in std_logic_vector(7 downto 0);
	Tin	: in std_logic;
	S	: out std_logic_vector(7 downto 0);
	Tout: out std_logic);
end sum8bant;

architecture sum8bant of sum8bant is
signal P01 : std_logic;	
signal G01 : std_logic;
signal P23 : std_logic;	
signal G23 : std_logic;
signal P45 : std_logic;	
signal G45 : std_logic;
signal P67 : std_logic;	
signal G67 : std_logic;	 

signal T2  : std_logic;
signal T4  : std_logic;
signal T6  : std_logic;
begin
	sum1: entity WORK.sum2bant port map(
		X => X(1 downto 0),
		Y => Y(1 downto 0),
		Tin => Tin,
		S => S(1 downto 0),
		P => P01,
		G => G01
		);
	sum2: entity WORK.sum2bant port map(
		X => X(3 downto 2),
		Y => Y(3 downto 2),
		Tin => T2,
		S => S(3 downto 2),
		P => P23,
		G => G23
		);
	sum3: entity WORK.sum2bant port map(
		X => X(5 downto 4),
		Y => Y(5 downto 4),
		Tin => T4,
		S => S(5 downto 4),
		P => P45,
		G => G45
		);
	sum4: entity WORK.sum2bant port map(
		X => X(7 downto 6),
		Y => Y(7 downto 6),
		Tin => T6,
		S => S(7 downto 6),
		P => P67,
		G => G67
		);
	--transport generator	
	T2 <= G01 or (P01 and Tin);
	T4 <= G23 or (P23 and T2); -- G23 or (P23 and G01) or (P23 and P01 and Tin);  
	T6 <= G45 or (P45 and T4) ;--G45 or (P45 and G23) or (P45 and P23 and G01) or (P45 and P23 and P01 and Tin);
	Tout <= G67 or (P67 and T6); --G67 or (P67 and G45) or (P67 and P45 and G23) or (P67 and P45 and P23 and G01) or (P67 and P45 and P23 and P01 and Tin);
	
end sum8bant;