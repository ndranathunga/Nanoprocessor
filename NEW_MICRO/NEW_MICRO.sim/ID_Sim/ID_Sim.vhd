----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/12/2022 02:21:18 PM
-- Design Name: 
-- Module Name: ID_Sim - Behavioral
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

entity ID_Sim is
--  Port ( );
end ID_Sim;

architecture Behavioral of ID_Sim is

component Instruction_Decoder
    Port ( instruction : in STD_LOGIC_VECTOR (11 downto 0);
           reg_jump : in STD_LOGIC_VECTOR (3 downto 0);
           reg_en : out STD_LOGIC_VECTOR (2 downto 0);
           load_sel : out STD_LOGIC;
           im_val : out STD_LOGIC_VECTOR (3 downto 0);
           reg_sel_0 : out STD_LOGIC_VECTOR (2 downto 0);
           reg_sel_1 : out STD_LOGIC_VECTOR (2 downto 0);
           sub_sel : out STD_LOGIC;
           jmp_flag : out STD_LOGIC;
           jmp_address : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal instruction0 :STD_LOGIC_VECTOR (11 downto 0);
signal reg_jump0 :STD_LOGIC_VECTOR (3 downto 0);
signal reg_en0 :STD_LOGIC_VECTOR (2 downto 0);
signal load_sel0 :STD_LOGIC;
signal im_val0 :STD_LOGIC_VECTOR (3 downto 0);
signal reg_sel_00 :STD_LOGIC_VECTOR (2 downto 0);
signal reg_sel_10 :STD_LOGIC_VECTOR (2 downto 0);
signal sub_sel0 :STD_LOGIC;
signal jmp_flag0 :STD_LOGIC;
signal jmp_address0 :STD_LOGIC_VECTOR (2 downto 0);

begin

UUT: Instruction_Decoder
    PORT MAP(
        instruction => instruction0,
        reg_jump => reg_jump0,
        reg_en => reg_en0,
        load_sel => load_sel0,
        im_val => im_val0,
        reg_sel_0 => reg_sel_00,
        reg_sel_1 => reg_sel_10,
        sub_sel => sub_sel0,
        jmp_flag => jmp_flag0,
        jmp_address => jmp_address0
    );

process begin

instruction0 <= "100010000011"; -- MOVI R1, 3
wait for 200ns;

instruction0 <= "100100000001"; -- MOVI R2, 1
wait for 200ns;

instruction0 <= "010100000000"; -- NEG R2
wait for 200ns;

instruction0 <= "001110010000"; -- ADD R7, R1
wait for 200ns;

instruction0 <= "110010000111"; -- JZR R1, 7
reg_jump0 <= "0000";
wait;

end process;

end Behavioral;
