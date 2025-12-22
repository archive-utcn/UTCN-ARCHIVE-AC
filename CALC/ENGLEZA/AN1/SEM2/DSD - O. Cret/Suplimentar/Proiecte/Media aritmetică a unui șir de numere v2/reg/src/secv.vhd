library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity random is
    generic ( width : integer :=  8 );
port (a,b,c : in bit;
      clk : in std_logic;
      random_num : out std_logic_vector (width-1 downto 0);
	  D: in std_logic_vector(7 downto 0));
end random;

architecture Behavioral of random is   
signal FF1, FF2, FF3, FF4 : std_logic_vector(7 downto 0);
begin
process(clk)
  variable rand_temp : std_logic_vector (width-1 downto 0):=(others=>'1');
  variable temp : std_logic := '0';		
begin  								
    if(clk'event) then  
		if (a='1'and b='1'and c='0') then
          temp := rand_temp(width-1) xor rand_temp(width-2);
          rand_temp(width-1 downto width-3) := rand_temp(width-2 downto width-4);
          rand_temp(width-4) := temp;		
		  rand_temp(width-5 downto 0) := (others=>'0');	  	
		elsif (a='1'and b='1'and c='1') then
		  temp := rand_temp(width-1) xor rand_temp(width-2);
          rand_temp(width-1 downto 1) := rand_temp(width-2 downto 0);
          rand_temp(0) := temp;	  
		elsif (a='0'and b='0'and c='0') then  
		  rand_temp(width-1 downto 0) := (others=>'0');
		elsif (a='0'and b='0'and c='1') then  
		    temp := rand_temp(width-1) xor rand_temp(width-2);
            rand_temp(width-1 downto 1) := rand_temp(width-2 downto 0);
            rand_temp(0) := temp;		
		end if;
	end if;
	FF1 <= rand_temp;
   FF2 <= FF1;
   FF3 <= FF2;
   FF4 <= FF3;	
random_num <= rand_temp;	
end process;	   
end Behavioral;