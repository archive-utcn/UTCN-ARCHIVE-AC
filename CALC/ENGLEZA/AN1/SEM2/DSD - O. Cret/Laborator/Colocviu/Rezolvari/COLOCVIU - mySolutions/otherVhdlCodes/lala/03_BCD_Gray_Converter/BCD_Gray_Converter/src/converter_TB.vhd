library ieee;
use ieee.std_logic_1164.all;

entity tb_BCD_to_GRAY is
end tb_BCD_to_GRAY;

architecture ARCH of tb_BCD_to_GRAY is	

component BCD_to_GRAY is
	port(B: in bit_vector(3 downto 0);
	G: out bit_vector(3 downto 0));
end component;

shared variable END_SIM: boolean:=FALSE;
signal B, G: bit_vector(3 downto 0);
constant PERIOD: TIME:=100 ns;

begin
	UUT: BCD_to_GRAY port map(B, G);
	
	--CLK_GENERATOR: process
	--begin
	--	if not END_SIM then
		--	wait for PERIOD/2;
	--	else wait;
	--	end if;
	--end process CLK_GENERATOR;
	
	STIMULI: process
	begin	
		B<="0000";
		assert B="0000" report "Error";
		wait for PERIOD/2;	
		B<="0001";
		assert B="0001" report "Error";
		wait for PERIOD/2;	
		B<="0010";
		assert B="0010" report "Error";
		wait for PERIOD/2;		 
		B<="0011";
		assert B="0011" report "Error";
		wait for PERIOD/2; 
		 B<="0100";
		assert B="0100" report "Error";
		wait for PERIOD/2;
		B<="0101";
		assert B="0101" report "Error";
		wait for PERIOD/2; 
		B<="0110";
		assert B="0110" report "Error";
		wait for PERIOD/2;
		B<="0111";
		assert B="0111" report "Error";
		wait for PERIOD/2; 
		B<="1000";
		assert B="1000" report "Error";
		wait for PERIOD/2;
		B<="1001";
		assert B="1001" report "Error";
		wait for PERIOD/2;
		B<="1010";
		assert B="1010" report "Error";
		wait for PERIOD/2;
		B<="1011";
		assert B="1011" report "Error";
		wait for PERIOD/2;
		B<="1100";
		assert B="1100" report "Error";
		wait for PERIOD/2;
		B<="1101";
		assert B="1101" report "Error";
		wait for PERIOD/2;
		B<="1110";
		assert B="1110" report "Error";
		wait for PERIOD/2; 
		B<="1111";
		assert B="1111" report "Error";
		wait for PERIOD/2;
		END_SIM:=TRUE;
		wait;
	end process STIMULI;
end ARCH;
	