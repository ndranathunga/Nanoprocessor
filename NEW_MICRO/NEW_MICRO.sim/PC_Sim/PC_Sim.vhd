----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/13/2022 08:12:16 PM
-- Design Name: 
-- Module Name: PC_Sim - Behavioral
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

entity PC_Sim is
--  Port ( );
end PC_Sim;

architecture Behavioral of PC_Sim is

component Counter
    Port ( Clk : in STD_LOGIC;
           Res : in STD_LOGIC;
           D: in STD_LOGIC_VECTOR(2 downto 0);
           Q : out STD_LOGIC_VECTOR(2 downto 0));
end component;

signal clkk, Ress: std_logic:='0';
signal dd, qq: STD_LOGIC_VECTOR (2 downto 0);

begin

UUT: Counter
    PORT MAP(
        Clk => clkk,
        res => ress,
        D => dd,
        Q => Qq
    );

process begin
    wait for 40 ns; 
    clkk <= not clkk;
end process;

process begin 
    dd <= "ZZZ";
    wait for 80ns;
    
    dd <= "000";
    wait for 80ns;
    
    dd <= "001";
    wait for 80ns;
    
    dd <= "110";
    wait for 80ns;
end process;

process begin 
    ress <= '1';
    wait for 80ns;
    
    ress <= '0';
    wait;
end process;

end Behavioral;
