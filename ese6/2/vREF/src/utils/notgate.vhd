LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE work.constants_2.ALL;

ENTITY notgate_2 IS
  PORT  (
          A : in  std_logic;
          Y : out std_logic
        );
END ENTITY;

ARCHITECTURE behavioral OF notgate_2 IS
BEGIN
  Y <= NOT A;
END ARCHITECTURE;
