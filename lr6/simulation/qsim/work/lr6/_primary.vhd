library verilog;
use verilog.vl_types.all;
entity lr6 is
    port(
        SW              : in     vl_logic_vector(1 downto 0);
        CLOCK_50        : in     vl_logic;
        LEDR            : out    vl_logic_vector(1 downto 0);
        LEDG            : out    vl_logic_vector(3 downto 0);
        HEX0            : out    vl_logic_vector(6 downto 0);
        HEX1            : out    vl_logic_vector(6 downto 0);
        HEX2            : out    vl_logic_vector(6 downto 0);
        HEX3            : out    vl_logic_vector(6 downto 0)
    );
end lr6;
