----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/05/2025 08:25:41 AM
-- Design Name: 
-- Module Name: Add_Sub - Behavioral
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

entity Add_Sub is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Sign : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Zero : out STD_LOGIC;
           OverFlow : out STD_LOGIC);
end Add_Sub;

architecture Behavioral of Add_Sub is

component RCA_4
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
       B : in STD_LOGIC_vector (3 downto 0);
       C_in : in STD_LOGIC;
       S : out STD_LOGIC_VECTOR (3 downto 0);
       C_in3 : out STD_LOGIC;
       C_out : out STD_LOGIC);
end component;

signal B_in: STD_LOGIC_VECTOR(3 downto 0);
signal S_RCA: STD_LOGIC_VECTOR(3 downto 0);
signal C_in3, C_out : STD_LOGIC;
    

begin
         
    RCA_4_0 : RCA_4  port map
        (A => A,
         B => B_in,
         C_in => Sign,
         S => S_RCA,
         C_in3 => C_in3,
         C_out => C_out);


B_in(0) <= B(0) XOR Sign; 
B_in(1) <= B(1) XOR Sign;
B_in(2) <= B(2) XOR Sign;
B_in(3) <= B(3) XOR Sign; 
S <= S_RCA;

Zero <= (NOT S_RCA(0)) AND (NOT S_RCA(1)) AND (NOT S_RCA(2)) AND (NOT S_RCA(3));

Overflow <= C_in3 XOR C_out;


end Behavioral;
