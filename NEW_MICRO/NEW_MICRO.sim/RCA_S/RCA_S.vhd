----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/14/2022 08:07:25 AM
-- Design Name: 
-- Module Name: RCA_S - Behavioral
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

entity RCA_S is
--  Port ( );
end RCA_S;

architecture Behavioral of RCA_S is

component RCA_S
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           CTR_in : in STD_LOGIC;
           C_out : out STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Zero: out STD_LOGIC);
end component;

signal a, b, s: STD_LOGIC_VECTOR (3 downto 0);
signal ctr, cOut, zz: STD_LOGIC;

begin

UUT: RCA_S
    PORT MAP(
        A => a,
        B => b,
        s => s,
        ctr_in => ctr,
        c_out => cOut,
        zero => zz
    );

process begin

a <= "1111";
b <= "0001";
ctr <= '1';
wait;

end process;

end Behavioral;
