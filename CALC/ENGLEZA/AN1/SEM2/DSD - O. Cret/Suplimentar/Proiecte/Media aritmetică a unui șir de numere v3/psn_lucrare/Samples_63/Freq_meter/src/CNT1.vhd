CNT1 :
process (enable1, clk, reset)
-- declarations	
variable qint: std_logic_vector(3 downto 0);
begin
 		if reset = '1' then 
			qint := (others => '0'); 
		elsif clk='1' and clk'event then 		
			if enable1 = '1' then
				if qint = 9 then 
						qint := (others => '0'); 
						full1 <= '1';
				else
					qint := qint + 1; 
					full1 <= '0';
				end if; 
			end if;
		end if;  
			bcd_d <= qint; 
end process;




