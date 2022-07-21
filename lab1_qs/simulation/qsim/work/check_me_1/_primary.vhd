library verilog;
use verilog.vl_types.all;
entity check_me_1 is
    port(
        sw_0            : in     vl_logic;
        sw_1            : in     vl_logic;
        sw_2            : in     vl_logic;
        ledr            : out    vl_logic_vector(9 downto 0)
    );
end check_me_1;
