 library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;

 entity REGISTRU is
 port ( CLK,RESET : in STD_LOGIC;
 	   Y : out STD_LOGIC_VECTOR (3 downto 0));
 end REGISTRU;
             



architecture REG of REGISTRU is
  signal anod: STD_LOGIC_VECTOR(3 downto 0);
    begin
      Y<=anod;
         process(CLK)
		 variable k:integer;
		
                begin
 	               if(CLK'event and CLK='1') then
 	                   if(RESET='1') then
 	                         anod<="1111";
 	                         k:=0;
 	                      else
 	                         if(k=4) then k:=0;
 	                         end if;
 	                            anod<="1111";
 	                            anod(k)<='0';
 	                            k:=k+1;
 	                      end if;
 	                  end if;
					   
           end process;
end REG;