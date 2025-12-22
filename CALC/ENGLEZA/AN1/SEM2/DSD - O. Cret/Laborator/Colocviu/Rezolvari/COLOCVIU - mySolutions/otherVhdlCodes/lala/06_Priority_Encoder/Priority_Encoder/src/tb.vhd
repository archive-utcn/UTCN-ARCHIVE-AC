library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity tb is
end tb;

architecture ARCH of tb is

component ENCODER is
	port(X: in std_logic_vector(0 to 9);
	B: out bit_vector(3 downto 0));
end component;

shared variable END_SIM: boolean:=false;
signal X: std_logic_vector(0 to 9);
signal B: bit_vector(3 downto 0);
constant PERIOD: time:=100 ns;

begin
	UUT: ENCODER port map(X, B);
	STIMULI: process
	variable aux: std_logic_vector(0 to 9):="0000000000";
	begin
		--aux:="0000000000";
		X<=aux;
		wait for PERIOD/2;
		for i in 1 to 15 loop
			aux:=aux+1;
			X<=aux;
			wait for PERIOD/2;
		end loop;	  
		END_SIM:=true;
		wait;
	end process STIMULI;
end ARCH;

			