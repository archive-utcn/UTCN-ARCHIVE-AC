library ieee;
use ieee.std_logic_1164.all;

entity sumnexys is
	port(
	X 	: in std_logic_vector(7 downto 0); 
	Y 	: in std_logic_vector(7 downto 0);
	Clk : in std_logic;
	Rst : in std_logic;
	An  : out std_logic_vector (7 downto 0);
	Seg : out std_logic_vector (7 downto 0));
end sumnexys;

architecture sumnexys of sumnexys is

signal S : std_logic_vector(7 downto 0);
signal Tout : std_logic;
signal Data : std_logic_vector(31 downto 0);
begin
	sum: entity sum8bant port map(
		X => X,
		Y => Y,
		Tin => '0',
		S => S,
		Tout => Tout); 
	Data <= (X & Y & "0000000" & Tout & S);
	display: entity WORK.displ7seg port map(
		Clk => Clk,
		Rst => Rst,
		Data => Data,
		An => An,
		Seg => Seg);
end sumnexys;