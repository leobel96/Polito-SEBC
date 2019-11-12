LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY FSM_ADDER IS
	PORT (CLK, RST : IN STD_LOGIC;
		  S : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END ENTITY FSM_ADDER ;

ARCHITECTURE STATE_MACHINE OF FSM_ADDER  IS

TYPE states IS (ab, abc, abcd, abcde, abcdef);

ATTRIBUTE enum_encoding : string;
ATTRIBUTE enum_encoding OF states : TYPE IS "001 011 111 110 100";

SIGNAL PRES_STATE : states;
SIGNAL NEXT_STATE : states;

BEGIN

	proc : PROCESS(CLK, RST)
		BEGIN
		IF (RST = '1') THEN
			PRES_STATE <= ab;
		ELSIF (CLK'EVENT AND CLK='1') THEN
			PRES_STATE <= NEXT_STATE;
		END IF;
	END PROCESS;

	next_state_decision : PROCESS(PRES_STATE)
		BEGIN
		CASE PRES_STATE IS
			WHEN ab =>
				NEXT_STATE <= abc;
			WHEN abc =>
				NEXT_STATE <= abcd;
			WHEN abcd =>
				NEXT_STATE <= abcde;
			WHEN abcde =>
				NEXT_STATE <= abcdef;
			WHEN abcdef =>
				NEXT_STATE <= ab;
			WHEN OTHERS =>
				NEXT_STATE <= ab;
		END CASE;
	END PROCESS;

	outs : PROCESS(PRES_STATE)
		BEGIN
		CASE PRES_STATE IS
			WHEN ab =>
				S <= "0110";
			WHEN abc =>
				S <= "1100";
			WHEN abcd =>
				S <= "1101";
			WHEN abcde =>
				S <= "1011";
			WHEN abcdef =>
				S <= "0011";
			WHEN OTHERS =>
				S <= "0110";
		END CASE;
	END PROCESS;

END ARCHITECTURE STATE_MACHINE;



