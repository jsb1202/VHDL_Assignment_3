-- 실습 3: Positive-edge-triggered D Flip-Flop
library ieee;
use ieee.std_logic_1164.all;

entity d_ff is
  port (
    clk, d : in  std_logic;
    q, qn  : out std_logic
  );
end entity d_ff;

architecture behavioral of d_ff is
  signal q_int : std_logic;
begin
  process (clk)
  begin
    if rising_edge(clk) then
      q_int <= d;      -- 상승 에지에서만 D를 저장
    end if;
  end process;
  q  <= q_int;
  qn <= not q_int;
end architecture behavioral;
