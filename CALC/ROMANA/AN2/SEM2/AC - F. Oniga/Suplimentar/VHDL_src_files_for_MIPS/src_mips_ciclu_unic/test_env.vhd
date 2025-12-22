----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/22/2021 06:28:56 PM
-- Design Name: 
-- Module Name: test_env - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity test_env is
    Port ( clk : in STD_LOGIC;
           btn : in STD_LOGIC_VECTOR (4 downto 0);
           sw : in STD_LOGIC_VECTOR (15 downto 0);
           led : out STD_LOGIC_VECTOR (15 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0);
           cat : out STD_LOGIC_VECTOR (6 downto 0));
end test_env;

architecture Behavioral of test_env is

signal cnt : std_logic_vector(15 downto 0) := X"0000";
signal enable_mpg : std_logic := '0';
signal cnt2: std_logic_vector(1 downto 0) := "00"; -- iesirea numaratorului pe 2 biti
signal zero_ext1: std_logic_vector(15 downto 0) := X"0000";
signal zero_ext2: std_logic_vector(15 downto 0) := X"0000";
signal zero_ext3: std_logic_vector(15 downto 0) := X"0000";
signal sum: std_logic_vector(15 downto 0) := X"0000";
signal dif: std_logic_vector(15 downto 0) := X"0000";
signal left_shift2: std_logic_vector(15 downto 0) := X"0000";
signal right_shift2: std_logic_vector(15 downto 0) := X"0000";
signal digits: std_logic_vector(15 downto 0) := X"0000"; -- iesrea de la mux 4:1

-- Lab03 
-- ROM 256 x 16 -- memoria de instructiuni
type rom_array is array (0 to 255) of std_logic_vector(15 downto 0);
signal rom256x16: rom_array := (
    B"000_000_000_001_0_000",       -- add $1, $0, $0       #0010
    B"001_000_100_0001010",         -- addi $4, $0, 10      #220A
    B"000_000_000_010_0_000",       -- add $2, $0, $0       #0020
    B"010_010_101_0000000",         -- lw $5, 0($2)         #4A80
    B"100_001_100_0000111",         -- beq $1, $4, 7        #8307
    B"010_010_011_0000000",         -- lw $3, 0($2)         #4980
    B"000_101_011_110_0_001",       -- sub $6, $5, $3       #15E1   
    B"101_110_000_0000001",         -- bgez $6, 1           #B801
    B"000_000_011_101_0_000",       -- add $5, $0, $3       #01D0
    B"001_010_010_0000010",         -- addi $2, $2, 2       #2902
    B"001_001_001_0000001",         -- addi $1, $1, 1       #2401
    B"111_0000000000100",           -- j 4                  #E004
    B"011_000_101_0010100",         -- sw $5, 20($0)        #6294
    others => x"1111"
);

signal counter8: std_logic_vector(7 downto 0) := x"00"; -- numarator pe 8 biti pentru memorie ROM

-- bloc de registre
signal enable_mpg2 : std_logic := '0';
signal cnt4 : std_logic_vector(3 downto 0) := "0000"; -- numaratorul pentru generarea adreselor
signal rd1_temp : std_logic_vector(15 downto 0) := x"0000";
signal rd2_temp : std_logic_vector(15 downto 0) := x"0000";

-- RAM write first
signal do_shifted : std_logic_vector(15 downto 0) := x"0000"; -- iesirea deplasata la stanga cu 2

component mpg is
  Port ( clk : in std_logic;
        btn : in std_logic;
        en : out std_logic );
end component;

component SSD is
Port ( digit0: in std_logic_vector(3 downto 0);
  digit1: in std_logic_vector(3 downto 0);
  digit2: in std_logic_vector(3 downto 0);
  digit3: in std_logic_vector(3 downto 0);
  clk: in std_logic;
  cat: out std_logic_vector(6 downto 0);
  an: out std_logic_vector(3 downto 0));
end component;

