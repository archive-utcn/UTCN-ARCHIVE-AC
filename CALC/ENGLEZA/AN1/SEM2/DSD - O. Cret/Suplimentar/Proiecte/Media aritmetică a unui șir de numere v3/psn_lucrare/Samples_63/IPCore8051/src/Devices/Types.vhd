--
--  File: Types.vhd
--  created by Design Wizard: 04/28/99 08:45:16
--

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {Types} architecture {Types}}


package Types is

type ScrType is record
	LineA: STRING (1 to 16);
	LineB: STRING (1 to 16);
end record;

type MemType is array (0 to 31) of bit_vector(7 downto 0);

type ASCIITableType is array (0 to 95) of character;

constant ASCII_Table: ASCIITableType :=
 ( 	 ' ','!','"',' ','$','%','&',''','(',')','*','+',',','-','.','/',
	 '0','1','2','3','4','5','6','7','8','9',':',';','<','=','>','?',
	 '@','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O',
	 'P','Q','R','S','T','U','V','W','X','Y','Z','[','\',']','­','­',
	 '/','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o',
	 'p','q','r','s','t','u','v','w','x','y','z','{','|','}','~',' '
 );
end package;
