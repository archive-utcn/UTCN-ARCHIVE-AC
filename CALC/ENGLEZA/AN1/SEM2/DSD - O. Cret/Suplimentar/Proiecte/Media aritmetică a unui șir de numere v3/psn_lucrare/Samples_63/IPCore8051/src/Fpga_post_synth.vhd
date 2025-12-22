
-- 
-- Definition of  fpga
-- 
--      Thu Apr 22 17:43:57 1999
-- 
-- 
-- 

library IEEE;
use IEEE.STD_LOGIC_1164.all;

package components is
   component MX4
      port (
         Y : OUT std_logic ;
         D0 : IN std_logic ;
         D1 : IN std_logic ;
         D2 : IN std_logic ;
         D3 : IN std_logic ;
         S0 : IN std_logic ;
         S1 : IN std_logic) ;
   end component ;
   component NAND2
      port (
         Y : OUT std_logic ;
         A : IN std_logic ;
         B : IN std_logic) ;
   end component ;
   component DFM6A
      port (
         Q : OUT std_logic ;
         D0 : IN std_logic ;
         D1 : IN std_logic ;
         D2 : IN std_logic ;
         D3 : IN std_logic ;
         S1 : IN std_logic ;
         S0 : IN std_logic ;
         CLK : IN std_logic ;
         CLR : IN std_logic) ;
   end component ;
   component AND2
      port (
         Y : OUT std_logic ;
         A : IN std_logic ;
         B : IN std_logic) ;
   end component ;
   component AND3
      port (
         Y : OUT std_logic ;
         A : IN std_logic ;
         B : IN std_logic ;
         C : IN std_logic) ;
   end component ;
   component OUTBUF
      port (
         PAD : OUT std_logic ;
         D : IN std_logic) ;
   end component ;
   component BIBUF
      port (
         PAD : INOUT std_logic ;
         Y : OUT std_logic ;
         D : IN std_logic ;
         E : IN std_logic) ;
   end component ;
   component TRIBUFF
      port (
         PAD : OUT std_logic ;
         D : IN std_logic ;
         E : IN std_logic) ;
   end component ;
   component OBDLHS
      port (
         PAD : OUT std_logic ;
         D : IN std_logic ;
         G : IN std_logic) ;
   end component ;
   component INBUF
      port (
         Y : OUT std_logic ;
         PAD : IN std_logic) ;
   end component ;
   component DL1
      port (
         Q : OUT std_logic ;
         D : IN std_logic ;
         G : IN std_logic) ;
   end component ;
   component DLMA
      port (
         Q : OUT std_logic ;
         A : IN std_logic ;
         B : IN std_logic ;
         G : IN std_logic ;
         S : IN std_logic) ;
   end component ;
   component DL1B
      port (
         Q : OUT std_logic ;
         D : IN std_logic ;
         G : IN std_logic) ;
   end component ;
   component DFMB
      port (
         Q : OUT std_logic ;
         A : IN std_logic ;
         B : IN std_logic ;
         CLK : IN std_logic ;
         CLR : IN std_logic ;
         S : IN std_logic) ;
   end component ;
   component DFC1D
      port (
         Q : OUT std_logic ;
         CLK : IN std_logic ;
         CLR : IN std_logic ;
         D : IN std_logic) ;
   end component ;
   component DFM3B
      port (
         Q : OUT std_logic ;
         A : IN std_logic ;
         B : IN std_logic ;
         S : IN std_logic ;
         CLK : IN std_logic ;
         CLR : IN std_logic) ;
   end component ;
   component DFC1
      port (
         Q : OUT std_logic ;
         CLK : IN std_logic ;
         CLR : IN std_logic ;
         D : IN std_logic) ;
   end component ;
   component VCC
      port (
         Y : OUT std_logic) ;
   end component ;
   component GND
      port (
         Y : OUT std_logic) ;
   end component ;
   component INV
      port (
         Y : OUT std_logic ;
         A : IN std_logic) ;
   end component ;
   component OR3A
      port (
         Y : OUT std_logic ;
         B : IN std_logic ;
         C : IN std_logic ;
         A : IN std_logic) ;
   end component ;
   component AOI1B
      port (
         Y : OUT std_logic ;
         A : IN std_logic ;
         B : IN std_logic ;
         C : IN std_logic) ;
   end component ;
   component OR3B
      port (
         Y : OUT std_logic ;
         C : IN std_logic ;
         A : IN std_logic ;
         B : IN std_logic) ;
   end component ;
   component NOR2
      port (
         Y : OUT std_logic ;
         A : IN std_logic ;
         B : IN std_logic) ;
   end component ;
   component AND3A
      port (
         Y : OUT std_logic ;
         A : IN std_logic ;
         B : IN std_logic ;
         C : IN std_logic) ;
   end component ;
   component OR2
      port (
         Y : OUT std_logic ;
         A : IN std_logic ;
         B : IN std_logic) ;
   end component ;
   component NOR3
      port (
         Y : OUT std_logic ;
         A : IN std_logic ;
         B : IN std_logic ;
         C : IN std_logic) ;
   end component ;
   component OR2A
      port (
         Y : OUT std_logic ;
         B : IN std_logic ;
         A : IN std_logic) ;
   end component ;
   component AND3B
      port (
         Y : OUT std_logic ;
         A : IN std_logic ;
         B : IN std_logic ;
         C : IN std_logic) ;
   end component ;
   component BUFA
      port (
         Y : OUT std_logic ;
         A : IN std_logic) ;
   end component ;
   component CLKBUF
      port (
         Y : OUT std_logic ;
         PAD : IN std_logic) ;
   end component ;
end components ;


package body components is
end components ;

library IEEE;
use IEEE.STD_LOGIC_1164.all;
Library A3200DX;
use a3200dx.all.all;

entity fpga is
   port (
      ale : IN std_logic ;
      inta : IN std_logic ;
      reset : IN std_logic ;
      nwrs : IN std_logic ;
      code : IN std_logic_vector (3 DOWNTO 0) ;
      datas : IN std_logic_vector (7 DOWNTO 0) ;
      acka : OUT std_logic ;
      busy : OUT std_logic ;
      ctr : OUT std_logic ;
      ncs : OUT std_logic ;
      nrd : OUT std_logic ;
      nwr : OUT std_logic ;
      address : OUT std_logic_vector (4 DOWNTO 0) ;
      port0 : INOUT std_logic_vector (7 DOWNTO 0) ;
      port1 : INOUT std_logic_vector (7 DOWNTO 0) ;
      port2 : INOUT std_logic_vector (7 DOWNTO 0) ;
      port3 : INOUT std_logic_vector (7 DOWNTO 0)) ;
end fpga ;

