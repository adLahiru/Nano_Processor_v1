----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/07/2025 10:25:19 PM
-- Design Name: 
-- Module Name: Instruction_Decoder - Behavioral
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

entity Instruction_Decoder is
    Port ( Instruction_Data : in STD_LOGIC_VECTOR (11 downto 0);
           Jmp_Flag : out STD_LOGIC;
           Jmp_Adrs : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_Sel_1 : out STD_LOGIC_VECTOR (2 downto 0);
           Val_Sel : out STD_LOGIC;
           Data_Out : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_Sel_2 : out STD_LOGIC_VECTOR (2 downto 0);
           Reg_En : out STD_LOGIC_VECTOR (2 downto 0);
           Ope_Sele : out STD_LOGIC;
           Che_Jmp : in STD_LOGIC_VECTOR (3 downto 0));
end Instruction_Decoder;

architecture Behavioral of Instruction_Decoder is

begin

Jmp_Flag <= '0';
Val_Sel <= '0';

process
    begin
    
        if Instruction_Data (11 downto 10) = "10" then 
            -- MOV
            Val_Sel <= '1';
            Reg_En <= Instruction_Data (9 downto 7);
            Data_Out <= Instruction_Data (3 downto 0);
            
         elsif Instruction_Data (11 downto 10) = "00" then
            -- ADD
            Val_Sel <= '1';
            Ope_Sele <= '0';
            Reg_En <= Instruction_Data (9 downto 7);
            Reg_Sel_1 <= Instruction_Data (9 downto 7);
            Reg_En <= Instruction_Data (6 downto 4);
            Reg_Sel_2 <= Instruction_Data (6 downto 4);
                      
         elsif Instruction_Data (11 downto 10) = "01" then
            -- NEG
            Val_Sel    <= '0';
            Ope_Sele   <= '1';
            Reg_Sel_1  <= Instruction_Data(6 downto 4);
            Reg_Sel_2  <= Instruction_Data(9 downto 7);
            Reg_En     <= Instruction_Data(6 downto 4);
            Reg_En     <= Instruction_Data(9 downto 7);
            
         
         elsif (Instruction_Data (11 downto 10) = "11") then
            -- JZR
            Val_Sel    <= '0';

            Reg_Sel_1 <= Instruction_Data (9 downto 7);
            if (Che_Jmp = "0000") then
                Jmp_Flag <= '1';
                Jmp_Adrs <= Instruction_Data (3 downto 0);
            end if;
         end if;
end process;


end Behavioral;
