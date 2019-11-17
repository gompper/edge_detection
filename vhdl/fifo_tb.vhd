library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity FIFO_tb is
end;

architecture bench of FIFO_tb is

  component FIFO
  generic(
  	DATA_WIDTH : integer := 8;
  	COLUMNS : integer := 28
  	);
  port(
  	clk : in std_logic;
  	data_in : in std_logic_vector(DATA_WIDTH - 1 downto 0);
  	data_out : out std_logic_vector(DATA_WIDTH - 1 downto 0)
  	);
  end component;

    constant DATA_WIDTH : integer := 8;
    constant COLUMNS : integer := 28;

  signal clk: std_logic;
  signal data_in: std_logic_vector(DATA_WIDTH - 1 downto 0);
  signal data_out: std_logic_vector(DATA_WIDTH - 1 downto 0) ;

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  -- Insert values for generic parameters !!
  uut: FIFO generic map ( DATA_WIDTH => DATA_WIDTH,
                          COLUMNS    =>  COLUMNS)
               port map ( clk        => clk,
                          data_in    => data_in,
                          data_out   => data_out );

  stimulus: process
  begin
  
    -- Put initialisation code here
	data_in <= std_logic_vector(to_unsigned(1,data_in'length)); wait for 10 ns;
	data_in <= std_logic_vector(to_unsigned(2,data_in'length)); wait for 10 ns;
	data_in <= std_logic_vector(to_unsigned(3,data_in'length)); wait for 10 ns;
	data_in <= std_logic_vector(to_unsigned(4,data_in'length)); wait for 10 ns;
	data_in <= std_logic_vector(to_unsigned(5,data_in'length)); wait for 10 ns;
	data_in <= std_logic_vector(to_unsigned(6,data_in'length)); wait for 10 ns;
	data_in <= std_logic_vector(to_unsigned(7,data_in'length)); wait for 10 ns;
	data_in <= std_logic_vector(to_unsigned(8,data_in'length)); wait for 10 ns;
	data_in <= std_logic_vector(to_unsigned(10,data_in'length)); wait for 10 ns;
	data_in <= std_logic_vector(to_unsigned(11,data_in'length)); wait for 10 ns;
	data_in <= std_logic_vector(to_unsigned(12,data_in'length)); wait for 10 ns;
	data_in <= std_logic_vector(to_unsigned(13,data_in'length)); wait for 10 ns;
	data_in <= std_logic_vector(to_unsigned(14,data_in'length)); wait for 10 ns;
	data_in <= std_logic_vector(to_unsigned(15,data_in'length)); wait for 10 ns;
	data_in <= std_logic_vector(to_unsigned(16,data_in'length)); wait for 10 ns;
	data_in <= std_logic_vector(to_unsigned(17,data_in'length)); wait for 10 ns;
	data_in <= std_logic_vector(to_unsigned(18,data_in'length)); wait for 10 ns;
	data_in <= std_logic_vector(to_unsigned(19,data_in'length)); wait for 10 ns;
	data_in <= std_logic_vector(to_unsigned(20,data_in'length)); wait for 10 ns;
	data_in <= std_logic_vector(to_unsigned(21,data_in'length)); wait for 10 ns;
	data_in <= std_logic_vector(to_unsigned(22,data_in'length)); wait for 10 ns;
	data_in <= std_logic_vector(to_unsigned(23,data_in'length)); wait for 10 ns;
	data_in <= std_logic_vector(to_unsigned(24,data_in'length)); wait for 10 ns;
	data_in <= std_logic_vector(to_unsigned(25,data_in'length)); wait for 10 ns;
	data_in <= std_logic_vector(to_unsigned(26,data_in'length)); wait for 10 ns;
	data_in <= std_logic_vector(to_unsigned(27,data_in'length)); wait for 10 ns;
	data_in <= std_logic_vector(to_unsigned(28,data_in'length)); wait for 10 ns;
	data_in <= std_logic_vector(to_unsigned(29,data_in'length)); wait for 10 ns;
	data_in <= std_logic_vector(to_unsigned(30,data_in'length)); wait for 10 ns;
	--after 1000 ns;
    wait for 1000 ns;
	-- Put test bench stimulus code here

    stop_the_clock <= true;
    wait;
  end process;

  clocking: process
  begin
    while not stop_the_clock loop
      clk <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end;