component reg_file is
  Port (
    clk : in std_logic;
    ra1 : in std_logic_vector(3 downto 0);
    ra2 : in std_logic_vector(3 downto 0);
    wa : in std_logic_vector(3 downto 0);
    wd : in std_logic_vector(15 downto 0);
    reg_wr : in std_logic;
    rd1 : out std_logic_vector(15 downto 0);
    rd2 : out std_logic_vector(15 downto 0) 
   );
end component;

component ram_write_first is
  Port ( 
    clk : in std_logic;
    we : in std_logic;
    en : in std_logic;
    addr : in std_logic_vector(3 downto 0);
    di : in std_logic_vector(15 downto 0);
    do : out std_logic_vector(15 downto 0)
  );
end component;

------------------------------------------------------------ MIPS ------------------------------------------------------------
signal current_instr : STD_LOGIC_VECTOR (15 downto 0) := x"0000";
signal next_instr : STD_LOGIC_VECTOR(15 downto 0) := x"0000";
signal ssd_signal : STD_LOGIC_VECTOR(15 downto 0) := x"0000";
------------ semnale IF ------------
signal jmp_addr: STD_LOGIC_VECTOR (15 downto 0);
------------ semnale ID ------------
signal rdata1:  STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
signal rdata2:  STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
signal wdata:   STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
signal func:    STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
signal extImm:  STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
signal sa:      STD_LOGIC := '0';

------------ semnale UC ------------
signal regDst:   STD_LOGIC := '0';
signal extOp:    STD_LOGIC := '0';
signal aluSrc:   STD_LOGIC := '0';
signal branch:   STD_LOGIC := '0';
signal bgez:   STD_LOGIC := '0';
signal bltz:    STD_LOGIC := '0';
signal jump:     STD_LOGIC := '0';
signal memWrite: STD_LOGIC := '0';
signal memToReg: STD_LOGIC := '0';
signal regWrite: STD_LOGIC := '0';
signal aluOp:    STD_LOGIC_VECTOR(2 downto 0) := "000"; 
signal slt: STD_LOGIC := '0';

------------ semnale ALU ------------
signal sgn: std_logic := '0';
signal Zero: STD_LOGIC := '0';
signal Sign: STD_LOGIC := '0';
signal BranchAddr: STD_LOGIC_VECTOR (15 downto 0) := X"0000";
signal Gez: STD_LOGIC := '0'; 
signal ALURes: STD_LOGIC_VECTOR (15 downto 0) := X"0000";

------------ semnale MEM ------------

signal r_data: std_logic_vector (15 downto 0) := X"0000";

------------ semnale WB ------------
signal PCSrc: std_logic;

------------ Memoria de instructiuni a fost declarata mai sus ------------

------------ componente ------------

component instruction_fetch is
  Port ( clk : in STD_LOGIC;
         en : in STD_LOGIC;
         clr : in STD_LOGIC;
         branch_addr : in STD_LOGIC_VECTOR (15 downto 0);
         jmp_addr : in STD_LOGIC_VECTOR (15 downto 0);
         jump : in STD_LOGIC;
         PCSrc : in STD_LOGIC;
         current_instr : out STD_LOGIC_VECTOR (15 downto 0);
         next_instr_addr : out STD_LOGIC_VECTOR (15 downto 0));
end component;

component UC is
  Port ( 
        Instr : in std_logic_vector(15 downto 0);
        RegDst : out std_logic;
        ExtOp : out std_logic;
        ALUSRC : out std_logic;
        Branch : out std_logic;
        Bgez : out std_logic;
        Bltz : out std_logic;
        Jump : out std_logic;
        MemWrite : out std_logic;
        MemtoReg : out std_logic;
        RegWrite : out std_logic;
        ALUOp : out std_logic_vector(2 downto 0);
        Slt : out std_logic
   );
end component;

component ID is
  Port (
        clk: in std_logic;
        enable: in std_logic;
        RegWrite: in std_logic;
        instr: in std_logic_vector(15 downto 0);
        RegDst: in std_logic;
        WD: in std_logic_vector(15 downto 0);
        ExtOp: in std_logic;
        RD1: out std_logic_vector(15 downto 0);
        RD2: out std_logic_vector(15 downto 0);
        ExtImm: out std_logic_vector(15 downto 0);
        func: out std_logic_vector(2 downto 0);
        sa: out std_logic
   );
