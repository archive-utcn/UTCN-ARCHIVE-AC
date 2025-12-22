-- 5. Codificator zecimal – BCD

-- Entitate:
entity zecimal_to_BCD is
	
	-- Semanale de intrare si de iesire:
	port (
	          X:  in BIT_VECTOR (9 downto 0);
			BCD: out BIT_VECTOR (3 downto 0)
		  );
		  
end entity;

-- Arhitectura:
architecture comportamental of zecimal_to_BCD is
begin
	process (X)
	begin
		   if X(0) = '1' then BCD <= "0000";   -- 0
		elsif X(1) = '1' then BCD <= "0001";   -- 1
		elsif X(2) = '1' then BCD <= "0010";   -- 2
		elsif X(3) = '1' then BCD <= "0011";   -- 3
		elsif X(4) = '1' then BCD <= "0100";   -- 4
		elsif X(5) = '1' then BCD <= "0101";   -- 5
		elsif X(6) = '1' then BCD <= "0110";   -- 6
		elsif X(7) = '1' then BCD <= "0111";   -- 7
		elsif X(8) = '1' then BCD <= "1000";   -- 8
		elsif X(9) = '1' then BCD <= "1001";   -- 9
						 else BCD <= "1111";   -- nici o intrare activata
		   end if;
		
	end process;
	
end architecture;
			