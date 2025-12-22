library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity CNT_4B is
    port (
        CLK: in STD_LOGIC;
        RESET: in STD_LOGIC;
        ENABLE: in STD_LOGIC;		
        FULL: out STD_LOGIC;
        Q: out STD_LOGIC_VECTOR (3 downto 0)
    );
end CNT_4B;

architecture CNT_4B of CNT_4B is
	signal Qint: STD_LOGIC_VECTOR(3 downto 0); 

begin 
	process (CLK, RESET) 
	begin 
 		if RESET = '1' then 
			Qint <= (others => '0'); 
		elsif CLK='1' and CLK'event then 		
			if ENABLE = '1' then
				if Qint = 9 then 
					Qint <= (others => '0'); 
				else
					Qint <= Qint + 1; 
				end if; 
			end if;
		end if; 
	end process; 
	
	Q <= Qint; 

	FULL <= '1' when (Qint = 9) else '0'; 

end CNT_4B;
