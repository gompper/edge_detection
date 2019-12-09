library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity edge_detect is
generic(
	DATA_WIDTH : integer := 8
	);
port(
	clk 	: in std_logic;
	--reset 	: in std_logic;
	
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
end edge_detect;

architecture behave of edge_detect is

begin

process(clk)
variable summ_x, summ_y, summa1, summa2, summ : std_logic_vector(10 downto 0);
begin
	if rising_edge(clk) then
		summ_x := ("000" & data3)+("00" & data6 & '0')+("000" & data9)
					-("000" & data1)-("00" & data4 & '0')-("000" & data7);
					
		summ_y:=("000" & data7)+("00" & data8 & '0')+("000" & data9)
					-("000" & data1)-("00" & data2 & '0')-("000" & data3);
					
			
		-- Here is computed the absolute value of the numbers
		if summ_x(10)='1' then
			summa1:= not summ_x+1;
		else
			summa1:= summ_x;				
		end if;

		if summ_y(10)='1' then
			summa2:= not summ_y+1;
		else
			summa2:= summ_y;
		end if;
		
		summ:=summa1+summa2;
		
		-- Threshold = 127
		if summ>"00001111111" then			
			data_o<=(others => '1');
		else 
			data_o<=summ(DATA_WIDTH-1 downto 0);
		end if;
	end if;
end process;



end behave;