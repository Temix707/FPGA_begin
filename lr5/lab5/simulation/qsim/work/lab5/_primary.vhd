library verilog;
use verilog.vl_types.all;
entity lab5 is
    port(
        KEY             : in     vl_logic_vector(1 downto 0);
        SW              : in     vl_logic_vector(1 downto 0);
        CLOCK_50        : in     vl_logic;
        HEX0            : out    vl_logic_vector(6 downto 0);
        HEX1            : out    vl_logic_vector(6 downto 0);
        HEX2            : out    vl_logic_vector(6 downto 0);
        HEX3            : out    vl_logic_vector(6 downto 0);
        LEDR            : out    vl_logic_vector(3 downto 0);
        LEDG            : out    vl_logic_vector(3 downto 0);
        c               : out    vl_logic_vector(8 downto 0)
    );
end lab5;
