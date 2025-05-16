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
           Jmp_Adrs : out STD_LOGIC_VECTOR (2 downto 0);
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
 
process (Instruction_Data, Che_Jmp) 
begin 
 
    Reg_En<="000"; 
    Val_Sel<='0'; 
    Data_Out<="0000"; 
    Reg_sel_1<="000"; 
    Reg_sel_2<="000"; 
    Ope_Sele<='0'; 
    Jmp_Flag<='0'; 
    Jmp_Adrs<="000"; 
     
    -- add two registers and store it register 
     
    if(Instruction_Data(11)='0' and Instruction_Data(10)='0') then 
        Reg_En<=Instruction_Data(9 downto 7); 
        Val_Sel<='0'; 
        Ope_Sele<='0';
        Reg_sel_1<=Instruction_Data(9 downto 7); 
        Reg_sel_2<=Instruction_Data(6 downto 4); 
         
     
    -- move numbers into relevant registers 

     
    elsif(Instruction_Data(11)='1' and Instruction_Data(10)='0') then 
        Reg_En<=Instruction_Data(9 downto 7); 
        Val_Sel<='1'; 
        Data_Out<=Instruction_Data(3 downto 0); 
         
         
         
    -- store negative number in register 
     
    elsif(Instruction_Data(11)='0' and Instruction_Data(10)='1') then 
        Reg_En<=Instruction_Data(9 downto 7); 
        Ope_Sele<='1'; 
        Val_Sel<='0'; 
        Reg_sel_1<="000"; 
        Reg_sel_2<=Instruction_Data(9 downto 7); 
 
    -- jump method 
     
    elsif(Instruction_Data(11)='1' and Instruction_Data(10)='1') then 
--        Reg_En<="000"; 
        Reg_sel_1<=Instruction_Data(9 downto 7); 
        if(Che_Jmp="0000") then 
            Jmp_Adrs<= Instruction_Data(2 downto 0); 
            Jmp_Flag<='1'; 
        else 
            Jmp_Flag<='0'; 
         
       end if; 
    end if; 
     
end process; 

end Behavioral;