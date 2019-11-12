
library IEEE;

use IEEE.std_logic_1164.all;

package CONV_PACK_ADDER is

-- define attributes
attribute ENUM_ENCODING : STRING;

end CONV_PACK_ADDER;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_ADDER.all;

entity datapath_adder_DW01_add_0 is

   port( A, B : in std_logic_vector (15 downto 0);  CI : in std_logic;  SUM : 
         out std_logic_vector (15 downto 0);  CO : out std_logic);

end datapath_adder_DW01_add_0;

architecture SYN_rpl of datapath_adder_DW01_add_0 is

   component NAND3_X1
      port( A1, A2, A3 : in std_logic;  ZN : out std_logic);
   end component;
   
   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component XOR2_X1
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component FA_X1
      port( A, B, CI : in std_logic;  CO, S : out std_logic);
   end component;
   
   signal carry_15_port, carry_14_port, carry_13_port, carry_12_port, 
      carry_11_port, carry_10_port, carry_9_port, carry_8_port, carry_7_port, 
      carry_6_port, carry_5_port, carry_4_port, carry_3_port, carry_2_port, n5,
      n6, n7, n8, n9, n_1002 : std_logic;

begin
   
   U1_15 : FA_X1 port map( A => A(15), B => B(15), CI => carry_15_port, CO => 
                           n_1002, S => SUM(15));
   U1_14 : FA_X1 port map( A => A(14), B => B(14), CI => carry_14_port, CO => 
                           carry_15_port, S => SUM(14));
   U1_13 : FA_X1 port map( A => A(13), B => B(13), CI => carry_13_port, CO => 
                           carry_14_port, S => SUM(13));
   U1_11 : FA_X1 port map( A => A(11), B => B(11), CI => carry_11_port, CO => 
                           carry_12_port, S => SUM(11));
   U1_10 : FA_X1 port map( A => A(10), B => B(10), CI => carry_10_port, CO => 
                           carry_11_port, S => SUM(10));
   U1_9 : FA_X1 port map( A => A(9), B => B(9), CI => carry_9_port, CO => 
                           carry_10_port, S => SUM(9));
   U1_8 : FA_X1 port map( A => A(8), B => B(8), CI => carry_8_port, CO => 
                           carry_9_port, S => SUM(8));
   U1_7 : FA_X1 port map( A => A(7), B => B(7), CI => carry_7_port, CO => 
                           carry_8_port, S => SUM(7));
   U1_6 : FA_X1 port map( A => A(6), B => B(6), CI => carry_6_port, CO => 
                           carry_7_port, S => SUM(6));
   U1_5 : FA_X1 port map( A => A(5), B => B(5), CI => carry_5_port, CO => 
                           carry_6_port, S => SUM(5));
   U1_4 : FA_X1 port map( A => A(4), B => B(4), CI => carry_4_port, CO => 
                           carry_5_port, S => SUM(4));
   U1_3 : FA_X1 port map( A => A(3), B => B(3), CI => carry_3_port, CO => 
                           carry_4_port, S => SUM(3));
   U1_2 : FA_X1 port map( A => A(2), B => B(2), CI => carry_2_port, CO => 
                           carry_3_port, S => SUM(2));
   U1_1 : FA_X1 port map( A => A(1), B => B(1), CI => n9, CO => carry_2_port, S
                           => SUM(1));
   U1 : XOR2_X1 port map( A => A(12), B => B(12), Z => n5);
   U3 : XOR2_X1 port map( A => carry_12_port, B => n5, Z => SUM(12));
   U4 : NAND2_X1 port map( A1 => carry_12_port, A2 => A(12), ZN => n6);
   U5 : NAND2_X1 port map( A1 => carry_12_port, A2 => B(12), ZN => n7);
   U6 : NAND2_X1 port map( A1 => A(12), A2 => B(12), ZN => n8);
   U2 : XOR2_X1 port map( A => B(0), B => A(0), Z => SUM(0));
   U7 : AND2_X1 port map( A1 => B(0), A2 => A(0), ZN => n9);
   U8 : NAND3_X1 port map( A1 => n7, A2 => n6, A3 => n8, ZN => carry_13_port);

end SYN_rpl;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_ADDER.all;

entity FSM_ADDER is

   port( CLK, RST : in std_logic;  S : out std_logic_vector (3 downto 0));

end FSM_ADDER;

