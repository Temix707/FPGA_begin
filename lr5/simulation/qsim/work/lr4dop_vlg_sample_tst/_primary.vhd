library verilog;
use verilog.vl_types.all;
entity lr4dop_vlg_sample_tst is
    port(
        CLOCK_50        : in     vl_logic;
        SW              : in     vl_logic_vector(1 downto 0);
        sampler_tx      : out    vl_logic
    );
end lr4dop_vlg_sample_tst;