end component;

component EX is
  Port (
        RD1: in STD_LOGIC_VECTOR (15 downto 0);
        ALUSrc: in STD_LOGIC;
        RD2: in STD_LOGIC_VECTOR (15 downto 0);
        Ext_Imm: in STD_LOGIC_VECTOR (15 downto 0);
        sa: in STD_LOGIC;
        func: in STD_LOGIC_VECTOR (2 downto 0);
        ALUOp: in STD_LOGIC_VECTOR (2 downto 0);
        ALURes: out STD_LOGIC_VECTOR (15 downto 0);
        PCNext: in STD_LOGIC_VECTOR (15 downto 0);
        Zero: out STD_LOGIC;
        Sign: out STD_LOGIC;
        BranchAddr: out STD_LOGIC_VECTOR (15 downto 0);
        Gez: out STD_LOGIC -- iesire pentru bgez (sign negat)
   );
end component;

component MEM is
  Port ( 
        clk :       in STD_LOGIC;
        enable :    in STD_LOGIC;
        MemWrite :  in STD_LOGIC;
        Addr :      in STD_LOGIC_VECTOR (15 downto 0);
        w_data :    in STD_LOGIC_VECTOR (15 downto 0);
        r_data :    out STD_LOGIC_VECTOR (15 downto 0);
        ALUResult : out STD_LOGIC_VECTOR (15 downto 0)
  );
end component;