architecture fpga_ps of fpga is
   signal u1_nx45, u1_nx46, u1_nx47, u1_nx48, u1_nx49, u1_nx50, u1_nx51, 
      u1_nx52, u2_cnt_0, u2_cnt_1, u2_cnt_2, 
      u1_ix4486_modgen_156_mi_ax_int_r_3, u1_ix4486_modgen_156_mi_ax_int_r_2, 
      u1_ix4486_modgen_156_mi_ax_int_r_1, u1_ix4486_modgen_156_mi_ax_int_r_0, 
      u1_ix4486_modgen_157_mi_ax_int_r_3, u1_ix4486_modgen_157_mi_ax_int_r_2, 
      u1_ix4486_modgen_157_mi_ax_int_r_1, u1_ix4486_modgen_157_mi_ax_int_r_0, 
      u1_ix4486_modgen_158_mi_ax_int_r_3, u1_ix4486_modgen_158_mi_ax_int_r_2, 
      u1_ix4486_modgen_158_mi_ax_int_r_1, u1_ix4486_modgen_158_mi_ax_int_r_0, 
      u1_ix4486_modgen_159_mi_ax_int_r_3, u1_ix4486_modgen_159_mi_ax_int_r_2, 
      u1_ix4486_modgen_159_mi_ax_int_r_1, u1_ix4486_modgen_159_mi_ax_int_r_0, 
      u1_ix4486_modgen_160_mi_ax_int_r_3, u1_ix4486_modgen_160_mi_ax_int_r_2, 
      u1_ix4486_modgen_160_mi_ax_int_r_1, u1_ix4486_modgen_160_mi_ax_int_r_0, 
      u1_ix4486_modgen_161_mi_ax_int_r_3, u1_ix4486_modgen_161_mi_ax_int_r_2, 
      u1_ix4486_modgen_161_mi_ax_int_r_1, u1_ix4486_modgen_161_mi_ax_int_r_0, 
      u1_ix4486_modgen_162_mi_ax_int_r_3, u1_ix4486_modgen_162_mi_ax_int_r_2, 
      u1_ix4486_modgen_162_mi_ax_int_r_1, u1_ix4486_modgen_162_mi_ax_int_r_0, 
      u1_ix4486_modgen_163_mi_ax_int_r_3, u1_ix4486_modgen_163_mi_ax_int_r_2, 
      u1_ix4486_modgen_163_mi_ax_int_r_1, u1_ix4486_modgen_163_mi_ax_int_r_0, 
      u2_modgen_153_mi_ax_int_r_1, u2_modgen_153_mi_ax_int_r_0, 
      u2_ix218_sclrbuf_5, u2_ix218_c_2, u2_ix218_c_1, ale_int, inta_int, 
      reset_int, nwrs_int, code_3_int, code_2_int, code_1_int, code_0_int, 
      datas_7_int, datas_6_int, datas_5_int, datas_4_int, datas_3_int, 
      datas_2_int, datas_1_int, datas_0_int, port0_7_int, port0_6_int, 
      port0_5_int, port0_4_int, port0_3_int, port0_2_int, port0_1_int, 
      port0_0_int, port2_7_int, port2_6_int, port3_7_int, port3_6_int, 
      port3_5_int, port3_4_int, port3_1_int, address_dup0_3, address_dup0_2, 
      address_dup0_1, address_dup0_0, u1_nx1756, u1_nx1768, u1_nx1780, 
      u1_nx1792, u1_nx1804, u1_nx1816, u1_nx1828, u1_nx1840, u1_nx1846, 
      u2_reg_7, u2_reg_6, u2_reg_5, u2_reg_4, u2_reg_3, u2_reg_2, u2_reg_1, 
      u2_reg_0, busy_dup0, u1_ix4486_a_15, u1_ix4486_a_14, u1_ix4486_a_13, 
      u1_ix4486_a_12, u1_ix4486_a_11, u1_ix4486_a_10, u1_ix4486_a_9, 
      u1_ix4486_a_8, u1_ix4486_a_7, u1_ix4486_a_6, u1_ix4486_a_5, 
      u1_ix4486_a_4, u1_ix4486_a_3_dup_3499, u1_ix4486_a_2_dup_3500, 
      u1_ix4486_a_1_dup_3501, u1_ix4486_a_0_dup_3502, 
      u1_ix4486_a_15_dup_3514, u1_ix4486_a_14_dup_3515, 
      u1_ix4486_a_13_dup_3516, u1_ix4486_a_12_dup_3517, 
      u1_ix4486_a_11_dup_3518, u1_ix4486_a_10_dup_3519, 
      u1_ix4486_a_9_dup_3520, u1_ix4486_a_8_dup_3521, u1_ix4486_a_7_dup_3522, 
      u1_ix4486_a_6_dup_3523, u1_ix4486_a_5_dup_3524, u1_ix4486_a_4_dup_3525, 
      u1_ix4486_a_3_dup_3526, u1_ix4486_a_2_dup_3527, u1_ix4486_a_1_dup_3528, 
      u1_ix4486_a_0_dup_3529, u1_ix4486_a_15_dup_3541, 
      u1_ix4486_a_14_dup_3542, u1_ix4486_a_13_dup_3543, 
      u1_ix4486_a_12_dup_3544, u1_ix4486_a_11_dup_3545, 
      u1_ix4486_a_10_dup_3546, u1_ix4486_a_9_dup_3547, 
      u1_ix4486_a_8_dup_3548, u1_ix4486_a_7_dup_3549, u1_ix4486_a_6_dup_3550, 
      u1_ix4486_a_5_dup_3551, u1_ix4486_a_4_dup_3552, u1_ix4486_a_3_dup_3553, 
      u1_ix4486_a_2_dup_3554, u1_ix4486_a_1_dup_3555, u1_ix4486_a_0_dup_3556, 
      u1_ix4486_a_15_dup_3568, u1_ix4486_a_14_dup_3569, 
      u1_ix4486_a_13_dup_3570, u1_ix4486_a_12_dup_3571, 
      u1_ix4486_a_11_dup_3572, u1_ix4486_a_10_dup_3573, 
      u1_ix4486_a_9_dup_3574, u1_ix4486_a_8_dup_3575, u1_ix4486_a_7_dup_3576, 
      u1_ix4486_a_6_dup_3577, u1_ix4486_a_5_dup_3578, u1_ix4486_a_4_dup_3579, 
      u1_ix4486_a_3_dup_3580, u1_ix4486_a_2_dup_3581, u1_ix4486_a_1_dup_3582, 
      u1_ix4486_a_0_dup_3583, u1_ix4486_a_15_dup_3595, 
      u1_ix4486_a_14_dup_3596, u1_ix4486_a_13_dup_3597, 
      u1_ix4486_a_12_dup_3598, u1_ix4486_a_11_dup_3599, 
      u1_ix4486_a_10_dup_3600, u1_ix4486_a_9_dup_3601, 
      u1_ix4486_a_8_dup_3602, u1_ix4486_a_7_dup_3603, u1_ix4486_a_6_dup_3604, 
      u1_ix4486_a_5_dup_3605, u1_ix4486_a_4_dup_3606, u1_ix4486_a_3_dup_3607, 
      u1_ix4486_a_2_dup_3608, u1_ix4486_a_1_dup_3609, u1_ix4486_a_0_dup_3610, 
      u1_ix4486_a_15_dup_3622, u1_ix4486_a_14_dup_3623, 
      u1_ix4486_a_13_dup_3624, u1_ix4486_a_12_dup_3625, 
      u1_ix4486_a_11_dup_3626, u1_ix4486_a_10_dup_3627, 
      u1_ix4486_a_9_dup_3628, u1_ix4486_a_8_dup_3629, u1_ix4486_a_7_dup_3630, 
      u1_ix4486_a_6_dup_3631, u1_ix4486_a_5_dup_3632, u1_ix4486_a_4_dup_3633, 
      u1_ix4486_a_3_dup_3634, u1_ix4486_a_2_dup_3635, u1_ix4486_a_1_dup_3636, 
      u1_ix4486_a_0_dup_3637, u1_ix4486_a_15_dup_3649, 
      u1_ix4486_a_14_dup_3650, u1_ix4486_a_13_dup_3651, 
      u1_ix4486_a_12_dup_3652, u1_ix4486_a_11_dup_3653, 
      u1_ix4486_a_10_dup_3654, u1_ix4486_a_9_dup_3655, 
      u1_ix4486_a_8_dup_3656, u1_ix4486_a_7_dup_3657, u1_ix4486_a_6_dup_3658, 
      u1_ix4486_a_5_dup_3659, u1_ix4486_a_4_dup_3660, u1_ix4486_a_3_dup_3661, 
      u1_ix4486_a_2_dup_3662, u1_ix4486_a_1_dup_3663, u1_ix4486_a_0_dup_3664, 
      u1_ix4486_a_15_dup_3676, u1_ix4486_a_14_dup_3677, 
      u1_ix4486_a_13_dup_3678, u1_ix4486_a_12_dup_3679, 
      u1_ix4486_a_11_dup_3680, u1_ix4486_a_10_dup_3681, 
      u1_ix4486_a_9_dup_3682, u1_ix4486_a_8_dup_3683, u1_ix4486_a_7_dup_3684, 
      u1_ix4486_a_6_dup_3685, u1_ix4486_a_5_dup_3686, u1_ix4486_a_4_dup_3687, 
      u1_ix4486_a_3_dup_3688, u1_ix4486_a_2_dup_3689, u1_ix4486_a_1_dup_3690, 
      u1_ix4486_a_0_dup_3691, port3_dup0_0, port3_dup0_3, address_3_XX0, 
      address_2_XX0, address_1_XX0, address_1_XX1, address_0_XX0, 
      address_0_XX1, u2_PWR, u2_nx107, GND0, u2_nx104, u2_ix218_aclrb, nx127, 
      nx128, u1_nx4482, nx129, nx130, u1_nx1842, nx131, u2_modgen_154_nx8, 
      nx132, nx133, u1_ix4486_nx497, nx134, u1_ix4486_nx501, nx135, 
      u1_ix4486_nx505, nx136, u1_ix4486_nx509, nx137, u1_ix4486_nx513, 
      u1_ix4486_nx517, u1_ix4486_nx521, u1_ix4486_nx525, u1_ix4486_nx529, 
      nx138, u1_ix4486_nx533, u1_ix4486_nx537, nx139, u1_ix4486_nx541, 
      u1_ix4486_nx545, u1_ix4486_nx549, u1_ix4486_nx553, u1_ix4486_nx557, 
      nx140, nx141, u2_nx160, nx142, nx143, nx144, nx145, nx146, nx147, 
      nx148, nx149, nx150, nx151, nx152, nx153, nx154, nx155, nx156, nx157: 
   std_logic ;

