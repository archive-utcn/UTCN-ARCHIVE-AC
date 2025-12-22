library IEEE;
use IEEE.STD_LOGIC_1164.all; 
use IEEE.STD_LOGIC_UNSIGNED.all; 
use IEEE.NUMERIC_STD.all;

entity pwm is
	port(clk, sMod, btn_clr: in STD_LOGIC;				-- Clock 50Mhz; Selectie Mod; buton de clear p/u afisoare
		Switch: in STD_LOGIC_VECTOR (6 downto 0); 		-- Incarcarea valorii DC manuale
		pwm_led: out STD_LOGIC_VECTOR (7 downto 0);		-- Semnalul generat de PWM pe toate led-urile
		a_segment: out STD_LOGIC_VECTOR(6 downto 0);	-- Segmentele afisorului
		a_anod: out STD_LOGIC_VECTOR(3 downto 0));		-- Anozii afisorului
end entity;

architecture proiect of pwm is
-- Componenta manuala -----------------------------
signal dutyM: STD_LOGIC_VECTOR (6 downto 0);			-- Valoarea DC incarcata de pe switch-uri
signal M_duty: integer := 0;							-- Valoarea dutyM in integer
-- End Componenta manuala -------------------------

-- Componenta automata ----------------------------
component pwm_automat is
	port(clk, sMod: in STD_LOGIC;
	aduty: out STD_LOGIC_VECTOR(7 downto 0));
end component;

signal A_duty: integer;
signal dutyA: STD_LOGIC_VECTOR(7 downto 0);
-- End Componenta automata ------------------------

-- PWM --------------------------------------------
signal pwm_counter, pwm_duty: integer :=0; 				-- Numarator componenta PMW; Semnalul multiplexat de DC
-- End PWM ----------------------------------------

-- BCD --------------------------------------------
component bcd is
	port(in_vect: in STD_LOGIC_VECTOR(7 downto 0);
		out_vect: out STD_LOGIC_VECTOR(15 downto 0));
end component;

signal duty: STD_LOGIC_VECTOR(7 downto 0);	 			-- conversia in bit vector a pwm_duty
signal val_bcd: STD_LOGIC_VECTOR(15 downto 0);  		-- vector procesat BCD	
-- End BCD -----------------------------------------

-- Afisor 7 segmente -------------------------------
component afis is
	port(value: in STD_LOGIC_VECTOR(15 downto 0);
		clk: in STD_LOGIC;
		clr: in STD_LOGIC;
		display: out STD_LOGIC_VECTOR(6 downto 0);
		anod: out STD_LOGIC_VECTOR(3 downto 0));
end component;

signal btn1, btn2, btn3, clr: STD_LOGIC; 				-- Debounce buton
-- End Afisor ---------------------------------------

begin
-- Componenta manuala
	dutyM <= Switch;
	M_duty <= TO_INTEGER(unsigned(dutyM));				-- Convert from BIT_VECTOR to Integer
	
-- Componenta automata
	auto: pwm_automat port map(clk, sMod, dutyA);
	A_duty <= TO_INTEGER(unsigned(dutyA));				-- Convert from BIT_VECTOR to Integer
	
-- Componenta PWM 
	-- PWM counter
	process(clk)	   							
	begin
		if clk'event and clk = '1' then
			pwm_counter <= pwm_counter + 1;		
			if pwm_counter = 127 then
				pwm_counter <= 0;
			end if;
		end if;
	end process;
	
	-- PWM DC
	process(sMod, M_duty, A_duty)
	begin
		if sMod = '0' then
			pwm_duty <= M_duty;
		else
			pwm_duty <= A_duty;
		end if;
	end process;
	
	-- PWM signal
	process(pwm_counter, pwm_duty)
	begin
		if pwm_duty = 0 then
			pwm_led <= (others => '0');
		elsif pwm_counter < pwm_duty then
			pwm_led <= (others => '1');
		else 
			pwm_led <= (others => '0');
		end if;
	end process;
	
-- Convert to BCD valoarea actuala DC
	duty <= std_logic_vector(to_unsigned(pwm_duty, 8));
	transform: bcd port map(duty, val_bcd);
	
-- Afisarea valorii actuale DC
	-- Debounce buton clr
	process(clk, btn_clr)
	begin
		if clk'event and clk = '1' then
			btn1 <= btn_clr;
			btn2 <= btn1;
			btn3 <= btn2;
		end if;
	end process;
	clr <= btn1 and btn2 and btn3; 
	
	afisare: afis port map(val_bcd, clk, clr, a_segment, a_anod);
	
end proiect;