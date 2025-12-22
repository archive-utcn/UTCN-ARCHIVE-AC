entity Shifter is
	port (A:inout bit_vector(3 downto 0);
	CLK:in bit);
end entity;

architecture ARH_Shift of Shifter is
signal A_xor:bit;
begin
	process(CLK)
	begin		 
		if(CLK'event and CLK='1') then 
			if(A="0000") then A<="0001";
				else
		A_xor<=A(3) xor A(2);
		A<=A sll 1;
		A(0)<=A_xor;
		end if;		 
		end if;
	end process;
end architecture;

	
	