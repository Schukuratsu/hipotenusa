----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.11.2019 12:25:43
-- Design Name: 
-- Module Name: top - rtl
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

entity top is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           value_a : in STD_LOGIC_VECTOR (7 downto 0);
           value_b : in STD_LOGIC_VECTOR (7 downto 0);
           test_enable : in STD_LOGIC;
           value_out : out STD_LOGIC_VECTOR (7 downto 0);
           error_flag : out STD_LOGIC;
           error_place : out STD_LOGIC_VECTOR (1 downto 0));
end top;

architecture rtl of top is  
    signal a : STD_LOGIC_VECTOR (7 downto 0);
    signal b : STD_LOGIC_VECTOR (7 downto 0)

begin

    process(clk)
    begin
        if(clk'event and clk = '1') then
            if(reset = '1') then
                a <= (others => '0');
                b <= (others => '0');
                value_out <= (others => '0');                
            elsif(test_enable = '1') then
                a <= 
            else
                a <= value_a;
                b <= value_b;
            end if;
        end if;
    end process;


end rtl;
