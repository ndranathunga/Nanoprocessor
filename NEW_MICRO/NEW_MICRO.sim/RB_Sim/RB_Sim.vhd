----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/14/2022 05:44:02 PM
-- Design Name: 
-- Module Name: RB_Sim - Behavioral
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

entity RB_Sim is
--  Port ( );
end RB_Sim;

architecture Behavioral of RB_Sim is

component RegBank
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           RegEn : in STD_LOGIC_VECTOR (2 downto 0);
           DataIn : in STD_LOGIC_VECTOR (3 downto 0);
           DataBus0 : out STD_LOGIC_VECTOR (3 downto 0);
           DataBus1 : out STD_LOGIC_VECTOR (3 downto 0);
           DataBus2 : out STD_LOGIC_VECTOR (3 downto 0);
           DataBus3 : out STD_LOGIC_VECTOR (3 downto 0);
           DataBus4 : out STD_LOGIC_VECTOR (3 downto 0);
           DataBus5 : out STD_LOGIC_VECTOR (3 downto 0);
           DataBus6 : out STD_LOGIC_VECTOR (3 downto 0);
           DataBus7 : out STD_LOGIC_VECTOR (3 downto 0)
           );
end component;

component Slow_clk
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end component;

signal clk: std_logic:= '0';
signal reset, clk_out: STD_LOGIC;
signal din, d0, d1, d2, d3, d4, d5, d6, d7: STD_LOGIC_VECTOR (3 downto 0);
signal regen: STD_LOGIC_VECTOR (2 downto 0);

begin

UUT: RegBank
    PORT MAP(
        clk => clk_out,
        reset => reset,
        regen => regen,
        datain => din,
        DataBus0 => d0,
       DataBus1  => d1,
       DataBus2  => d2,
       DataBus3  => d3,
       DataBus4  => d4,
       DataBus5  => d5,
       DataBus6  => d6,
       DataBus7  => d7
    );

sc: slow_clk
    PORT MAP(
        clk_in => clk,
        clk_out => clk_out
    );

process begin 
    clk <= not clk;
    wait for 4ns;
end process;

process begin
    regen <= "000";
    din <= "1010";
    wait for 200ns;
    
    regen <= "111";
    din <= "1111";
    wait for 200ns;
    
    regen <= "000";
    din <= "1110";
    wait for 200ns;
    
    regen <= "111";
    din <= "1101";
    wait for 200ns;
end process;

end Behavioral;
