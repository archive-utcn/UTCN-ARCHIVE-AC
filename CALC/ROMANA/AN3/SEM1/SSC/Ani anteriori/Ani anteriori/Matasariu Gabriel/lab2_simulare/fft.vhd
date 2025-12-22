library IEEE;
use IEEE.std_logic_1164.all;


entity fft is 
	port(
	T: in std_logic;
	Clk: in std_logic;
	Rst: in std_logic;
	Q: out std_logic;
	Qn: out std_logic);
end fft;
architecture fft_behav of fft is
signal Temp: std_logic;
begin
	process(Rst,Clk)
	begin
		if(Clk'event and Clk='1') then
			if(Rst = '1') then 
				Temp <= '0';
			else
				Temp <= T xor Temp;
			end if;
		end if;
	end process;
	Q <= Temp;
	Qn <= not(Temp);

end fft_behav;
	