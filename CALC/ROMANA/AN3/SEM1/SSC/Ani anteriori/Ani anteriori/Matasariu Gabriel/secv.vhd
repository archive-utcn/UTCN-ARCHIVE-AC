library ieee;
use ieee.std_logic_1164.all;

entity secv is
	port(
	Clk		: in std_logic;
	Rst		: in std_logic;	
	In_secv	: in std_logic;
	Found	: out std_logic
	);
end secv; 

architecture secv_a of secv is
type TIP_STARE is (st0,st1,st2,st3,st4,st5,st6,st7);
signal Stare : TIP_STARE;
begin
	proc1: process(Clk)
	begin
		if rising_edge(Clk) then
			if Rst = '1' then
				Stare <= st0;  
				Found <= '0';
			else 
				case Stare is
					when st0 =>
					if In_secv = '1' then
						Stare <= st1;
						Found <= '0';
					else
						Stare <= st0;
						Found <= '0';
					end if;
					
					when st1 =>
					if In_secv = '1' then
						Stare <= st2;
						Found <= '0';
					else
						Stare <= st0;
						Found <= '0';
					end if;
					
					when st2 =>
					if In_secv = '1' then
						Stare <= st3;
						Found <= '0';
					else
						Stare <= st0;
						Found <= '0';
					end if;
					
					when st3 =>
					if In_secv = '1' then
						Stare <= st3;
						Found <= '0';
					else
						Stare <= st4;
						Found <= '0';
					end if;
					
					when st4 =>
					if In_secv = '1' then
						Stare <= st5;
						Found <= '0';
					else
						Stare <= st0;
						Found <= '0';
					end if;
					
					when st5 =>
					if In_secv = '1' then
						Stare <= st2;
						Found <= '0';
					else
						Stare <= st6;
						Found <= '0';
					end if;
					
					when st6 =>
					if In_secv = '1' then
						Stare <= st7;
						Found <= '0';
					else
						Stare <= st0;
						Found <= '0';
					end if;
					
					when st7 =>
					if In_secv = '1' then
						Stare <= st2;
						Found <= '1';
					else
						Stare <= st0;
						Found <= '0';
					end if;
					
					when others =>
					Stare <= st0;
				end case;
			end if;
			end if;
	end process;
	
end secv_a;