library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;


entity sum8b_tb is
end sum8b_tb;

architecture sum8b_tb of sum8b_tb is

signal X   : std_logic_vector(7 downto 0) := "00000000";
signal Y   : std_logic_vector(7 downto 0) := "00000000";
signal Tin : std_logic := '0';
signal S   : std_logic_vector(7 downto 0); 
signal Tout: std_logic;	 
begin
	DUT: entity WORK.sum8bantgen port map(
		X => X,
		Y => Y,
		Tin => Tin,
		S => S,
		Tout => Tout);
	gen_vect: process
	variable RezCorect : Integer := 0;
	variable NrErori   : Integer := 0; 
	begin
		for i in 0 to 255 loop
			for j in 0 to 255 loop 
				X <= conv_std_logic_vector(i,8);
				Y <= conv_std_logic_vector(j,8);
				RezCorect := i + j;
				wait for 100 ps;
				if((Tout & S) /= conv_std_logic_vector(RezCorect,9)) then
					report "Sum ( " & Integer'image(i) & ", " & Integer'image(j) & "), "
					& "rezultat asteptat: " & Integer'image(RezCorect) & ", rezultat obtinut" 
					& "la t = " & TIME'image(now) severity ERROR;
					NrErori := NrErori + 1;
				end if;		
			end loop; 

		end loop;
		report "Testare terminata cu " & INTEGER'image(NrErori) & " erori";
	wait;
	end process;
end sum8b_tb;