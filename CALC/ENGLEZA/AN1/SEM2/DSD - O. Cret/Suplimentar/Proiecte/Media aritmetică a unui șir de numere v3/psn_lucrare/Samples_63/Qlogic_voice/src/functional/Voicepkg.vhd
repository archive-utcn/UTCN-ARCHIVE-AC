LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

PACKAGE voice_pkg IS

TYPE state IS (main,review,repeat,save_msg,erase_msg,send,address,record_msg,begin_rec,message);
--
CONSTANT zero : std_logic_vector(3 downto 0) :="0000"; -- declare constant values;
CONSTANT one : std_logic_vector(3 downto 0) :="0001";
CONSTANT two : std_logic_vector(3 downto 0) :="0010";
CONSTANT three : std_logic_vector(3 downto 0) :="0011";
CONSTANT four : std_logic_vector(3 downto 0) :="0100";
CONSTANT five : std_logic_vector(3 downto 0) :="0101";
CONSTANT six : std_logic_vector(3 downto 0) :="0110";
CONSTANT seven : std_logic_vector(3 downto 0) :="0111";
CONSTANT eight : std_logic_vector(3 downto 0) :="1000";
CONSTANT nine : std_logic_vector(3 downto 0) :="1001";
CONSTANT star : std_logic_vector(3 downto 0) :="1010";
CONSTANT pound : std_logic_vector(3 downto 0) :="1011";

END voice_pkg;
