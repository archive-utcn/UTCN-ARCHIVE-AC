library ieee;
use ieee.std_logic_1164.all;

entity automat2 is
	port(
	Clk		: in std_logic;
	Rst		: in std_logic;	
	Frame	: in std_logic;
	Hit		: in std_logic;
	OE		: out std_logic;
	GO		: out std_logic;
	ACT		: out std_logic);
end automat2;

architecture automat_stare2 of automat2 is
signal 	Stare	: std_logic_vector(3 downto 0);
constant  	idle	: std_logic_vector(3 downto 0) := "0000";
constant 	decode	: std_logic_vector(3 downto 0) := "1000";
constant	busy	: std_logic_vector(3 downto 0) := "0001";
constant xfer1		: std_logic_vector(3 downto 0) := "0111";
constant xfer2		: std_logic_vector(3 downto 0) := "0101";
begin
	proc1: process(Clk)
	begin
		if rising_edge(Clk) then
			if Rst = '1' then
				Stare <= idle;
			else 
				case Stare is
					when idle =>
					if Frame = '1' then
						Stare <= decode;
					else Stare <= idle;
					end if;
					when decode =>
					if Hit = '1' then 
						Stare <= xfer1;
					else Stare <= busy;
					end if;
					when xfer1 =>
					if Frame = '1' then
						Stare <= xfer2;
					else Stare <= xfer1;
					end if;
					when busy =>
					if Frame = '1' then
						Stare <= idle;
					else Stare <= busy;
					end if;
					when xfer2 =>
					Stare <= idle;
					when others =>
					Stare <= idle;
				end case;
			end if;
			end if;
	end process;
	
	OE <= Stare(2);
	GO <= Stare(1);
	ACT <= Stare(0);
	
end automat_stare2;
			
					
					