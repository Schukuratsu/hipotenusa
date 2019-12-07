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
           rst_n : in STD_LOGIC;
           a_i : in STD_LOGIC_VECTOR (3 downto 0);
           b_i : in STD_LOGIC_VECTOR (3 downto 0);
           test_enable : in STD_LOGIC;
           value_out : out STD_LOGIC_VECTOR (7 downto 0);
           error_flag : out STD_LOGIC;
           error_place : out STD_LOGIC_VECTOR (1 downto 0));
end top;

architecture rtl of top is  

signal a                : STD_LOGIC_VECTOR (3 downto 0);
signal b                : STD_LOGIC_VECTOR (3 downto 0);
signal square_a_result  : STD_LOGIC_VECTOR (7 downto 0);
signal square_b_result  : STD_LOGIC_VECTOR (7 downto 0);
signal sum_result       : STD_LOGIC_VECTOR (7 downto 0);
signal sqrt_result      : STD_LOGIC_VECTOR (3 downto 0);

component square
port( 
clk         : in std_logic;
rst_n       : in std_logic;
data_in     : in std_logic_vector(3 downto 0);
data_out    : out std_logic_vector(7 downto 0));
end component square;

component sum
port( 
clk         : in std_logic;
rst_n       : in std_logic;
a_i         : in std_logic_vector(7 downto 0);
b_i         : in std_logic_vector(7 downto 0);
data_out    : out std_logic_vector(7 downto 0));
end component sum;

component sqrt
port( 
clock      : in std_logic;  
rst_n      : in std_logic;
data_in    : in std_logic_vector(7 downto 0); 
data_out   : out std_logic_vector(3 downto 0));
end component sqrt;


begin

    squareofa : square
    port map( 
        clk         => clk,  
        rst_n       => rst_n,
        data_in     => a, 
        data_out    => square_a_result
    );

    squareofb : square
    port map( 
        clk         => clk,  
        rst_n       => rst_n,
        data_in     => b, 
        data_out    => square_b_result
    );

    sumof : sum
    port map( 
        clk => clk,  
        rst_n => rst_n,
        a_i => square_a_result, 
        b_i => square_b_result, 
        data_out => sum_result
    );

    sqrtof : sqrt
    port map( 
        clock => clk,  
        rst_n => rst_n,
        data_in => sum_result, 
        data_out => sqrt_result
    );


end rtl;
