-- AND2 gate

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity and2 is
	port(
		I0 : in std_logic;
		I1 : in std_logic;
		O : out std_logic);
end and2;

architecture AND2_ARCH of and2 is
begin
	process(I0,I1)
		begin
			O <= I0 and I1;
	end process;
end AND2_ARCH;  

-- OR2 gate

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity or2 is
	port(
		I0 : in std_logic;
		I1 : in std_logic;
		O : out std_logic);
end or2;

architecture OR2_ARCH of or2 is
begin
	process(I0,I1)
		begin
			O <= I0 or I1;
		end process;
end OR2_ARCH;  


-- INV gate

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity inv is
	port (
		I : in std_logic;
		O : out std_logic);
end inv;

architecture INV_ARCH of inv is
begin
	process(I)
		begin
			O <= not I;
	end process;
end INV_ARCH;

 -- VHDL model 8 bits Johnson's Counter with Asynchronous Reset

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity johnson8 is
	port (
		CLK: in STD_LOGIC;
		RESET: in STD_LOGIC;
		Q: out STD_LOGIC_VECTOR (7 downto 0));
end johnson8;

architecture JOHNSON8_ARCH of johnson8 is

	signal Q_I : STD_LOGIC_VECTOR (7 downto 0);
begin

process (CLK, RESET)
	variable I: INTEGER;
	begin
		if RESET='1' then
			-- asynchronous reset
			for I in 0 to 7 loop
    		   Q_I(I) <= '1';
			end loop;
		elsif CLK'event and CLK='1' then
			-- shifting bits
			for I in 1 to 7 loop
				Q_I(I) <= Q_I(I-1);
			end loop;
			-- inverted feedback 
			Q_I(0) <= not Q_I(7);
			end if;
end process;

process (Q_I)
	begin
		Q <= Q_I; 
end process;	

end JOHNSON8_ARCH;

-- VHDL Model of 2 to 1 Multiplexer with 5 bits output. 
-- Input A is 4-bits, input B is 5-bits
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity mux is
	port (
		A: in STD_LOGIC_VECTOR (3 downto 0);
		B: in STD_LOGIC_VECTOR (4 downto 0);
		Y: out STD_LOGIC_VECTOR (4 downto 0);
		S: in STD_LOGIC);
end mux;

architecture MUX_ARCH of mux is

begin
	Y <= B when (S='1') else
			'0' & A;	-- bits concatenation
end MUX_ARCH;		 
-- VHDL model of Pseudo Random Numbers Generator with Asynchronous Reset
-- and Count Enable, for numbers from 1 to 11
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity gen is
	port (
		CLK: in STD_LOGIC;
		RES: in STD_LOGIC;
		DO: out STD_LOGIC_VECTOR (3 downto 0) ;
		ENC: in STD_LOGIC);
end gen;

architecture TOP_LEVEL of gen is

-- auxiliary signal declaration
signal DOINT: STD_LOGIC_VECTOR (3 downto 0):="0000";

begin

process ( CLK,RES )
begin
	if RES='1' then
		-- asynchronous initialization
		DOINT <= "0001";
	else
		if CLK'EVENT and CLK = '1' then
			-- clock enable 
			if ENC = '1' then
				DOINT(3) <= DOINT(2);
				DOINT(2) <= DOINT(1);
				DOINT(1) <= DOINT(0);
				DOINT(0) <= DOINT(0) xor DOINT(3);
			end if;
		end if;
	end if;
end process;

DO(3) <= DOINT(3) and (DOINT(3) nand DOINT(2));
DO(2) <= DOINT(2);
DO(1) <= DOINT(1);
DO(0) <= DOINT(0);

end TOP_LEVEL;