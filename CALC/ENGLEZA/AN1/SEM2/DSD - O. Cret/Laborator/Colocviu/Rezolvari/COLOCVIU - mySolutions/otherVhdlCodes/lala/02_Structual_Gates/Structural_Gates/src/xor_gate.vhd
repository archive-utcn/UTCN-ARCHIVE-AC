library ieee;
use ieee.std_logic_1164.all;

entity XOR_gate is
	port(x, y: in bit;
	z: out bit);
end XOR_gate;

architecture A of XOR_gate is

component INVERTER is
	port(x: in bit;
	y: out bit);
end component;

component AND_gate is
	port(x, y: in bit;
	z: out  bit);
end component;

component OR_gate is
	port(x, y: in bit;
	z: out  bit);
end component;

signal nx, ny, z1, z2: bit;
begin
	
	TAG1: INVERTER port map(x, nx);
	TAG2: INVERTER port map(y, ny);
	TAG3: AND_gate port map(x, ny, z1);
	TAG4: AND_gate port map(nx, y, z2);
	TAG5: OR_gate port map(z1, z2, z);
	
end A;