architecture SYN_STATE_MACHINE of FSM_ADDER is

   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component DFFR_X1
      port( D, CK, RN : in std_logic;  Q, QN : out std_logic);
   end component;
   
   component DFFS_X1
      port( D, CK, SN : in std_logic;  Q, QN : out std_logic);
   end component;
   
   component OAI21_X1
      port( B1, B2, A : in std_logic;  ZN : out std_logic);
   end component;
   
   signal S_3_port, S_0_port, N6, n3, S_2_port, n6_port, S_1_port, n48, n49, 
      n50, n51, n_1003, n_1004 : std_logic;

begin
   S <= ( S_3_port, S_2_port, S_1_port, S_0_port );
   
   U8 : NAND2_X1 port map( A1 => n3, A2 => S_2_port, ZN => S_0_port);
   U9 : NAND2_X1 port map( A1 => n48, A2 => n50, ZN => S_2_port);
   U10 : NAND2_X1 port map( A1 => n48, A2 => n49, ZN => n3);
   U11 : OAI21_X1 port map( B1 => n50, B2 => n48, A => S_1_port, ZN => N6);
   U12 : NAND2_X1 port map( A1 => n6_port, A2 => n49, ZN => S_1_port);
   PRES_STATE_reg_2_inst : DFFR_X1 port map( D => S_3_port, CK => CLK, RN => 
                           n51, Q => n48, QN => n_1003);
   PRES_STATE_reg_0_inst : DFFS_X1 port map( D => n3, CK => CLK, SN => n51, Q 
                           => n6_port, QN => n50);
   PRES_STATE_reg_1_inst : DFFR_X1 port map( D => N6, CK => CLK, RN => n51, Q 
                           => n49, QN => n_1004);
   U3 : NAND2_X1 port map( A1 => n3, A2 => S_1_port, ZN => S_3_port);
   U4 : INV_X1 port map( A => RST, ZN => n51);

end SYN_STATE_MACHINE;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_ADDER.all;

entity datapath_adder is

   port( MUX00, MUX01, MUX02, MUX03, MUX10, MUX11, MUX12, MUX13 : in 
         std_logic_vector (15 downto 0);  clock, reset, SEL00, SEL01, SEL10, 
         SEL11 : in std_logic;  SUM : out std_logic_vector (15 downto 0));

end datapath_adder;

architecture SYN_behavioral of datapath_adder is

   component INV_X1
      port( A : in std_logic;  ZN : out std_logic);
   end component;
   
   component AND2_X2
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component NOR2_X2
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component AND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component NOR2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component CLKBUF_X1
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component DFFR_X1
      port( D, CK, RN : in std_logic;  Q, QN : out std_logic);
   end component;
   
   component datapath_adder_DW01_add_0
      port( A, B : in std_logic_vector (15 downto 0);  CI : in std_logic;  SUM 
            : out std_logic_vector (15 downto 0);  CO : out std_logic);
   end component;
   
   component AOI22_X1
      port( A1, A2, B1, B2 : in std_logic;  ZN : out std_logic);
   end component;
   
   component NAND2_X1
      port( A1, A2 : in std_logic;  ZN : out std_logic);
   end component;
   
   signal operanda_15_port, operanda_14_port, operanda_13_port, 
      operanda_12_port, operanda_11_port, operanda_10_port, operanda_9_port, 
      operanda_8_port, operanda_7_port, operanda_6_port, operanda_5_port, 
      operanda_4_port, operanda_3_port, operanda_2_port, operanda_1_port, 
      operanda_0_port, operandb_15_port, operandb_14_port, operandb_13_port, 
      operandb_12_port, operandb_11_port, operandb_10_port, operandb_9_port, 
      operandb_8_port, operandb_7_port, operandb_6_port, operandb_5_port, 
      operandb_4_port, operandb_3_port, operandb_2_port, operandb_1_port, 
      operandb_0_port, N25, N26, N27, N28, N29, N30, N31, N32, N33, N34, N35, 
      N36, N37, N38, N39, N40, n2, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15
      , n16, n17, n18, n19, n20, n21, n22, n23, n24, n25_port, n26_port, 
      n27_port, n28_port, n29_port, n30_port, n31_port, n32_port, n33_port, 
      n34_port, n35_port, n36_port, n37_port, n38_port, n39_port, n40_port, n41
      , n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, 
      n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70
      , n71, n72, n73, n74, n75, n76, n77, n190, n191, n192, n193, n194, n_1005
      , n_1006, n_1007, n_1008, n_1009, n_1010, n_1011, n_1012, n_1013, n_1014,
      n_1015, n_1016, n_1017, n_1018, n_1019, n_1020, n_1021 : std_logic;

