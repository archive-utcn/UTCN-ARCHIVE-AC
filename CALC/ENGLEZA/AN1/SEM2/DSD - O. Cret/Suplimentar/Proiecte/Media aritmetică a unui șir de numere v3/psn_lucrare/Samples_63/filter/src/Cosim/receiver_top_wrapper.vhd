library ieee;
use ieee.std_logic_1164.all;

entity receiver_top is
  port
  (
    Ack     : in std_logic;
    clk     : in std_logic;
    DataIn  : in std_logic;
    DataOut : out std_logic_vector(7 downto 0);
    Rdy     : out std_logic;
    rst     : in std_logic;
    Vol     : in std_logic_vector(3 downto 0)
  );

  constant HANDELC_SIMULATOR  : string := "$HANDELC_SIMULATOR";
  constant MODELNAME          : string := "$MODELNAME";

end receiver_top;

architecture HandelC of receiver_top is

  attribute foreign of HandelC : 
    architecture is "VHPI $aldec\bin\AldecHandelC.dll; cosim_handelc";

begin
end HandelC;