begin
    -- led <= sw;
    -- an <= btn(3 downto 0);
    -- cat <= (others => '0');
    
    -- MPG1: mpg port map(clk, btn(4), enable_mpg);
    -- SSDC: SSD port map(clk => clk, an => an, cat => cat, digit0 => digits(3 downto 0), digit1 => digits(7 downto 4), digit2 => digits(11 downto 8), digit3 => digits(15 downto 12));
    
    -- process(clk)
    -- begin
        -- if (clk = '1' and clk'event) then
           -- if (enable_mpg = '1') then
                -- if (sw(0) = '1') then
                   -- cnt <= cnt + 1;
                -- else
                   -- cnt <= cnt - 1;
                -- end if;
            -- end if;
        -- end if;
    -- end process;
    
    -- UAL
    -- numarator pe 2 biti
    -- process(clk, enable_mpg)
    -- begin
        -- if rising_edge(clk) then
            -- if enable_mpg = '1' then
                -- cnt2 <= cnt2 + 1;
            -- end if;
        -- end if;
    -- end process;
    
    -- zero ext1 
    -- zero_ext1 <= "000000000000" & sw(3 downto 0);
    
    -- zero ext2
    -- zero_ext2 <= "000000000000" & sw(7 downto 4);
    
    -- zero ext3
    -- zero_ext3 <= "00000000" & sw(7 downto 0);
    
    -- sumator
    -- sum <= zero_ext1 + zero_ext2;
    
    -- scazator
    -- dif <= zero_ext1 - zero_ext2;
    
    -- 2 left shifter
    -- left_shift2 <= zero_ext3(13 downto 0) & "00";
    
    -- 2 right shifter
    -- right_shift2 <= "00" & zero_ext3(15 downto 2);
    
    -- mux 4:1
    -- process(cnt2, sum, dif, left_shift2, right_shift2)
    -- begin
        -- case cnt2 is
            -- when "00" => digits <= sum;
            -- when "01" => digits <= dif;
            -- when "10" => digits <= left_shift2;
            -- when others => digits <= right_shift2;
        -- end case;
    -- end process;
    
    -- zero det
    -- led(7) <= '1' when digits = 0 else '0';
    
    -- led <= cnt;
    -- an <= btn(3 downto 0);
    -- cat <= (others => '0');
    
    -- Lab03
    -- numarator pe 8 biti pentru ROM 256 x 16
    -- process(clk)
    -- begin
        -- if clk = '1' and clk'event then
            -- if enable_mpg = '1' then
                -- counter8 <= counter8 + 1;
            -- end if;
        -- end if;
    -- end process;
    
    -- memoria ROM 256 x 16
    -- digits <= rom256x16(conv_integer(counter8));
    
    -- bloc de registre
    -- numarator pe 4 biti pentru blocul de registre
    -- noua instanta a mpg, cu un buton nefolosit
   --  MPG2: mpg port map(clk, btn(3), enable_mpg2);
    
    -- numarator pe 4 biti pentru generarea adreselor
    -- process(clk, btn(2))
    -- begin
        -- if btn(2) = '1' then    -- resetare asincrona
            -- cnt4 <= "0000";
        -- else
            -- if rising_edge(clk) then
                -- if enable_mpg = '1' then
                    -- cnt4 <= cnt4 + 1;
                -- end if;
            -- end if;
        -- end if;
    -- end process;
    
    -- digits <= rd1_temp + rd2_temp;
    
    -- REG_FILE1: reg_file port map(clk, cnt4, cnt4, cnt4, digits, enable_mpg2, rd1_temp, rd2_temp);

    -- RAM write first
    -- deplasare la stanga cu 2 pozitii
    -- do_shifted <= digits(13 downto 0) & "00";
    -- RAM1: ram_write_first port map(clk, enable_mpg2, sw(15), cnt4, do_shifted, digits);
    
    
    
    ------------------------------------------------------------ MIPS ------------------------------------------------------------
    -- ssd_signal <= current_instr when sw(7) = '0'
                  --else next_instr;
    
    MPG1: mpg port map(clk, btn(0), enable_mpg);
    MPG2: mpg port map(clk, btn(1), enable_mpg2);
    SSDC: SSD port map(clk => clk, an => an, cat => cat, digit0 => ssd_signal(3 downto 0), digit1 => ssd_signal(7 downto 4), digit2 => ssd_signal(11 downto 8), digit3 => ssd_signal(15 downto 12));
    INSTR_FETCH: instruction_fetch port map(clk, enable_mpg, enable_mpg2, BranchAddr, jmp_addr, jump, PCSrc, current_instr, next_instr);
    INSTR_DECODER: ID port map(clk => clk, enable => enable_mpg, RegWrite => regWrite, instr => current_instr, RegDst => regDst, WD => wdata, ExtOp => extOp, RD1 => rdata1, RD2 => rdata2, ExtImm => extImm, func => func, sa => sa);
    MAIN_CONTROL: UC port map(Instr => current_instr, RegDst => regDst, ExtOp => extOp, ALUSrc => aluSrc, Branch => branch, Bgez => bgez, Bltz => bltz, Jump => jump, Slt => slt, MemWrite => memWrite, MemtoReg => memToReg, RegWrite => regWrite, ALUOp => aluOp);
    
   
    -- EX
    EX_COMP: EX port map(RD1 => rdata1, ALUSrc => aluSrc, RD2 => rdata2, Ext_Imm => extImm, sa => sa, func => func, ALUOp => aluOp, PCNext => next_instr, Zero => Zero, Sign => Sign, BranchAddr => BranchAddr, Gez => Gez, ALURes => ALURes);
    
    -- MEM
    MEM_COMP: MEM port map(clk, enable_mpg, memWrite, ALURes, rdata2, r_data, ALURes);
    
    -- logica combinationala suplimentara - pentru bgez, bltz
    PCSrc <= (branch and Zero) or (bgez and Gez) or (bltz and Sign);
    
    -- write-back
    wdata <= r_data when memToReg = '1' else ALURes;
    
    -- jump
    jmp_addr <= "000" & current_instr(12 downto 0);
    
    -- test afisare
    mux_afisare: process(sw(7 downto 5))
                         begin 
                         case sw(7 downto 5) is
                            when "000" => ssd_signal <= current_instr;
                            when "001" => ssd_signal <= next_instr;
                            when "010" => ssd_signal <= rdata1;
                            when "011" => ssd_signal <= rdata2;
                            when "100" => ssd_signal <= extImm;
                            when "101" => ssd_signal <= ALURes;
                            when "110"=>  ssd_signal <= r_data;
                            when others=> ssd_signal <= wdata;
                         end case;
                         end process;
    
    
end Behavioral;
