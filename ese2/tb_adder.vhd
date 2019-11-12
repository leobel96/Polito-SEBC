LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY tb_ADDER IS
END ENTITY tb_ADDER;

ARCHITECTURE TB OF TB_ADDER IS

COMPONENT ADDER IS
	PORT (A, B, C, D, E, F : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		  clock, reset : IN STD_LOGIC;
		  SUM : INOUT STD_LOGIC_VECTOR(15 DOWNTO 0));
END COMPONENT ADDER;

SIGNAL clock, reset : std_logic:='0';
signal a,b,c,d,e,f, sum : std_logic_vector (15 downto 0);
BEGIN
	
clock <= not clock after 10 ns;
reset <= '1' after 20 ns, '0' after 40 ns;
a <= "0000000000000001";
b <= "0000000000000010";
c <= "0000000000000011";
d <= "0000000000000100";
e <= "0000000000000101";
f <= "0000000000000111";
dut:adder port map(
	a,b,c,d,e,f,clock,reset,sum);
end architecture;
