library ieee;
use ieee.std_logic_1164.all;

package bus_class is

  type ulogic_2_vector is array (integer range <>) of std_ulogic_vector(1 downto 0);
  type ulogic_3_vector is array (integer range <>) of std_ulogic_vector(2 downto 0);
  type ulogic_4_vector is array (integer range <>) of std_ulogic_vector(3 downto 0);
  type ulogic_5_vector is array (integer range <>) of std_ulogic_vector(4 downto 0);
  type ulogic_6_vector is array (integer range <>) of std_ulogic_vector(5 downto 0);
  type ulogic_7_vector is array (integer range <>) of std_ulogic_vector(6 downto 0);
  type ulogic_8_vector is array (integer range <>) of std_ulogic_vector(7 downto 0);
  type ulogic_16_vector is array (integer range <>) of std_ulogic_vector(15 downto 0);
  type ulogic_21_vector is array (integer range <>) of std_ulogic_vector(20 downto 0);
  type ulogic_32_vector is array (integer range <>) of std_ulogic_vector(31 downto 0);

  type nibble is array (3 downto 0)  of std_ulogic;
  type byte   is array (7 downto 0)  of std_ulogic;
  type word   is array (15 downto 0) of std_ulogic;
  type dword  is array (31 downto 0) of std_ulogic;
  type qword  is array (63 downto 0) of std_ulogic;

  type byte_vector is array (integer range <>) of byte;
  type word_vector is array (integer range <>) of word;
  type dword_vector is array (integer range <>) of dword;
  type qword_vector is array (integer range <>) of qword;

end bus_class;
