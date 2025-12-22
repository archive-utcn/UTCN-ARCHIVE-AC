library ieee; 
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity sumator8 is
  port(
    A,B: in std_logic_vector(7 downto 0);
    SUM : out std_logic_vector(8 downto 0));
end sumator8;		

architecture sumator8 of sumator8 is
signal SUMA_AUX: std_logic_vector(8 downto 0);		 
  begin
    SUMA_AUX <= conv_std_logic_vector((conv_integer(A) + conv_integer(B)),9);
    SUM <= SUMA_AUX(8 downto 0);
end sumator8; 	 

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity sumator9 is
  port(
    A,B : in std_logic_vector(8 downto 0);
    SUM : out std_logic_vector(9 downto 0));
end sumator9;		

architecture sumator9 of sumator9 is
signal SUMA_AUX: std_logic_vector(9 downto 0);		 
  begin
    SUMA_AUX <= conv_std_logic_vector((conv_integer(A) + conv_integer(B)),10);
    SUM <= SUMA_AUX(9 downto 0);
end sumator9; 

					
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;  
use ieee.std_logic_unsigned.all;  
entity medie is
    generic ( LUNG : integer :=  8 );
	port (A,B,C : in std_logic;
      	  CLK : in std_logic;
          NR_GEN : out std_logic_vector (LUNG-1 downto 0);
	      MED:out std_logic_vector(7 downto 0));  
end medie;

architecture medie of medie is   
signal REG1, REG2, REG3, REG4 : std_logic_vector(7 downto 0);	
signal SUM1,SUM2 : std_logic_vector(8 downto 0);
signal SUM3 : std_logic_vector(9 downto 0);
signal PRIM4:std_logic_vector(3 downto 0); 
signal ULTIM4:std_logic_vector(3 downto 0);	 
signal MEDIE1,MEDIE2:std_logic_vector(3 downto 0);  
signal SEGMENT70: std_logic_vector(6 downto 0):="1111111";  
signal SEGMENT71: std_logic_vector(6 downto 0):="1111111";
signal SEGMENT72: std_logic_vector(6 downto 0):="1111111";
signal SEGMENT73: std_logic_vector(6 downto 0):="1111111"; 
component sumator8 is
	port( A, B : in std_logic_vector(7 downto 0);
    	  SUM : out std_logic_vector(8 downto 0));
end component;	  
component sumator9 is
    port( A, B : in std_logic_vector(8 downto 0);
    	  SUM : out std_logic_vector(9 downto 0));
