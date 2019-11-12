library ieee ;
use ieee.std_logic_1164.all ;
use ieee.numeric_std.all ;
use ieee.math_real.all ; -- for UNIFORM, TRUNC

entity tb_cnt is
end entity ; 

architecture behaviour of tb_cnt is

component counter
	port
	(
		CLK		 		: in	std_logic;
		RST				: in 	std_logic;
		COUNT	 		: in 	std_logic;
		DATA_OUT	: out	unsigned (8-1 downto 0);
		UP_DN			: out	std_logic
	);
end component;

--REF
component counter_ref
	port
	(
		CLK		 		: in	std_logic;
		RST				: in 	std_logic;
		COUNT	 		: in 	std_logic;
		DATA_OUT	: out	unsigned (8-1 downto 0);
		UP_DN			: out	std_logic
	);
end component;

signal CLK :  std_logic:='0';
signal RST: std_logic:='0';
signal COUNT: std_logic:='0';
signal UP_DN_DUT,UP_DN_REF : std_logic;
signal OUT_DUT, OUT_REF : unsigned (8-1 downto 0):=(others=>'0');
signal RST_t, COUNT_t : std_logic_vector(1 downto 0);

begin

	--cloCLK and reset generation
	CLK <= not CLK after 1 ns;
	--RST <= '1' after 3 ns, '0' after 6 ns,'1' after 30 ns, '0' after 31 ns; -- v2 test
	--COUNT <= '1';
	RST <= '1' after 3 ns, '0' after 6 ns; -- v3 test
	COUNT <= '1' after 3 ns, '0' after 14 ns, '1' after 70 ns;
	random: process (CLK)
		variable seed1, seed2: positive;

		variable rand_1: real;
		variable rand_2: real;

		variable int_rand_1: integer;
		variable int_rand_2: integer;

	begin
		if CLK='1' AND CLK'EVENT then
			-- Random number generation
			UNIFORM(seed1, seed2, rand_1);
			UNIFORM(seed1, seed2, rand_2);
	
			int_rand_1 := INTEGER(ROUND(rand_1));
			int_rand_2 := INTEGER(ROUND(rand_2));
			RST_t <= std_logic_vector(to_signed(int_rand_1,2));
			COUNT_t <= std_logic_vector(to_signed(int_rand_2,2));
			--RST <= RST_t(0);
			--COUNT <= COUNT_t(0);
		end if;

	end process random;

	bug_report: process(CLK)
		begin
			if CLK='1' AND CLK'EVENT then
				assert ( OUT_DUT = OUT_REF) report "There is a bug [OUTPUT MISMATCH]" severity warning;
			end if;
			if CLK='1' AND CLK'EVENT then
				assert ( UP_DN_DUT = UP_DN_REF) report "There is a bug [UP/DOWN MISMATCH]" severity warning;
			end if;
	end process bug_report;

	DUT : counter
		port map    (
			CLK		=>	CLK,		
			RST		=>	RST,
			COUNT	=> 	COUNT,
			DATA_OUT=>	OUT_DUT,
			UP_DN	=>	UP_DN_DUT); 

	REF : counter_ref
		port map    (
			CLK		=>	CLK,		
			RST		=>	RST,
			COUNT	=> 	COUNT,
			DATA_OUT=>	OUT_REF,
			UP_DN	=>	UP_DN_REF);

end architecture behaviour;
