library ieee;
use ieee.std_logic_1164.all;

entity mulnexys is
	port(
	X 	: in std_logic_vector(7 downto 0); 
	Y 	: in std_logic_vector(7 downto 0);
	Clk : in std_logic;
	Rst : in std_logic;
	An  : out std_logic_vector (7 downto 0);
	Seg : out std_logic_vector (7 downto 0));
end mulnexys;

architecture mulnexys of mulnexys is

signal P : std_logic_vector(15 downto 0);
signal Data : std_logic_vector(31 downto 0);
begin
	sum: entity WORK.mul port map(
		X => X,
		Y => Y,
		P => P); 
	Data <= (X & Y & P);
	display: entity WORK.displ7seg port map(
		Clk => Clk,
		Rst => Rst,
		Data => Data,
		An => An,
		Seg => Seg);
end mulnexys;