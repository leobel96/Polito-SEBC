library ieee ;
use ieee.std_logic_1164.all ;
use ieee.numeric_std.all ;

entity inccomp_tb is
  GENERIC (
            N_BIT   : integer := 32
          );
end entity ; 

architecture arch of inccomp_tb is

component inccomp
	generic	(
			N_BIT : integer := 32
		);
	port(	
		CK		: in 	std_logic;
		RST		: in 	std_logic;
		INCA	: in 	std_logic;
		INCB	: in 	std_logic;
		EXTA 	: in 	std_logic;
		EXTB 	: in 	std_logic;
		A		: in 	signed (N_BIT-1 downto 0);
		B		: in 	signed (N_BIT-1 downto 0);
		C		: out	signed (N_BIT-1 downto 0)
	);
end component;

--REF
component inccomp_2
	generic	(
			N_BIT : integer := 32
		);
	port(	
		CK		: in 	std_logic;
		RST		: in 	std_logic;
		INCA	: in 	std_logic;
		INCB	: in 	std_logic;
		EXTA 	: in 	std_logic;
		EXTB 	: in 	std_logic;
		A		: in 	signed (N_BIT-1 downto 0);
		B		: in 	signed (N_BIT-1 downto 0);
		C		: out	signed (N_BIT-1 downto 0)
	);
end component;

signal CK :  std_logic:='0';
signal RST: std_logic:='0';
signal INCA,INCB : std_logic;
signal EXTA,EXTB : std_logic;
signal A,B : signed (N_BIT-1 downto 0):=(others=>'0');
signal C,C_2 : signed (N_BIT-1 downto 0);

begin

	--clock generation
	CK <= not CK after 2 ns;
	RST <= '1' after 3 ns, '0' after 6 ns;

	--ADDER 1 INC, ADDER 2 NULL
	INCA <= '1';
	INCB <= '0';
	EXTA <= '0'; --incremental mode
	EXTB <= '1';
	--A <= (others => '0');
	B_generation:process(CK,RST)
		begin
			if RST = '1' then
				B <= (others => '0');
			elsif CK='1' and CK'event then
				B <= B + 1;
			end if;
	end process B_generation;

	bug_report: process(CK)
		begin
			if CK='1' AND CK'EVENT then
				assert ( C = C_2) report "There is a bug." severity warning;
			end if;
	end process bug_report;

	DUT : inccomp 
		generic map (
			N_BIT => N_BIT)
		port map    (
			CK		=>	CK,		
			RST		=>	RST,
			INCA	=>	INCA,
			INCB	=>	INCB,
			EXTA 	=>	EXTA,
			EXTB 	=>	EXTB,
			A		=>	A,
			B		=>	B,
			C		=>	C); 

	REF : inccomp_2 
		generic map (
			N_BIT => N_BIT)
		port map    (
			CK		=>	CK,		
			RST		=>	RST,
			INCA	=>	INCA,
			INCB	=>	INCB,
			EXTA 	=>	EXTA,
			EXTB 	=>	EXTB,
			A		=>	A,
			B		=>	B,
			C		=>	C_2); 

end architecture ;
