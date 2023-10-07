----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/08/2022 08:25:55 AM
-- Design Name: 
-- Module Name: RCA - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RCA is
    Port (Y : in STD_LOGIC_VECTOR (2 downto 0);
          S : out STD_LOGIC_VECTOR (2 downto 0);
          Cin : in STD_LOGIC;
          Cout : out STD_LOGIC);
end RCA;

architecture Behavioral of RCA is

component FA
Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C_in : in STD_LOGIC;
           S : out STD_LOGIC;
           C_out : out STD_LOGIC);
end component;

signal  FA_cout : STD_LOGIC_VECTOR (1 downto 0);



begin


FA_0: FA

PORT MAP(
A=>'1', 
B=>Y(0),
C_in=>Cin,
S=>S(0),
C_out=>FA_cout(0)
);

FA_1: FA

PORT MAP(
A=>'0', 
B=>Y(1),
C_in=>FA_cout(0),
S=>S(1),
C_out=>FA_cout(1)
);

FA_2: FA

PORT MAP(
A=>'0', 
B=>Y(2),
C_in=>FA_cout(1),
S=>S(2),
C_out=>Cout
);


end Behavioral;
