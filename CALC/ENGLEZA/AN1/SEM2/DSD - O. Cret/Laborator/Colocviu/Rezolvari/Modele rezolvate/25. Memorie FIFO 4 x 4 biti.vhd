--  25. Memorie FIFO 4 x 4 biti

library	IEEE;
use IEEE.STD_LOGIC_1164.all;


-- Enititate:
entity FIFO_4x4 is
	
	-- Semnale de intrare si de iesire:
	port (
			CLK, R, WE, RE:  in STD_LOGIC;
					   Din:  in STD_LOGIC_VECTOR (3 downto 0);
					  Dout: out STD_LOGIC_VECTOR (3 downto 0);
			   Full, Empty: out STD_LOGIC
		  );

end entity;


-- Arhitectura
architecture comportamental of FIFO_4x4 is
shared variable tEmpty, tFull: STD_LOGIC;
shared variable	wPos: INTEGER range 0 to 4;

type mem is array (3 downto 0) of STD_LOGIC_VECTOR (3 downto 0);
shared variable M:mem := ("0000", "0000", "0000", "0000");
begin
	
	process (CLK, R, WE, RE, Din)
	begin
		if (CLK = '1') and (CLK'EVENT) then
			if (R = '1') then
				tEmpty :='1';
				tFull := '0';
				wPos := 0;
			elsif (WE = '1') and (tFull = '0') then
				M( wPos ) := Din;
				wPos := wPos + 1;
				tEmpty := '0';
				if (wPos = 4) then 
					tFull := '1';
				end if;
			elsif (RE = '1') and (tEmpty = '0') then
				Dout <= M(0);
				M(2 downto 0) := M(3 downto 1);  
				wPos := wPos - 1;
				tFull := '0';
				if (wPos = 0) then
					tEmpty := '1';
				end if;
			end if;
			Empty <= tEmpty;
			Full <= tFull;
		end if;
	end process;
end architecture;
	
	
				
			
					