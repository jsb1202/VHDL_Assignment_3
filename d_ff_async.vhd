-- 실습 5: Positive-edge D Flip-Flop with asynchronous Set / Clear (Clear 우선)
library ieee;
use ieee.std_logic_1164.all;

entity d_ff_async is
  port (
    clk, d   : in  std_logic;
    set, clr : in  std_logic;   -- 액티브-하이 비동기 입력
    q, qn    : out std_logic
  );
end entity d_ff_async;

architecture behavioral of d_ff_async is
  signal q_int : std_logic;
begin
  process (clk, set, clr)
  begin
    if clr = '1' then
      q_int <= '0';            -- 1순위: Clear
    elsif set = '1' then
      q_int <= '1';            -- 2순위: Set
    elsif rising_edge(clk) then
      q_int <= d;              -- 3순위: 일반 D 플립플롭
    end if;
  end process;
  q  <= q_int;
  qn <= not q_int;
end architecture behavioral;
