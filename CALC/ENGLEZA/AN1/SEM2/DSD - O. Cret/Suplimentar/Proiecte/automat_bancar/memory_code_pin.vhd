----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:02:57 04/29/2015 
-- Design Name: 
-- Module Name:    memory_code_pin - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity memory_code_pin is
 port( verify_pin: in std_logic_vector(2 downto 0);    --the client give this as a pin code
      verify_code: in std_logic_vector(3 downto 0);   --the client give this as a card code
		ok_pin: out std_logic;                    -- this will be '1' if the pin is in the memory
		ok_code: out std_logic;                   -- this will be '1' if the code is in the memory   
      index_of_client: out INTEGER		--every client has an index (which is the order-number in teh memory); 
);
end memory_code_pin;



architecture memory_rom of memory_code_pin is
type memory_code is array(4 downto 0) of std_logic_vector( 3 downto 0); -- we will have a memory of 5 
                                                                        --clients, each of them having a card code on 4 bits; 
type memory_pin is array(4 downto 0) of std_logic_vector(2 downto 0);-- memorising 5 pn codes; 

signal codes: memory_code;
signal pin: memory_pin;

begin
P1: process(verify_code,verify_pin,codes,pin)
    begin
	 ok_pin <= '0';   --initialization
	 ok_code <= '0';
 
 codes(0) <="1010";   --client with index 0 have this card code;
 codes(1) <="1011";
 codes(2) <="0011";
 codes(3) <="0101";
 codes(4) <="1000";
 
 pin(0) <="101";
 pin(1) <="100";
 pin(2) <="010";
 pin(3) <="011";
 pin(4) <="111";
 
      --verifing if the given card code and the given pin code are in the memory or not;
		if verify_code=codes(0)
		     then  ok_code<= '1';
			        if verify_pin=pin(0)
					      then ok_pin<='1';
							     index_of_client <= 0;
						end if;
		end if;
		
		if verify_code=codes(1)
		     then  ok_code<= '1';
			        if verify_pin=pin(1)
					      then ok_pin<='1';
							     index_of_client <= 1;
						end if;
		end if;
		
		if verify_code=codes(2)
		     then  ok_code<= '1';
			        if verify_pin=pin(2)
					      then ok_pin<='1';
							     index_of_client <= 2;
						end if;
		end if;
		
		if verify_code=codes(3)
		     then  ok_code<= '1';
			        if verify_pin=pin(3)
					      then ok_pin<='1';
							     index_of_client <= 3;
						end if;
		end if;

      if verify_code=codes(4)
		     then  ok_code<= '1';
			        if verify_pin=pin(4)
					      then ok_pin<='1';
							     index_of_client <= 4;
						end if;
		end if;
		
end process P1;
end memory_rom;

