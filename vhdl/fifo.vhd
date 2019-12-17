library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FIFO is
generic(
	DATA_WIDTH : integer := 8;
	COLUMNS : integer := 30
	);
port(
	clk : in std_logic;
	data_in : in std_logic_vector(DATA_WIDTH - 1 downto 0);
	data_out : out std_logic_vector(DATA_WIDTH - 1 downto 0)
	);
end FIFO;

architecture behave of FIFO is
	type row is array (COLUMNS - 1 downto 0) of std_logic_vector(DATA_WIDTH - 1 downto 0);
	signal row_array : row;
	signal pointer : integer range 0 to COLUMNS - 1 := 0;
begin

-- writing
process(clk)
begin
	if rising_edge(clk) then
		row_array(pointer) <= data_in;
	end if;
end process;

-- reading
process(clk)
begin
	if rising_edge(clk) then
		 data_out <= row_array(pointer);
	end if;
end process;

-- pointer++
process(clk)
begin
	if rising_edge(clk) then
		if pointer < COLUMNS - 1 then
			pointer <= pointer + 1;
		else
			pointer <= 0;
		end if;
	end if;
end process;

end behave;