LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.all;

USE work.constants_2.ALL;

ENTITY pg_network_2 IS
  GENERIC (
            N_BIT : INTEGER := cNUM_BIT
          );
  PORT    (
            A     : in  signed (N_BIT-1 DOWNTO 0);
            B     : in  signed (N_BIT-1 DOWNTO 0);
            PG    : out std_logic_vector (N_BIT-1 DOWNTO 0);
            G     : out std_logic_vector (N_BIT-1 DOWNTO 0)
          );

END ENTITY pg_network_2;

ARCHITECTURE structural OF pg_network_2 IS
  COMPONENT pg_network_block_2 IS
    PORT  (
            A  : in  std_logic;
            B  : in  std_logic;
            PG : out std_logic;
            G  : out std_logic
          );
  END COMPONENT pg_network_block_2;

BEGIN  -- ARCHITECTURE pg_network_structural
  pg_block_gen : FOR i IN 0 TO N_BIT-1 GENERATE
    pg_blockx : pg_network_block_2
      PORT MAP  (
                  A  => A(i),
                  B  => B(i),
                  PG => PG(i),
                  G  => G(i)
                );
  END GENERATE pg_block_gen;

END ARCHITECTURE structural;
