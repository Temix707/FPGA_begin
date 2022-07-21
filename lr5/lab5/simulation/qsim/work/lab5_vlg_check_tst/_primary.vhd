library verilog;
use verilog.vl_types.all;
entity lab5_vlg_check_tst is
    port(
        HEX0            : in     vl_logic_vector(6 downto 0);
        HEX1            : in     vl_logic_vector(6 downto 0);
        HEX2            : in     vl_logic_vector(6 downto 0);
        HEX3            : in     vl_logic_vector(6 downto 0);
        LEDG            : in     vl_logic_vector(3 downto 0);
        LEDR            : in     vl_logic_vector(3 downto 0);
        c               : in     vl_logic_vector(8 downto 0);
        sampler_rx      : in     vl_logic
    );
end lab5_vlg_check_tst;
