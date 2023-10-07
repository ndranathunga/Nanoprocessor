----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/20/2022 09:54:09 PM
-- Design Name: 
-- Module Name: Circuit2Sim - Behavioral
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
 
entity RCA_Ssim is
--  Port ( );
end RCA_Ssim;
 
architecture Behavioral of RCA_Ssim is
COMPONENT RCA_S
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           CTR_in : in STD_LOGIC;
           C_out : out STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0));
END COMPONENT;
signal a,b,s : STD_LOGIC_VECTOR (3 downto 0);
signal ctr_in,c_out : STD_LOGIC ;
 
begin
UUT: RCA_S
    PORT MAP(
        A => a,
        B => b,
        CTR_in => ctr_in ,
        C_out => c_out,
        S => s
    );
 
process begin
    --Reset mode
    a <= "0011";
    b <= "0000";
    ctr_in <= '0';
    
    wait for 200ns;
    
    a <= "0001";
    b <= "0011";
    ctr_in <= '0';
    wait;
    
--    wait for 200ns;
    
--    a <= "0111";
--    b <= "0100";
--    ctr_in <= '1';
   
--    wait;
    
end process;
end Behavioral;
