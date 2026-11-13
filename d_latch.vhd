-- 실습 2: D Latch with Enable
library ieee;
use ieee.std_logic_1164.all;

entity d_latch is
  port (
    d, en : in  std_logic;
    q, qn : out std_logic
  );
end entity d_latch;

architecture behavioral of d_latch is
  signal q_int : std_logic;
begin
  process (d, en)
  begin
    if en = '1' then
      q_int <= d;      -- 투명: Q가 D를 따라감
    end if;            -- en = '0': 대입이 없으므로 이전 값 유지 (래치)
  end process;
  q  <= q_int;
  qn <= not q_int;
end architecture behavioral;
