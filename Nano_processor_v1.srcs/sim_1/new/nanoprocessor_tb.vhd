----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/15/2025 12:06:32 PM
-- Design Name: 
-- Module Name: nanoprocessor_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity nanoprocessor_tb is
--  Port ( );
end nanoprocessor_tb;

architecture Behavioral of nanoprocessor_tb is
 
component Nano_Processor
    Port ( Clk : in STD_LOGIC;
            Output : out STD_LOGIC_vector(3 downto 0);
           Zero : out STD_LOGIC;
          Overflow : out STD_LOGIC;
          Slow_Clk_LED : out std_logic
);
end component;

signal clk , Slow_clk_led , Zero , Overflow : std_logic;
signal output : std_logic_vector (3 downto 0);

begin

UUT : Nano_Processor Port map ( 
        Clk => clk,
        Output => output,
       Zero => zero,
      Overflow => overflow,
      Slow_Clk_LED => Slow_clk_led
);


process
    begin 
        clk <= '0';
        wait for 5ns ;
        clk <= '1';
        wait for 5ns;
        wait;
end process;

  

end Behavioral;
