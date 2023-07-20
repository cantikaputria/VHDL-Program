library ieee;
use ieee.std_logic_1164.all;

entity Multiplier_3bit is
    port(
        x, y: in std_logic_vector(2 downto 0);
        product: out std_logic_vector(5 downto 0)
    );
end Multiplier_3bit;

architecture Behavioral of Multiplier_3bit is
    signal partial_products: std_logic_vector(5 downto 0);

begin
    -- Perkalian bit ke-0
    partial_products(0) <= x(0) and y(0);

    -- Perkalian bit ke-1
    partial_products(1) <= x(1) and y(0);

    -- Perkalian bit ke-2
    partial_products(2) <= x(2) and y(0);

    -- Perkalian bit ke-3
    partial_products(3) <= x(0) and y(1);

    -- Perkalian bit ke-4
    partial_products(4) <= x(1) and y(1);

    -- Perkalian bit ke-5
    partial_products(5) <= x(2) and y(1);

    -- Menggabungkan hasil perkalian
    product <= partial_products(5 downto 0);

end Behavioral;
