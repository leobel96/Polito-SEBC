library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;
use work.all;

entity busT0 is
port (	ck : in std_logic;
	rst : in std_logic;
	A : in std_logic_vector(7 downto 0);
	B : out std_logic_vector(8 downto 0);
	C : out std_logic_vector(7 downto 0));
end busT0;

architecture behavioral of busT0 is

signal T0 : std_logic;
signal count : std_logic_vector(7 downto 0);
signal Aold, Abus, buss : std_logic_vector(7 downto 0);

begin
	
	penc: process(ck,rst)
	begin
	  if rst='1' then
		Abus <= (others => '0');
		T0 <= '0';
		Aold <= (others => '0');
		buss <= (others => '0');
	  elsif ck'event and ck='1' then
		if A = Aold then
			T0 <= '0';
			buss <= Abus;
		else
			T0 <= '1';
			Abus <= A;
			buss <= A;
	    end if;
		Aold <= std_logic_vector(unsigned(A)+"00000001");
	  end if;
	end process;
	
	pdec: process(ck,rst)
	begin
	  if rst='1' then
	    count <= (others => '0');
	  elsif ck'event and ck='1' then
	    if T0 = '0' then
		  count <= std_logic_vector(unsigned(count)+"00000001");
	    else
		  count <= buss;
	    end if;
	  end if;
	end process;
	C <= count;
	B(7 downto 0) <= buss;
	B(8) <= T0;
	
end behavioral;
