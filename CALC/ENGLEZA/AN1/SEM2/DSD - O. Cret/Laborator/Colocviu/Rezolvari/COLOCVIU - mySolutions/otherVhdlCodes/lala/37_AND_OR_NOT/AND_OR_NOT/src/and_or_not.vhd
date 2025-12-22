library ieee;
use ieee.std_logic_1164.all;

entity circuit is
	port(a, b, c, d:in bit;
	f: out bit);
end circuit;

architecture a of circuit is
component inverter is
	port(x: in bit;
	y: out bit);
end component;
component and_gate is
	port(x, y: in bit;
	z: out bit);
end component;
component or_gate is
	port(x, y: in bit;
	z: out bit);
end component;
signal aux1, aux2, aux3: bit;
begin
	T1: and_gate port map (a, b, aux1);
	T2: and_gate port map(c, d, aux2);
	T3: or_gate port map (aux1, aux2, aux3);
	T4: inverter port map (aux3, f);
end a;