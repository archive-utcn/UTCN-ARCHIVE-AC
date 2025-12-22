-- 32. Modul de simulare pentru buffer three-state pe 8 biti	

-- Buffer three-state
library	IEEE;
use IEEE.STD_LOGIC_1164.all;

-- Entitate:
entity Buff3s_8 is
	port (
			X:  in STD_LOGIC_VECTOR (7 downto 0);
			E:  in STD_LOGIC;
			O: out STD_LOGIC_VECTOR (7 downto 0)
		  );
end entity;

--Arhitecutura:
architecture comportamental of Buff3s_8 is
begin
	process (X, E)
	begin
		if (E = '1') then
			O <= X;
		else
			O <= "ZZZZZZZZ";
		end if;
	end process;
end architecture;


-- Modul de simulare
library	IEEE;
use IEEE.STD_LOGIC_1164.all;

-- Entitate:
entity modul_buff3s is
end entity;

-- Arhitectura:
architecture comportamental of modul_buff3s is
	component Buff3s_8 is
		port (
				X:  in STD_LOGIC_VECTOR (7 downto 0);
				E:  in STD_LOGIC;
				O: out STD_LOGIC_VECTOR (7 downto 0)
			  );
	end component;
signal X, O: STD_LOGIC_VECTOR (7 downto 0);
signal E: STD_LOGIC;
begin
	UST: Buff3s_8 port map ( X, E, O);
	
	X <= "10110111";
	E <= '1', '0' after 20 ns;
end architecture;
	
