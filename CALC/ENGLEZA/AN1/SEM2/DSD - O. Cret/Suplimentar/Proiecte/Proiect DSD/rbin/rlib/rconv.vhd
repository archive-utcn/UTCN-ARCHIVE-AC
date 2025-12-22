library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity rconv is
    generic (h : natural := 32) ; -- size of input in bit
    Port ( input : in  std_logic_vector (2*h-1 downto 0);
           output : out std_logic_vector (h downto 0));
end rconv;

architecture carry of rconv is
component fulladd
    Port ( e0,e1 : in  std_logic;
			  cin : in  std_logic;
			  s,cout : out std_logic);
end component;

signal carryo : std_logic_vector (h-1 downto 0);
begin
    
    full1:  fulladd port map ( e0 => input(0), e1 => input(1), cin => '1', s => output(0), cout => carryo(0));
    A: for i in 1 to h-1 generate
       full2: fulladd port map ( e0 => input(2*i), e1 => input(2*i+1), cin => carryo(i-1), s => output(i), cout => carryo(i));
   end generate;
   full3: fulladd port map (e0 => '1', e1 => '0', cin => carryo(h-1), s => output(h), cout => open);
   
end architecture carry;


--A NOVEL CONVERSION SCHEME FROM A REDUNDANT BINARY
--NUMBER TO TWO?S COMPLEMENT BINARY NUMBER
--FOR PARALLEL ARCHITECTURES
architecture combin of rconv is
    signal Y : std_logic_vector (2*h+1 downto 0);
    signal Si,Ci : std_logic_vector (h downto 0);
    begin
        -- X is always the same
        --X generation
        --Xgen: for i in 0 to h-1 generate
         --  X(2*i+1 downto 2*i) <= b"11";
       --end generate;
       --X(2*h+1 downto 2*h) <= b"01";
       
       --with input(1 downto 0) select Y(1 downto 0)  <= 
          --b"01" when b"00",
          --b"01" when b"11",
          --b"11" when b"01",
          --b"11" when b"10",
          --b"XX" when others;
        
        Y(0) <='1';
        Y(1) <= input(0) xor input(1);
          
       Ygen: for i in 1 to h-1 generate
           with std_logic_vector'(input(2*i+1), input(2*i), input(2*i-1), input(2*i-2)) select Y(2*i+1 downto 2*i) <=
           -- 0 when di=0 and di+1 = -1 or 0
              b"01" when b"0100",
              b"01" when b"0101",
              b"01" when b"0110",
              b"01" when b"1000",
              b"01" when b"1001",
              b"01" when b"1010",
              -- 0 when di =-1 and di+1 =1
              b"01" when b"0011",
              -- 0 when di = 1 and di+1 =1
              b"01" when b"1111",
              -- 1 when di = 0 and di+1 =1
              b"11" when b"0111",
              b"11" when b"1011",
              -- -1 when di = -1 and di+1 = -1 or 0
              b"00" when b"0000",
              b"00" when b"0001",
              b"00" when b"0010",
              -- -1 when di = 1 and di+1 = -1 or 0
              b"00" when b"1100",
              b"00" when b"1101",
              b"00" when b"1110",
              "XX" when others;
        end generate;
              
        Y(2*h) <= input(2*h-1) and input(2*h-2);
        Y(2*h+1) <= '0';
        
        -- generate Si
        Sigen: for i in 0 to h-1 generate
           with std_logic_vector'(Y(2*i+1),  Y(2*i)) select Si(i) <=
              '1' when b"01",
              '1' when b"10",
              '0' when b"11",
              '0' when b"00",
              'X' when others;
        end generate;
        with std_logic_vector'(Y(2*h+1), Y(2*h)) select Si(h) <=
           '0' when b"01",
           '0' when b"10",
           '1' when b"00", -- ? verify
           '1' when b"11",
           'X' when others;
        
        --generate Ci
        Ci(0) <= '0';
        Cigen: for i in 1 to h generate
           with std_logic_vector'(Y(2*i-1), Y(2*i-2)) select Ci(i) <=
              '0' when b"01",
              '0' when b"10",
              '1' when b"11",
              '0' when b"00",
              'X' when others;
        end generate;
       
       output <= std_logic_vector(signed(Si) + signed(Ci));
           
end architecture combin;

architecture combin2 of rconv is
    signal Y : std_logic_vector (2*h+1 downto 0);
    signal Si,Ci : std_logic_vector (h downto 0);
    begin        
        Si(0) <= input(0) xnor input(1);
        Ci(0) <= '0';
        Ci(1) <= input(0) xor input(1);
          
       Sgen: for i in 1 to h-1 generate
           with std_logic_vector'(input(2*i+1), input(2*i), input(2*i-1), input(2*i-2)) select Si(i)<=
           -- 0 when di=0 and di+1 = -1 or 0
              '1' when b"0100",
              '1' when b"0101",
              '1' when b"0110",
              '1' when b"1000",
              '1' when b"1001",
              '1' when b"1010",
              -- 0 when di =-1 and di+1 =1
              '1' when b"0011",
              -- 0 when di = 1 and di+1 =1
              '1' when b"1111",
              -- 1 when di = 0 and di+1 =1
              '0' when b"0111",
              '0' when b"1011",
              -- -1 when di = -1 and di+1 = -1 or 0
              '0' when b"0000",
              '0' when b"0001",
              '0' when b"0010",
              -- -1 when di = 1 and di+1 = -1 or 0
              '0' when b"1100",
              '0' when b"1101",
              '0' when b"1110",
              'X' when others;
        end generate;
        
        -- Sign bit
        Si(h) <= not(input(2*h-1) and input(2*h-2));
        
            Cgen: for i in 1 to h-1 generate
           with std_logic_vector'(input(2*i+1), input(2*i), input(2*i-1), input(2*i-2)) select Ci(i+1) <=
           -- 0 when di=0 and di+1 = -1 or 0
              '0' when b"0100",
              '0' when b"0101",
              '0' when b"0110",
              '0' when b"1000",
              '0' when b"1001",
              '0' when b"1010",
              -- 0 when di =-1 and di+1 =1
              '0' when b"0011",
              -- 0 when di = 1 and di+1 =1
              '0' when b"1111",
              -- 1 when di = 0 and di+1 =1
              '1' when b"0111",
              '1' when b"1011",
              -- -1 when di = -1 and di+1 = -1 or 0
              '0' when b"0000",
              '0' when b"0001",
              '0' when b"0010",
              -- -1 when di = 1 and di+1 = -1 or 0
              '0' when b"1100",
              '0' when b"1101",
              '0' when b"1110",
              'X' when others;
        end generate;
       
       output <= std_logic_vector(signed(Si) + signed(Ci));
           
end architecture combin2;

architecture combin3 of rconv is
    signal R,S : std_logic_vector (h downto 0);
    begin
        RS: for i in 0 to h-1 generate
           R(i)<= input(2*i);
           S(i)<=input(2*i+1);
         end generate;
         R(h)<='1';
         S(h)<='0';
         
         output <= std_logic_vector(signed(R)+signed(S)+1);
end architecture combin3;


