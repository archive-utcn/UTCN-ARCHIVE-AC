library ieee;
use ieee.std_logic_1164.all;

entity jk_ff is
	port ( j,k,s,r,clk : in std_logic;
	q,nq : out std_logic);
end jk_ff;

architecture arh of jk_ff is
begin
	process ( s,r,clk)
	begin
		if ( r = '1' ) then
			q <= '0' ;
			nq <= '1';
		elsif 
			s='1' then
			q <= '1';
			nq <= '0';
		elsif 
			clk'event and clk='1' then
			if j='0' and k='1'
				then q<='0' ; nq <= '1';
			elsif j='1' and k='0'
				then q<='1' ; nq <='1';
			elsif 
				j='1' and k='1'
				then  q<= not q'driving_value;
				nq<= not nq'driving_value;
			end if;
		end if;
	end process;	
end arh;