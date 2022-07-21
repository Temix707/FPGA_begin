library verilog;
use verilog.vl_types.all;
entity lr4 is
    port(
        CLOCK_50        : in     vl_logic;
        SW              : in     vl_logic_vector(1 downto 0);
        KEY             : in     vl_logic_vector(1 downto 0);
        LEDR            : out    vl_logic_vector(9 downto 0);
        LEDG            : out    vl_logic
    );
end lr4;
