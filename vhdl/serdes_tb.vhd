library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity ser2des_tb is
end;

architecture bench of ser2des_tb is

  component ser2des
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
  end component;

constant DATA_WIDTH : integer := 8;

  signal clk: std_logic;
  signal s1_in: std_logic_vector(DATA_WIDTH - 1 downto 0);
  signal s2_in: std_logic_vector(DATA_WIDTH - 1 downto 0);
  signal s3_in: std_logic_vector(DATA_WIDTH - 1 downto 0);
  signal p1_out: std_logic_vector(DATA_WIDTH - 1 downto 0);
  signal p2_out: std_logic_vector(DATA_WIDTH - 1 downto 0);
  signal p3_out: std_logic_vector(DATA_WIDTH - 1 downto 0);
  signal p4_out: std_logic_vector(DATA_WIDTH - 1 downto 0);
  signal p5_out: std_logic_vector(DATA_WIDTH - 1 downto 0);
  signal p6_out: std_logic_vector(DATA_WIDTH - 1 downto 0);
  signal p7_out: std_logic_vector(DATA_WIDTH - 1 downto 0);
  signal p8_out: std_logic_vector(DATA_WIDTH - 1 downto 0);
  signal p9_out: std_logic_vector(DATA_WIDTH - 1 downto 0) ;

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  -- Insert values for generic parameters !!
  uut: ser2des generic map ( DATA_WIDTH => DATA_WIDTH )
                  port map ( clk        => clk,
                             s1_in      => s1_in,
                             s2_in      => s2_in,
                             s3_in      => s3_in,
                             p1_out     => p1_out,
                             p2_out     => p2_out,
                             p3_out     => p3_out,
                             p4_out     => p4_out,
                             p5_out     => p5_out,
                             p6_out     => p6_out,
                             p7_out     => p7_out,
                             p8_out     => p8_out,
                             p9_out     => p9_out );

  stimulus: process
  begin
  
    -- Put initialisation code here
	s1_in <= std_logic_vector(to_unsigned(1,s1_in'length));
	s2_in <= std_logic_vector(to_unsigned(3,s1_in'length));
	s3_in <= std_logic_vector(to_unsigned(6,s1_in'length));
    wait for 10 ns;
	
	s1_in <= std_logic_vector(to_unsigned(2,s1_in'length));
	s2_in <= std_logic_vector(to_unsigned(5,s1_in'length));
	s3_in <= std_logic_vector(to_unsigned(9,s1_in'length));
    wait for 10 ns;
	
	s1_in <= std_logic_vector(to_unsigned(3,s1_in'length));
	s2_in <= std_logic_vector(to_unsigned(7,s1_in'length));
	s3_in <= std_logic_vector(to_unsigned(12,s1_in'length));
    wait for 10 ns;
	
	s1_in <= std_logic_vector(to_unsigned(4,s1_in'length));
	s2_in <= std_logic_vector(to_unsigned(9,s1_in'length));
	s3_in <= std_logic_vector(to_unsigned(15,s1_in'length));
    wait for 10 ns;
	
	s1_in <= std_logic_vector(to_unsigned(5,s1_in'length));
	s2_in <= std_logic_vector(to_unsigned(11,s1_in'length));
	s3_in <= std_logic_vector(to_unsigned(18,s1_in'length));
    wait for 10 ns;
	
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
  