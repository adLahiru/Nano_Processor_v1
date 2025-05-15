----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/14/2025 04:45:38 PM
-- Design Name: 
-- Module Name: adder_4_bit - Behavioral
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

entity adder_4_bit is
    Port ( input : in STD_LOGIC_VECTOR (3 downto 0);
           output : out STD_LOGIC_VECTOR (3 downto 0);
           C_out : out STD_LOGIC);
end adder_4_bit;

architecture Behavioral of adder_4_bit is

component FA
    port( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C_in : in STD_LOGIC;
           S : out STD_LOGIC;
           C_out : out STD_LOGIC);
end component;

--signal input_0,output_0:std_logic_vector(2 downto 0); 
signal S0,S1,S2,S3,C_out_0,C_out_1,C_out_2,C_out_3:std_logic;


begin
FA_0:FA 
port map(A=>input(0), 
         B=>'1', 
         C_in=>'0', 
         S=>S0, 
         C_out=>C_out_0); 
FA_1:FA 
port map(A=>input(1), 
         B=>'0', 
         C_in=>C_out_0, 
         S=>S1, 
         C_out=>C_out_1); 
FA_2:FA 
port map(A=>input(2), 
         B=>'0', 
         C_in=>C_out_1, 
         S=>S2, 
         C_out=>C_out_2); 
FA_3:FA 
port map(A=>input(3), 
         B=>'0', 
         C_in=>C_out_2, 
         S=>S3, 
         C_out=>C_out_3); 

output(0)<=S0; 
output(1)<=S1; 
output(2)<=S2; 
output(3)<=S3;  
C_out<=C_out_3; 

end Behavioral;
