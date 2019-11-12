library ieee ;
  use ieee.std_logic_1164.all ;
  use ieee.numeric_std.all ;
  use ieee.math_real.all ; -- for UNIFORM, TRUNC


entity inccomp_tb is
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

  signal CK,RST,INCA,INCB,EXTA,EXTB : std_logic;
  signal A,B,C,C_2 : signed (31 downto 0);
  signal INCA_t, INCB_t, EXTA_t, EXTB_t : std_logic_vector(0 downto 0);
begin

  DUT : inccomp 
  generic map (
                N_BIT => 32
              )
  port map    (
                CK		=>	CK,		
				RST		=>	RST,
				INCA	=>	INCA,
				INCB	=>	INCB,
				EXTA 	=>	EXTA,
				EXTB 	=>	EXTB,
				A		=>	A,
				B		=>	B,
				C		=>	C
              ); 

  DUT_2 : inccomp_2 
  generic map (
                N_BIT => 32
              )
  port map    (
                CK		=>	CK,		
				RST		=>	RST,
				INCA	=>	INCA,
				INCB	=>	INCB,
				EXTA 	=>	EXTA,
				EXTB 	=>	EXTB,
				A		=>	A,
				B		=>	B,
				C		=>	C_2
              ); 
 -- A    <= to_signed(0, A'LENGTH);
  --B    <= to_signed(0, B'LENGTH);
  --INCA <= '0';
  --INCB <= '0';
  --EXTA <= '0';
  --EXTB <= '0';
 -- RST <= '0';
  --CK <= '0';


random: process(CK)
variable seed1, seed2: positive;

  variable rand_1: real;
  variable rand_2: real;
  variable rand_3: real;
  variable rand_4: real;
  variable rand_5: real;
  variable rand_6: real;

  variable int_rand_1: integer;
  variable int_rand_2: integer;
  variable int_rand_3: integer;
  variable int_rand_4: integer;
  variable int_rand_5: integer;
  variable int_rand_6: integer;


begin
  
  --wait for 5 ns;
 -- RST <= '0';

  if rising_edge(CK) then
    -- Random number generation
    UNIFORM(seed1, seed2, rand_1);
    UNIFORM(seed1, seed2, rand_2);
	UNIFORM(seed1, seed2, rand_3);
    UNIFORM(seed1, seed2, rand_4);
	UNIFORM(seed1, seed2, rand_5);
    UNIFORM(seed1, seed2, rand_6);

    int_rand_1 := INTEGER(TRUNC(rand_1*(4294967296.0) - 2147483648.0));
    int_rand_2 := INTEGER(TRUNC(rand_2*(4294967296.0) - 2147483648.0));
    int_rand_3 := INTEGER(ROUND(rand_3));
    int_rand_4 := INTEGER(ROUND(rand_4));
	int_rand_5 := INTEGER(ROUND(rand_5));
    int_rand_6 := INTEGER(ROUND(rand_6));

    A    <= to_signed(int_rand_1, A'LENGTH);
    B    <= to_signed(int_rand_2, B'LENGTH);
	INCA_t    <= std_logic_vector(to_signed(int_rand_3, 1));
	INCA <= INCA_t(0);
    INCB_t    <= std_logic_vector(to_signed(int_rand_4, 1));
	INCB <= INCB_t(0);	
	EXTA_t	<= std_logic_vector(to_signed(int_rand_5, 1));
	EXTA <= EXTA_t(0);	
	EXTB_t	<= std_logic_vector(to_signed(int_rand_6, 1));
	EXTB <= EXTB_t(0);	

    -- Reference architecture
    
    -- Assert
    assert ( C = C_2) report "There is a bug." severity warning;
  end if;


end process;

clock : process
	begin
		CK <= '1';
		wait for 2 ns;
		CK <= '0';
		wait for 2 ns;
end process clock;

resert : process
	begin
	RST <= '1';
	wait for 7 ns;
	RST <= '0';
	wait;
end process;



end architecture ; -- arch
