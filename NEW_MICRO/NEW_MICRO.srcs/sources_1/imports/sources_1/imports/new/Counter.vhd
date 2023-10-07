----------------------------------------------------------------------------------
-- Company: 
-- Engineer: KEERTHICHANDRA HMPM
-- 
-- Create Date: 06/09/2022 02:57:20 PM
-- Design Name: 
-- Module Name: Counter - Behavioral
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

entity Counter is
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           D: in STD_LOGIC_VECTOR(2 downto 0);
           Q : out STD_LOGIC_VECTOR(2 downto 0));
end Counter;

architecture Behavioral of Counter is

component Reg_3bit
    Port ( D : in STD_LOGIC_VECTOR (2 downto 0);
           En : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal dd: std_logic_vector (2 downto 0);
signal qq: std_logic_vector (2 downto 0);

begin

reg_0: Reg_3bit
    PORT MAP(
        Clk => Clk,
        En => '1',
        Q => Q,
        D => dd
    );

with Reset select dd <= d when '0', 
                      d when 'U',  
                      "000" when others;

end Behavioral;
