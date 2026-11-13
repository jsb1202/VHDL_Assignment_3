-- 실습 4: Positive-edge-triggered JK Flip-Flop
-- Logisim 회로의 CLR(액티브-로우)과 맞추기 위해 비동기 clr_n 포함
library ieee;
use ieee.std_logic_1164.all;

entity jk_ff is
  port (
    clk, j, k : in  std_logic;
    clr_n     : in  std_logic;   -- '0'이면 Q = '0' (초기화용)
    q, qn     : out std_logic
  );
end entity jk_ff;

architecture behavioral of jk_ff is
  signal q_int : std_logic;
begin
  process (clk, clr_n)
  begin
    if clr_n = '0' then
      q_int <= '0';                      -- 비동기 Clear
    elsif rising_edge(clk) then
      if j = '1' and k = '1' then
        q_int <= not q_int;              -- Toggle
      elsif j = '1' then
        q_int <= '1';                    -- Set
      elsif k = '1' then
        q_int <= '0';                    -- Reset
      end if;                            -- j = k = '0': Hold
    end if;
  end process;
  q  <= q_int;
  qn <= not q_int;
end architecture behavioral;
