LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY ADDER IS
	PORT (A, B, C, D, E, F : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		  clock, reset : IN STD_LOGIC;
		  SUM : INOUT STD_LOGIC_VECTOR(15 DOWNTO 0));
END ENTITY ADDER;

ARCHITECTURE BEHAVIOURAL OF ADDER IS

COMPONENT FSM_ADDER IS
	PORT (CLK, RST : IN STD_LOGIC;
		  S : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END COMPONENT FSM_ADDER;

COMPONENT datapath_adder is
	port( 	MUX00:	in std_logic_vector(15 downto 0);
		MUX01:	in std_logic_vector(15 downto 0);
		MUX02:	in std_logic_vector(15 downto 0);
		MUX03:	in std_logic_vector(15 downto 0);
		MUX10:	in std_logic_vector(15 downto 0);
		MUX11:	in std_logic_vector(15 downto 0);
		MUX12:	in std_logic_vector(15 downto 0);
		MUX13:	in std_logic_vector(15 downto 0);
		clock: 	in std_logic;
		reset:	in std_logic;
		SEL00:	in std_logic;
		SEL01:	in std_logic;
		SEL10:	in std_logic;
		SEL11:	in std_logic;
		SUM:	out std_logic_vector(15 downto 0)
	);
end	COMPONENT datapath_adder;

SIGNAL S : STD_LOGIC_VECTOR (3 DOWNTO 0);

BEGIN

	DATAPATH:datapath_adder PORT MAP( 
		MUX00 => F,
		MUX01 => A,
		MUX02 => E,
		MUX03 => SUM,
		MUX10 => C,
		MUX11 => D,
		MUX12 => B,
		MUX13 => SUM,
		clock => clock,
		reset => reset,
		SEL00 => S(2),
		SEL01 => S(3),
		SEL10 => S(0),
		SEL11 => S(1),
		SUM => SUM);
	
	FSM:FSM_ADDER PORT MAP(
		CLK => clock,
		RST => reset,
		S => S);

END ARCHITECTURE BEHAVIOURAL;
		
	