begin
   u1_ix4486_modgen_156_mi_ax_ax_0_a0 : work.components.MX4 port map ( Y=>
      u1_ix4486_modgen_156_mi_ax_int_r_0, D0=>u1_ix4486_a_0_dup_3502, D1=>
      u1_ix4486_a_1_dup_3501, D2=>u1_ix4486_a_2_dup_3500, D3=>
      u1_ix4486_a_3_dup_3499, S0=>address_0_XX0, S1=>address_1_XX0);
   u1_ix4486_modgen_156_mi_ax_ax_1_a0 : work.components.MX4 port map ( Y=>
      u1_ix4486_modgen_156_mi_ax_int_r_1, D0=>u1_ix4486_a_4, D1=>
      u1_ix4486_a_5, D2=>u1_ix4486_a_6, D3=>u1_ix4486_a_7, S0=>address_0_XX0, 
      S1=>address_1_XX0);
   u1_ix4486_modgen_156_mi_ax_ax_2_a0 : work.components.MX4 port map ( Y=>
      u1_ix4486_modgen_156_mi_ax_int_r_2, D0=>u1_ix4486_a_8, D1=>
      u1_ix4486_a_9, D2=>u1_ix4486_a_10, D3=>u1_ix4486_a_11, S0=>
      address_0_XX0, S1=>address_1_XX0);
   u1_ix4486_modgen_156_mi_ax_ax_3_a0 : work.components.MX4 port map ( Y=>
      u1_ix4486_modgen_156_mi_ax_int_r_3, D0=>u1_ix4486_a_12, D1=>
      u1_ix4486_a_13, D2=>u1_ix4486_a_14, D3=>u1_ix4486_a_15, S0=>
      address_0_XX0, S1=>address_1_XX0);
   u1_nx45_EXMPLR : work.components.MX4 port map ( Y=>u1_nx45, D0=>
      u1_ix4486_modgen_156_mi_ax_int_r_0, D1=>
      u1_ix4486_modgen_156_mi_ax_int_r_1, D2=>
      u1_ix4486_modgen_156_mi_ax_int_r_2, D3=>
      u1_ix4486_modgen_156_mi_ax_int_r_3, S0=>address_2_XX0, S1=>
      address_3_XX0);
   u1_ix4486_modgen_157_mi_ax_ax_0_a0 : work.components.MX4 port map ( Y=>
      u1_ix4486_modgen_157_mi_ax_int_r_0, D0=>u1_ix4486_a_0_dup_3529, D1=>
      u1_ix4486_a_1_dup_3528, D2=>u1_ix4486_a_2_dup_3527, D3=>
      u1_ix4486_a_3_dup_3526, S0=>address_0_XX0, S1=>address_1_XX0);
   u1_ix4486_modgen_157_mi_ax_ax_1_a0 : work.components.MX4 port map ( Y=>
      u1_ix4486_modgen_157_mi_ax_int_r_1, D0=>u1_ix4486_a_4_dup_3525, D1=>
      u1_ix4486_a_5_dup_3524, D2=>u1_ix4486_a_6_dup_3523, D3=>
      u1_ix4486_a_7_dup_3522, S0=>address_0_XX0, S1=>address_1_XX0);
   u1_ix4486_modgen_157_mi_ax_ax_2_a0 : work.components.MX4 port map ( Y=>
      u1_ix4486_modgen_157_mi_ax_int_r_2, D0=>u1_ix4486_a_8_dup_3521, D1=>
      u1_ix4486_a_9_dup_3520, D2=>u1_ix4486_a_10_dup_3519, D3=>
      u1_ix4486_a_11_dup_3518, S0=>address_0_XX0, S1=>address_1_XX0);
   u1_ix4486_modgen_157_mi_ax_ax_3_a0 : work.components.MX4 port map ( Y=>
      u1_ix4486_modgen_157_mi_ax_int_r_3, D0=>u1_ix4486_a_12_dup_3517, D1=>
      u1_ix4486_a_13_dup_3516, D2=>u1_ix4486_a_14_dup_3515, D3=>
      u1_ix4486_a_15_dup_3514, S0=>address_0_XX0, S1=>address_1_XX0);
   u1_nx46_EXMPLR : work.components.MX4 port map ( Y=>u1_nx46, D0=>
      u1_ix4486_modgen_157_mi_ax_int_r_0, D1=>
      u1_ix4486_modgen_157_mi_ax_int_r_1, D2=>
      u1_ix4486_modgen_157_mi_ax_int_r_2, D3=>
      u1_ix4486_modgen_157_mi_ax_int_r_3, S0=>address_2_XX0, S1=>
      address_3_XX0);
   u1_ix4486_modgen_158_mi_ax_ax_0_a0 : work.components.MX4 port map ( Y=>
      u1_ix4486_modgen_158_mi_ax_int_r_0, D0=>u1_ix4486_a_0_dup_3556, D1=>
      u1_ix4486_a_1_dup_3555, D2=>u1_ix4486_a_2_dup_3554, D3=>
      u1_ix4486_a_3_dup_3553, S0=>address_0_XX0, S1=>address_1_XX0);
   u1_ix4486_modgen_158_mi_ax_ax_1_a0 : work.components.MX4 port map ( Y=>
      u1_ix4486_modgen_158_mi_ax_int_r_1, D0=>u1_ix4486_a_4_dup_3552, D1=>
      u1_ix4486_a_5_dup_3551, D2=>u1_ix4486_a_6_dup_3550, D3=>
      u1_ix4486_a_7_dup_3549, S0=>address_0_XX0, S1=>address_1_XX0);
   u1_ix4486_modgen_158_mi_ax_ax_2_a0 : work.components.MX4 port map ( Y=>
      u1_ix4486_modgen_158_mi_ax_int_r_2, D0=>u1_ix4486_a_8_dup_3548, D1=>
      u1_ix4486_a_9_dup_3547, D2=>u1_ix4486_a_10_dup_3546, D3=>
      u1_ix4486_a_11_dup_3545, S0=>address_0_XX0, S1=>address_1_XX0);
   u1_ix4486_modgen_158_mi_ax_ax_3_a0 : work.components.MX4 port map ( Y=>
      u1_ix4486_modgen_158_mi_ax_int_r_3, D0=>u1_ix4486_a_12_dup_3544, D1=>
      u1_ix4486_a_13_dup_3543, D2=>u1_ix4486_a_14_dup_3542, D3=>
      u1_ix4486_a_15_dup_3541, S0=>address_0_XX0, S1=>address_1_XX0);
   u1_nx47_EXMPLR : work.components.MX4 port map ( Y=>u1_nx47, D0=>
      u1_ix4486_modgen_158_mi_ax_int_r_0, D1=>
      u1_ix4486_modgen_158_mi_ax_int_r_1, D2=>
      u1_ix4486_modgen_158_mi_ax_int_r_2, D3=>
      u1_ix4486_modgen_158_mi_ax_int_r_3, S0=>address_2_XX0, S1=>
      address_3_XX0);
   u1_ix4486_modgen_159_mi_ax_ax_0_a0 : work.components.MX4 port map ( Y=>
      u1_ix4486_modgen_159_mi_ax_int_r_0, D0=>u1_ix4486_a_0_dup_3583, D1=>
      u1_ix4486_a_1_dup_3582, D2=>u1_ix4486_a_2_dup_3581, D3=>
      u1_ix4486_a_3_dup_3580, S0=>address_0_XX1, S1=>address_1_XX0);
   u1_ix4486_modgen_159_mi_ax_ax_1_a0 : work.components.MX4 port map ( Y=>
      u1_ix4486_modgen_159_mi_ax_int_r_1, D0=>u1_ix4486_a_4_dup_3579, D1=>
      u1_ix4486_a_5_dup_3578, D2=>u1_ix4486_a_6_dup_3577, D3=>
      u1_ix4486_a_7_dup_3576, S0=>address_0_XX1, S1=>address_1_XX0);
   u1_ix4486_modgen_159_mi_ax_ax_2_a0 : work.components.MX4 port map ( Y=>
      u1_ix4486_modgen_159_mi_ax_int_r_2, D0=>u1_ix4486_a_8_dup_3575, D1=>
      u1_ix4486_a_9_dup_3574, D2=>u1_ix4486_a_10_dup_3573, D3=>
      u1_ix4486_a_11_dup_3572, S0=>address_0_XX1, S1=>address_1_XX1);
   u1_ix4486_modgen_159_mi_ax_ax_3_a0 : work.components.MX4 port map ( Y=>
      u1_ix4486_modgen_159_mi_ax_int_r_3, D0=>u1_ix4486_a_12_dup_3571, D1=>
      u1_ix4486_a_13_dup_3570, D2=>u1_ix4486_a_14_dup_3569, D3=>
      u1_ix4486_a_15_dup_3568, S0=>address_0_XX1, S1=>address_1_XX1);
   u1_nx48_EXMPLR : work.components.MX4 port map ( Y=>u1_nx48, D0=>
      u1_ix4486_modgen_159_mi_ax_int_r_0, D1=>
      u1_ix4486_modgen_159_mi_ax_int_r_1, D2=>
      u1_ix4486_modgen_159_mi_ax_int_r_2, D3=>
      u1_ix4486_modgen_159_mi_ax_int_r_3, S0=>address_2_XX0, S1=>
      address_3_XX0);
   u1_ix4486_modgen_160_mi_ax_ax_0_a0 : work.components.MX4 port map ( Y=>
      u1_ix4486_modgen_160_mi_ax_int_r_0, D0=>u1_ix4486_a_0_dup_3610, D1=>
      u1_ix4486_a_1_dup_3609, D2=>u1_ix4486_a_2_dup_3608, D3=>
      u1_ix4486_a_3_dup_3607, S0=>address_0_XX1, S1=>address_1_XX1);
   u1_ix4486_modgen_160_mi_ax_ax_1_a0 : work.components.MX4 port map ( Y=>
      u1_ix4486_modgen_160_mi_ax_int_r_1, D0=>u1_ix4486_a_4_dup_3606, D1=>
      u1_ix4486_a_5_dup_3605, D2=>u1_ix4486_a_6_dup_3604, D3=>
      u1_ix4486_a_7_dup_3603, S0=>address_0_XX1, S1=>address_1_XX1);
   u1_ix4486_modgen_160_mi_ax_ax_2_a0 : work.components.MX4 port map ( Y=>
      u1_ix4486_modgen_160_mi_ax_int_r_2, D0=>u1_ix4486_a_8_dup_3602, D1=>
      u1_ix4486_a_9_dup_3601, D2=>u1_ix4486_a_10_dup_3600, D3=>
      u1_ix4486_a_11_dup_3599, S0=>address_0_XX1, S1=>address_1_XX1);
   u1_ix4486_modgen_160_mi_ax_ax_3_a0 : work.components.MX4 port map ( Y=>
      u1_ix4486_modgen_160_mi_ax_int_r_3, D0=>u1_ix4486_a_12_dup_3598, D1=>
      u1_ix4486_a_13_dup_3597, D2=>u1_ix4486_a_14_dup_3596, D3=>
      u1_ix4486_a_15_dup_3595, S0=>address_0_XX1, S1=>address_1_XX1);
   u1_nx49_EXMPLR : work.components.MX4 port map ( Y=>u1_nx49, D0=>
      u1_ix4486_modgen_160_mi_ax_int_r_0, D1=>
      u1_ix4486_modgen_160_mi_ax_int_r_1, D2=>
      u1_ix4486_modgen_160_mi_ax_int_r_2, D3=>
      u1_ix4486_modgen_160_mi_ax_int_r_3, S0=>address_2_XX0, S1=>
      address_3_XX0);
   u1_ix4486_modgen_161_mi_ax_ax_0_a0 : work.components.MX4 port map ( Y=>
      u1_ix4486_modgen_161_mi_ax_int_r_0, D0=>u1_ix4486_a_0_dup_3637, D1=>
      u1_ix4486_a_1_dup_3636, D2=>u1_ix4486_a_2_dup_3635, D3=>
      u1_ix4486_a_3_dup_3634, S0=>address_0_XX1, S1=>address_1_XX1);
   u1_ix4486_modgen_161_mi_ax_ax_1_a0 : work.components.MX4 port map ( Y=>
      u1_ix4486_modgen_161_mi_ax_int_r_1, D0=>u1_ix4486_a_4_dup_3633, D1=>
      u1_ix4486_a_5_dup_3632, D2=>u1_ix4486_a_6_dup_3631, D3=>
      u1_ix4486_a_7_dup_3630, S0=>address_0_XX1, S1=>address_1_XX1);
   u1_ix4486_modgen_161_mi_ax_ax_2_a0 : work.components.MX4 port map ( Y=>
      u1_ix4486_modgen_161_mi_ax_int_r_2, D0=>u1_ix4486_a_8_dup_3629, D1=>
      u1_ix4486_a_9_dup_3628, D2=>u1_ix4486_a_10_dup_3627, D3=>
      u1_ix4486_a_11_dup_3626, S0=>address_0_XX1, S1=>address_1_XX1);
   u1_ix4486_modgen_161_mi_ax_ax_3_a0 : work.components.MX4 port map ( Y=>
      u1_ix4486_modgen_161_mi_ax_int_r_3, D0=>u1_ix4486_a_12_dup_3625, D1=>
      u1_ix4486_a_13_dup_3624, D2=>u1_ix4486_a_14_dup_3623, D3=>
      u1_ix4486_a_15_dup_3622, S0=>address_0_XX1, S1=>address_1_XX1);
   u1_nx50_EXMPLR : work.components.MX4 port map ( Y=>u1_nx50, D0=>
      u1_ix4486_modgen_161_mi_ax_int_r_0, D1=>
      u1_ix4486_modgen_161_mi_ax_int_r_1, D2=>
      u1_ix4486_modgen_161_mi_ax_int_r_2, D3=>
      u1_ix4486_modgen_161_mi_ax_int_r_3, S0=>address_2_XX0, S1=>
      address_3_XX0);
   u1_ix4486_modgen_162_mi_ax_ax_0_a0 : work.components.MX4 port map ( Y=>
      u1_ix4486_modgen_162_mi_ax_int_r_0, D0=>u1_ix4486_a_0_dup_3664, D1=>
      u1_ix4486_a_1_dup_3663, D2=>u1_ix4486_a_2_dup_3662, D3=>
      u1_ix4486_a_3_dup_3661, S0=>address_dup0_0, S1=>address_1_XX1);
   u1_ix4486_modgen_162_mi_ax_ax_1_a0 : work.components.MX4 port map ( Y=>
      u1_ix4486_modgen_162_mi_ax_int_r_1, D0=>u1_ix4486_a_4_dup_3660, D1=>
      u1_ix4486_a_5_dup_3659, D2=>u1_ix4486_a_6_dup_3658, D3=>
      u1_ix4486_a_7_dup_3657, S0=>address_dup0_0, S1=>address_1_XX1);
   u1_ix4486_modgen_162_mi_ax_ax_2_a0 : work.components.MX4 port map ( Y=>
      u1_ix4486_modgen_162_mi_ax_int_r_2, D0=>u1_ix4486_a_8_dup_3656, D1=>
      u1_ix4486_a_9_dup_3655, D2=>u1_ix4486_a_10_dup_3654, D3=>
      u1_ix4486_a_11_dup_3653, S0=>address_dup0_0, S1=>address_1_XX1);
   u1_ix4486_modgen_162_mi_ax_ax_3_a0 : work.components.MX4 port map ( Y=>
      u1_ix4486_modgen_162_mi_ax_int_r_3, D0=>u1_ix4486_a_12_dup_3652, D1=>
      u1_ix4486_a_13_dup_3651, D2=>u1_ix4486_a_14_dup_3650, D3=>
      u1_ix4486_a_15_dup_3649, S0=>address_dup0_0, S1=>address_1_XX1);
   u1_nx51_EXMPLR : work.components.MX4 port map ( Y=>u1_nx51, D0=>
      u1_ix4486_modgen_162_mi_ax_int_r_0, D1=>
      u1_ix4486_modgen_162_mi_ax_int_r_1, D2=>
      u1_ix4486_modgen_162_mi_ax_int_r_2, D3=>
      u1_ix4486_modgen_162_mi_ax_int_r_3, S0=>address_2_XX0, S1=>
      address_3_XX0);
   u1_ix4486_modgen_163_mi_ax_ax_0_a0 : work.components.MX4 port map ( Y=>
      u1_ix4486_modgen_163_mi_ax_int_r_0, D0=>u1_ix4486_a_0_dup_3691, D1=>
      u1_ix4486_a_1_dup_3690, D2=>u1_ix4486_a_2_dup_3689, D3=>
      u1_ix4486_a_3_dup_3688, S0=>address_dup0_0, S1=>address_dup0_1);
   u1_ix4486_modgen_163_mi_ax_ax_1_a0 : work.components.MX4 port map ( Y=>
      u1_ix4486_modgen_163_mi_ax_int_r_1, D0=>u1_ix4486_a_4_dup_3687, D1=>
      u1_ix4486_a_5_dup_3686, D2=>u1_ix4486_a_6_dup_3685, D3=>
      u1_ix4486_a_7_dup_3684, S0=>address_dup0_0, S1=>address_dup0_1);
   u1_ix4486_modgen_163_mi_ax_ax_2_a0 : work.components.MX4 port map ( Y=>
      u1_ix4486_modgen_163_mi_ax_int_r_2, D0=>u1_ix4486_a_8_dup_3683, D1=>
      u1_ix4486_a_9_dup_3682, D2=>u1_ix4486_a_10_dup_3681, D3=>
      u1_ix4486_a_11_dup_3680, S0=>address_dup0_0, S1=>address_dup0_1);
   u1_ix4486_modgen_163_mi_ax_ax_3_a0 : work.components.MX4 port map ( Y=>
      u1_ix4486_modgen_163_mi_ax_int_r_3, D0=>u1_ix4486_a_12_dup_3679, D1=>
      u1_ix4486_a_13_dup_3678, D2=>u1_ix4486_a_14_dup_3677, D3=>
      u1_ix4486_a_15_dup_3676, S0=>address_dup0_0, S1=>address_dup0_1);
   u1_nx52_EXMPLR : work.components.MX4 port map ( Y=>u1_nx52, D0=>
      u1_ix4486_modgen_163_mi_ax_int_r_0, D1=>
      u1_ix4486_modgen_163_mi_ax_int_r_1, D2=>
      u1_ix4486_modgen_163_mi_ax_int_r_2, D3=>
      u1_ix4486_modgen_163_mi_ax_int_r_3, S0=>address_2_XX0, S1=>
      address_3_XX0);
   u2_modgen_153_mi_ax_ax_0_a0 : work.components.MX4 port map ( Y=>
      u2_modgen_153_mi_ax_int_r_0, D0=>u2_reg_0, D1=>u2_reg_1, D2=>u2_reg_2, 
      D3=>u2_reg_3, S0=>u2_cnt_2, S1=>u2_cnt_1);
   u2_modgen_153_mi_ax_ax_1_a0 : work.components.MX4 port map ( Y=>
      u2_modgen_153_mi_ax_int_r_1, D0=>u2_reg_4, D1=>u2_reg_5, D2=>u2_reg_6, 
      D3=>u2_reg_7, S0=>u2_cnt_2, S1=>u2_cnt_1);
   u2_ix218_l0_0_l0 : work.components.NAND2 port map ( Y=>u2_ix218_sclrbuf_5, 
      A=>u2_PWR, B=>u2_nx107);
   u2_cnt_2_EXMPLR : work.components.DFM6A port map ( Q=>u2_cnt_2, D0=>GND0, 
      D1=>u2_ix218_sclrbuf_5, D2=>u2_ix218_sclrbuf_5, D3=>GND0, S1=>u2_cnt_2, 
      S0=>u2_PWR, CLK=>u2_nx104, CLR=>u2_ix218_aclrb);
   u2_cnt_1_EXMPLR : work.components.DFM6A port map ( Q=>u2_cnt_1, D0=>GND0, 
      D1=>u2_ix218_sclrbuf_5, D2=>u2_ix218_sclrbuf_5, D3=>GND0, S1=>u2_cnt_1, 
      S0=>u2_ix218_c_1, CLK=>u2_nx104, CLR=>u2_ix218_aclrb);
   u2_cnt_0_EXMPLR : work.components.DFM6A port map ( Q=>u2_cnt_0, D0=>GND0, 
      D1=>u2_ix218_sclrbuf_5, D2=>u2_ix218_sclrbuf_5, D3=>GND0, S1=>u2_cnt_0, 
      S0=>u2_ix218_c_2, CLK=>u2_nx104, CLR=>u2_ix218_aclrb);
   u2_ix218_l0_l0 : work.components.AND2 port map ( Y=>u2_ix218_c_1, A=>
      u2_cnt_2, B=>u2_PWR);
   u2_ix218_l1_l0 : work.components.AND3 port map ( Y=>u2_ix218_c_2, A=>
      u2_cnt_1, B=>u2_cnt_2, C=>u2_PWR);
   ix158 : work.components.OUTBUF port map ( PAD=>port3(0), D=>nx127);
   ix159 : work.components.BIBUF port map ( PAD=>port3(1), Y=>port3_1_int, D
      =>GND0, E=>GND0);
   ix160 : work.components.OUTBUF port map ( PAD=>port3(2), D=>inta_int);
   ix161 : work.components.OUTBUF port map ( PAD=>port3(3), D=>nx128);
   ix162 : work.components.BIBUF port map ( PAD=>port3(4), Y=>port3_4_int, D
      =>GND0, E=>GND0);
   ix163 : work.components.BIBUF port map ( PAD=>port3(5), Y=>port3_5_int, D
      =>GND0, E=>GND0);
   ix164 : work.components.BIBUF port map ( PAD=>port3(6), Y=>port3_6_int, D
      =>GND0, E=>GND0);
   ix165 : work.components.BIBUF port map ( PAD=>port3(7), Y=>port3_7_int, D
      =>GND0, E=>GND0);
   ix166 : work.components.TRIBUFF port map ( PAD=>port2(0), D=>GND0, E=>
      GND0);
   ix167 : work.components.TRIBUFF port map ( PAD=>port2(1), D=>GND0, E=>
      GND0);
   ix168 : work.components.TRIBUFF port map ( PAD=>port2(2), D=>GND0, E=>
      GND0);
   ix169 : work.components.TRIBUFF port map ( PAD=>port2(3), D=>GND0, E=>
      GND0);
   ix170 : work.components.TRIBUFF port map ( PAD=>port2(4), D=>GND0, E=>
      GND0);
   ix171 : work.components.TRIBUFF port map ( PAD=>port2(5), D=>GND0, E=>
      GND0);
   ix172 : work.components.BIBUF port map ( PAD=>port2(6), Y=>port2_6_int, D
      =>GND0, E=>GND0);
   ix173 : work.components.BIBUF port map ( PAD=>port2(7), Y=>port2_7_int, D
      =>GND0, E=>GND0);
   ix174 : work.components.OUTBUF port map ( PAD=>port1(0), D=>code_0_int);
   ix175 : work.components.OUTBUF port map ( PAD=>port1(1), D=>code_1_int);
   ix176 : work.components.OUTBUF port map ( PAD=>port1(2), D=>code_2_int);
   ix177 : work.components.OUTBUF port map ( PAD=>port1(3), D=>code_3_int);
   ix178 : work.components.TRIBUFF port map ( PAD=>port1(4), D=>GND0, E=>
      GND0);
   ix179 : work.components.TRIBUFF port map ( PAD=>port1(5), D=>GND0, E=>
      GND0);
   ix180 : work.components.TRIBUFF port map ( PAD=>port1(6), D=>GND0, E=>
      GND0);
   ix181 : work.components.TRIBUFF port map ( PAD=>port1(7), D=>GND0, E=>
      GND0);
   ix182 : work.components.BIBUF port map ( PAD=>port0(0), Y=>port0_0_int, D
      =>u1_nx1840, E=>u1_nx1846);
   ix183 : work.components.BIBUF port map ( PAD=>port0(1), Y=>port0_1_int, D
      =>u1_nx1828, E=>u1_nx1846);
   ix184 : work.components.BIBUF port map ( PAD=>port0(2), Y=>port0_2_int, D
      =>u1_nx1816, E=>u1_nx1846);
   ix185 : work.components.BIBUF port map ( PAD=>port0(3), Y=>port0_3_int, D
      =>u1_nx1804, E=>u1_nx1846);
   ix186 : work.components.BIBUF port map ( PAD=>port0(4), Y=>port0_4_int, D
      =>u1_nx1792, E=>u1_nx1846);
   ix187 : work.components.BIBUF port map ( PAD=>port0(5), Y=>port0_5_int, D
      =>u1_nx1780, E=>u1_nx1846);
   ix188 : work.components.BIBUF port map ( PAD=>port0(6), Y=>port0_6_int, D
      =>u1_nx1768, E=>u1_nx1846);
   ix189 : work.components.BIBUF port map ( PAD=>port0(7), Y=>port0_7_int, D
      =>u1_nx1756, E=>u1_nx1846);
   ix190 : work.components.OUTBUF port map ( PAD=>address(0), D=>
      address_dup0_0);
   ix191 : work.components.OUTBUF port map ( PAD=>address(1), D=>
      address_dup0_1);
   ix192 : work.components.OUTBUF port map ( PAD=>address(2), D=>
      address_2_XX0);
   ix193 : work.components.OUTBUF port map ( PAD=>address(3), D=>
      address_dup0_3);
   u0_lat_outp_4 : work.components.OBDLHS port map ( PAD=>address(4), D=>
      nx142, G=>ale_int);
   ix194 : work.components.OUTBUF port map ( PAD=>nwr, D=>port3_6_int);
   ix195 : work.components.OUTBUF port map ( PAD=>nrd, D=>port3_7_int);
   ix196 : work.components.OUTBUF port map ( PAD=>ncs, D=>port2_6_int);
   ix197 : work.components.OUTBUF port map ( PAD=>ctr, D=>port3_4_int);
   ix198 : work.components.OUTBUF port map ( PAD=>busy, D=>busy_dup0);
   ix199 : work.components.OUTBUF port map ( PAD=>acka, D=>port3_5_int);
   ix200 : work.components.INBUF port map ( Y=>datas_0_int, PAD=>datas(0));
   ix201 : work.components.INBUF port map ( Y=>datas_1_int, PAD=>datas(1));
   ix202 : work.components.INBUF port map ( Y=>datas_2_int, PAD=>datas(2));
   ix203 : work.components.INBUF port map ( Y=>datas_3_int, PAD=>datas(3));
   ix204 : work.components.INBUF port map ( Y=>datas_4_int, PAD=>datas(4));
   ix205 : work.components.INBUF port map ( Y=>datas_5_int, PAD=>datas(5));
   ix206 : work.components.INBUF port map ( Y=>datas_6_int, PAD=>datas(6));
   ix207 : work.components.INBUF port map ( Y=>datas_7_int, PAD=>datas(7));
   ix208 : work.components.INBUF port map ( Y=>code_0_int, PAD=>code(0));
   ix209 : work.components.INBUF port map ( Y=>code_1_int, PAD=>code(1));
   ix210 : work.components.INBUF port map ( Y=>code_2_int, PAD=>code(2));
   ix211 : work.components.INBUF port map ( Y=>code_3_int, PAD=>code(3));
   ix213 : work.components.INBUF port map ( Y=>reset_int, PAD=>reset);
   ix214 : work.components.INBUF port map ( Y=>inta_int, PAD=>inta);
   ix215 : work.components.INBUF port map ( Y=>ale_int, PAD=>ale);
   u0_lat_outp_3 : work.components.DL1 port map ( Q=>address_dup0_3, D=>
      nx144, G=>ale_int);
   u0_lat_outp_2 : work.components.DL1 port map ( Q=>address_dup0_2, D=>
      nx146, G=>ale_int);
   u0_lat_outp_1 : work.components.DL1 port map ( Q=>address_dup0_1, D=>
      nx148, G=>ale_int);
   u0_lat_outp_0 : work.components.DL1 port map ( Q=>address_dup0_0, D=>
      nx150, G=>ale_int);
   u1_ix1757 : work.components.DLMA port map ( Q=>u1_nx1756, A=>u1_nx45, B=>
      nx152, G=>nx129, S=>port3_7_int);
   u1_ix1769 : work.components.DLMA port map ( Q=>u1_nx1768, A=>u1_nx46, B=>
      nx154, G=>nx129, S=>port3_7_int);
   u1_ix1781 : work.components.DLMA port map ( Q=>u1_nx1780, A=>u1_nx47, B=>
      nx156, G=>nx129, S=>port3_7_int);
   u1_ix1793 : work.components.DLMA port map ( Q=>u1_nx1792, A=>u1_nx48, B=>
      nx142, G=>nx129, S=>port3_7_int);
   u1_ix1805 : work.components.DLMA port map ( Q=>u1_nx1804, A=>u1_nx49, B=>
      nx144, G=>nx129, S=>port3_7_int);
   u1_ix1817 : work.components.DLMA port map ( Q=>u1_nx1816, A=>u1_nx50, B=>
      nx146, G=>nx129, S=>port3_7_int);
   u1_ix1829 : work.components.DLMA port map ( Q=>u1_nx1828, A=>u1_nx51, B=>
      nx148, G=>nx129, S=>port3_7_int);
   u1_ix1841 : work.components.DLMA port map ( Q=>u1_nx1840, A=>u1_nx52, B=>
      nx150, G=>nx129, S=>port3_7_int);
   u1_ix1847 : work.components.DL1B port map ( Q=>u1_nx1846, D=>u1_nx1842, G
      =>nx129);
   u2_reg_reg_7 : work.components.DFMB port map ( Q=>u2_reg_7, A=>
      datas_7_int, B=>u2_reg_7, CLK=>nwrs_int, CLR=>u2_ix218_aclrb, S=>
      busy_dup0);
   u2_reg_reg_6 : work.components.DFMB port map ( Q=>u2_reg_6, A=>
      datas_6_int, B=>u2_reg_6, CLK=>nwrs_int, CLR=>u2_ix218_aclrb, S=>
      busy_dup0);
   u2_reg_reg_5 : work.components.DFMB port map ( Q=>u2_reg_5, A=>
      datas_5_int, B=>u2_reg_5, CLK=>nwrs_int, CLR=>u2_ix218_aclrb, S=>
      busy_dup0);
   u2_reg_reg_4 : work.components.DFMB port map ( Q=>u2_reg_4, A=>
      datas_4_int, B=>u2_reg_4, CLK=>nwrs_int, CLR=>u2_ix218_aclrb, S=>
      busy_dup0);
   u2_reg_reg_3 : work.components.DFMB port map ( Q=>u2_reg_3, A=>
      datas_3_int, B=>u2_reg_3, CLK=>nwrs_int, CLR=>u2_ix218_aclrb, S=>
      busy_dup0);
   u2_reg_reg_2 : work.components.DFMB port map ( Q=>u2_reg_2, A=>
      datas_2_int, B=>u2_reg_2, CLK=>nwrs_int, CLR=>u2_ix218_aclrb, S=>
      busy_dup0);
   u2_reg_reg_1 : work.components.DFMB port map ( Q=>u2_reg_1, A=>
      datas_1_int, B=>u2_reg_1, CLK=>nwrs_int, CLR=>u2_ix218_aclrb, S=>
      busy_dup0);
   u2_reg_reg_0 : work.components.DFMB port map ( Q=>u2_reg_0, A=>
      datas_0_int, B=>u2_reg_0, CLK=>nwrs_int, CLR=>u2_ix218_aclrb, S=>
      busy_dup0);
   u2_reg_busy_int : work.components.DFC1D port map ( Q=>busy_dup0, CLK=>
      port3_1_int, CLR=>u2_ix218_aclrb, D=>u2_modgen_154_nx8);
   u1_ix4486_ix43 : work.components.DL1 port map ( Q=>u1_ix4486_a_15, D=>
      nx152, G=>u1_ix4486_nx497);
   u1_ix4486_ix47 : work.components.DL1 port map ( Q=>u1_ix4486_a_14, D=>
      nx152, G=>u1_ix4486_nx501);
   u1_ix4486_ix51 : work.components.DL1 port map ( Q=>u1_ix4486_a_13, D=>
      nx152, G=>u1_ix4486_nx505);
   u1_ix4486_ix55 : work.components.DL1 port map ( Q=>u1_ix4486_a_12, D=>
      nx152, G=>u1_ix4486_nx509);
   u1_ix4486_ix59 : work.components.DL1 port map ( Q=>u1_ix4486_a_11, D=>
      nx152, G=>u1_ix4486_nx513);
   u1_ix4486_ix63 : work.components.DL1 port map ( Q=>u1_ix4486_a_10, D=>
      nx152, G=>u1_ix4486_nx517);
   u1_ix4486_ix67 : work.components.DL1 port map ( Q=>u1_ix4486_a_9, D=>
      nx152, G=>u1_ix4486_nx521);
   u1_ix4486_ix71 : work.components.DL1 port map ( Q=>u1_ix4486_a_8, D=>
      nx153, G=>u1_ix4486_nx525);
   u1_ix4486_ix75 : work.components.DL1 port map ( Q=>u1_ix4486_a_7, D=>
      nx153, G=>u1_ix4486_nx529);
   u1_ix4486_ix79 : work.components.DL1 port map ( Q=>u1_ix4486_a_6, D=>
      nx153, G=>u1_ix4486_nx533);
   u1_ix4486_ix83 : work.components.DL1 port map ( Q=>u1_ix4486_a_5, D=>
      nx153, G=>u1_ix4486_nx537);
   u1_ix4486_ix87 : work.components.DL1 port map ( Q=>u1_ix4486_a_4, D=>
      nx153, G=>u1_ix4486_nx541);
   u1_ix4486_ix91 : work.components.DL1 port map ( Q=>u1_ix4486_a_3_dup_3499, 
      D=>nx153, G=>u1_ix4486_nx545);
   u1_ix4486_ix95 : work.components.DL1 port map ( Q=>u1_ix4486_a_2_dup_3500, 
      D=>nx153, G=>u1_ix4486_nx549);
   u1_ix4486_ix99 : work.components.DL1 port map ( Q=>u1_ix4486_a_1_dup_3501, 
      D=>nx153, G=>u1_ix4486_nx553);
   u1_ix4486_ix103 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_0_dup_3502, D=>nx153, G=>u1_ix4486_nx557);
   u1_ix4486_ix110 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_15_dup_3514, D=>nx154, G=>u1_ix4486_nx497);
   u1_ix4486_ix114 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_14_dup_3515, D=>nx154, G=>u1_ix4486_nx501);
   u1_ix4486_ix118 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_13_dup_3516, D=>nx154, G=>u1_ix4486_nx505);
   u1_ix4486_ix122 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_12_dup_3517, D=>nx154, G=>u1_ix4486_nx509);
   u1_ix4486_ix126 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_11_dup_3518, D=>nx154, G=>u1_ix4486_nx513);
   u1_ix4486_ix130 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_10_dup_3519, D=>nx154, G=>u1_ix4486_nx517);
   u1_ix4486_ix134 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_9_dup_3520, D=>nx154, G=>u1_ix4486_nx521);
   u1_ix4486_ix138 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_8_dup_3521, D=>nx155, G=>u1_ix4486_nx525);
   u1_ix4486_ix142 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_7_dup_3522, D=>nx155, G=>u1_ix4486_nx529);
   u1_ix4486_ix146 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_6_dup_3523, D=>nx155, G=>u1_ix4486_nx533);
   u1_ix4486_ix150 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_5_dup_3524, D=>nx155, G=>u1_ix4486_nx537);
   u1_ix4486_ix154 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_4_dup_3525, D=>nx155, G=>u1_ix4486_nx541);
   u1_ix4486_ix158 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_3_dup_3526, D=>nx155, G=>u1_ix4486_nx545);
   u1_ix4486_ix162 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_2_dup_3527, D=>nx155, G=>u1_ix4486_nx549);
   u1_ix4486_ix166 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_1_dup_3528, D=>nx155, G=>u1_ix4486_nx553);
   u1_ix4486_ix170 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_0_dup_3529, D=>nx155, G=>u1_ix4486_nx557);
   u1_ix4486_ix175 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_15_dup_3541, D=>nx156, G=>u1_ix4486_nx497);
   u1_ix4486_ix179 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_14_dup_3542, D=>nx156, G=>u1_ix4486_nx501);
   u1_ix4486_ix183 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_13_dup_3543, D=>nx156, G=>u1_ix4486_nx505);
   u1_ix4486_ix187 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_12_dup_3544, D=>nx156, G=>u1_ix4486_nx509);
   u1_ix4486_ix191 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_11_dup_3545, D=>nx156, G=>u1_ix4486_nx513);
   u1_ix4486_ix195 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_10_dup_3546, D=>nx156, G=>u1_ix4486_nx517);
   u1_ix4486_ix199 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_9_dup_3547, D=>nx156, G=>u1_ix4486_nx521);
   u1_ix4486_ix203 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_8_dup_3548, D=>nx157, G=>u1_ix4486_nx525);
   u1_ix4486_ix207 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_7_dup_3549, D=>nx157, G=>u1_ix4486_nx529);
   u1_ix4486_ix211 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_6_dup_3550, D=>nx157, G=>u1_ix4486_nx533);
   u1_ix4486_ix215 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_5_dup_3551, D=>nx157, G=>u1_ix4486_nx537);
   u1_ix4486_ix219 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_4_dup_3552, D=>nx157, G=>u1_ix4486_nx541);
   u1_ix4486_ix223 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_3_dup_3553, D=>nx157, G=>u1_ix4486_nx545);
   u1_ix4486_ix227 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_2_dup_3554, D=>nx157, G=>u1_ix4486_nx549);
   u1_ix4486_ix231 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_1_dup_3555, D=>nx157, G=>u1_ix4486_nx553);
   u1_ix4486_ix235 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_0_dup_3556, D=>nx157, G=>u1_ix4486_nx557);
   u1_ix4486_ix240 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_15_dup_3568, D=>nx142, G=>u1_ix4486_nx497);
   u1_ix4486_ix244 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_14_dup_3569, D=>nx142, G=>u1_ix4486_nx501);
   u1_ix4486_ix248 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_13_dup_3570, D=>nx142, G=>u1_ix4486_nx505);
   u1_ix4486_ix252 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_12_dup_3571, D=>nx142, G=>u1_ix4486_nx509);
   u1_ix4486_ix256 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_11_dup_3572, D=>nx142, G=>u1_ix4486_nx513);
   u1_ix4486_ix260 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_10_dup_3573, D=>nx142, G=>u1_ix4486_nx517);
   u1_ix4486_ix264 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_9_dup_3574, D=>nx142, G=>u1_ix4486_nx521);
   u1_ix4486_ix268 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_8_dup_3575, D=>nx143, G=>u1_ix4486_nx525);
   u1_ix4486_ix272 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_7_dup_3576, D=>nx143, G=>u1_ix4486_nx529);
   u1_ix4486_ix276 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_6_dup_3577, D=>nx143, G=>u1_ix4486_nx533);
   u1_ix4486_ix280 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_5_dup_3578, D=>nx143, G=>u1_ix4486_nx537);
   u1_ix4486_ix284 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_4_dup_3579, D=>nx143, G=>u1_ix4486_nx541);
   u1_ix4486_ix288 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_3_dup_3580, D=>nx143, G=>u1_ix4486_nx545);
   u1_ix4486_ix292 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_2_dup_3581, D=>nx143, G=>u1_ix4486_nx549);
   u1_ix4486_ix296 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_1_dup_3582, D=>nx143, G=>u1_ix4486_nx553);
   u1_ix4486_ix300 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_0_dup_3583, D=>nx143, G=>u1_ix4486_nx557);
   u1_ix4486_ix305 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_15_dup_3595, D=>nx144, G=>u1_ix4486_nx497);
   u1_ix4486_ix309 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_14_dup_3596, D=>nx144, G=>u1_ix4486_nx501);
   u1_ix4486_ix313 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_13_dup_3597, D=>nx144, G=>u1_ix4486_nx505);
   u1_ix4486_ix317 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_12_dup_3598, D=>nx144, G=>u1_ix4486_nx509);
   u1_ix4486_ix321 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_11_dup_3599, D=>nx144, G=>u1_ix4486_nx513);
   u1_ix4486_ix325 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_10_dup_3600, D=>nx144, G=>u1_ix4486_nx517);
   u1_ix4486_ix329 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_9_dup_3601, D=>nx144, G=>u1_ix4486_nx521);
   u1_ix4486_ix333 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_8_dup_3602, D=>nx145, G=>u1_ix4486_nx525);
   u1_ix4486_ix337 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_7_dup_3603, D=>nx145, G=>u1_ix4486_nx529);
   u1_ix4486_ix341 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_6_dup_3604, D=>nx145, G=>u1_ix4486_nx533);
   u1_ix4486_ix345 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_5_dup_3605, D=>nx145, G=>u1_ix4486_nx537);
   u1_ix4486_ix349 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_4_dup_3606, D=>nx145, G=>u1_ix4486_nx541);
   u1_ix4486_ix353 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_3_dup_3607, D=>nx145, G=>u1_ix4486_nx545);
   u1_ix4486_ix357 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_2_dup_3608, D=>nx145, G=>u1_ix4486_nx549);
   u1_ix4486_ix361 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_1_dup_3609, D=>nx145, G=>u1_ix4486_nx553);
   u1_ix4486_ix365 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_0_dup_3610, D=>nx145, G=>u1_ix4486_nx557);
   u1_ix4486_ix370 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_15_dup_3622, D=>nx146, G=>u1_ix4486_nx497);
   u1_ix4486_ix374 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_14_dup_3623, D=>nx146, G=>u1_ix4486_nx501);
   u1_ix4486_ix378 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_13_dup_3624, D=>nx146, G=>u1_ix4486_nx505);
   u1_ix4486_ix382 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_12_dup_3625, D=>nx146, G=>u1_ix4486_nx509);
   u1_ix4486_ix386 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_11_dup_3626, D=>nx146, G=>u1_ix4486_nx513);
   u1_ix4486_ix390 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_10_dup_3627, D=>nx146, G=>u1_ix4486_nx517);
   u1_ix4486_ix394 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_9_dup_3628, D=>nx146, G=>u1_ix4486_nx521);
   u1_ix4486_ix398 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_8_dup_3629, D=>nx147, G=>u1_ix4486_nx525);
   u1_ix4486_ix402 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_7_dup_3630, D=>nx147, G=>u1_ix4486_nx529);
   u1_ix4486_ix406 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_6_dup_3631, D=>nx147, G=>u1_ix4486_nx533);
   u1_ix4486_ix410 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_5_dup_3632, D=>nx147, G=>u1_ix4486_nx537);
   u1_ix4486_ix414 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_4_dup_3633, D=>nx147, G=>u1_ix4486_nx541);
   u1_ix4486_ix418 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_3_dup_3634, D=>nx147, G=>u1_ix4486_nx545);
   u1_ix4486_ix422 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_2_dup_3635, D=>nx147, G=>u1_ix4486_nx549);
   u1_ix4486_ix426 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_1_dup_3636, D=>nx147, G=>u1_ix4486_nx553);
   u1_ix4486_ix430 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_0_dup_3637, D=>nx147, G=>u1_ix4486_nx557);
   u1_ix4486_ix435 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_15_dup_3649, D=>nx148, G=>u1_ix4486_nx497);
   u1_ix4486_ix439 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_14_dup_3650, D=>nx148, G=>u1_ix4486_nx501);
   u1_ix4486_ix443 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_13_dup_3651, D=>nx148, G=>u1_ix4486_nx505);
   u1_ix4486_ix447 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_12_dup_3652, D=>nx148, G=>u1_ix4486_nx509);
   u1_ix4486_ix451 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_11_dup_3653, D=>nx148, G=>u1_ix4486_nx513);
   u1_ix4486_ix455 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_10_dup_3654, D=>nx148, G=>u1_ix4486_nx517);
   u1_ix4486_ix459 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_9_dup_3655, D=>nx148, G=>u1_ix4486_nx521);
   u1_ix4486_ix463 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_8_dup_3656, D=>nx148, G=>u1_ix4486_nx525);
   u1_ix4486_ix467 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_7_dup_3657, D=>nx149, G=>u1_ix4486_nx529);
   u1_ix4486_ix471 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_6_dup_3658, D=>nx149, G=>u1_ix4486_nx533);
   u1_ix4486_ix475 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_5_dup_3659, D=>nx149, G=>u1_ix4486_nx537);
   u1_ix4486_ix479 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_4_dup_3660, D=>nx149, G=>u1_ix4486_nx541);
   u1_ix4486_ix483 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_3_dup_3661, D=>nx149, G=>u1_ix4486_nx545);
   u1_ix4486_ix487 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_2_dup_3662, D=>nx149, G=>u1_ix4486_nx549);
   u1_ix4486_ix491 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_1_dup_3663, D=>nx149, G=>u1_ix4486_nx553);
   u1_ix4486_ix495 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_0_dup_3664, D=>nx149, G=>u1_ix4486_nx557);
   u1_ix4486_ix500 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_15_dup_3676, D=>nx150, G=>u1_ix4486_nx497);
   u1_ix4486_ix504 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_14_dup_3677, D=>nx150, G=>u1_ix4486_nx501);
   u1_ix4486_ix508 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_13_dup_3678, D=>nx150, G=>u1_ix4486_nx505);
   u1_ix4486_ix512 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_12_dup_3679, D=>nx150, G=>u1_ix4486_nx509);
   u1_ix4486_ix516 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_11_dup_3680, D=>nx150, G=>u1_ix4486_nx513);
   u1_ix4486_ix520 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_10_dup_3681, D=>nx150, G=>u1_ix4486_nx517);
   u1_ix4486_ix524 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_9_dup_3682, D=>nx150, G=>u1_ix4486_nx521);
   u1_ix4486_ix528 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_8_dup_3683, D=>nx150, G=>u1_ix4486_nx525);
   u1_ix4486_ix532 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_7_dup_3684, D=>nx151, G=>u1_ix4486_nx529);
   u1_ix4486_ix536 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_6_dup_3685, D=>nx151, G=>u1_ix4486_nx533);
   u1_ix4486_ix540 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_5_dup_3686, D=>nx151, G=>u1_ix4486_nx537);
   u1_ix4486_ix544 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_4_dup_3687, D=>nx151, G=>u1_ix4486_nx541);
   u1_ix4486_ix548 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_3_dup_3688, D=>nx151, G=>u1_ix4486_nx545);
   u1_ix4486_ix552 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_2_dup_3689, D=>nx151, G=>u1_ix4486_nx549);
   u1_ix4486_ix556 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_1_dup_3690, D=>nx151, G=>u1_ix4486_nx553);
   u1_ix4486_ix560 : work.components.DL1 port map ( Q=>
      u1_ix4486_a_0_dup_3691, D=>nx151, G=>u1_ix4486_nx557);
   u2_reg_txd : work.components.DFM3B port map ( Q=>port3_dup0_0, A=>nx140, 
      B=>nx141, S=>u2_cnt_0, CLK=>port3_1_int, CLR=>u2_ix218_aclrb);
   u2_reg_int : work.components.DFC1 port map ( Q=>port3_dup0_3, CLK=>
      nwrs_int, CLR=>u2_nx160, D=>u2_PWR);
   u0_lat_outp_3_0 : work.components.DL1 port map ( Q=>address_3_XX0, D=>
      nx145, G=>ale_int);
   u0_lat_outp_2_0 : work.components.DL1 port map ( Q=>address_2_XX0, D=>
      nx147, G=>ale_int);
   u0_lat_outp_1_0 : work.components.DL1 port map ( Q=>address_1_XX0, D=>
      nx149, G=>ale_int);
   u0_lat_outp_1_1 : work.components.DL1 port map ( Q=>address_1_XX1, D=>
      nx149, G=>ale_int);
   u0_lat_outp_0_0 : work.components.DL1 port map ( Q=>address_0_XX0, D=>
      nx151, G=>ale_int);
   u0_lat_outp_0_1 : work.components.DL1 port map ( Q=>address_0_XX1, D=>
      nx151, G=>ale_int);
   u2_PWR_EXMPLR : work.components.VCC port map ( Y=>u2_PWR);
   u2_nx107_EXMPLR : work.components.AND3 port map ( Y=>u2_nx107, A=>
      u2_cnt_0, B=>u2_cnt_1, C=>u2_cnt_2);
   GND0_EXMPLR : work.components.GND port map ( Y=>GND0);
   u2_nx104_EXMPLR : work.components.INV port map ( Y=>u2_nx104, A=>
      port3_1_int);
   u2_ix218_aclrb_EXMPLR : work.components.INV port map ( Y=>u2_ix218_aclrb, 
      A=>reset_int);
   ix216 : work.components.INV port map ( Y=>nx127, A=>port3_dup0_0);
   ix217 : work.components.INV port map ( Y=>nx128, A=>port3_dup0_3);
   u1_nx4482_EXMPLR : work.components.OR3A port map ( Y=>u1_nx4482, B=>
      port2_7_int, C=>port3_6_int, A=>port3_7_int);
   ix218 : work.components.INV port map ( Y=>nx129, A=>u1_nx4482);
   ix219 : work.components.INV port map ( Y=>nx130, A=>port2_7_int);
   u1_nx1842_EXMPLR : work.components.AOI1B port map ( Y=>u1_nx1842, A=>
      port3_7_int, B=>port3_6_int, C=>nx130);
   ix220 : work.components.INV port map ( Y=>nx131, A=>u2_cnt_0);
   u2_modgen_154_nx8_EXMPLR : work.components.OR3B port map ( Y=>
      u2_modgen_154_nx8, C=>nx131, A=>u2_cnt_1, B=>u2_cnt_2);
   ix221 : work.components.OR3B port map ( Y=>nx132, C=>u1_nx4482, A=>
      address_dup0_1, B=>address_dup0_0);
   ix222 : work.components.NAND2 port map ( Y=>nx133, A=>address_dup0_3, B=>
      address_dup0_2);
   u1_ix4486_nx497_EXMPLR : work.components.NOR2 port map ( Y=>
      u1_ix4486_nx497, A=>nx132, B=>nx133);
   ix223 : work.components.NOR2 port map ( Y=>nx134, A=>u1_nx4482, B=>
      address_dup0_0);
   u1_ix4486_nx501_EXMPLR : work.components.AND3A port map ( Y=>
      u1_ix4486_nx501, A=>nx133, B=>nx134, C=>address_dup0_1);
   ix224 : work.components.OR3A port map ( Y=>nx135, B=>u1_nx4482, C=>
      address_dup0_1, A=>address_dup0_0);
   u1_ix4486_nx505_EXMPLR : work.components.NOR2 port map ( Y=>
      u1_ix4486_nx505, A=>nx135, B=>nx133);
   ix225 : work.components.OR2 port map ( Y=>nx136, A=>u1_nx4482, B=>
      address_dup0_0);
   u1_ix4486_nx509_EXMPLR : work.components.NOR3 port map ( Y=>
      u1_ix4486_nx509, A=>address_dup0_1, B=>nx136, C=>nx133);
   ix226 : work.components.OR2A port map ( Y=>nx137, B=>address_dup0_2, A=>
      address_dup0_3);
   u1_ix4486_nx513_EXMPLR : work.components.NOR2 port map ( Y=>
      u1_ix4486_nx513, A=>nx132, B=>nx137);
   u1_ix4486_nx517_EXMPLR : work.components.AND3A port map ( Y=>
      u1_ix4486_nx517, A=>nx137, B=>nx134, C=>address_dup0_1);
   u1_ix4486_nx521_EXMPLR : work.components.NOR2 port map ( Y=>
      u1_ix4486_nx521, A=>nx135, B=>nx137);
   u1_ix4486_nx525_EXMPLR : work.components.NOR3 port map ( Y=>
      u1_ix4486_nx525, A=>address_dup0_1, B=>nx136, C=>nx137);
   u1_ix4486_nx529_EXMPLR : work.components.AND3B port map ( Y=>
      u1_ix4486_nx529, A=>nx132, B=>address_dup0_3, C=>address_dup0_2);
   ix227 : work.components.NOR2 port map ( Y=>nx138, A=>address_dup0_3, B=>
      nx136);
   u1_ix4486_nx533_EXMPLR : work.components.AND3 port map ( Y=>
      u1_ix4486_nx533, A=>nx138, B=>address_dup0_2, C=>address_dup0_1);
   u1_ix4486_nx537_EXMPLR : work.components.AND3B port map ( Y=>
      u1_ix4486_nx537, A=>nx135, B=>address_dup0_3, C=>address_dup0_2);
   ix228 : work.components.OR2A port map ( Y=>nx139, B=>address_dup0_3, A=>
      nx134);
   u1_ix4486_nx541_EXMPLR : work.components.AND3B port map ( Y=>
      u1_ix4486_nx541, A=>nx139, B=>address_dup0_1, C=>address_dup0_2);
   u1_ix4486_nx545_EXMPLR : work.components.NOR3 port map ( Y=>
      u1_ix4486_nx545, A=>address_dup0_3, B=>address_dup0_2, C=>nx132);
   u1_ix4486_nx549_EXMPLR : work.components.AND3B port map ( Y=>
      u1_ix4486_nx549, A=>nx139, B=>address_dup0_2, C=>address_dup0_1);
   u1_ix4486_nx553_EXMPLR : work.components.NOR3 port map ( Y=>
      u1_ix4486_nx553, A=>address_dup0_3, B=>address_dup0_2, C=>nx135);
   u1_ix4486_nx557_EXMPLR : work.components.NOR3 port map ( Y=>
      u1_ix4486_nx557, A=>address_dup0_2, B=>address_dup0_1, C=>nx139);
   ix229 : work.components.INV port map ( Y=>nx140, A=>
      u2_modgen_153_mi_ax_int_r_0);
   ix230 : work.components.INV port map ( Y=>nx141, A=>
      u2_modgen_153_mi_ax_int_r_1);
   u2_nx160_EXMPLR : work.components.OR2 port map ( Y=>u2_nx160, A=>
      busy_dup0, B=>reset_int);
   ix231 : work.components.BUFA port map ( Y=>nx142, A=>port0_4_int);
   ix232 : work.components.BUFA port map ( Y=>nx143, A=>port0_4_int);
   ix233 : work.components.BUFA port map ( Y=>nx144, A=>port0_3_int);
   ix234 : work.components.BUFA port map ( Y=>nx145, A=>port0_3_int);
   ix235 : work.components.BUFA port map ( Y=>nx146, A=>port0_2_int);
   ix236 : work.components.BUFA port map ( Y=>nx147, A=>port0_2_int);
   ix237 : work.components.BUFA port map ( Y=>nx148, A=>port0_1_int);
   ix238 : work.components.BUFA port map ( Y=>nx149, A=>port0_1_int);
   ix239 : work.components.BUFA port map ( Y=>nx150, A=>port0_0_int);
   ix240 : work.components.BUFA port map ( Y=>nx151, A=>port0_0_int);
   ix241 : work.components.BUFA port map ( Y=>nx152, A=>port0_7_int);
   ix242 : work.components.BUFA port map ( Y=>nx153, A=>port0_7_int);
   ix243 : work.components.BUFA port map ( Y=>nx154, A=>port0_6_int);
   ix244 : work.components.BUFA port map ( Y=>nx155, A=>port0_6_int);
   ix245 : work.components.BUFA port map ( Y=>nx156, A=>port0_5_int);
   ix246 : work.components.BUFA port map ( Y=>nx157, A=>port0_5_int);
   ix212 : work.components.CLKBUF port map ( Y=>nwrs_int, PAD=>nwrs);
end fpga_ps ;

