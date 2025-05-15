----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/15/2025 04:15:00 PM
-- Design Name: 
-- Module Name: TB_Instruction_Decoder - Behavioral
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

entity TB_Instruction_Decoder is
--  Port ( );
end TB_Instruction_Decoder;

architecture Behavioral of TB_Instruction_Decoder is

component Instruction_Decoder 
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
end component;

signal instruction_bus:std_logic_vector(11 downto 0); 
signal Reg_chek_jump,immediate_value,address_jump :STD_LOGIC_VECTOR (3 downto 0); 
signal Reg_sel_1,Reg_sel_2,Reg_ena : STD_LOGIC_VECTOR (2 downto 0); 
signal Add_Sub_sel,jump_flag,load_sel : STD_LOGIC; 

begin

UUT : Instruction_Decoder port map(
         Instruction_Data=>instruction_bus, 
         Che_Jmp=>Reg_chek_jump, 
         Reg_En=>Reg_ena, 
         Val_Sel=>load_sel, 
         Data_Out=>immediate_value, 
         Reg_sel_1=>Reg_sel_1, 
         Reg_sel_2=>Reg_sel_2, 
         Ope_Sele=>Add_Sub_sel, 
         Jmp_Flag=>jump_flag,  
         Jmp_Adrs=>address_jump); 
          
process begin 
    --Add method Test 
    instruction_bus<="100010001100"; 
    Reg_chek_jump<="1000"; 
    wait for 100ns; 
    
    --Move method Test 
    instruction_bus<="100100000001"; 
    Reg_chek_jump<="0101"; 
    wait for 100ns; 
     
    --NEG method Test 
    instruction_bus<="000011001010"; 
    wait for 100ns; 
     
    --Jump method Test 
    instruction_bus<="011110010101"; 
    Reg_chek_jump<="0101";    -- Test when register not zero 
    wait for 100ns; 
     
    instruction_bus<="110000000011"; 
    Reg_chek_jump<="0000";     --Test when register zero 
    wait; 
end process; 

end Behavioral;
