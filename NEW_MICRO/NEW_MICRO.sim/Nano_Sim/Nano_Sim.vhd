----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/13/2022 09:04:40 PM
-- Design Name: 
-- Module Name: Nano_Sim - Behavioral
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

entity Nano_Sim is
--  Port ( );
end Nano_Sim;

architecture Behavioral of Nano_Sim is

component Nanoprocessor
    Port ( Clock : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC);
end component;

signal clk: std_logic:= '0';
signal res, ov, zz: std_logic;

begin

UUT: Nanoprocessor
    PORT MAP(
        Clock => clk,
        Reset => res,
        overflow => ov,
        zero => zz
    );

process begin
    wait for 4ns;
    clk <= not clk;
end process;

process begin
    res <= '1';
    wait for 65ns;
    
    res <= '0';
    wait;
end process;

end Behavioral;
