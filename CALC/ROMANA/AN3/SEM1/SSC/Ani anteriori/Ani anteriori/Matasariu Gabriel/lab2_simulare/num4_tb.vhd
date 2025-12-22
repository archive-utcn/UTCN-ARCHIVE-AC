library IEEE;
use IEEE.std_logic_1164.all;  
use IEEE.std_logic_unsigned.all;

entity num4_tb is
end num4_tb;

architecture simul_tb of num4_tb is 
signal Clk : std_logic := '0';
signal Rst : std_logic := '0';
signal En  : std_logic := '0';
signal Num : std_logic_vector(3 downto 0); 

constant CLK_PERIOD : TIME := 10ns;

begin 
	DUT: entity WORK.num4 port map(
		Clk => Clk,
		Rst => Rst,
		En  => En,
		Num => Num); 
	gen_clk: process
	begin
		Clk <= '0';
		wait for (CLK_PERIOD/2);
		Clk <= '1';
		wait for (CLK_PERIOD/2);
	end process gen_clk;  
	
	gen_vec_test: process
	variable RezCorect : std_logic_vector(3 downto 0) := "0000";
	variable NrErori   : Integer := 0;
	
	begin
		Rst <= '1';    
		wait for CLK_PERIOD;    
		Rst <= '0';    
		wait for CLK_PERIOD;    
		En <= '1';
	    for i in 0 to 15 loop	
			if( Num /= RezCorect) then
				report "Rezultat asteptat (" &
				STD_LOGIC'image(RezCorect(3)) &
				STD_LOGIC'image(RezCorect(2)) &
				STD_LOGIC'image(RezCorect(1)) &
				STD_LOGIC'image(RezCorect(0)) &
				" ) /= Valoarea obtinuta (" &
				STD_LOGIC'image (Num(3)) & 
				STD_LOGIC'image (Num(2)) &
				STD_LOGIC'image (Num(1)) &
				STD_LOGIC'image (Num(0)) &
				") la t = " & TIME'image(now)
				severity ERROR;
				NrErori := NrErori + 1;
			end if;
			RezCorect := RezCorect + 1;	
			wait for CLK_PERIOD;
		end loop;
		report "Testare terminata cu " & INTEGER'image(NrErori) & " erori";
		wait ;
	end process;
	
	
	
end simul_tb;
	


	
