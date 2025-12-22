entity link is
end entity link;

architecture link_arch of link is
attribute foreign of link_arch : architecture is
	"VHPI $aldec\bin\pipe_ahdl; vhpi_link";
begin
end architecture link_arch;

library IEEE;
use IEEE.std_logic_1164.all;

entity div_rem_wrapp is
end div_rem_wrapp;

architecture div_rem_wrapp_arch of div_rem_wrapp is

signal		clk : STD_LOGIC;
signal		rst : STD_LOGIC;
signal		start : STD_LOGIC;
signal		a : STD_LOGIC_VECTOR(7 downto 0);
signal		b : STD_LOGIC_VECTOR(7 downto 0);
signal		done : STD_LOGIC;
signal		quot : STD_LOGIC_VECTOR(3 downto 0);
signal		remain : STD_LOGIC_VECTOR(3 downto 0);

component div_rem is
	port(
		clk : in STD_LOGIC;
		rst : in STD_LOGIC;
		start : in STD_LOGIC;
		a : in STD_LOGIC_VECTOR(7 downto 0);
		b : in STD_LOGIC_VECTOR(7 downto 0);
		done : out STD_LOGIC;
		quot : out STD_LOGIC_VECTOR(3 downto 0);
		remain : out STD_LOGIC_VECTOR(3 downto 0)
		);
end component div_rem;

component link is
end component link;

begin
	
	int : link;
	
	vhdl_part : div_rem
	port map (
		clk,
		rst,
		start,
		a,
		b,
		done,
		quot,
		remain
		);
		
end div_rem_wrapp_arch;