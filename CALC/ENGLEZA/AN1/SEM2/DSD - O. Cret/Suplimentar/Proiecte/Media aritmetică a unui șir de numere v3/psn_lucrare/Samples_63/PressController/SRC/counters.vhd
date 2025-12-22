library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_SIGNED.all;

entity Counters is
	port
		(
		CLK, CLK_T, DET : in STD_LOGIC;
		clr, CET, CEL : in STD_LOGIC;
		TIMER : out STD_LOGIC_VECTOR (9 downto 0);
		TIM : out STD_LOGIC;
		LIMIT : out STD_LOGIC_VECTOR (5 downto 0);
		LIM :out STD_LOGIC
		);
end entity Counters;

architecture Behaviour of Counters is
	begin
		time_down : process (CLK_T, clr, CET, DET) is
		variable tim_cnt : STD_LOGIC_VECTOR (9 downto 0);
			begin
				if clr = '0' or DET = '1' then
					tim_cnt := "0001011010";
					TIM <= '0';
				else
					if rising_edge (CLK_T) then
						if CET ='1' then
							tim_cnt := "0001011010";
							TIM <='0';
						else
							if tim_cnt > 0 then
								tim_cnt := tim_cnt - 1;
								TIM <= '0';
							else
								TIM <= '1';
							end if;
						end if;
					end if;
				end if;
				TIMER <= tim_cnt;
			end process time_down;

		limit_down : process (clr, CLK, CEL, DET)
			variable lim_cnt : std_logic_vector (5 downto 0);
			begin
				if clr = '0' then
					lim_cnt := "000111";
					LIM <= '0';
				else
					if DET ='1' then
						if CEL = '0' then
							if rising_edge (CLK) then
								if lim_cnt > 0 then
									lim_cnt := lim_cnt -1;
									LIM <= '0';
								else
									LIM <= '1';
								end if;
							end if;
						else
							if lim_cnt > 0 then
								LIM <= '0';
							else
								LIM <= '1';
							end if;
						end if;
					else
						if lim_cnt > 0 then
							LIM <= '0';
						else
							LIM <= '1';
						end if;
					end if;
				end if;
			  LIMIT <= lim_cnt;
			end process limit_down;
	end Behaviour;
