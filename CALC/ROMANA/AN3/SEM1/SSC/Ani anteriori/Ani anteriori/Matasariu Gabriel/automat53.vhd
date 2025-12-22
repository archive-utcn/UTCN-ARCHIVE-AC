library ieee;
use ieee.std_logic_1164.all;

entity automat is
	port(
	Clk		: in std_logic;
	Rst		: in std_logic;	
	Frame	: in std_logic;
	Hit		: in std_logic;
	OE		: out std_logic;
	GO		: out std_logic;
	ACT		: out std_logic);
end automat;

architecture automat_stare of automat is
type TIP_STARE is (idle,decode,busy,xfer1,xfer2);
signal Stare : TIP_STARE;
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
	
	proc2: process(Stare)
	begin
		case Stare is
			when idle =>
			OE <= '0';GO <= '0';ACT <= '0';
			when decode =>
			OE <= '0';GO <= '0';ACT <= '0';
			when busy =>
			OE <= '0';GO <= '0';ACT <= '1';
			when xfer1 =>
			OE <= '1';GO <= '1';ACT <= '1';
			when xfer2 =>
			OE <= '1';GO <= '0';ACT <= '1';
	   	end case;
	end process;
	
end automat_stare;
			
					
					