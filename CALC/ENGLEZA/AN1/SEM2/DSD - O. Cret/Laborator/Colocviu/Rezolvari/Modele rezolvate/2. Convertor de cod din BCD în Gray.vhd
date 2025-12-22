
-- 2. Convertor de cod din BCD în Gray ----------

-- Entitate:
entity BCD_to_Gray is
	
	-- Semanale de intrare si de iesire:	
	port (
			 BCD:  in BIT_VECTOR (3 downto 0);
			Gray: out BIT_VECTOR (3 downto 0)
		 );

end entity;	

-- Arhitectura: 
architecture comportamental of BCD_to_Gray is
begin
	process (BCD)
	begin
		case BCD is
			when "0000" =>  Gray <= "0000";	 --	0
			when "0001" =>  Gray <= "0001";	 --	1
			when "0010" =>  Gray <= "0011";	 --	2
			when "0011" =>  Gray <= "0010";	 --	3
			when "0100" =>  Gray <= "0110";	 --	4
			when "0101" =>  Gray <= "0111";	 --	5
			when "0110" =>  Gray <= "0101";  --	6
			when "0111" =>  Gray <= "0100";	 --	7
			when "1000" =>  Gray <= "1100";	 --	8
			when "1001" =>  Gray <= "1101";	 -- 9
			when others =>  Gray <= "1111";  -- >=10
		end case;
	end process;
end architecture;
