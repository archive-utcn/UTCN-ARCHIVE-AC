library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity moving_avg is
    generic (h,order : natural) ; -- size of input in bit, 2**order = size of memory
    Port ( input : in  std_logic_vector (h-1 downto 0);
           clk, rst : in std_logic;
           output : out std_logic_vector (h-1 downto 0));
end moving_avg;

architecture redun of moving_avg is
component radder
generic (h : natural) ;
Port ( input0,input1 : in  std_logic_vector (2*h-1 downto 0);
    output : out std_logic_vector (2*h+1 downto 0));
end component;
component raddsub is
    generic (h : natural) ;
    Port ( input0,input1 : in  std_logic_vector (2*h-1 downto 0);
           sub : in std_logic;
           output : out std_logic_vector (2*h+1 downto 0));
end component raddsub;
component tworconv is
    generic (h : natural := 32) ; -- size of input in bit
    Port ( input : in  std_logic_vector (h-1 downto 0);
           output : out std_logic_vector (2*h-1 downto 0));
end component tworconv;
component rconv is
    generic (h : natural := 32) ; -- size of input in bit
    Port ( input : in  std_logic_vector (2*h-1 downto 0);
           output : out std_logic_vector (h downto 0));
end component rconv;

type ram_type is array (2**order-1 downto 0) of std_logic_vector(2*h-1 downto 0);
subtype addr is integer range 0 to 2**order-1;
signal mem: ram_type;
signal current : addr; --last
signal inputconv, invalue : std_logic_vector (2*h-1 downto 0);
signal outvalue,counter,counterin,counternext, zeroes : std_logic_vector(2*(h+order+2)-1 downto 0);
signal counterplus,countersub : std_logic_vector(2*(h+order+2+1)-1 downto 0);
signal counterminus : std_logic_vector(2*(h+order+2+2)-1 downto 0);
signal outputtemp : std_logic_vector(h+order+2 downto 0);
signal overflow, fullcircle : std_logic;
begin
    zeroesgen: for i in 0 to h+order+2-1 generate
       zeroes(2*i) <= '1';
       zeroes(2*i+1) <= '0';
   end generate;
    conv: tworconv generic map (h=> h) port map (input=>input, output=> inputconv);
    process(clk) is
    begin
        if(clk'event and clk='1') then
            invalue <= inputconv;
        end if;
    end process;
    
    --main stage
    process(clk) is
    begin
	 if clk'event and clk='1' then
        if(rst = '1') then
            current <= 0;
            --last <= addr'right;
            overflow <= '0';
				fullcircle <= '0';
        else
            --last <= current;
            if(fullcircle = '1') then
			fullcircle <= '1';
		elsif ( current = addr'right) then
			fullcircle <= '1';
		else
			fullcircle <= '0';
		end if;
            if (current = addr'right) then
                current <= 0;
                else
                current <= current+1;
            end if;
        end if;
		end if;
    end process;
    
    counterin(2*h-1 downto 0)<=invalue;
    zeroe: for i in h to h+order+2-1  generate
       counterin(2*i) <= '1';
       counterin(2*i+1) <= '0';
    end generate;
    
    with fullcircle select countersub(2*h-1 downto 0)<=
       mem(current) when '1',
       zeroes(2*h-1 downto 0) when others;

    zeroe1: for i in h to h+order+2 generate
       countersub(2*i) <= '1';
       countersub(2*i+1) <= '0';
   end generate;
    
    radd: radder generic map(h=>h+order+2)
        port map (input0=> counter, input1=> counterin, output=> counterplus);
    rsub: raddsub generic map(h=> h+order+2+1)
        port map (input0=> counterplus, input1=> countersub, sub=>'1', output=> counterminus);
    
    counternext<=counterminus(2*(h+order+2)-1 downto 0) when rst='0' else zeroes;

    process(clk, inputconv, counter, counternext, counterminus) is
    begin
       if(clk'event and clk='1') then
           --write to memory
          mem(current) <= invalue; --inputconv?
          outvalue <= counter;
          counter <= counternext;
          if (((counterminus(2*(h+order+2)) xnor counterminus(2*(h+order+2)+1)) or (counterminus(2*(h+order+2+1)) xnor counterminus(2*(h+order+2+1)+1)))='1') then
              overflow <= '1';
          end if;
      end if;
  end process;
   
   --out stage
   convert: entity work.rconv(combin2) generic map (h=> h+order+2)
      port map (input=> outvalue, output=> outputtemp);
          
    output <= outputtemp(h+order-1 downto order);
    
end architecture;

architecture carry of moving_avg is
type ram_type is array (2**order-1 downto 0) of std_logic_vector(h-1 downto 0);
subtype addr is integer range 0 to 2**order-1;
signal mem: ram_type;
signal current : addr; --last
signal invalue : std_logic_vector (h-1 downto 0);
signal outvalue,counter,counterin,counternext, zeroes : std_logic_vector((h+order+2)-1 downto 0);
signal countersub : std_logic_vector((h+order+2)-1 downto 0);
signal counterminus : std_logic_vector((h+order+2)-1 downto 0);
signal overflow, fullcircle : std_logic;
begin
    zeroesgen: for i in 0 to h+order+2-1 generate
       zeroes(i) <= '0';
   end generate;

    process(clk) is
    begin
        if(clk'event and clk='1') then
            invalue <= input;
        end if;
    end process;
    
    --main stage
    process(clk) is
    begin
	 if clk'event and clk='1' then
        if(rst = '1') then
            current <= 0;
            --last <= addr'right;
            overflow <= '0';
				fullcircle <= '0';
        else
            --last <= current;
            if(fullcircle = '1') then
			fullcircle <= '1';
		elsif ( current = addr'right) then
			fullcircle <= '1';
		else
			fullcircle <= '0';
		end if;
            if (current = addr'right) then
                current <= 0;
                else
                current <= current+1;
            end if;
        end if;
		end if;
    end process;
    
    counterin(h-1 downto 0)<=invalue;
    zeroe: for i in h to h+order+2-1  generate
       counterin(i) <= invalue(h-1);
    end generate;
    
    with fullcircle select countersub(h-1 downto 0)<=
       mem(current) when '1',
       zeroes(h-1 downto 0) when others;

    zeroe1: for i in h to h+order+1 generate
       countersub(i) <= countersub(h-1);
   end generate;
    
    --radd: radder generic map(h=>h+order+2)
    --    port map (input0=> counter, input1=> counterin, output=> counterplus);
    --rsub: raddsub generic map(h=> h+order+2+1)
    --    port map (input0=> counterplus, input1=> countersub, sub=>'1', output=> counterminus);
	 counterminus <= std_logic_vector(signed(counter)+signed(counterin)-signed(countersub));
    
    counternext<=counterminus((h+order+2)-1 downto 0) when rst='0' else zeroes;

    process(clk, counter, counternext, counterminus) is
    begin
       if(clk'event and clk='1') then
           --write to memory
          mem(current) <= invalue;
          outvalue <= counter;
          counter <= counternext;
				--- ??? check overflow
      end if;
  end process;
   
   --out stage
   output <= outvalue(h+order-1 downto order);
    
end architecture;

