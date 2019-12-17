library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity ser2des is
generic(
	DATA_WIDTH : integer := 8
);
port(
	clk		: in  std_logic;
	s1_in 	: in  std_logic_vector(DATA_WIDTH - 1 downto 0);
	s2_in 	: in std_logic_vector(DATA_WIDTH - 1 downto 0);
	s3_in 	: in  std_logic_vector(DATA_WIDTH - 1 downto 0);
	p1_out 	: out  std_logic_vector(DATA_WIDTH - 1 downto 0);
	p2_out 	: out  std_logic_vector(DATA_WIDTH - 1 downto 0);
	p3_out 	: out  std_logic_vector(DATA_WIDTH - 1 downto 0);
	p4_out 	: out  std_logic_vector(DATA_WIDTH - 1 downto 0);
	p5_out 	: out  std_logic_vector(DATA_WIDTH - 1 downto 0);
	p6_out 	: out  std_logic_vector(DATA_WIDTH - 1 downto 0);
	p7_out 	: out  std_logic_vector(DATA_WIDTH - 1 downto 0);
	p8_out 	: out  std_logic_vector(DATA_WIDTH - 1 downto 0);
	p9_out 	: out  std_logic_vector(DATA_WIDTH - 1 downto 0)
);
end ser2des;

architecture behave of ser2des is

type data_buffer is array (2 downto 0) of std_logic_vector(DATA_WIDTH - 1 downto 0);

signal p1_buf : data_buffer;
signal p2_buf : data_buffer;
signal p3_buf : data_buffer;



begin

process(clk)
begin
if rising_edge(clk) then
	p1_buf(2) <= p1_buf(1);
	p1_buf(1) <= p1_buf(0);
	p1_buf(0) <= s1_in;
	p2_buf(2) <= p2_buf(1);
	p2_buf(1) <= p2_buf(0);
	p2_buf(0) <= s2_in;
	p3_buf(2) <= p3_buf(1);
	p3_buf(1) <= p3_buf(0);
	p3_buf(0) <= s3_in;
end if;
end process;

p1_out <= p1_buf(0);
p2_out <= p1_buf(1);
p3_out <= p1_buf(2);
p4_out <= p2_buf(0);
p5_out <= p2_buf(1);
p6_out <= p2_buf(2);
p7_out <= p3_buf(0);
p8_out <= p3_buf(1);
p9_out <= p3_buf(2);

end behave;