begin
   
   n2 <= '0';
   U12 : NAND2_X1 port map( A1 => n6, A2 => n7, ZN => operandb_9_port);
   U13 : AOI22_X1 port map( A1 => MUX13(9), A2 => n8, B1 => MUX12(9), B2 => n9,
                           ZN => n7);
   U14 : AOI22_X1 port map( A1 => MUX10(9), A2 => n10, B1 => MUX11(9), B2 => 
                           n11, ZN => n6);
   U15 : NAND2_X1 port map( A1 => n12, A2 => n13, ZN => operandb_8_port);
   U16 : AOI22_X1 port map( A1 => MUX13(8), A2 => n8, B1 => MUX12(8), B2 => n9,
                           ZN => n13);
   U17 : AOI22_X1 port map( A1 => MUX10(8), A2 => n10, B1 => MUX11(8), B2 => 
                           n11, ZN => n12);
   U18 : NAND2_X1 port map( A1 => n14, A2 => n15, ZN => operandb_7_port);
   U19 : AOI22_X1 port map( A1 => MUX13(7), A2 => n8, B1 => MUX12(7), B2 => n9,
                           ZN => n15);
   U20 : AOI22_X1 port map( A1 => MUX10(7), A2 => n10, B1 => MUX11(7), B2 => 
                           n11, ZN => n14);
   U21 : NAND2_X1 port map( A1 => n16, A2 => n17, ZN => operandb_6_port);
   U22 : AOI22_X1 port map( A1 => MUX13(6), A2 => n8, B1 => MUX12(6), B2 => n9,
                           ZN => n17);
   U23 : AOI22_X1 port map( A1 => MUX10(6), A2 => n10, B1 => MUX11(6), B2 => 
                           n11, ZN => n16);
   U24 : NAND2_X1 port map( A1 => n18, A2 => n19, ZN => operandb_5_port);
   U25 : AOI22_X1 port map( A1 => MUX13(5), A2 => n8, B1 => MUX12(5), B2 => n9,
                           ZN => n19);
   U26 : AOI22_X1 port map( A1 => MUX10(5), A2 => n10, B1 => MUX11(5), B2 => 
                           n11, ZN => n18);
   U27 : NAND2_X1 port map( A1 => n20, A2 => n21, ZN => operandb_4_port);
   U28 : AOI22_X1 port map( A1 => MUX13(4), A2 => n8, B1 => MUX12(4), B2 => n9,
                           ZN => n21);
   U29 : AOI22_X1 port map( A1 => MUX10(4), A2 => n10, B1 => MUX11(4), B2 => 
                           n11, ZN => n20);
   U30 : NAND2_X1 port map( A1 => n22, A2 => n23, ZN => operandb_3_port);
   U31 : AOI22_X1 port map( A1 => MUX13(3), A2 => n8, B1 => MUX12(3), B2 => n9,
                           ZN => n23);
   U32 : AOI22_X1 port map( A1 => MUX10(3), A2 => n10, B1 => MUX11(3), B2 => 
                           n11, ZN => n22);
   U33 : NAND2_X1 port map( A1 => n24, A2 => n25_port, ZN => operandb_2_port);
   U34 : AOI22_X1 port map( A1 => MUX13(2), A2 => n8, B1 => MUX12(2), B2 => n9,
                           ZN => n25_port);
   U35 : AOI22_X1 port map( A1 => MUX10(2), A2 => n10, B1 => MUX11(2), B2 => 
                           n11, ZN => n24);
   U36 : NAND2_X1 port map( A1 => n26_port, A2 => n27_port, ZN => 
                           operandb_1_port);
   U37 : AOI22_X1 port map( A1 => MUX13(1), A2 => n8, B1 => MUX12(1), B2 => n9,
                           ZN => n27_port);
   U38 : AOI22_X1 port map( A1 => MUX10(1), A2 => n10, B1 => MUX11(1), B2 => 
                           n11, ZN => n26_port);
   U39 : NAND2_X1 port map( A1 => n28_port, A2 => n29_port, ZN => 
                           operandb_15_port);
   U40 : AOI22_X1 port map( A1 => MUX13(15), A2 => n8, B1 => MUX12(15), B2 => 
                           n9, ZN => n29_port);
   U41 : AOI22_X1 port map( A1 => MUX10(15), A2 => n10, B1 => MUX11(15), B2 => 
                           n11, ZN => n28_port);
   U42 : NAND2_X1 port map( A1 => n30_port, A2 => n31_port, ZN => 
                           operandb_14_port);
   U43 : AOI22_X1 port map( A1 => MUX13(14), A2 => n8, B1 => MUX12(14), B2 => 
                           n9, ZN => n31_port);
   U44 : AOI22_X1 port map( A1 => MUX10(14), A2 => n10, B1 => MUX11(14), B2 => 
                           n11, ZN => n30_port);
   U45 : NAND2_X1 port map( A1 => n32_port, A2 => n33_port, ZN => 
                           operandb_13_port);
   U46 : AOI22_X1 port map( A1 => MUX13(13), A2 => n8, B1 => MUX12(13), B2 => 
                           n9, ZN => n33_port);
   U47 : AOI22_X1 port map( A1 => MUX10(13), A2 => n10, B1 => MUX11(13), B2 => 
                           n11, ZN => n32_port);
   U48 : NAND2_X1 port map( A1 => n34_port, A2 => n35_port, ZN => 
                           operandb_12_port);
   U49 : AOI22_X1 port map( A1 => MUX13(12), A2 => n8, B1 => MUX12(12), B2 => 
                           n9, ZN => n35_port);
   U50 : AOI22_X1 port map( A1 => MUX10(12), A2 => n10, B1 => MUX11(12), B2 => 
                           n11, ZN => n34_port);
   U51 : NAND2_X1 port map( A1 => n36_port, A2 => n37_port, ZN => 
                           operandb_11_port);
   U52 : AOI22_X1 port map( A1 => MUX13(11), A2 => n8, B1 => MUX12(11), B2 => 
                           n9, ZN => n37_port);
   U53 : AOI22_X1 port map( A1 => MUX10(11), A2 => n10, B1 => MUX11(11), B2 => 
                           n11, ZN => n36_port);
   U54 : NAND2_X1 port map( A1 => n38_port, A2 => n39_port, ZN => 
                           operandb_10_port);
   U55 : AOI22_X1 port map( A1 => MUX13(10), A2 => n8, B1 => MUX12(10), B2 => 
                           n9, ZN => n39_port);
   U56 : AOI22_X1 port map( A1 => MUX10(10), A2 => n10, B1 => MUX11(10), B2 => 
                           n11, ZN => n38_port);
   U57 : NAND2_X1 port map( A1 => n40_port, A2 => n41, ZN => operandb_0_port);
   U58 : AOI22_X1 port map( A1 => MUX13(0), A2 => n8, B1 => MUX12(0), B2 => n9,
                           ZN => n41);
   U59 : AOI22_X1 port map( A1 => MUX10(0), A2 => n10, B1 => MUX11(0), B2 => 
                           n11, ZN => n40_port);
   U62 : NAND2_X1 port map( A1 => n42, A2 => n43, ZN => operanda_9_port);
   U63 : AOI22_X1 port map( A1 => MUX02(9), A2 => n44, B1 => MUX03(9), B2 => 
                           n45, ZN => n43);
   U64 : AOI22_X1 port map( A1 => MUX00(9), A2 => n46, B1 => MUX01(9), B2 => 
                           n47, ZN => n42);
   U65 : NAND2_X1 port map( A1 => n48, A2 => n49, ZN => operanda_8_port);
   U66 : AOI22_X1 port map( A1 => MUX02(8), A2 => n44, B1 => MUX03(8), B2 => 
                           n45, ZN => n49);
   U67 : AOI22_X1 port map( A1 => MUX00(8), A2 => n46, B1 => MUX01(8), B2 => 
                           n47, ZN => n48);
   U68 : NAND2_X1 port map( A1 => n50, A2 => n51, ZN => operanda_7_port);
   U69 : AOI22_X1 port map( A1 => MUX02(7), A2 => n44, B1 => MUX03(7), B2 => 
                           n45, ZN => n51);
   U70 : AOI22_X1 port map( A1 => MUX00(7), A2 => n46, B1 => MUX01(7), B2 => 
                           n47, ZN => n50);
   U71 : NAND2_X1 port map( A1 => n52, A2 => n53, ZN => operanda_6_port);
   U72 : AOI22_X1 port map( A1 => MUX02(6), A2 => n44, B1 => MUX03(6), B2 => 
                           n45, ZN => n53);
   U73 : AOI22_X1 port map( A1 => MUX00(6), A2 => n46, B1 => MUX01(6), B2 => 
                           n47, ZN => n52);
   U74 : NAND2_X1 port map( A1 => n54, A2 => n55, ZN => operanda_5_port);
   U75 : AOI22_X1 port map( A1 => MUX02(5), A2 => n44, B1 => MUX03(5), B2 => 
                           n45, ZN => n55);
   U76 : AOI22_X1 port map( A1 => MUX00(5), A2 => n46, B1 => MUX01(5), B2 => 
                           n47, ZN => n54);
   U77 : NAND2_X1 port map( A1 => n56, A2 => n57, ZN => operanda_4_port);
   U78 : AOI22_X1 port map( A1 => MUX02(4), A2 => n44, B1 => MUX03(4), B2 => 
                           n45, ZN => n57);
   U79 : AOI22_X1 port map( A1 => MUX00(4), A2 => n46, B1 => MUX01(4), B2 => 
                           n47, ZN => n56);
   U80 : NAND2_X1 port map( A1 => n58, A2 => n59, ZN => operanda_3_port);
   U81 : AOI22_X1 port map( A1 => MUX02(3), A2 => n44, B1 => MUX03(3), B2 => 
                           n45, ZN => n59);
   U82 : AOI22_X1 port map( A1 => MUX00(3), A2 => n46, B1 => MUX01(3), B2 => 
                           n47, ZN => n58);
   U83 : NAND2_X1 port map( A1 => n60, A2 => n61, ZN => operanda_2_port);
   U84 : AOI22_X1 port map( A1 => MUX02(2), A2 => n44, B1 => MUX03(2), B2 => 
                           n45, ZN => n61);
   U85 : AOI22_X1 port map( A1 => MUX00(2), A2 => n46, B1 => MUX01(2), B2 => 
                           n47, ZN => n60);
   U86 : NAND2_X1 port map( A1 => n62, A2 => n63, ZN => operanda_1_port);
   U87 : AOI22_X1 port map( A1 => MUX02(1), A2 => n44, B1 => MUX03(1), B2 => 
                           n45, ZN => n63);
   U88 : AOI22_X1 port map( A1 => MUX00(1), A2 => n46, B1 => MUX01(1), B2 => 
                           n47, ZN => n62);
   U89 : NAND2_X1 port map( A1 => n64, A2 => n65, ZN => operanda_15_port);
   U90 : AOI22_X1 port map( A1 => MUX02(15), A2 => n44, B1 => MUX03(15), B2 => 
                           n45, ZN => n65);
   U91 : AOI22_X1 port map( A1 => MUX00(15), A2 => n190, B1 => MUX01(15), B2 =>
                           n191, ZN => n64);
   U92 : NAND2_X1 port map( A1 => n66, A2 => n67, ZN => operanda_14_port);
   U93 : AOI22_X1 port map( A1 => MUX02(14), A2 => n44, B1 => MUX03(14), B2 => 
                           n45, ZN => n67);
   U94 : AOI22_X1 port map( A1 => MUX00(14), A2 => n190, B1 => MUX01(14), B2 =>
                           n191, ZN => n66);
   U95 : NAND2_X1 port map( A1 => n68, A2 => n69, ZN => operanda_13_port);
   U96 : AOI22_X1 port map( A1 => MUX02(13), A2 => n44, B1 => MUX03(13), B2 => 
                           n45, ZN => n69);
   U97 : AOI22_X1 port map( A1 => MUX00(13), A2 => n190, B1 => MUX01(13), B2 =>
                           n191, ZN => n68);
   U98 : NAND2_X1 port map( A1 => n70, A2 => n71, ZN => operanda_12_port);
   U99 : AOI22_X1 port map( A1 => MUX02(12), A2 => n44, B1 => MUX03(12), B2 => 
                           n45, ZN => n71);
   U100 : AOI22_X1 port map( A1 => MUX00(12), A2 => n190, B1 => MUX01(12), B2 
                           => n191, ZN => n70);
   U101 : NAND2_X1 port map( A1 => n72, A2 => n73, ZN => operanda_11_port);
   U102 : AOI22_X1 port map( A1 => MUX02(11), A2 => n44, B1 => MUX03(11), B2 =>
                           n45, ZN => n73);
   U103 : AOI22_X1 port map( A1 => MUX00(11), A2 => n190, B1 => MUX01(11), B2 
                           => n191, ZN => n72);
   U104 : NAND2_X1 port map( A1 => n74, A2 => n75, ZN => operanda_10_port);
   U105 : AOI22_X1 port map( A1 => MUX02(10), A2 => n44, B1 => MUX03(10), B2 =>
                           n45, ZN => n75);
   U106 : AOI22_X1 port map( A1 => MUX00(10), A2 => n46, B1 => MUX01(10), B2 =>
                           n47, ZN => n74);
   U107 : NAND2_X1 port map( A1 => n76, A2 => n77, ZN => operanda_0_port);
   U108 : AOI22_X1 port map( A1 => MUX02(0), A2 => n44, B1 => MUX03(0), B2 => 
                           n45, ZN => n77);
   U109 : AOI22_X1 port map( A1 => MUX00(0), A2 => n46, B1 => MUX01(0), B2 => 
                           n47, ZN => n76);
   add_78 : datapath_adder_DW01_add_0 port map( A(15) => operanda_15_port, 
                           A(14) => operanda_14_port, A(13) => operanda_13_port
                           , A(12) => operanda_12_port, A(11) => 
                           operanda_11_port, A(10) => operanda_10_port, A(9) =>
                           operanda_9_port, A(8) => operanda_8_port, A(7) => 
                           operanda_7_port, A(6) => operanda_6_port, A(5) => 
                           operanda_5_port, A(4) => operanda_4_port, A(3) => 
                           operanda_3_port, A(2) => operanda_2_port, A(1) => 
                           operanda_1_port, A(0) => operanda_0_port, B(15) => 
                           operandb_15_port, B(14) => operandb_14_port, B(13) 
                           => operandb_13_port, B(12) => operandb_12_port, 
                           B(11) => operandb_11_port, B(10) => operandb_10_port
                           , B(9) => operandb_9_port, B(8) => operandb_8_port, 
                           B(7) => operandb_7_port, B(6) => operandb_6_port, 
                           B(5) => operandb_5_port, B(4) => operandb_4_port, 
                           B(3) => operandb_3_port, B(2) => operandb_2_port, 
                           B(1) => operandb_1_port, B(0) => operandb_0_port, CI
                           => n2, SUM(15) => N40, SUM(14) => N39, SUM(13) => 
                           N38, SUM(12) => N37, SUM(11) => N36, SUM(10) => N35,
                           SUM(9) => N34, SUM(8) => N33, SUM(7) => N32, SUM(6) 
                           => N31, SUM(5) => N30, SUM(4) => N29, SUM(3) => N28,
                           SUM(2) => N27, SUM(1) => N26, SUM(0) => N25, CO => 
                           n_1005);
   SUM_reg_15_inst : DFFR_X1 port map( D => N40, CK => clock, RN => n194, Q => 
                           SUM(15), QN => n_1006);
   SUM_reg_14_inst : DFFR_X1 port map( D => N39, CK => clock, RN => n194, Q => 
                           SUM(14), QN => n_1007);
   SUM_reg_13_inst : DFFR_X1 port map( D => N38, CK => clock, RN => n194, Q => 
                           SUM(13), QN => n_1008);
   SUM_reg_12_inst : DFFR_X1 port map( D => N37, CK => clock, RN => n194, Q => 
                           SUM(12), QN => n_1009);
   SUM_reg_11_inst : DFFR_X1 port map( D => N36, CK => clock, RN => n194, Q => 
                           SUM(11), QN => n_1010);
   SUM_reg_10_inst : DFFR_X1 port map( D => N35, CK => clock, RN => n194, Q => 
                           SUM(10), QN => n_1011);
   SUM_reg_9_inst : DFFR_X1 port map( D => N34, CK => clock, RN => n194, Q => 
                           SUM(9), QN => n_1012);
   SUM_reg_8_inst : DFFR_X1 port map( D => N33, CK => clock, RN => n194, Q => 
                           SUM(8), QN => n_1013);
   SUM_reg_7_inst : DFFR_X1 port map( D => N32, CK => clock, RN => n194, Q => 
                           SUM(7), QN => n_1014);
   SUM_reg_6_inst : DFFR_X1 port map( D => N31, CK => clock, RN => n194, Q => 
                           SUM(6), QN => n_1015);
   SUM_reg_5_inst : DFFR_X1 port map( D => N30, CK => clock, RN => n194, Q => 
                           SUM(5), QN => n_1016);
   SUM_reg_4_inst : DFFR_X1 port map( D => N29, CK => clock, RN => n194, Q => 
                           SUM(4), QN => n_1017);
   SUM_reg_3_inst : DFFR_X1 port map( D => N28, CK => clock, RN => n194, Q => 
                           SUM(3), QN => n_1018);
   SUM_reg_2_inst : DFFR_X1 port map( D => N27, CK => clock, RN => n194, Q => 
                           SUM(2), QN => n_1019);
   SUM_reg_1_inst : DFFR_X1 port map( D => N26, CK => clock, RN => n194, Q => 
                           SUM(1), QN => n_1020);
   SUM_reg_0_inst : DFFR_X1 port map( D => N25, CK => clock, RN => n194, Q => 
                           SUM(0), QN => n_1021);
   U4 : NOR2_X2 port map( A1 => SEL10, A2 => SEL11, ZN => n10);
   U5 : CLKBUF_X1 port map( A => n46, Z => n190);
   U6 : CLKBUF_X1 port map( A => n47, Z => n191);
   U7 : NOR2_X1 port map( A1 => SEL00, A2 => SEL01, ZN => n46);
   U8 : NOR2_X1 port map( A1 => n193, A2 => SEL01, ZN => n47);
   U9 : AND2_X1 port map( A1 => SEL01, A2 => n193, ZN => n44);
   U10 : AND2_X1 port map( A1 => SEL00, A2 => SEL01, ZN => n45);
   U11 : AND2_X1 port map( A1 => SEL10, A2 => SEL11, ZN => n8);
   U60 : NOR2_X2 port map( A1 => n192, A2 => SEL11, ZN => n11);
   U61 : AND2_X2 port map( A1 => SEL11, A2 => n192, ZN => n9);
   U110 : INV_X1 port map( A => SEL10, ZN => n192);
   U111 : INV_X1 port map( A => SEL00, ZN => n193);
   U112 : INV_X1 port map( A => reset, ZN => n194);

