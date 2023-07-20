library ieee;
use ieee.std_logic_1164.all;

entity FA_8bit_Subtractor is
    port(
        x, y: in std_logic_vector(7 downto 0);
        cin: in std_logic;
        difference: out std_logic_vector(7 downto 0);
        borrow: out std_logic
    );
end FA_8bit_Subtractor;

architecture FA_arch_Subtractor of FA_8bit_Subtractor is
    signal borrow_out: std_logic_vector(6 downto 0);

    component full_subtractor is
        port(
            p, q, r: in std_logic;
            difference, bout: out std_logic
        );
    end component;

begin
    a0: full_subtractor port map(x(0), y(0), cin, difference(0), borrow_out(0));
    a1: full_subtractor port map(x(1), y(1), borrow_out(0), difference(1), borrow_out(1));
    a2: full_subtractor port map(x(2), y(2), borrow_out(1), difference(2), borrow_out(2));
    a3: full_subtractor port map(x(3), y(3), borrow_out(2), difference(3), borrow_out(3));
    a4: full_subtractor port map(x(4), y(4), borrow_out(3), difference(4), borrow_out(4));
    a5: full_subtractor port map(x(5), y(5), borrow_out(4), difference(5), borrow_out(5));
    a6: full_subtractor port map(x(6), y(6), borrow_out(5), difference(6), borrow_out(6));
    a7: full_subtractor port map(x(7), y(7), borrow_out(6), difference(7), borrow);

end FA_arch_Subtractor;

library ieee;
use ieee.std_logic_1164.all;

entity full_subtractor is
    port(
        p, q, r: in std_logic;
        difference, bout: out std_logic
    );
end full_subtractor;

architecture FA_arc_Subtractor of full_subtractor is
begin
    difference <= p xor q xor r;
    bout <= (not p and q and r) or (p and not q and r) or (p and q and not r);
end FA_arc_Subtractor;
