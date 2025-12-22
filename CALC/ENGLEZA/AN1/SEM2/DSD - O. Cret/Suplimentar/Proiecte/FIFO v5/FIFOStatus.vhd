library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
entity STATUS is
	port(CE_WR,CE_RD,RESET: in std_logic;
	CLK: in std_logic;
	EMPTY,LAST,FULL: out std_logic);
end STATUS;
architecture ARHSTATUS of STATUS is
signal Q: std_logic_vector(3 downto 0);
component C4UD is
	port(U,D,CLK: in std_logic;
	Q: out std_logic_vector(3 downto 0));
end component;
component BistabilD is
	port ( D,CLK: in std_logic;
	Q: out std_logic); 
end component;
begin 
	Numarator: C4UD port map (U=>CE_WR, D=>CE_RD, CLK=>CLK, Q=>Q);
	process(CLK,CE_WR,CE_RD,Q)
	variable A,C,S0,S1,S2,S3,S4,S5,S6: std_logic; 
	variable B,VEMPTY: std_logic:='1';
	variable E,D,VLAST,VFULL:std_logic:='0';
	begin
		A:=(Q(0) and not(Q(2)) and not(Q(3)) and not(Q(3)));
		C:=(Q(1) and Q(2) and Q(3));
		S0:=(CE_RD and A); 
		S1:=(S0 or VEMPTY);
		B:=(S1 and not(CE_WR));
		S2:=(CE_WR and VLAST);
		S3:=(S2 or VFULL);
		E:=(S3 and not(CE_RD));	  
		S4:=(VLAST and not(CE_WR) and not(CE_RD));
		S5:=(C and CE_WR);
		S6:=(not(C) and VLAST and CE_RD);  
		D:=(S4 or S5 or S6);
		if CLK'EVENT and CLK='1' then
			if(RESET='1') then
				VEMPTY:='1';
				VLAST:='0';
				VFULL:='0';	
			else VEMPTY:=B;
				 VLAST:=D;
				 VFULL:=E;
			end if;
		end if;	   
		EMPTY<=VEMPTY;
		LAST<=VLAST;  
		FULL<=VFULL;
		end process;	
end architecture;
