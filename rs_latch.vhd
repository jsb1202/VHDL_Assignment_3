-- 실습 1: RS Latch (NOR 게이트 구조와 동일한 데이터플로우 기술)
library ieee;
use ieee.std_logic_1164.all;

entity rs_latch is
  port (
    s, r  : in  std_logic;
    q, qn : out std_logic
  );
end entity rs_latch;

architecture dataflow of rs_latch is
  signal q_int, qn_int : std_logic;   -- 피드백용 내부 신호
begin
  q_int  <= r nor qn_int;   -- NOR1
  qn_int <= s nor q_int;    -- NOR2
  q  <= q_int;
  qn <= qn_int;
end architecture dataflow;
