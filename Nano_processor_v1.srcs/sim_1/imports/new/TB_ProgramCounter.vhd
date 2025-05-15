----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/10/2025 11:41:59 PM
-- Design Name: 
-- Module Name: TB_ProgramCounter - Behavioral
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

entity TB_ProgramCounter is
--  Port ( );
end TB_ProgramCounter;

architecture Behavioral of TB_ProgramCounter is
component Program_Counter
    Port (
        D : in STD_LOGIC_VECTOR(3 downto 0);
        Clk : in STD_LOGIC;
        Res : in STD_LOGIC;
        Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal D, Q: std_logic_vector(3 downto 0);
signal Clk, Res: std_logic;

begin

UUT: Program_Counter
    PORT MAP
        (D => D,
         Clk => Clk,
         Res => Res,
         Q => Q);


process
    begin
        
        Clk <= '0';
        WAIT FOR 10ns;
        
        Clk <= '1';
        WAIT FOR 10ns;
        
end process;

process 
    begin
        
        Res <= '1';
        D <= "0010";
        WAIT FOR 20ns;
        
        Res <= '0';
        D <= "0001";
        WAIT FOR 50ns;
        
        Res <= '0';
        D <= "0010";
        WAIT FOR 50ns;
        
        Res <= '0';
        D <= "0011";
        WAIT FOR 50ns;

        D <= "0110";
        WAIT FOR 100ns;

        D <= "0101";
        WAIT FOR 50ns;
        
        Res <= '1';
        D <= "0111";
        WAIT FOR 20ns;
        
        
        Res <= '0';
        D <= "0111";
        WAIT FOR 50ns;
        
end process;
   

end Behavioral;
