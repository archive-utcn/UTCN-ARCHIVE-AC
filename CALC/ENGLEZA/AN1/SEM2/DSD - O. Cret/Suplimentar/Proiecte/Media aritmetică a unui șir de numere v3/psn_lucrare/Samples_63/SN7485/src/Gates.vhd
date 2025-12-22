------------------------------------------------------------------------------------------
-- File name   : GATES.VHD
-- Date        : 10/26/96
-- Author      : Ryszard Matuszyk
-- Copyright   : (C) 1996 ALDEC Inc.
-- Description : Different kinds of gates.
------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------
-- GATE NOT1
------------------------------------------------------------------------------------------

library IEEE;
	 use IEEE.std_logic_1164.all;

entity e_not1 is
  port (in1 : in std_logic;
        out1 : out std_logic);
end entity;

architecture a_not1 of e_not1 is
begin
  not1:process (in1)
  begin
    out1 <= not in1;  
  end process;
end architecture; 

------------------------------------------------------------------------------------------
-- GATE AND2
------------------------------------------------------------------------------------------

library IEEE;
	 use IEEE.std_logic_1164.all;

entity e_and2 is
  port (in1,in2 : in std_logic;
        out1 : out std_logic);
end entity;

architecture a_and2 of e_and2 is
begin
  and2:process (in1,in2)
  begin
    out1 <= in1 and in2;  
  end process;
end architecture;

------------------------------------------------------------------------------------------
-- GATE AND3
------------------------------------------------------------------------------------------

library IEEE;
	 use IEEE.std_logic_1164.all;

entity e_and3 is
  port (in1,in2,in3 : in std_logic;
        out1 : out std_logic);
end entity;

architecture a_and3 of e_and3 is
begin
  and3:process (in1,in2,in3)
  begin
    out1 <= in1 and in2 and in3;  
  end process;
end architecture;

------------------------------------------------------------------------------------------
-- GATE AND4
------------------------------------------------------------------------------------------

library IEEE;
	 use IEEE.std_logic_1164.all;

entity e_and4 is
  port (in1,in2,in3,in4 : in std_logic;
        out1 : out std_logic);
end entity;

architecture a_and4 of e_and4 is
begin
  and4:process (in1,in2,in3,in4)
  begin
    out1 <= in1 and in2 and in3 and in4;  
  end process;
end architecture;

------------------------------------------------------------------------------------------
-- GATE AND5
------------------------------------------------------------------------------------------

library IEEE;
	 use IEEE.std_logic_1164.all;

entity e_and5 is
  port (in1,in2,in3,in4,in5 : in std_logic;
        out1 : out std_logic);
end entity;

architecture a_and5 of e_and5 is
begin
  and5:process (in1,in2,in3,in4,in5)
  begin
    out1 <= in1 and in2 and in3 and in4 and in5;  
  end process;
end architecture;

------------------------------------------------------------------------------------------
-- GATE AND6
------------------------------------------------------------------------------------------

library IEEE;
	 use IEEE.std_logic_1164.all;

entity e_and6 is
  port (in1,in2,in3,in4,in5,in6 : in std_logic;
        out1 : out std_logic);
end entity;

architecture a_and6 of e_and6 is
begin
  and6:process (in1,in2,in3,in4,in5,in6)
  begin
    out1 <= in1 and in2 and in3 and in4 and in5 and in6;  
  end process;
end architecture;

-----------------------------------------------------------------
-- GATE OR2
-----------------------------------------------------------------

library IEEE;
	 use IEEE.std_logic_1164.all;

entity e_or2 is
  port (in1,in2 : in std_logic;
        out1 : out std_logic);
end entity;

architecture a_or2 of e_or2 is
begin
  or2:process (in1,in2)
  begin
    out1 <= in1 or in2;  
  end process;
end architecture;

-----------------------------------------------------------------
-- GATE OR3
-----------------------------------------------------------------

library IEEE;
	 use IEEE.std_logic_1164.all;

entity e_or3 is
  port (in1,in2,in3 : in std_logic;
        out1 : out std_logic);
end entity;

architecture a_or3 of e_or3 is
begin
  or3:process (in1,in2,in3)
  begin
    out1 <= in1 or in2 or in3;  
  end process;
end architecture;

-----------------------------------------------------------------
-- GATE OR5
-----------------------------------------------------------------

library IEEE;
	 use IEEE.std_logic_1164.all;

entity e_or5 is
  port (in1,in2,in3,in4,in5 : in std_logic;
        out1 : out std_logic);
end entity;

architecture a_or5 of e_or5 is
begin
  or5:process (in1,in2,in3,in4,in5)
  begin
    out1 <= in1 or in2 or in3 or in4 or in5;  
  end process;
end architecture;

-----------------------------------------------------------------
-- GATE NAND3
-----------------------------------------------------------------

library IEEE;
	 use IEEE.std_logic_1164.all;

entity e_nand3 is
  port (in1,in2,in3 : in std_logic;
        out1 : out std_logic);
end entity;

architecture a_nand3 of e_nand3 is
begin
  nand3:process (in1,in2,in3)
  begin
    out1 <= (in1 nand in2) nand in3;  
  end process;
end architecture;


-----------------------------------------------------------------
-- GATE NOR2
-----------------------------------------------------------------

library IEEE;
	 use IEEE.std_logic_1164.all;

entity e_nor2 is
  port (in1,in2 : in std_logic;
        out1 : out std_logic);
end entity;

architecture a_nor2 of e_nor2 is
begin
  nor2:process (in1,in2)
  begin
    out1 <= in1 nor in2;  
  end process;
end architecture;

------------------------------------------------------------------------------------------
-- GATE NOR3
------------------------------------------------------------------------------------------

library IEEE;
	 use IEEE.std_logic_1164.all;

entity e_nor3 is
  port (in1,in2,in3 : in std_logic;
        out1 : out std_logic);
end entity;

architecture a_nor3 of e_nor3 is
begin
  nor3:process (in1,in2,in3)
  begin
    out1 <= not (in1 or in2 or in3);  
  end process;
end architecture;

------------------------------------------------------------------------------------------
-- GATE NOR4
------------------------------------------------------------------------------------------

library IEEE;
	 use IEEE.std_logic_1164.all;

entity e_nor4 is
  port (in1,in2,in3,in4 : in std_logic;
        out1 : out std_logic);
end entity;

architecture a_nor4 of e_nor4 is
begin
  nor4:process (in1,in2,in3,in4)
  begin
    out1 <= not (in1 or in2 or in3 or in4);  
  end process;
end architecture;

-----------------------------------------------------------------
-- GATE XOR2
-----------------------------------------------------------------

library IEEE;
	 use IEEE.std_logic_1164.all;

entity e_xor2 is
  port (in1,in2 : in std_logic;
        out1 : out std_logic);
end entity;

architecture a_xor2 of e_xor2 is
begin
  xor2:process (in1,in2)
  begin
    out1 <= in1 xor in2;  
  end process;
end architecture;