end component;	
begin
P1:process(clk)
variable NR_GEN_AUX : std_logic_vector (LUNG-1 downto 0):=(others=>'1');
variable XOR01 : std_logic := '0';		 
variable I,J,L:integer:=0; 
  begin  								
  if(CLK'event) then  
	 if (A='1'and B='1'and C='0') then
       if I<15 then
		 XOR01 := NR_GEN_AUX(LUNG-5) xor NR_GEN_AUX(LUNG-6);
         NR_GEN_AUX(LUNG-5 downto 1) := NR_GEN_AUX(LUNG-6 downto 0);
         NR_GEN_AUX(0) := XOR01;		
		 NR_GEN_AUX(LUNG-1 downto LUNG-4) := (others=>'0');	
		 I:=I+1;
	  end if;
	end if;
	if (A='1'and B='1'and C='1') then
	  if J<255 then
		 XOR01 := NR_GEN_AUX(LUNG-1) xor NR_GEN_AUX(LUNG-2);
         NR_GEN_AUX(LUNG-1 downto 1) := NR_GEN_AUX(LUNG-2 downto 0);
         NR_GEN_AUX(0) := XOR01;	
		 J:=J+1;
	  end if; 
	end if;
	if (A='0'and B='0'and C='0') then  
	   NR_GEN_AUX(LUNG-1 downto 0) := (others=>'0');	 
	end if;
	if (A='0'and B='0'and C='1') then  	
	  if L<4 then
		 XOR01 := NR_GEN_AUX(LUNG-1) xor NR_GEN_AUX(LUNG-2);
         NR_GEN_AUX(LUNG-1 downto 1) := NR_GEN_AUX(LUNG-2 downto 0);
         NR_GEN_AUX(0) := XOR01;		
	     L:=L+1;
	  end if;
	end if;
  end if;
  REG1 <= NR_GEN_AUX;
  REG2 <= REG1;
  REG3 <= REG2;
  REG4 <= REG3;	
  NR_GEN <= NR_GEN_AUX;
  PRIM4(3 downto 0)<=NR_GEN_AUX(7 downto 4) ;
  case  PRIM4(3 DOWNTO 0) is
    when "0000"=> SEGMENT70 <="0000001";  -- '0'
    when "0001"=> SEGMENT70 <="1001111";  -- '1'
    when "0010"=> SEGMENT70 <="0010010";  -- '2'
    when "0011"=> SEGMENT70 <="0000110";  -- '3'
    when "0100"=> SEGMENT70 <="1001100";  -- '4'
    when "0101"=> SEGMENT70 <="0100100";  -- '5'
    when "0110"=> SEGMENT70 <="0100000";  -- '6'
    when "0111"=> SEGMENT70 <="0001111";  -- '7'
    when "1000"=> SEGMENT70 <="0000000";  -- '8'
    when "1001"=> SEGMENT70 <="0000100";  -- '9'
    when "1010"=> SEGMENT70 <="0001000";  -- 'A'
    when "1011"=> SEGMENT70 <="1100000";  -- 'b'
	when "1100"=> SEGMENT70 <="0110001";  -- 'C'
	when "1101"=> SEGMENT70 <="1000010";  -- 'D'
	when "1110"=> SEGMENT70 <="0110000";  -- 'E'
	when "1111"=> SEGMENT70 <="0111000";  -- 'F'
    when others=> SEGMENT70 <="1111111";
  end case;								   
  ULTIM4(3 downto 0)<=NR_GEN_AUX(3 downto 0);											 
  case  ULTIM4(3 DOWNTO 0) is
    when "0000"=> SEGMENT71 <="0000001";  -- '0'
    when "0001"=> SEGMENT71 <="1001111";  -- '1'
    when "0010"=> SEGMENT71 <="0010010";  -- '2'
    when "0011"=> SEGMENT71 <="0000110";  -- '3'
    when "0100"=> SEGMENT71 <="1001100";  -- '4'
    when "0101"=> SEGMENT71 <="0100100";  -- '5'
    when "0110"=> SEGMENT71 <="0100000";  -- '6'
    when "0111"=> SEGMENT71 <="0001111";  -- '7'
    when "1000"=> SEGMENT71 <="0000000";  -- '8'
    when "1001"=> SEGMENT71 <="0000100";  -- '9'
    when "1010"=> SEGMENT71 <="0001000";  -- 'A'
	when "1011"=> SEGMENT71 <="1100000";  -- 'b'
	when "1100"=> SEGMENT71 <="0110001";  -- 'C'
	when "1101"=> SEGMENT71 <="1000010";  -- 'D'
	when "1110"=> SEGMENT71 <="0110000";  -- 'E'
	when "1111"=> SEGMENT71 <="0111000";  -- 'F'
    when others=> SEGMENT71 <="1111111";
  end case;	 
end process P1;

C1:sumator8 port map(REG1,REG2,SUM1);
C2:sumator8 port map(REG3,REG4,SUM2);	
C3:sumator9 port map(SUM1,SUM2,SUM3); 
 
P2:process(SUM3)
begin
  MED<=SUM3(9 downto 2);   
  MEDIE1(3 downto 0)<=SUM3(9 downto 6);
  case MEDIE1(3 DOWNTO 0) is
    when "0000"=> SEGMENT72 <="0000001";  -- '0'
    when "0001"=> SEGMENT72 <="1001111";  -- '1'
    when "0010"=> SEGMENT72 <="0010010";  -- '2'
    when "0011"=> SEGMENT72 <="0000110";  -- '3'
    when "0100"=> SEGMENT72 <="1001100";  -- '4'
    when "0101"=> SEGMENT72 <="0100100";  -- '5'
    when "0110"=> SEGMENT72 <="0100000";  -- '6'
    when "0111"=> SEGMENT72 <="0001111";  -- '7'
    when "1000"=> SEGMENT72 <="0000000";  -- '8'
    when "1001"=> SEGMENT72 <="0000100";  -- '9'
    when "1010"=> SEGMENT72 <="0001000";  -- 'A'
	when "1011"=> SEGMENT72 <="1100000";  -- 'b'
	when "1100"=> SEGMENT72 <="0110001";  -- 'C'
	when "1101"=> SEGMENT72 <="1000010";  -- 'D'
	when "1110"=> SEGMENT72 <="0110000";  -- 'E'
	when "1111"=> SEGMENT72 <="0111000";  -- 'F'
    when others=> SEGMENT72 <="1111111";	
  end case;							   
   MEDIE2(3 downto 0)<=SUM3(5 downto 2); 
  case  MEDIE2(3 downto 0) is
 	when "0000"=> SEGMENT73 <="0000001";  -- '0'
    when "0001"=> SEGMENT73 <="1001111";  -- '1'
    when "0010"=> SEGMENT73 <="0010010";  -- '2'
    when "0011"=> SEGMENT73 <="0000110";  -- '3'
    when "0100"=> SEGMENT73 <="1001100";  -- '4'
    when "0101"=> SEGMENT73 <="0100100";  -- '5'
    when "0110"=> SEGMENT73 <="0100000";  -- '6'
    when "0111"=> SEGMENT73 <="0001111";  -- '7'
    when "1000"=> SEGMENT73 <="0000000";  -- '8'
    when "1001"=> SEGMENT73 <="0000100";  -- '9'
    when "1010"=> SEGMENT73 <="0001000";  -- 'A'
	when "1011"=> SEGMENT73 <="1100000";  -- 'b'
	when "1100"=> SEGMENT73 <="0110001";  -- 'C'
	when "1101"=> SEGMENT73 <="1000010";  -- 'D'
	when "1110"=> SEGMENT73 <="0110000";  -- 'E'
	when "1111"=> SEGMENT73 <="0111000";  -- 'F'
    when others=> SEGMENT73 <="1111111";	 			
  end case;	 
end process P2;
end medie;

