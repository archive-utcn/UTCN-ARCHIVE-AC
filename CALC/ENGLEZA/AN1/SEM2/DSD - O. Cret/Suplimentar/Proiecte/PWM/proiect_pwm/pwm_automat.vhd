library IEEE;
use IEEE.STD_LOGIC_1164.all; 
use IEEE.STD_LOGIC_UNSIGNED.all; 
use IEEE.NUMERIC_STD.all;

entity pwm_automat is
	port(clk, sMod: in STD_LOGIC;
	aduty: out STD_LOGIC_VECTOR(7 downto 0));
end entity;

architecture pwm_automat of pwm_automat is
signal Acounter, A_duty: integer := 0;			-- Numarator componenta automata; Valoarea DC generat
signal sel, sec: STD_LOGIC := '1';				-- Selectie Count-up / Count-down; Selectie Numarator 2s / 5s
begin
	-- Componenta automata
	process(clk, sec, sMod)
	begin
	if sMod = '1' then -- Enable Counters
		if sec = '1' then -- Counter clock 2s
			if clk'event and clk = '1' then 
				Acounter <= Acounter + 1;		
				if Acounter = 390624 and sel = '1' then 	-- Count-up numarator 2s
					Acounter <= 0;
					A_duty <= A_duty + 1;
					
					if A_duty = 128 then
						A_duty <= A_duty - 1;
						sel <= '0';
					end if;
				elsif Acounter = 390624 and sel = '0' then	-- Count-down numarator 2s	
					Acounter <= 0;
					A_duty <= A_duty - 1;
					
					if A_duty = 1 then
						sec <= '0';
						sel <= '1';
					end if;				
				end if;
			end if; -- End Counter clock 2s
			
		elsif sec = '0' then -- Counter 5s
			if clk'event and clk = '1' then
				Acounter <= Acounter + 1;		
				
				if Acounter = 976562 and sel = '1' then 	-- Count-up numarator 5s
					Acounter <= 0;
					A_duty <= A_duty + 1;
					
					if A_duty = 128 then
						A_duty <= A_duty - 1;
						sel <= '0';
					end if;
				elsif Acounter = 976562 and sel = '0' then	-- Count-down numarator 5s
					Acounter <= 0;
					A_duty <= A_duty - 1;
					
					if A_duty = 1 then
						sec <= '1';
						sel <= '1';
					end if;				
				end if;
			end if; -- End Counter 5s
		end if; -- End Counters
	end if; -- End enable counters
	end process;
	-- End componenta Automata
	
	aduty <= std_logic_vector(to_unsigned(A_duty, 8));
	
end pwm_automat;