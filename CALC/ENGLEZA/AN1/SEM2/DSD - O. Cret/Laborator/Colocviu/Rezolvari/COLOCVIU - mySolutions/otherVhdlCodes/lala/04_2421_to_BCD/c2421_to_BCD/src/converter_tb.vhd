library ieee;
use ieee.std_logic_1164.all;

entity tb_c2421_to_BCD is
end tb_c2421_to_BCD;

architecture ARCH of tb_c2421_to_BCD is	

component c2421_to_BCD is
	port(C: in bit_vector(3 downto 0);
	B: out bit_vector(3 downto 0));
end component;

shared variable END_SIM: boolean:=FALSE;
signal C, B: bit_vector(3 downto 0);
constant PERIOD: TIME:=100 ns;

begin
	UUT: c2421_to_BCD port map(C, B);
	
	--CLK_GENERATOR: process
	--begin
	--	if not END_SIM then
		--	wait for PERIOD/2;
	--	else wait;
	--	end if;
	--end process CLK_GENERATOR;
	
	STIMULI: process
	begin	
		C<="0000";
		wait for PERIOD/2;	
		C<="0001";
		wait for PERIOD/2;	
		C<="0010";
		wait for PERIOD/2;		 
		C<="0011";
		wait for PERIOD/2; 
		 C<="0100";
		wait for PERIOD/2;
		C<="0101";
		wait for PERIOD/2; 
		C<="0110";
		wait for PERIOD/2;
		C<="0111";
		wait for PERIOD/2; 
		C<="1000";
		wait for PERIOD/2;
		C<="1001";
		wait for PERIOD/2;
		C<="1010";
		wait for PERIOD/2;
		C<="1011";
		wait for PERIOD/2;
		C<="1100";
		wait for PERIOD/2;
		C<="1101";
		wait for PERIOD/2;
		C<="1110";
		wait for PERIOD/2; 
		C<="1111";
		wait for PERIOD/2;
		END_SIM:=TRUE;
		wait;
	end process STIMULI;
end ARCH;
	