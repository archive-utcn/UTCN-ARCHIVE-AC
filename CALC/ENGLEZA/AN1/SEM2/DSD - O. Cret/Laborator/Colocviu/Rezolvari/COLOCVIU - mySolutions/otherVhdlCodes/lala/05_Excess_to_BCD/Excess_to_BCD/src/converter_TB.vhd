library ieee;
use ieee.std_logic_1164.all;

entity tb is
end tb;

architecture ARCH of tb is

component EXCESS_TO_BCD is
	port(E: in bit_vector(3 downto 0);
	B: out bit_vector(3 downto 0));
end component;

shared variable END_SIM: boolean:=FALSE;
signal E, B: bit_vector(3 downto 0);
constant PERIOD: time:=100 ns;

begin
	UUT: EXCESS_TO_BCD port map(E, B);
	STIMULI: process
	begin
		E<="0000";
		wait for PERIOD/2;
		E<="0001";
		wait for PERIOD/2;
		E<="0010";
		wait for PERIOD/2;
		E<="0011";
		wait for PERIOD/2;
		E<="0100";
		wait for PERIOD/2;
		E<="0101";
		wait for PERIOD/2;
		E<="0110";
		wait for PERIOD/2;
		E<="0111";
		wait for PERIOD/2;
		E<="1000";
		wait for PERIOD/2;
		E<="1001";
		wait for PERIOD/2;
		E<="1010";
		wait for PERIOD/2;
		E<="1011";
		wait for PERIOD/2;
		E<="1100";
		wait for PERIOD/2;
		E<="1101";
		wait for PERIOD/2;
		E<="1110";
		wait for PERIOD/2;
		E<="1111";
		wait for PERIOD/2;
		END_SIM:=true;
		wait;
	end process STIMULI;
end ARCH;

		