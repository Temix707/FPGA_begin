library verilog;
use verilog.vl_types.all;
entity shift_reg_l4_vlg_sample_tst is
    port(
        ISL             : in     vl_logic;
        clk             : in     vl_logic;
        en              : in     vl_logic;
        rst             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end shift_reg_l4_vlg_sample_tst;
