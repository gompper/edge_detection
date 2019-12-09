library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity edge_detect_tb is
end;

architecture bench of edge_detect_tb is

  component edge_detect
  generic(
  	DATA_WIDTH : integer := 8
  	);
  port(
  	clk 	: in std_logic;
  	data1	: in std_logic_vector(DATA_WIDTH-1 downto 0);
  	data2	: in std_logic_vector(DATA_WIDTH-1 downto 0);
  	data3	: in std_logic_vector(DATA_WIDTH-1 downto 0);
  	data4	: in std_logic_vector(DATA_WIDTH-1 downto 0);
  	data5	: in std_logic_vector(DATA_WIDTH-1 downto 0);
  	data6	: in std_logic_vector(DATA_WIDTH-1 downto 0);
  	data7	: in std_logic_vector(DATA_WIDTH-1 downto 0);
  	data8	: in std_logic_vector(DATA_WIDTH-1 downto 0);
  	data9	: in std_logic_vector(DATA_WIDTH-1 downto 0);
  	data_o : out std_logic_vector(DATA_WIDTH-1 downto 0)
  	);
  end component;
  
  constant DATA_WIDTH : integer := 8;
  signal clk: std_logic;
  signal data1: std_logic_vector(DATA_WIDTH-1 downto 0);
  signal data2: std_logic_vector(DATA_WIDTH-1 downto 0);
  signal data3: std_logic_vector(DATA_WIDTH-1 downto 0);
  signal data4: std_logic_vector(DATA_WIDTH-1 downto 0);
  signal data5: std_logic_vector(DATA_WIDTH-1 downto 0);
  signal data6: std_logic_vector(DATA_WIDTH-1 downto 0);
  signal data7: std_logic_vector(DATA_WIDTH-1 downto 0);
  signal data8: std_logic_vector(DATA_WIDTH-1 downto 0);
  signal data9: std_logic_vector(DATA_WIDTH-1 downto 0);
  signal data_o: std_logic_vector(DATA_WIDTH-1 downto 0) ;

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  -- Insert values for generic parameters !!
  uut: edge_detect generic map ( DATA_WIDTH => DATA_WIDTH )
                      port map ( clk        => clk,
                                 data1      => data1,
                                 data2      => data2,
                                 data3      => data3,
                                 data4      => data4,
                                 data5      => data5,
                                 data6      => data6,
                                 data7      => data7,
                                 data8      => data8,
                                 data9      => data9,
                                 data_o     => data_o );

  stimulus: process
  begin
  
    -- Put initialisation code here
	wait for 10 ns;
	data1 <= std_logic_vector(to_unsigned(1,data1'length));
	data2 <= std_logic_vector(to_unsigned(2,data1'length));
	data3 <= std_logic_vector(to_unsigned(3,data1'length));
	data4 <= std_logic_vector(to_unsigned(4,data1'length));
	data5 <= std_logic_vector(to_unsigned(5,data1'length));
	data6 <= std_logic_vector(to_unsigned(6,data1'length));
	data7 <= std_logic_vector(to_unsigned(7,data1'length));
	data8 <= std_logic_vector(to_unsigned(8,data1'length));
	data9 <= std_logic_vector(to_unsigned(9,data1'length));	
	
	wait for 50 ns;
	data1 <= std_logic_vector(to_unsigned(3,data1'length));
	data2 <= std_logic_vector(to_unsigned(4,data1'length));
	data3 <= std_logic_vector(to_unsigned(5,data1'length));
	data4 <= std_logic_vector(to_unsigned(7,data1'length));
	data5 <= std_logic_vector(to_unsigned(5,data1'length));
	data6 <= std_logic_vector(to_unsigned(6,data1'length));
	data7 <= std_logic_vector(to_unsigned(7,data1'length));
	data8 <= std_logic_vector(to_unsigned(8,data1'length));
	data9 <= std_logic_vector(to_unsigned(9,data1'length));

    -- Put test bench stimulus code here

    stop_the_clock <= false;
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
  