end SYN_behavioral;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_ADDER.all;

entity ADDER is

   port( A, B, C, D, E, F : in std_logic_vector (15 downto 0);  clock, reset : 
         in std_logic;  SUM : inout std_logic_vector (15 downto 0));

end ADDER;

architecture SYN_BEHAVIOURAL of ADDER is

   component FSM_ADDER
      port( CLK, RST : in std_logic;  S : out std_logic_vector (3 downto 0));
   end component;
   
   component datapath_adder
      port( MUX00, MUX01, MUX02, MUX03, MUX10, MUX11, MUX12, MUX13 : in 
            std_logic_vector (15 downto 0);  clock, reset, SEL00, SEL01, SEL10,
            SEL11 : in std_logic;  SUM : out std_logic_vector (15 downto 0));
   end component;
   
   signal S_3_port, S_2_port, S_1_port, S_0_port : std_logic;

begin
   
   DATAPATH : datapath_adder port map( MUX00(15) => F(15), MUX00(14) => F(14), 
                           MUX00(13) => F(13), MUX00(12) => F(12), MUX00(11) =>
                           F(11), MUX00(10) => F(10), MUX00(9) => F(9), 
                           MUX00(8) => F(8), MUX00(7) => F(7), MUX00(6) => F(6)
                           , MUX00(5) => F(5), MUX00(4) => F(4), MUX00(3) => 
                           F(3), MUX00(2) => F(2), MUX00(1) => F(1), MUX00(0) 
                           => F(0), MUX01(15) => A(15), MUX01(14) => A(14), 
                           MUX01(13) => A(13), MUX01(12) => A(12), MUX01(11) =>
                           A(11), MUX01(10) => A(10), MUX01(9) => A(9), 
                           MUX01(8) => A(8), MUX01(7) => A(7), MUX01(6) => A(6)
                           , MUX01(5) => A(5), MUX01(4) => A(4), MUX01(3) => 
                           A(3), MUX01(2) => A(2), MUX01(1) => A(1), MUX01(0) 
                           => A(0), MUX02(15) => E(15), MUX02(14) => E(14), 
                           MUX02(13) => E(13), MUX02(12) => E(12), MUX02(11) =>
                           E(11), MUX02(10) => E(10), MUX02(9) => E(9), 
                           MUX02(8) => E(8), MUX02(7) => E(7), MUX02(6) => E(6)
                           , MUX02(5) => E(5), MUX02(4) => E(4), MUX02(3) => 
                           E(3), MUX02(2) => E(2), MUX02(1) => E(1), MUX02(0) 
                           => E(0), MUX03(15) => SUM(15), MUX03(14) => SUM(14),
                           MUX03(13) => SUM(13), MUX03(12) => SUM(12), 
                           MUX03(11) => SUM(11), MUX03(10) => SUM(10), MUX03(9)
                           => SUM(9), MUX03(8) => SUM(8), MUX03(7) => SUM(7), 
                           MUX03(6) => SUM(6), MUX03(5) => SUM(5), MUX03(4) => 
                           SUM(4), MUX03(3) => SUM(3), MUX03(2) => SUM(2), 
                           MUX03(1) => SUM(1), MUX03(0) => SUM(0), MUX10(15) =>
                           C(15), MUX10(14) => C(14), MUX10(13) => C(13), 
                           MUX10(12) => C(12), MUX10(11) => C(11), MUX10(10) =>
                           C(10), MUX10(9) => C(9), MUX10(8) => C(8), MUX10(7) 
                           => C(7), MUX10(6) => C(6), MUX10(5) => C(5), 
                           MUX10(4) => C(4), MUX10(3) => C(3), MUX10(2) => C(2)
                           , MUX10(1) => C(1), MUX10(0) => C(0), MUX11(15) => 
                           D(15), MUX11(14) => D(14), MUX11(13) => D(13), 
                           MUX11(12) => D(12), MUX11(11) => D(11), MUX11(10) =>
                           D(10), MUX11(9) => D(9), MUX11(8) => D(8), MUX11(7) 
                           => D(7), MUX11(6) => D(6), MUX11(5) => D(5), 
                           MUX11(4) => D(4), MUX11(3) => D(3), MUX11(2) => D(2)
                           , MUX11(1) => D(1), MUX11(0) => D(0), MUX12(15) => 
                           B(15), MUX12(14) => B(14), MUX12(13) => B(13), 
                           MUX12(12) => B(12), MUX12(11) => B(11), MUX12(10) =>
                           B(10), MUX12(9) => B(9), MUX12(8) => B(8), MUX12(7) 
                           => B(7), MUX12(6) => B(6), MUX12(5) => B(5), 
                           MUX12(4) => B(4), MUX12(3) => B(3), MUX12(2) => B(2)
                           , MUX12(1) => B(1), MUX12(0) => B(0), MUX13(15) => 
                           SUM(15), MUX13(14) => SUM(14), MUX13(13) => SUM(13),
                           MUX13(12) => SUM(12), MUX13(11) => SUM(11), 
                           MUX13(10) => SUM(10), MUX13(9) => SUM(9), MUX13(8) 
                           => SUM(8), MUX13(7) => SUM(7), MUX13(6) => SUM(6), 
                           MUX13(5) => SUM(5), MUX13(4) => SUM(4), MUX13(3) => 
                           SUM(3), MUX13(2) => SUM(2), MUX13(1) => SUM(1), 
                           MUX13(0) => SUM(0), clock => clock, reset => reset, 
                           SEL00 => S_2_port, SEL01 => S_3_port, SEL10 => 
                           S_0_port, SEL11 => S_1_port, SUM(15) => SUM(15), 
                           SUM(14) => SUM(14), SUM(13) => SUM(13), SUM(12) => 
                           SUM(12), SUM(11) => SUM(11), SUM(10) => SUM(10), 
                           SUM(9) => SUM(9), SUM(8) => SUM(8), SUM(7) => SUM(7)
                           , SUM(6) => SUM(6), SUM(5) => SUM(5), SUM(4) => 
                           SUM(4), SUM(3) => SUM(3), SUM(2) => SUM(2), SUM(1) 
                           => SUM(1), SUM(0) => SUM(0));
   FSM : FSM_ADDER port map( CLK => clock, RST => reset, S(3) => S_3_port, S(2)
                           => S_2_port, S(1) => S_1_port, S(0) => S_0_port);

end SYN_BEHAVIOURAL;
